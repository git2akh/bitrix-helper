#!/usr/bin/env sh

GIT_SCHEME="https";
GIT_HOST=github.com
GIT_AUTHOR="git2akh";
GIT_REPO="bitrix-helper";
GIT_ORIGIN="${GIT_SCHEME}://${GIT_HOST}/${GIT_AUTHOR}/${GIT_REPO}.git";
GIT_REPO_API_BASE="https://api.${GIT_HOST}/repos/${GIT_AUTHOR}/${GIT_REPO}";
GIT_REPO_LATEST_DATA="$(curl ${GIT_REPO_API_BASE}/releases/latest)";
GIT_REPO_LATEST_TAG="$(echo "${GIT_REPO_LATEST_DATA}" | sed -nE 's;^[[:space:]]{2}"tag_name"[[:space:]]*:[[:space:]]*"([^"]+)"[[:space:],]{0,1}$;\1;p;')";
GIT_LATEST_zipball_url="$(echo "${GIT_REPO_LATEST_DATA}" | sed -nE 's;^[[:space:]]{2}"tarball_url"[[:space:]]*:[[:space:]]*"([^"]+)"[[:space:],]{0,1}$;"\1";p;')";
GIT_LATEST_tarball_url="$(echo "${GIT_REPO_LATEST_DATA}" | sed -nE 's;^[[:space:]]{2}"tarball_url"[[:space:]]*:[[:space:]]*"([^"]+)"[[:space:],]{0,1}$;"\1";p;')";
GIT_LATEST_FETCH_zipball_CMD="curl ${GIT_LATEST_zipball_url} | tee \"${GIT_REPO}.${GIT_REPO_LATEST_TAG}.zip\" | wc -c";
GIT_LATEST_FETCH_tarball_CMD="curl ${GIT_LATEST_tarball_url} | tee \"${GIT_REPO}.${GIT_REPO_LATEST_TAG}.tar\" | wc -c";

GIT_BRANCH="$(echo "${GIT_REPO_LATEST_TAG}" | sed -nE 's;^(.+)$;--branch=\1 --single-branch;p;')";
#GIT_BRANCH_FLAG_SB="$([ -z "${GIT_BRANCH}" ] || echo "--single-branch")";
GIT_CLONE_CMD="git clone ${GIT_ORIGIN} ${GIT_BRANCH}"; # ${GIT_BRANCH_FLAG_SB};

FETCH_DIR=".core";

echo "starting @send2akh/bitrix-helper Ubuntu Installer by NimbleFridge ...";
#############################################################################
#############################################################################

[ -d "${FETCH_DIR}" ] || mkdir "${FETCH_DIR}";
cd "${FETCH_DIR}";
echo "${GIT_ORIGIN}";
echo "${GIT_CLONE_CMD}";
$GIT_CLONE_CMD;
$GIT_LATEST_FETCH_zipball_CMD;
$GIT_LATEST_FETCH_tarball_CMD;
cd "${GIT_REPO}";
pwd;

#############################################################################
#############################################################################
echo "... done.";
exit 0;