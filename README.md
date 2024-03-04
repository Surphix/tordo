# Setting up Environment Variables

Before running the application, make sure to set up the following environment variables:

- `TF_VAR_DO_TOKEN`: This environment variable should be set to your DigitalOcean API token. You can obtain this token from the DigitalOcean dashboard.
- `ORPORT`: This environment variable specifies the port number for your Tor relay's ORPort. This is the port on which your relay listens for incoming Tor connections.
- `OBFS4PORT`: This environment variable specifies the port number for your Tor relay's obfs4 transport. Obfs4 is a pluggable transport for Tor that provides additional obfuscation.

Once you have set up these environment variables, you can proceed with running the application.

# Execution

## Infrastructure
```
terraform -chdir=tf apply
```

## Tor intsall
```
ansible-playbook -i ansible/inv.digitalocean.yaml deploy.yaml
```
