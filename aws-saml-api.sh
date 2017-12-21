mkdir -p ~/.aws/
touch ~/.aws/credentials
sudo docker run -it --rm -v ~/.aws:/root/.aws aws-saml-api
