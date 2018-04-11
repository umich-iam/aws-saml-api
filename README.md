# aws-saml-api

This is a fork of https://github.com/CU-CloudCollab/samlapi to work with the University of Michigan IdP.

All credit goes to sbower and Cornell for their efforts.

## Usage
1. Build the aws-saml-api container
```
docker build -t aws-saml-api .
```

2. Launch the container  
NOTE: Your ~/.aws/credentials file must exist before launching the container. Launching from aws-saml-api.sh will create this for you. Use the optional -d flag to specify a session duration in seconds, the default is 4 hours. The role you assume must be configured to allow the maximum session duration specified: https://aws.amazon.com/blogs/security/enable-federated-api-access-to-your-aws-resources-for-up-to-12-hours-using-iam-roles/.
```
sh aws-saml-api.sh [-d session_duration_seconds]

OR

docker run -it --rm -v ~/.aws:/root/.aws aws-saml-api
```

After this command has been run it will prompt you for your uniqname and password.  This will be used to login you into Shibboleth. Then you will prompted to choose a DUO authentication method (push or passcode). Once you have authenticated via DUO, you will be prompted to select the role you wish to use for login, if you have only one role it will choose that automatically.  The credentials will be placed in the saml credential file (~/.aws/credentials) and can be used as follows:

```
aws --profile saml s3 ls
```

## More Info

http://blogs.cornell.edu/cloudification/2016/07/05/using-shibboleth-for-aws-api-and-cli-access/

Base Image can be found here: https://github.com/CU-CommunityApps/docker-xvfb-firefox.
