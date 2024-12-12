import hvac

client = hvac.Client(
    url='https://vault:8200',
    cert=('/certs/client.pem', '/certs/client.key'),
    verify='/certs/vault-ca.pem'
)

client.login('/v1/auth/cert/login')

print(client.is_authenticated())

secret_data = client.secrets.kv.v1.read_secret(path='wliant/mtls-vault')
print(secret_data['data'])