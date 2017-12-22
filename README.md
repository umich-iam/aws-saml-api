# aws-saml-api

This is a fork of https://github.com/CU-CloudCollab/samlapi to work with the University of Michigan IdP.

All credit goes to sbower and Cornell for their efforts.

## Usage
1. Build the aws-saml-api container
```
docker build -t aws-saml-api .
```

2. Launch the container
NOTE: Your ~/.aws/credentials file must exist before launching the container. Launching from aws-saml-api.sh will create this for you.
```
docker run -it --rm -v ~/.aws:/root/.aws aws-saml-api

OR

sh aws-saml-api.sh
```

After this command has been run it will prompt you for your uniqname and password.  This will be used to login you into Shibboleth. You will get a push from DUO.  Once you have confirmed the DUO notification, you will be prompted to select the role you wish to use for login, if you have only one role it will choose that automatically.  The credentials will be placed in the default credential file (~/.aws/credentials) and can be used as follows:

```
aws --profile saml s3 ls
```

## More Info

http://blogs.cornell.edu/cloudification/2016/07/05/using-shibboleth-for-aws-api-and-cli-access/

Base Image can be found here: https://github.com/CU-CommunityApps/docker-xvfb-firefox.
