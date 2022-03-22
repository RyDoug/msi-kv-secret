const express = require('express')
const app = express()
const port = 3000
const { SecretClient } = require("@azure/keyvault-secrets");
const { DefaultAzureCredential } = require("@azure/identity");


app.get('/', async (req, res) => {
    const kvName = process.env["KEY_VAULT_NAME"];
    const secretName = process.env["SECRET_NAME"];

    const credential = new DefaultAzureCredential();
    const kvURL = `https://${kvName}.vault.azure.net`    

    const client = new SecretClient(kvURL, credential); 
    const secretValue = await client.getSecret(secretName);
    
    console.log(`secret: ${secretValue.value}`);
    res.send(`secret: ${secretValue.value}`)
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})