# Setting up Environment Variables

Before running the application, make sure to set up the following environment variables:

- `TF_VAR_DO_TOKEN`: This environment variable should be set to your DigitalOcean API token. You can obtain this token from the DigitalOcean dashboard.
- `ORPORT`: This environment variable specifies the port number for your Tor relay's ORPort. This is the port on which your relay listens for incoming Tor connections.
- `OBFS4PORT`: This environment variable specifies the port number for your Tor relay's obfs4 transport. Obfs4 is a pluggable transport for Tor that provides additional obfuscation.
- `CONTACT_EMAIL`: This environment variable should be set to the contact email address for the administrator or maintainer of the Tor relay.

Once you have set up these environment variables, you can proceed with running the application.

# Execution

### Infrastructure
```
terraform -chdir=tf apply
```

### Tor intsall
```
ansible-playbook -i ansible/inv.digitalocean.yaml deploy.yaml
```

# Tor Browser

### Using a Specific Tor Bridge with Tor Browser

1. **Obtain Bridge Configuration**: Obtain the bridge configuration details, including the bridge address, port, and any additional parameters such as a bridge password or obfs4 parameters.

2. **Configure Tor Browser**:
   - Open Tor Browser and click on the menu button (three horizontal lines) in the top-right corner.
   - Select "Preferences" or "Options" from the menu.
   - In the preferences/options window, go to the "Tor" or "Privacy & Security" section.
   - Scroll down to the "Tor Network Settings" or "Tor Connection" section.
   - Look for the "Bridges" configuration option and click on "Configure".
   - Enter the bridge configuration details obtained in step 1, including the bridge address, port, and any additional parameters.
   - Click "OK" or "Save" to save the bridge configuration.

3. **Connect to Tor Network**: Close and reopen the Tor Browser. It should now attempt to connect to the Tor network using the specified bridge.

Keep in mind to periodically update the bridge configuration as bridge addresses may change over time. Additionally, ensure that you obtain the correct bridge configuration details from a trusted source.

