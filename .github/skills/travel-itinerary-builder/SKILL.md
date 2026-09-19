---
name: travel-itinerary-builder
description: "Build or update a polished mobile travel itinerary in an organized YYYYMM_Destination folder. Use for road-trip apps, daily driving navigation, Google Maps links, activity photos, restaurant recommendations, ticket and packing checklists, categorized KML maps, emergency guides, or new travel dates."
argument-hint: "Provide dates, travelers, origin, destinations, lodging, activities, transport, and any constraints"
user-invocable: true
disable-model-invocation: false
---

# 🧭 Travel Itinerary Builder

> ✨ Create a practical, visually polished, offline-friendly travel package centered on an interactive HTML itinerary.

When requested, also create a categorized KML map, packing list, destination emergency guide, assets, and reproducible helper scripts.

## 📝 Inputs

Gather these facts from the user's prompt and existing workspace files before asking questions:

- Trip title and exact dates, including year
- Travelers, ages, mobility needs, dietary needs, and interests
- Starting point, overnight locations, and final destination
- Lodging names and addresses
- Planned activities, reservation times, and operating-hour constraints
- Transportation mode, preferred departure times, and driving limits
- Restaurant preferences, budget, and meal requirements
- Tickets, tolls, reservations, and admissions already purchased
- Preferred photo source, local asset requirements, and maximum image size
- Checklist persistence needs and whether the itinerary will run from `file://` or a web server
- Desired outputs: itinerary HTML, KML, packing list, emergency guide
- Connectivity needs: fully offline, online, or hybrid

Ask only for missing information that materially changes the itinerary. If details remain unknown, label assumptions and use editable placeholders instead of inventing reservations or confirmations.

## 🔎 Research Rules

1. Treat current workspace files and user-provided links as authoritative.
2. Verify time-sensitive facts such as opening hours, seasonal closures, tolls, reservations, road restrictions, and transit schedules against official sources where possible.
3. Use exact Google Maps listing URLs already present in source material. Prefer stable listing links such as `maps?cid=...`; otherwise use a precise Google Maps search URL.
4. Match every restaurant photo to its exact Google Maps listing. Confirm the resolved listing title before using the listing's primary venue photo.
5. Never silently substitute a similarly named business. If a match is ambiguous, ask the user or use a labeled placeholder.
6. Record the access date for facts likely to change, and clearly distinguish estimates from verified information.
7. Prefer official ticket shops for transportation, admissions, tolls, vignettes, parking, and rentals. Distinguish advance purchases, same-day purchases, on-site payments, reservations, and free-entry stops.
8. If the user requests Google Images, use search results to locate a representative image, then preserve the original publisher URL. Do not claim Google is the image owner or publisher.
9. Check every recommended venue for closure notices. Do not present a permanently closed venue as active; replace it when practical or flag it prominently.

## 🗺️ Workflow

```mermaid
flowchart TD
	A[💬 Gather trip details] --> B[📁 Create YYYYMM_Destination]
	B --> C[🔎 Inspect existing material]
	C --> D[🗓️ Normalize the trip]
	D --> E[🌐 Build requested artifacts]
	E --> F[🧪 Validate content and behavior]
	F --> G[📋 Report results]
```

### 1. 📁 Create the Trip Folder

For a new trip, create one workspace-root folder before generating any files. Name it `YYYYMM_Destination`, using the trip's four-digit year and two-digit starting month, an underscore, and a concise destination name with spaces replaced by underscores. For example, an October 2026 Dolomites trip belongs in `202610_Dolomites/`.

- Put every generated trip artifact inside this folder, including itinerary HTML, KML or KMZ files, packing lists, emergency guides, downloaded assets, and reproducible helper scripts.
- Keep relative asset and script paths within the trip folder; do not scatter new trip files across the workspace root.
- If the trip spans multiple months, use the starting month.
- If the trip includes multiple stops, use the primary destination or a concise regional trip name.
- When updating an existing trip, reuse its current trip folder unless the user explicitly requests a rename or separate version.
- Do not overwrite another trip's folder. If the computed name belongs to a different trip, ask for a distinguishing destination name.

### 2. 🔍 Inspect Existing Material

- Identify the controlling files, nearby styles, scripts, existing route links, and current design conventions.
- Extract structured trip facts with targeted searches. Avoid broad reads of HTML lines containing embedded base64 images.
- Preserve user edits and reuse established components before adding new abstractions.

### 3. 🗓️ Normalize the Trip

Build an internal day-by-day table containing:

- Date and day number
- Start and end locations
- Lodging
- Timed activities
- Meal options
- Route legs
- Parking or transit details
- Warnings and booking requirements
- Source URLs

Check chronology, travel time, check-in constraints, seasonal daylight, and opening hours. Surface conflicts rather than hiding them.

### 4. 🌐 Build the Itinerary HTML

Create the actual itinerary as the first screen, not a marketing page. Include:

