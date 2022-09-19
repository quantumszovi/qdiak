#! /bin/ash
main() {
  local GITHUB_PERSONAL_ACCESS_TOKEN=$GH_PAT
  local REPO_URL_HTTPS=$1
  local REPO_TARGET_BRANCH=$2
  local APP_NAME=$3
  local AUTHORIZED_REPO_URL_HTTPS=$(echo $REPO_URL_HTTPS | sed "s|https://|https://$GITHUB_PERSONAL_ACCESS_TOKEN@|")
  rm -rf /tmp/$APP_NAME
  git clone --depth 1 -b $REPO_TARGET_BRANCH $AUTHORIZED_REPO_URL_HTTPS /tmp/$APP_NAME

  echo $GH_PAT | docker login ghcr.io --username GAlexIHU --password-stdin  
  APP_NAME=$APP_NAME IMAGE_BASE=ghcr.io/qdiak/iskolaszovi2 TAG=test docker buildx bake --push
}

main $@