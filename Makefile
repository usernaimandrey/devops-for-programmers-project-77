-include terraform/Makefile

export ANSIBLE_VAULT_PASSWORD_FILE=$(CURDIR)/files/vault_pass

edit-vault-pass:
	ansible-vault edit ansible/group_vars/all/vault.yml

configure-terraform:
	ansible-playbook ansible/terraform.yml -i inventory.ini -u $$USER

create-y-token:
	bin/create_yc_token
