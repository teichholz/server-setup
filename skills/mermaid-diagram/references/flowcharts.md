# Flowcharts

Flowcharts visualize processes, algorithms, decision trees, and user journeys.

## Directions

```
flowchart TD   – top to bottom (default)
flowchart LR   – left to right
flowchart BT   – bottom to top
flowchart RL   – right to left
```

## Node Shapes

| Shape | Syntax | Use for |
|-------|--------|---------|
| Rectangle | `A[text]` | Process step |
| Rounded | `A(text)` | Start / End |
| Stadium | `A([text])` | Terminal |
| Double border | `A[[text]]` | Subroutine |
| Cylinder | `A[(text)]` | Database |
| Circle | `A((text))` | Junction |
| Diamond | `A{text}` | Decision |
| Hexagon | `A{{text}}` | Condition |
| Parallelogram | `A[/text/]` | Input / Output |

## Connections

```mermaid
flowchart LR
    A --> B           %% solid arrow
    C --- D           %% open link (no arrowhead)
    E -->|label| F    %% labeled arrow
    G -.-> H          %% dotted arrow
    I ==> J           %% thick arrow
    K --> L & M       %% fan-out
    N & O --> P       %% fan-in
```

## Subgraphs

```mermaid
flowchart TB
    subgraph Processing
        direction LR
        B[Step 1] --> C[Step 2]
    end

    A[Start] --> Processing --> D[End]
```

Subgraphs can be nested and each can have its own direction.

## Styling

```mermaid
flowchart LR
    A[Normal]
    B[Styled]:::highlight

    classDef highlight fill:#ff6b6b,stroke:#333,color:#fff
    style A fill:#87CEEB
```

## Common Patterns

### Linear flow
```mermaid
flowchart LR
    A[Step 1] --> B[Step 2] --> C[Step 3]
```

### Decision branch
```mermaid
flowchart TD
    A[Input] --> B{Condition?}
    B -->|Yes| C[Path 1]
    B -->|No| D[Path 2]
    C & D --> E[Continue]
```

### Loop
```mermaid
flowchart TD
    A[Initialize] --> B[Process]
    B --> C{Done?}
    C -->|No| B
    C -->|Yes| D[Exit]
```

### Error handling
```mermaid
flowchart TD
    A[Try] --> B{Success?}
    B -->|Yes| C[Continue]
    B -->|No| D{Retry?}
    D -->|Yes| A
    D -->|No| E[Abort]
```

## Tips

- Use diamonds only for decisions; use rectangles for actions.
- Start and end with stadium nodes `([text])` to mark entry/exit.
- Color-code: green for start/success, red for error, yellow for storage.
- Use `TD` for hierarchies; `LR` for pipelines.
- Keep it to one process per diagram — split at natural checkpoints.
