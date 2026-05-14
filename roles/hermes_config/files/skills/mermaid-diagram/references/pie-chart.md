# Pie Charts

Pie charts show numerical proportions as slices of a circle.

## Basic Syntax

```mermaid
pie
    title Distribution of Traffic Sources
    "Organic Search" : 42
    "Direct" : 28
    "Social Media" : 15
    "Referral" : 10
    "Email" : 5
```

## Show Raw Values

Add `showData` after `pie` to display actual values alongside percentages in the legend:

```mermaid
pie showData
    title Bug Count by Component
    "Auth" : 12
    "API" : 8
    "UI" : 23
    "Database" : 4
```

## Rules

- Values must be **positive numbers** greater than zero (up to two decimal places).
- Slices render **clockwise** in the order listed.
- Labels must be in quotes.
- `title` is optional.

## Configuration

Control the radial position of slice labels (0.0 = center, 1.0 = edge):

```
%%{init: {"pie": {"textPosition": 0.6}}}%%
pie
    ...
```

Default `textPosition` is `0.75`.

## Example: Time Budget

```mermaid
pie showData
    title Weekly Time Budget
    "Deep work" : 20
    "Meetings" : 8
    "Email & comms" : 6
    "Admin" : 4
    "Learning" : 2
```

## Tips

- Use pie charts only for **part-of-whole** relationships — not for comparing unrelated values.
- Limit to ~5–7 slices; more than that becomes unreadable.
- If you have many small slices, group them into "Other".
- For comparisons across categories, prefer a bar chart (Mermaid's `xychart-beta`).
