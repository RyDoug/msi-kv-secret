# msi-kv-secret
Example express docker application that pulls a single secret from an Azure Key Vault using Managed Identity.

This container has SSH enabled for App Services compatibility.
-- Application listens on port 3000.
-- For app services add the App Setting WEBSITE_PORT = 3000

Required environment variables:
-- KEY_VAULT_NAME
-- SECRET_NAME

This application will return the secret value specified.
-- This will not work unless running on Azure product with Managed Identity enabled.
-- You must ensure the Managed Identity has been given get access on the Key Vault for secrets.