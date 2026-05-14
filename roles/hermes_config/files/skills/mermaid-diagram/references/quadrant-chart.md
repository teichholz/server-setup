# Quadrant Charts

Quadrant charts plot data points on a two-dimensional grid divided into four sections. Useful for prioritization matrices, risk assessments, and positioning maps.

## Basic Syntax

```mermaid
quadrantChart
    title Reach and Engagement of Campaigns
    x-axis Low Reach --> High Reach
    y-axis Low Engagement --> High Engagement
    quadrant-1 We should expand
    quadrant-2 Need to promote
    quadrant-3 Re-evaluate
    quadrant-4 May be improved
    Campaign A: [0.3, 0.6]
    Campaign B: [0.45, 0.23]
    Campaign C: [0.57, 0.69]
    Campaign D: [0.78, 0.34]
    Campaign E: [0.40, 0.34]
    Campaign F: [0.35, 0.78]
```

## Axes

```
x-axis <left label> --> <right label>
y-axis <bottom label> --> <top label>
```

Single-label variant (label placed at high end):
```
x-axis High Priority
y-axis High Impact
```

## Quadrant Labels

Labels are optional. Quadrant numbering starts top-right and goes counter-clockwise:

```
quadrant-1   top-right
quadrant-2   top-left
quadrant-3   bottom-left
quadrant-4   bottom-right
```

## Data Points

```
Point Name: [x, y]
```

- `x` and `y` are floats between `0` and `1`
- Point names can contain spaces

## Point Styling

Direct style on a point:

```
Point A: [0.5, 0.5] radius: 8, color: #ff0000, stroke-color: #333, stroke-width: 2px
```

Class-based styling:

```
Point A:::myClass: [0.5, 0.5]
```

Styling priority: direct styles > class styles > theme styles.

## Configuration

```yaml
%%{init: {"quadrantChart": {"chartWidth": 400, "chartHeight": 400, "pointRadius": 5}}}%%
quadrantChart
    ...
```

| Parameter | Default |
|-----------|---------|
| `chartWidth` | 500 |
| `chartHeight` | 500 |
| `pointRadius` | 5 |
| `xAxisLabelFontSize` | 16 |
| `yAxisLabelFontSize` | 16 |
| `quadrantLabelFontSize` | 16 |

## Example: Feature Prioritization

```mermaid
quadrantChart
    title Feature Prioritization
    x-axis Low Effort --> High Effort
    y-axis Low Value --> High Value
    quadrant-1 Quick wins
    quadrant-2 Major projects
    quadrant-3 Fill-ins
    quadrant-4 Thankless tasks
    Dark mode: [0.2, 0.8]
    Search: [0.6, 0.9]
    Onboarding: [0.4, 0.7]
    Analytics: [0.7, 0.5]
    Settings page: [0.3, 0.3]
    Legacy cleanup: [0.8, 0.2]
```

## Tips

- Coordinates are relative (0–1), not absolute values — normalize your data first.
- Quadrant labels set the interpretive frame; choose them carefully.
- Works well for: prioritization matrices, risk maps, market positioning, effort/impact grids.
- Use consistent axis directions (low→high) to match reader expectations.
