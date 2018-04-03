duration=14400    # set default session duration to 4 hours
usage="\nUsage:\n  $0 [-d <session_duration_seconds>]\n"
while getopts ":d:h" opt; do
  case $opt in
    d)
      duration=$OPTARG
      ;;
    h)
      echo -e "$usage"
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      echo -e "$usage"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      echo -e "$usage"
      exit 1
      ;;
  esac
done

mkdir -p ~/.aws/
touch ~/.aws/credentials
sudo docker run -it --rm -v ~/.aws:/root/.aws aws-saml-api $duration
