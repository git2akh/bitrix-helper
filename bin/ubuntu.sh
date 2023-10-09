#!/usr/bin/env sh

GIT_SCHEME="https";
GIT_HOST=github.com
GIT_AUTHOR="git2akh";
GIT_REPO="bitrix-helper";
GIT_ORIGIN="${GIT_SCHEME}://${GIT_HOST}/${GIT_AUTHOR}/${GIT_REPO}.git";
GIT_ORIGIN="$(curl https://api.github.com/repos/git2akh/bitrix-helper/releases/latest | sed -nE 's;^[[:space:]]{2}"html_url"[[:space:]]*:[[:space:]]*"([^"]+)"[[:space:],]{0,1}$;\1;p;')";
FETCH_DIR=".core";

echo "starting @send2akh/bitrix-helper Ubuntu Installer by NimbleFridge ...";
#############################################################################
#############################################################################

[ -d "${FETCH_DIR}" ] || mkdir "${FETCH_DIR}";
cd "${FETCH_DIR}";
echo "${GIT_ORIGIN}";
git clone "${GIT_ORIGIN}";
cd "${GIT_REPO}";
pwd;

#############################################################################
#############################################################################
echo "... done.";
exit 0;