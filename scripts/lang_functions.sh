#!/bin/bash
#
# Common functions to fetch languages.
#

LANG_PATH='../src/assets/lang'
SUFFIX='' # Determines suffix of the langpacks to be merged. Ie, using wp will include en.json and en_wp.json
          # (and the later will override the earlier).
LANGPACKS_PATH='/tmp/moodleapp-lang'

# Get the version of the Moodle App to fetch latest languages.
function get_app_version {
    if [ ! -z "${LANGVERSION}" ]; then
        return
    fi

    APP_VERSION=$(jq -r '.versionname' ../moodle.config.json| cut -d. -f1-2)
    if [ ! -z "$APP_VERSION" ]; then
        export LANGVERSION=$APP_VERSION
        echo "Using app version $LANGVERSION"
        return
    fi

    echo "Cannot decide version"
    exit 1
}
