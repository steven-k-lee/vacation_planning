# 🏔️ Dolomites Family Road Trip

> 🚗 An offline-friendly travel package for the October 2026 family road trip from Wiesbaden through Füssen and the Dolomites.

## 🧭 Route At A Glance

```mermaid
flowchart LR
	A[🏠 Wiesbaden] --> B[🏰 Füssen]
	B --> C[⛰️ Dolomites]
	C --> D[🏠 Return home]
```

## 📦 Main Files

| File | Purpose |
| --- | --- |
| <a href="index.html" target="_blank" rel="noopener noreferrer">`index.html`</a> | 🗓️ Interactive day-by-day itinerary with logistics, lodging, activities, routes, restaurant cards, embedded photos, and image lightboxes. |
| <a href="dolomites_road_trip_categorized.kml" target="_blank" rel="noopener noreferrer">`dolomites_road_trip_categorized.kml`</a> | 🗺️ Google Earth/My Maps placemarks grouped by day, with category icons, muted colors, descriptions, and Google Maps links. |
| <a href="Dolomite%20Packing%20List.html" target="_blank" rel="noopener noreferrer">`Dolomite Packing List.html`</a> | 🎒 Trip-specific family packing list. |
| <a href="Italy%20Emergency_Guide.html" target="_blank" rel="noopener noreferrer">`Italy Emergency_Guide.html`</a> | 🆘 Emergency contacts and travel-safety reference. |
| <a href="embed_restaurant_images.ps1" target="_blank" rel="noopener noreferrer">`embed_restaurant_images.ps1`</a> | 📸 Rebuilds the itinerary's embedded restaurant thumbnails from verified Google listing photo URLs. |
| <a href="../SKILLS.md" target="_blank" rel="noopener noreferrer">`../SKILLS.md`</a> | 🧰 Instructions for using the reusable Copilot travel-itinerary skill. |

> 📝 Additional HTML, KML, and KMZ files in this folder are drafts or reference inputs. The files above are the maintained deliverables.

## ✅ Completed Work

- 🖨️ Built a responsive, printable five-day itinerary.
- 🧭 Added daily logistics, route links, lodging, activities, warnings, and restaurant recommendations.
- 📍 Linked restaurant names and map placemarks to Google Maps.
- 📸 Matched 20 restaurant thumbnails to their corresponding Google listings and embedded them for offline use.
- ⌨️ Added mouse and keyboard lightbox support to itinerary and restaurant images.
- 🔗 Made restaurant cards open their listings while thumbnail clicks remain dedicated to the lightbox.
- 🗺️ Categorized KML pins with meaningful Google My Maps icons and muted colors.
- 🍽️ Converted Day 5 stops to restaurant pins and removed emoji from KML names.
- 📌 Added one Maps link to every KML placemark.

## 🌐 Open The Files

The HTML files are self-contained and can be opened directly in a browser; no server or build step is required. 👍

Import <a href="dolomites_road_trip_categorized.kml" target="_blank" rel="noopener noreferrer">`dolomites_road_trip_categorized.kml`</a> into Google My Maps or Google Earth to view the categorized trip map.

> 🔗 Documentation and itinerary links open in a new tab or window and use `noopener noreferrer` for isolation.

## 📸 Refresh Restaurant Photos

The helper expects the current 20 restaurant cards in their existing order. Run it from PowerShell in this folder:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
& .\embed_restaurant_images.ps1
```

> ⚠️ Google-hosted image URLs can expire or change. Before refreshing, confirm each URL in the helper still belongs to the named restaurant listing. The generated images remain embedded in the itinerary after the script finishes.

## ⚠️ Important Travel Check

Opening hours, seasonal lifts, mountain roads, toll systems, parking rules, prices, and emergency information can change. Reverify time-sensitive details with official sources shortly before departure. 🔎

## ♻️ Reuse

The workspace skill is stored at <a href="../.github/skills/travel-itinerary-builder/SKILL.md" target="_blank" rel="noopener noreferrer">`../.github/skills/travel-itinerary-builder/SKILL.md`</a>. See <a href="../SKILLS.md" target="_blank" rel="noopener noreferrer">`../SKILLS.md`</a> for examples and setup guidance. 🚀