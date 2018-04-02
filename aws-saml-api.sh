duration=14400    # set default session duration to 4 hours
while getopts ":d:" opt; do
  case $opt in
    d)
      duration=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      exit 1
      ;;
  esac
done

mkdir -p ~/.aws/
touch ~/.aws/credentials
sudo docker run -it --rm -v ~/.aws:/root/.aws aws-saml-api $duration
