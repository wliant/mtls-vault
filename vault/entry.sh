#!/bin/sh

export VAULT_ADDR='https://vault:8200'
export VAULT_CACERT='/certs/vault-ca.pem'

vault login root
vault auth enable cert

vault write auth/cert/certs/web display_name=web policies=web,prod certificate=@/certs/client.pem ttl=3600
vault secrets disable secret
vault secrets enable -version=1 -path=secret kv-v1

vault policy write read-policy /mnt/read-policy.hcl
vault write auth/cert/certs/web/policies=read-policy
