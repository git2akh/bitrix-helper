#!/usr/bin/env sh

GIT_SCHEME="https";
GIT_HOST
GITHUB_AUTHOR="git2akh";
GITHUB_REPO="bitrix-helper";
GITHUB_ORIGIN="https://github.com//${GIT_NAME}.git";
FETCH_DIR=".core";

echo "starting @send2akh/bitrix-helper Ubuntu Installer by NimbleFridge ...";
#############################################################################
#############################################################################

[ -d "${FETCH_DIR}" ] || mkdir "${FETCH_DIR}";
cd "${FETCH_DIR}";
git clone "${GIT_ORIGIN}";


#############################################################################
#############################################################################
echo "... done.";
exit 0;