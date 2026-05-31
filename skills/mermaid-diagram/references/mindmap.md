# Mindmap Diagrams

Mindmaps organize information hierarchically in a radial structure. Hierarchy is expressed through indentation — no explicit connection syntax needed.

## Basic Syntax

```mermaid
mindmap
    root((Central Idea))
        Topic A
            Subtopic A1
            Subtopic A2
        Topic B
            Subtopic B1
```

The root node is the first item; everything else is a child based on indentation depth.

## Node Shapes

| Shape | Syntax |
|-------|--------|
| Default (plain) | `text` |
| Square | `[text]` |
| Rounded | `(text)` |
| Circle | `((text))` |
| Bang | `)text(` |
| Cloud | `)text` or just indented |
| Hexagon | `{{text}}` |

```mermaid
mindmap
    root((Root))
        [Square]
        (Rounded)
        ((Circle))
        )Bang(
        {{Hexagon}}
```

## Icons

Add Font Awesome icons with `::icon()`:

```mermaid
mindmap
    root((Project))
        Code
            ::icon(fa fa-code)
            Backend
            Frontend
        Design
            ::icon(fa fa-paint-brush)
            UI
            UX
```

## CSS Classes

Apply classes with `:::`:

```mermaid
mindmap
    root((System))
        ServiceA:::urgent
        ServiceB:::ok
```

Classes must be provided by the rendering environment.

## Markdown Text

Node labels support basic markdown formatting:

```mermaid
mindmap
    root((Core))
        **Bold topic**
        *Italic topic*
        Long text wraps automatically when it exceeds the available width
```

## Example: Knowledge Domain Map

```mermaid
mindmap
    root((Linux))
        Shell
            Bash
            Zsh
            Fish
        Filesystem
            /etc
            /var
            /home
        Networking
            ip / ss
            nftables
            DNS
        Package Management
            pacman
            apt
            nix
```

## Tips

- Keep the root label short — it anchors the whole diagram.
- Limit depth to 3–4 levels; deeper hierarchies become unreadable.
- Mindmaps are best for brainstorming and concept overviews, not precise process flows.
- If a branch has more than ~6 children, consider splitting into a separate diagram.
- Available from Mermaid v9.4+.
