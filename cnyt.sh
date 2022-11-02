#!/bin/bash

# Reading arguments
SERVER_URL="${1}";
SDK_KEY="${2}";
CUSTOM_DSYM_PATH="${3}";

# Pre-checks
if [[ -z $SERVER_URL ]]; then
	echo "[AppConnect]: SERVER URL not found!";
	exit 0;
fi

if [[ -z $SDK_KEY ]]; then
	echo "[AppConnect]: SDK KEY not found!";
	exit 0;
fi

if [[ -z $CUSTOM_DSYM_PATH ]]; then
    if [ ! "${DWARF_DSYM_FOLDER_PATH}" ] || [ ! "${DWARF_DSYM_FILE_NAME}" ]; then
        echo "[AppConnect]: Custom dSYM Path not found and Xcode Environment Variables are missing!"
  		exit 0;
    fi
    DSYM_FOLDER_PATH=${DWARF_DSYM_FOLDER_PATH}
    DSYM_FILE_NAME=${DWARF_DSYM_FILE_NAME}
else
    DSYM_FOLDER_PATH=$(dirname "${CUSTOM_DSYM_PATH}")
    DSYM_FILE_NAME=$(basename "${CUSTOM_DSYM_PATH}")
fi

DSYM_PATH="${DSYM_FOLDER_PATH}/${DSYM_FILE_NAME}";
if [[ ! -d $DSYM_PATH ]]; then
	echo "[AppConnect]: dSYM path ${DSYM_PATH} does not exist!"
  	exit 0;
fi

# Extracting Build UUIDs from DSYM using dwarfdump
BUILD_UUIDS=$(xcrun dwarfdump --uuid "${DSYM_PATH}" | awk '{print $2}' | xargs | sed 's/ /,/g')
if [ $? -eq 0 ]; then
    echo "[AppConnect]: Extracted Build UUIDs: ${BUILD_UUIDS}"
else
	echo "[AppConnect]: Extracting Build UUIDs failed!"
  	exit 0;
fi

# Creating archive of DSYM folder using zip
DSYM_ZIP_PATH="/tmp/$(date +%s)_${DSYM_FILE_NAME}.zip"
pushd "${DSYM_FOLDER_PATH}" > /dev/null
zip -rq "${DSYM_ZIP_PATH}" "${DSYM_FILE_NAME}"
popd > /dev/null
if [ $? -eq 0 ]; then
    echo "[AppConnect]: Created archive at $DSYM_ZIP_PATH"
else
    echo "[AppConnect]: Creating archive failed!"
    exit 0;
fi