- Compact trip summary and daily navigation
- One clearly separated section per day
- Dates, route, logistics, activities, meals, lodging, and warnings
- A final lodging transfer or lodging arrival item whenever the day ends away from its last activity
- A sticky day navigator and fixed mobile route controls when the itinerary is intended for driving
- Full-row Maps actions for timeline items, with visible keyboard focus and Enter/Space activation
- Every `<a href>` opens in a new tab or window with `target="_blank" rel="noopener noreferrer"`
- Dynamically created anchors receive `target="_blank"` and `rel="noopener noreferrer"` before insertion
- Responsive layouts for desktop and mobile
- Mobile timeline times stacked above titles when a fixed time column would crowd or overlap content
- Stable image dimensions that prevent layout shift
- Print-friendly behavior where practical

Keep operational travel information easy to scan. Use restrained cards only for repeated items such as restaurant entries.

### 5. 🚗 Build Mobile Navigation

For a phone-first driving itinerary:

- Keep a compact day selector visible near the top.
- Add a bottom route dock on mobile with previous day, current-day route, and next day controls.
- Update the dock from the day currently in view.
- Make the whole itinerary event row open its exact Google Maps destination, except when the traveler activates a nested link.
- Give scripted map rows `role="link"`, `tabindex="0"`, and a descriptive accessible name.
- Open scripted destinations with `_blank`, `noopener,noreferrer`, and explicitly clear `window.opener`.
- Reserve stable dimensions for route controls so labels and icons cannot shift the layout.

### 6. 🖼️ Add Activity Photos

- Use three representative activity thumbnails per day unless the user requests another count.
- Prefer local image files for reliable travel use. Keep each downloaded image at or below 1 MB; resize and recompress when necessary.
- Use meaningful filenames, alt text, explicit intrinsic dimensions, lazy loading, and the original publisher URL in source metadata.
- Use a stable 4:3 thumbnail frame with `object-fit: cover` and inspect the rendered crop. Replace images that contain white borders, letterboxing, tiny subjects, or unsuitable crops instead of hiding the problem with excessive zoom.
- When sourcing through Google Images, verify the full image, destination, and publisher before downloading.
- Reuse one accessible lightbox for itinerary and restaurant images.

### 7. 🍽️ Add Restaurant Entries

For each restaurant, include:

- Exact linked name
- Current rating, cuisine, price range, and meal suitability
- Concise reason it fits the travelers
- Hours with a warning that they may change
- A representative photo from the corresponding Google listing
- The date on which ratings and price ranges were checked

Use a consistent rating source across a recommendation set when possible. Label estimated price ranges rather than presenting them as verified. If a venue is closed, replace it or clearly identify the closure and direct the traveler to another option.

Download and embed listing thumbnails as data URLs when offline use is requested. Preserve the verified source URL in a reproducible helper script or source table. Use the listing's primary substantial venue image, excluding logos, avatars, map tiles, and unrelated nearby-place images.

Restaurant thumbnails must:

- Use a fixed responsive frame with `background-size: cover`
- Show a `zoom-in` cursor
- Open the existing image lightbox on click
- Open the lightbox with Enter or Space
- Have `role="button"`, `tabindex="0"`, and a descriptive `aria-label`
- Stop propagation so the parent restaurant card does not open Google Maps

The remainder of the restaurant card may open its Google Maps listing. Keep the restaurant name as a normal anchor with `target="_blank" rel="noopener noreferrer"`. If a card uses `window.open`, pass `_blank` and prevent the opened page from receiving an `opener` reference.

Place each day's restaurant recommendations in a collapsed `<details>` section when space is limited. Keep cards readable at phone width and do not nest cards inside decorative section cards.

### 8. ✅ Add Packing and Ticket Checklists

When packing or ticket planning is requested:

- Use real checkbox inputs with associated labels.
- Make long checklists collapsible and collapsed by default.
- Show completed and total counts in the collapsed control.
- Include a reset action scoped to the relevant checklist or day.
- Persist checked state with `localStorage` so it survives browser restarts.
- Mirror state to a one-year `SameSite=Lax` cookie when served over HTTP(S), and use `sessionStorage` only as a fallback. Cookies are not reliable for itineraries opened with `file://`.
- Treat malformed or unavailable storage as an empty checklist without breaking the page.
- Keep expansion state independent from completion state; a completed checklist should still load collapsed by default.

For daily tickets and purchases:

- Add one prominent alert-style checklist to every day.
- Include all planned transportation fares, road vignettes or tolls, parking payments, rentals, timed admissions, and reservations.
- State exactly when and where to buy each item: before departure, before entering a country, weeks ahead, at a station, or on site.
- Link directly to official shops or official visitor guidance, not reseller pages.
- Include practical completion steps such as selecting the date or time, entering a license plate, saving confirmations offline, carrying cash, and arriving before timed entry.
- Explicitly identify planned attractions that need no ticket so travelers do not waste time searching.
- Verify current prices when shown and label estimates from source itineraries.
- Use a visually distinct summary with strong contrast, a clear expand icon, and a completion badge without causing mobile overflow.

