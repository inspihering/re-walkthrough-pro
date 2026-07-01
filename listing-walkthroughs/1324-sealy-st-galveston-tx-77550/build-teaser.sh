#!/usr/bin/env bash
# build-teaser.sh — assemble a short property teaser for 1324 Sealy St, Galveston TX
# from the 7 Higgsfield room clips. Run on any machine with ffmpeg + internet
# (this repo's sandbox can't reach the Higgsfield video CDN, so it's built here).
#
#   chmod +x build-teaser.sh && ./build-teaser.sh
#
# Output: teaser.mp4  (~20s, 1080p, silent, quick-cut)
set -euo pipefail

OUT=teaser.mp4
SRC=teaser-src
mkdir -p "$SRC"

# --- The 7 clips, in teaser order (hook: exterior → walk-in → wow rooms) -------
# label|url|trim_start|trim_len   (trim grabs the punchiest slice of each 8s clip)
CLIPS=(
  "exterior|https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_025417_375ab3bc-1ba9-42f4-b8bf-7202bcbeafce.mp4|1.0|3.4"
  "walkin-dining|https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_034036_783e8289-f657-4893-bb4a-eba4db4254dd.mp4|1.0|3.0"
  "kitchen|https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_023402_76d29d7c-418b-4522-a545-0632b72ee634.mp4|1.5|2.6"
  "living|https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_022711_521c12bc-d843-47e6-88c3-ccb3dd2419b3.mp4|1.5|2.6"
  "primary-bed|https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_023405_dc5c28c7-7656-468a-a570-05b6536a1fdb.mp4|1.5|2.6"
  "primary-bath|https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_034940_9f9b38fc-12e0-4980-826f-be42dceec9b3.mp4|1.5|2.4"
  "secondary-bed|https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_024351_52dd0fcc-3adc-4cc5-ab0a-26ee414b46b7.mp4|1.5|2.4"
)

# --- Optional title/end cards (auto-skipped if no usable font found) -----------
FONT=""
for f in \
  /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf \
  /System/Library/Fonts/Supplemental/Arial\ Bold.ttf \
  /Library/Fonts/Arial\ Bold.ttf \
  /System/Library/Fonts/HelveticaNeue.ttc ; do
  [ -f "$f" ] && FONT="$f" && break
done

echo "==> downloading 7 clips"
i=0
: > concat.txt
for c in "${CLIPS[@]}"; do
  IFS='|' read -r label url ss len <<< "$c"
  i=$((i+1)); n=$(printf "%02d" "$i")
  raw="$SRC/$n-$label.mp4"; seg="$SRC/seg-$n.mp4"
  [ -f "$raw" ] || curl -fL -o "$raw" "$url"
  # trim to the punchy slice + normalize to 1080p/30fps/h264, silent
  ffmpeg -y -ss "$ss" -t "$len" -i "$raw" \
    -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,fps=30,format=yuv420p" \
    -c:v libx264 -preset medium -crf 19 -an "$seg"
  echo "file '$seg'" >> concat.txt
done

echo "==> concatenating quick-cut teaser"
ffmpeg -y -f concat -safe 0 -i concat.txt -c:v libx264 -crf 19 -pix_fmt yuv420p -an body.mp4

if [ -n "$FONT" ]; then
  echo "==> adding title + end cards (font: $FONT)"
  # 2.2s title card
  ffmpeg -y -f lavfi -i color=c=0x111417:s=1920x1080:d=2.2:r=30 \
    -vf "drawtext=fontfile='$FONT':text='1324 SEALY ST':fontcolor=white:fontsize=96:x=(w-tw)/2:y=380,\
drawtext=fontfile='$FONT':text='Galveston, TX \\| East End Historic District':fontcolor=0xcfd6dd:fontsize=44:x=(w-tw)/2:y=520,\
drawtext=fontfile='$FONT':text='4 BD  •  3.5 BA  •  3,750 SqFt  •  Built 1910':fontcolor=0xcfd6dd:fontsize=44:x=(w-tw)/2:y=600,format=yuv420p" \
    -c:v libx264 -crf 19 -an title.mp4
  # 2.5s end card
  ffmpeg -y -f lavfi -i color=c=0x111417:s=1920x1080:d=2.5:r=30 \
    -vf "drawtext=fontfile='$FONT':text='NOW AVAILABLE':fontcolor=white:fontsize=88:x=(w-tw)/2:y=430,\
drawtext=fontfile='$FONT':text='Schedule a private showing':fontcolor=0xcfd6dd:fontsize=46:x=(w-tw)/2:y=560,format=yuv420p" \
    -c:v libx264 -crf 19 -an end.mp4
  printf "file 'title.mp4'\nfile 'body.mp4'\nfile 'end.mp4'\n" > final.txt
  ffmpeg -y -f concat -safe 0 -i final.txt -c:v libx264 -crf 19 -pix_fmt yuv420p -an "$OUT"
else
  echo "==> no font found; skipping title/end cards (set FONT= at top to enable)"
  cp body.mp4 "$OUT"
fi

echo "==> done: $OUT"
ffprobe -v error -show_entries format=duration -of default=nk=1:nw=1 "$OUT" 2>/dev/null | awk '{printf "    duration: %.1fs\n",$1}'
echo "    9:16 social cut:  ffmpeg -i $OUT -vf \"scale=-1:1920,crop=1080:1920\" -an teaser-9x16.mp4"
echo "    add music:        ffmpeg -i $OUT -i music.mp3 -shortest -c:v copy -c:a aac teaser-music.mp4"
