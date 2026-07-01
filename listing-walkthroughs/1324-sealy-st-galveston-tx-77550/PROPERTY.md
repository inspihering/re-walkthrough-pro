# 1324 Sealy St, Galveston, TX 77550

**Zillow:** https://www.zillow.com/homedetails/1324-Sealy-St-Galveston-TX-77550/27655923_zpid/
**Status:** RECENTLY_SOLD (last public sale ~May 2022; verify current status)
**Slug:** 1324-sealy-st-galveston-tx-77550
**Built (walkthrough):** 2026-07-01

## Property
| Field | Value |
|-------|-------|
| Price | ~$785,000 (last list) · Redfin est. ~$842K |
| Beds | 4 |
| Baths | 3.5 |
| Living area | ~3,750 sqft |
| Year built | 1910 |
| Home type | Single Family — East End Historic District, Galveston |

## Agent
- **Name:** [not captured — Apify scrape unavailable this session]
- **Contact:** [—]
- **Brokerage:** [—]

## Photos
- Source count: 33 (user-supplied zip → `source-images/NN-original.webp`, Zillow gallery order)
- Curated for animation: 8 hero rooms

## Character notes (from vision pass)
- Classic 1910 Galveston Victorian: two-story double-gallery front porch, white
  clapboard, picket fence, mature live oaks.
- Restored interior: heart-pine floors, stained-glass windows (incl. "1324" transom),
  ceiling medallions, multiple grand pianos, high-end remodeled kitchen (quartz
  island, wine column, pro range/double ovens), symmetric dual-vanity primary bath.
- Ground floor (photos 28–33) is utilitarian: empty stained-concrete flex rooms,
  laundry, storage, accessible bath — intentionally excluded from the tour.
- No backyard/pool/outdoor photos in the set (urban historic lot).

## Shot List (walkthrough order) — 8 clips (Seedance 1.5, 8s, 720p, 16:9, silent)
| # | Room | Source photo | Camera move | Higgsfield job id |
|---|------|--------------|-------------|-------------------|
| 01 | Exterior (establishing) | 01-original.webp | gentle slow push, stable foreground (re-roll v2) | 375ab3bc-1ba9-42f4-b8bf-7202bcbeafce |
| 02 | Entry foyer (stained glass) | 03-original.webp | doorway threshold → steadicam step-in | b9a61a89-ac3a-4046-ab1a-ede0c111e66a |
| 03 | Living room (teal) | 10-original.webp | slow gimbal glide, reveal depth | 521c12bc-d843-47e6-88c3-ccb3dd2419b3 |
| 04 | Dining room (grand piano) | 07-original.webp | gimbal glide, table approach | 1c1bd2f2-22ff-470c-a508-5666f3f094ee |
| 05 | Kitchen (island) | 11-original.webp | gimbal glide along island | 76d29d7c-418b-4522-a545-0632b72ee634 |
| 06 | Primary bedroom | 16-original.webp | gentle steadicam glide | dc5c28c7-7656-468a-a570-05b6536a1fdb |
| 07 | Primary bath (dual vanity) | 19-original.webp | threshold → slow centered push-in | 5cc570e1-85c4-42ff-8f7d-8c74b087a3ca |
| 08 | Secondary bedroom | 23-original.webp | slow gimbal glide | 52dd0fcc-3adc-4cc5-ab0a-26ee414b46b7 |

### Rendered clip URLs (Higgsfield CDN — download to assemble locally)
1. exterior      — https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_025417_375ab3bc-1ba9-42f4-b8bf-7202bcbeafce.mp4  (re-roll v2; original b6108244 had a foreground-tree parallax bloom)
2. entry         — https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_022324_b9a61a89-ac3a-4046-ab1a-ede0c111e66a.mp4
3. living        — https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_022711_521c12bc-d843-47e6-88c3-ccb3dd2419b3.mp4
4. dining        — https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_023137_1c1bd2f2-22ff-470c-a508-5666f3f094ee.mp4
5. kitchen       — https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_023402_76d29d7c-418b-4522-a545-0632b72ee634.mp4
6. primary-bed   — https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_023405_dc5c28c7-7656-468a-a570-05b6536a1fdb.mp4
7. primary-bath  — https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_023709_5cc570e1-85c4-42ff-8f7d-8c74b087a3ca.mp4
8. secondary-bed — https://d8j0ntlcm91z4.cloudfront.net/user_2zWaPzpL41myse7Z7CR4Qimmvju/hf_20260701_024351_52dd0fcc-3adc-4cc5-ab0a-26ee414b46b7.mp4

## Build Choices
- **Style:** cinematic (per-room camera move)
- **Rooms:** auto-curate (8 hero shots)
- **Output ratio:** 16:9 master
- **Engine:** Seedance 1.5 Pro (Bytedance) image-to-video, 8s/clip, 720p
  (Seedance 2.0 required a Pro/Ultimate Higgsfield plan; this account is Starter,
  so fell back to Seedance 1.5 — reliable motion, and much cheaper.)
- **Cost:** 8 × 4.8 = 38.4 Higgsfield credits (202 → 163.6 remaining)

## Outputs
- Scenes: 8 Higgsfield clips (job links; also to be downloaded to `scenes/room-NN-*.mp4` where CDN reachable)
- Master: `final/walkthrough-16x9.mp4` — assembled via ffmpeg recipe in `STITCH.md`

## Run Notes
- Environment: Apify Zillow-scraper MCP not connected; egress policy blocks
  photos.zillowstatic.com AND Higgsfield's CloudFront CDN (403 on CONNECT).
  → Photos supplied by user as a zip (viewed locally for curation).
  → Animation inputs imported into Higgsfield via server-side media_import_url
    (same source URLs; not affected by the local egress block).
  → Rendered clips can't be pulled into this sandbox to ffmpeg-stitch; final
    concat is done by the user locally via STITCH.md.
- Higgsfield: 202 credits (starter) at build start → 163.6 after 8 clips; ffmpeg via ffmpeg-static.
- All 8 clips rendered successfully; none needed a re-gen.
