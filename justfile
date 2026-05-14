mitogen_plugins := `uv run python3 -c "import ansible_mitogen, os; print(os.path.join(os.path.dirname(ansible_mitogen.__file__), 'plugins/strategy'))" 2>/dev/null || echo ""`

export ANSIBLE_STRATEGY_PLUGINS := mitogen_plugins
export ANSIBLE_STRATEGY := "mitogen_linear"

install:
    ansible-galaxy install -r requirements.yml
    uv sync

# One-time: create the server_user on a fresh machine, then run the full playbook
bootstrap:
    uv run ansible-playbook playbooks/bootstrap.yml
    uv run ansible-playbook playbooks/site.yml

ping:
    ansible all -m ping

site:
    uv run ansible-playbook playbooks/site.yml

# Reads from 1Password and writes env vars to the server
env-vars:
    uv run ansible-playbook playbooks/setup_env.yml

# Dry-run: show what env-vars would change without touching the server
env-vars-check:
    uv run ansible-playbook playbooks/setup_env.yml --check --diff