Fold cold-weather advice into the packing checklist rather than duplicating it in a separate panel. Include clothing, documents, driving equipment, charging, offline maps, booking confirmations, and activity-specific gear.

### 9. 🖼️ Add the Lightbox

Reuse an existing lightbox when available. Otherwise add one modal shared by itinerary and restaurant images.

- Display the selected full image without distortion
- Provide a visible close control
- Close on backdrop click and Escape
- Prevent backdrop closing when the image itself is clicked
- Restore focus to the triggering thumbnail after closing
- Include meaningful image alt text

### 10. 🗺️ Build the KML When Requested

Create valid KML 2.2 with folders grouped by day or category. For every placemark:

- Use an emoji-free name
- Assign a meaningful shared style such as lodging, restaurant, activity, parking, or viewpoint
- Use muted, visually distinct category colors
- Use meaningful Google My Maps composite icons instead of generic pushpins
- Preserve precise coordinates
- Put formatted description HTML inside CDATA
- Add exactly one `Open in Google Maps` link with `target="_blank" rel="noopener noreferrer"` where the KML consumer supports HTML anchor attributes

Prefer exact itinerary listing URLs for matching places. Use precise search URLs only when no exact listing URL exists.

### 11. 🎒 Add Optional Supporting Files

When requested:

- Packing list: tailor quantities to duration, forecast, activities, laundry, travelers, and baggage constraints.
- Emergency guide: include local emergency numbers, nearby hospitals, pharmacies, embassy or consular contacts, insurance steps, and critical phrases. Verify all safety information.
- Reproducible image helper: map each venue name to its verified listing photo, download it, verify status and media type, then embed it without changing unrelated HTML.

## 🧪 Validation

After editing, run the narrowest executable checks available.

### 🌐 HTML

- Confirm expected day and restaurant counts.
- Confirm each day has the intended number of activity thumbnails and that every image decodes with nonzero dimensions.
- Confirm downloaded images are at or below the requested size limit and visually fill their frames without blank borders.
- Confirm every route and restaurant link has a nonempty destination.
- Inspect every `a[href]` and confirm `target` is `_blank` and `rel` contains both `noopener` and `noreferrer`.
- Include dynamically created anchors, file links, source citations, lodging links, navigation links, and links inside hidden or collapsible content.
- Confirm each itinerary event has the intended Maps destination and that full-row click, Enter, and Space open it securely without hijacking nested anchors.
- Exercise card-level or scripted link actions and confirm they open a separate browsing context without exposing `window.opener`.
- Confirm all embedded images decode successfully and have nonzero dimensions.
- If source photos were downloaded, compare embedded bytes or hashes to the verified source bytes.
- Use browser automation to test desktop and mobile layouts.
- Expand every collapsible section and check for overflow or overlap.
- Confirm ticket and packing sections are collapsed by default.
- Check every checklist type, verify counts, reload to test persistence, test reset behavior, and restore the user's prior saved state after automated checks.
- Validate `localStorage` on `file://`; only expect cookie persistence when served over HTTP(S).
- Click at least one itinerary image and one restaurant thumbnail.
- Test restaurant thumbnails with Enter and Space.
- Confirm thumbnail clicks do not trigger the parent Maps action.
- Verify mobile timeline times do not overlap titles and fixed route controls do not obscure content.
- Check the browser console and editor diagnostics.

### 🗺️ KML

- Parse as XML using the KML 2.2 namespace.
- Confirm placemark count and unique names.
- Confirm every placemark has coordinates, style, description, and one Maps link.
- Confirm restaurant and lodging URLs match corresponding itinerary entries.
- Confirm required category styles and colors.
- Confirm no emoji remains when emoji-free KML is requested.

### 📋 Content

- Check dates, day labels, chronology, lodging sequence, and route direction.
- Check that every day ends at the correct lodging or final destination.
- Check that listing titles match restaurant names.
- Check restaurant rating, cuisine, price range, closure status, and access date.
- Check that each planned paid transport or entry appears in that day's ticket checklist and that free stops are identified.
- Flag unverified hours, seasonal roads, reservations, and prices.
- Do not claim validation passed unless the command or browser check actually completed.

### 📝 Markdown

- Use raw HTML anchors with `target="_blank" rel="noopener noreferrer"` for clickable links that must open in a new tab or window.
- Do not rely on standard Markdown link syntax for new-window behavior because it has no portable target attribute.
- Confirm every local `href` resolves relative to the Markdown file containing it.

## 📦 Output Conventions

- For new trips, write all outputs under the trip's workspace-root `YYYYMM_Destination/` folder.
- Keep generated filenames descriptive and destination-specific.
- Preserve offline behavior by embedding assets only when requested; otherwise prefer maintainable external assets.
- Keep source URLs in scripts or structured data so photos and listings can be refreshed later.
- Report modified files, important assumptions, and completed validation concisely.
- Mention any facts that could not be verified and identify the best official source for manual confirmation.