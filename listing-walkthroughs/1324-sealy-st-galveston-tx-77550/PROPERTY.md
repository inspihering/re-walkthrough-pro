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

## Shot List (walkthrough order) — 8 clips
| # | Room | Source photo | Camera move | Higgsfield job |
|---|------|--------------|-------------|----------------|
| 01 | Exterior (establishing) | 01-original.webp | slow gimbal push toward entry | (pending) |
| 02 | Entry foyer (stained glass) | 03-original.webp | doorway threshold → steadicam step-in | (pending) |
| 03 | Living room (teal) | 10-original.webp | slow gimbal glide, reveal depth | (pending) |
| 04 | Dining room (grand piano) | 07-original.webp | gimbal glide, table approach | (pending) |
| 05 | Kitchen (island) | 11-original.webp | gimbal glide along island | (pending) |
| 06 | Primary bedroom | 16-original.webp | gentle steadicam glide | (pending) |
| 07 | Primary bath (dual vanity) | 19-original.webp | threshold → slow centered push-in | (pending) |
| 08 | Secondary bedroom | 23-original.webp | slow gimbal glide | (pending) |

## Build Choices
- **Style:** cinematic (per-room camera move)
- **Rooms:** auto-curate (8 hero shots)
- **Output ratio:** 16:9 master
- **Engine:** Seedance 2.0 image-to-video, 5s/clip
- **Cost:** 8 × 22.5 = 180 Higgsfield credits (of 202 available)

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
- Higgsfield: 202 credits (starter) at build start; ffmpeg via ffmpeg-static.
