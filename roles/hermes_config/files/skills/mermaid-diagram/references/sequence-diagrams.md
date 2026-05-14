# Sequence Diagrams

Sequence diagrams show interactions between participants over time. Ideal for API flows, authentication sequences, and system component interactions.

## Basic Syntax

```mermaid
sequenceDiagram
    participant A
    participant B
    A->>B: Message
```

## Participants and Actors

```mermaid
sequenceDiagram
    actor User
    participant Frontend
    participant API
    participant Database

    User->>Frontend: Click button
    Frontend->>API: POST /data
```

- `participant` — system components (services, classes, databases)
- `actor` — external entities (users, external systems)

## Message Types

| Arrow | Meaning |
|-------|---------|
| `->>`  | Solid arrow — synchronous request |
| `-->>`  | Dotted arrow — response/return |
| `-)`   | Open solid arrow — async |
| `--)`  | Open dotted arrow — async response |
| `-x`   | Cross — delete / terminate |

## Activations

```mermaid
sequenceDiagram
    Client->>+Server: Request
    Server->>+Database: Query
    Database-->>-Server: Data
    Server-->>-Client: Response
```

`+` after arrow activates; `-` before arrow deactivates.

## Control Flow

### Alt / Else
```mermaid
sequenceDiagram
    User->>API: POST /login
    alt Valid credentials
        API-->>User: 200 OK + Token
    else Invalid credentials
        API-->>User: 401 Unauthorized
    end
```

### Opt (optional block)
```mermaid
sequenceDiagram
    opt Payment successful
        API->>EmailService: Send confirmation
    end
```

### Loop
```mermaid
sequenceDiagram
    loop Every 5 seconds
        Monitor->>API: Health check
        API-->>Monitor: Status
    end
```

### Par (parallel)
```mermaid
sequenceDiagram
    par Send email
        Service->>EmailService: Send confirmation
    and Update inventory
        Service->>InventoryService: Reduce stock
    end
```

### Break (early exit)
```mermaid
sequenceDiagram
    break Input invalid
        API-->>User: 400 Bad Request
    end
```

## Notes

```mermaid
sequenceDiagram
    Note over API: Validates JWT token
    Note over Frontend,API: HTTPS encrypted
    Note right of System: Logs to database
```

## Auto-numbering

```mermaid
sequenceDiagram
    autonumber
    User->>Frontend: Login
    Frontend->>API: Authenticate
```

## Tips

- Order participants: User → Frontend → Backend → Database.
- Use activations to show when components are actively processing.
- Use `alt/opt/par` to document all relevant paths including error cases.
- One scenario per diagram — don't cram happy path and all edge cases together.
- `autonumber` helps when discussing specific steps with others.
