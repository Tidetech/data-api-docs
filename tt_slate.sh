#!/usr/bin/env bash
set -o errexit #abort if any command fails

help_message="\
Usage: $me [-c FILE] [<options>]
Run locally,
Build for deployment,
Deploy built files to tidetech S3 bucket.

Options:

  -h, --help               Show this help information.
      --dev                Serve the Slate doc site locally on port 4567
      --build              Build the Slate doc files to ./build
      --deploy          Sync build to S3 production site and invalidate CloudFront cache
"

run_dev() {
  docker run --rm --name slate -p 4567:4567 -v $(pwd)/source:/srv/slate/source slatedocs/slate serve
}

run_build() {
  docker run --rm --name slate -v $(pwd)/build:/srv/slate/build -v $(pwd)/source:/srv/slate/source slatedocs/slate build
}

run_deploy() {
  aws s3 sync ./build/ s3://docs.tidetech.org/data-api --delete --exclude ".git/*"
  aws cloudfront create-invalidation --distribution-id=E3UMYDANSKFA0F --paths '/*'
}

parse_args() {
  # Set args from a local environment file.
  if [ -e ".env" ]; then
    source .env
  fi

  if [[ $1 = "-h" || $1 = "--help" ]]; then
    echo "$help_message"
    exit 0
  elif [[ $1 = "--dev" ]]; then
    run_dev
  elif [[ $1 = "--build" ]]; then
    run_build
  elif [[ $1 = "--deploy" ]]; then
    run_deploy
  else
    >&2 echo "Specify one of --dev, --build or --deploy"
  fi

}

parse_args "$@"
