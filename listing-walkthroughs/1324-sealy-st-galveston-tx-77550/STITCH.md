# Stitching the walkthrough — 1324 Sealy St

The 8 room clips render on Higgsfield (Seedance 1.5, 8s each, 720p, 16:9, silent).
This session's sandbox can't reach Higgsfield's video CDN, so **download the 8 clips
from the Higgsfield app** and stitch them locally with the recipe below.

## 1. Download + name the clips (walkthrough order)

Save each clip into a `scenes/` folder using this exact order so a sorted concat is correct:

| File name | Room | Higgsfield job id |
|-----------|------|-------------------|
| room-01-exterior.mp4      | Front exterior        | 375ab3bc-1ba9-42f4-b8bf-7202bcbeafce |
| room-02-walkin-dining.mp4 | Walk-in → dining room | 783e8289-f657-4893-bb4a-eba4db4254dd |
| room-03-living.mp4        | Living room           | 521c12bc-d843-47e6-88c3-ccb3dd2419b3 |
| room-04-kitchen.mp4       | Kitchen               | 76d29d7c-418b-4522-a545-0632b72ee634 |
| room-05-primary-bed.mp4   | Primary bedroom       | dc5c28c7-7656-468a-a570-05b6536a1fdb |
| room-06-primary-bath.mp4  | Primary bath          | 9f9b38fc-12e0-4980-826f-be42dceec9b3 |
| room-07-secondary-bed.mp4 | Secondary bedroom     | 52dd0fcc-3adc-4cc5-ab0a-26ee414b46b7 |

Direct download URLs for all 8 clips are listed in `PROPERTY.md` → "Rendered clip URLs".

## 2. Normalize + concat (hard cuts)

Requires ffmpeg (`brew install ffmpeg`). Run from the folder containing `scenes/`:

```bash
mkdir -p final norm
# Normalize each clip to 1920x1080, 30fps, h264, silent (uniform for a clean concat)
for f in scenes/room-*.mp4; do
  ffmpeg -y -i "$f" \
    -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,fps=30" \
    -c:v libx264 -pix_fmt yuv420p -an "norm/$(basename "$f")"
done
# Concat in walkthrough order
ls norm/room-*.mp4 | sort | sed "s/^/file '/;s/$/'/" > concat.txt
ffmpeg -y -f concat -safe 0 -i concat.txt -c:v libx264 -pix_fmt yuv420p -an final/walkthrough-16x9.mp4
```

Result: `final/walkthrough-16x9.mp4` — ~56s silent master (7 × 8s).

## 3. Optional — soft crossfades instead of hard cuts

Hard cuts (above) are the clean default. For 0.4s crossfades between rooms, use ffmpeg
`xfade` chained across the 8 normalized clips (keep transitions short so the tour stays brisk).

## 4. Optional — 9:16 social cut

```bash
ffmpeg -y -i final/walkthrough-16x9.mp4 \
  -vf "scale=-1:1920,crop=1080:1920" -c:v libx264 -pix_fmt yuv420p -an final/walkthrough-9x16.mp4
```

Center-crop loses side edges; for content-aware reframing use Higgsfield `reframe` on the master instead.

## 5. Optional — add music

The master is silent by design. Drop a licensed track over it in your editor, or:

```bash
ffmpeg -y -i final/walkthrough-16x9.mp4 -i music.mp3 -shortest -c:v copy -c:a aac final/walkthrough-16x9-music.mp4
```
