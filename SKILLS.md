# Using The Travel Itinerary Skill

## Included Skill

`travel-itinerary-builder` creates or updates an interactive trip itinerary and optional KML map, packing list, emergency guide, and restaurant-photo workflow.

Workspace copy:

```text
.github/skills/travel-itinerary-builder/SKILL.md
```

The workspace copy travels with this folder. A personal copy may also be installed at:

```text
~/.copilot/skills/travel-itinerary-builder/SKILL.md
```

The personal copy makes the skill available across workspaces.

## Invoke It

In Copilot Chat, type:

```text
/travel-itinerary-builder
```

Then provide the trip data. Copilot may also load the skill automatically for itinerary, road-trip, travel-map, packing-list, or emergency-guide requests.

## Recommended Input

Include as much of this as you know:

- Exact travel dates and year
- Travelers, ages, mobility needs, and dietary needs
- Origin, destination sequence, and return location
- Transportation mode and maximum preferred travel time
- Lodging names, addresses, and check-in constraints
- Must-do activities and reservation times
- Restaurant style, cuisine, price, and child-friendly requirements
- Desired departure and meal times
- Offline or online asset preference
- Requested outputs: HTML itinerary, KML, packing list, emergency guide

Unknown details can remain placeholders. The skill should not invent confirmed reservations.

## Example: New Trip

```text
/travel-itinerary-builder

Create an offline-friendly family itinerary for May 18-24, 2027.
We are two adults and three children ages 4, 8, and 11, driving from Wiesbaden.
Route: Strasbourg, Annecy, and Chamonix, then return home.
We prefer drives under four hours, easy walks, playgrounds, and casual restaurants.
One traveler avoids vegetables and spicy food.
Create the itinerary HTML, categorized KML, packing list, and emergency guide.
Use exact Google Maps listings and representative listing photos for restaurants.
```

## Example: Update Existing Files

```text
/travel-itinerary-builder

Update this workspace for October 14-19, 2027. Keep the current visual design,
replace all dates and lodging, recalculate each route, refresh restaurant listings
and photos, and regenerate the KML. Preserve offline image support.
```

## Example: Restaurant Refresh Only

```text
/travel-itinerary-builder

Verify every restaurant against its Google Maps listing. Replace each thumbnail
with the listing's primary venue photo, preserve offline embedding, and validate
that thumbnail clicks open the lightbox without opening Maps.
```

## Expected Workflow

1. Copilot inspects existing source files and extracts reusable design and trip data.
2. It normalizes dates, route legs, lodging, activities, meals, and constraints by day.
3. It verifies time-sensitive facts and labels anything that remains uncertain.
4. It builds or updates the itinerary and optional supporting files.
5. It checks Google listing titles before using restaurant links or photos.
6. It validates HTML behavior in a browser and parses KML as XML.
7. It reports changed files, assumptions, and any facts requiring manual confirmation.

## Copy To Another Workspace

Copy this folder into the new workspace:

```text
.github/skills/travel-itinerary-builder/
```

Reload VS Code or start a new Copilot Chat if the skill does not appear immediately. Then invoke `/travel-itinerary-builder` from the new workspace.

For personal availability, retain the copy under `~/.copilot/skills/`; no workspace copy is required unless the instructions should be shared with the project.

## Maintenance

- Keep the folder name and frontmatter `name` identical: `travel-itinerary-builder`.
- Keep the YAML frontmatter at the top of `SKILL.md` between `---` markers.
- Update both workspace and personal copies when changing the workflow.
- Treat Google listing photo URLs as refreshable source data rather than permanent identifiers.
- Reverify official opening hours, closures, tolls, parking restrictions, and emergency contacts before travel.