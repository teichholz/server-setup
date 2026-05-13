# server

Ansible playbooks for managing my personal server.

## Prerequisites

- `ansible` and `just` installed locally
- `op` (1Password CLI) for secret injection
- SSH alias `server` configured in `~/.ssh/config`

## Setup

```sh
just install   # install Ansible collections
```

## Usage

| Command | Description |
|---|---|
| `just bootstrap` | First-time setup: creates server user, then runs full playbook |
| `just site` | Apply full configuration |
| `just env-vars` | Push secrets from 1Password to the server |
| `just env-vars-check` | Dry-run of env-vars (no changes applied) |
| `just ping` | Check connectivity |
