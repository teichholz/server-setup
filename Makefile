.PHONY: install bootstrap ping site env-vars env-vars-check

install:
	ansible-galaxy install -r requirements.yml

# One-time: create the server_user on a fresh machine, then run the full playbook
bootstrap:
	ansible-playbook playbooks/bootstrap.yml
	ansible-playbook playbooks/site.yml

ping:
	ansible all -m ping

site:
	ansible-playbook playbooks/site.yml

# Reads from 1Password and writes env vars to the server
env-vars:
	op run -- ansible-playbook playbooks/setup_env.yml

# Dry-run: show what env-vars would change without touching the server
env-vars-check:
	op run -- ansible-playbook playbooks/setup_env.yml --check --diff
