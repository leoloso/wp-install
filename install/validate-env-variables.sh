#!/bin/bash

# Flag to know if there are errors
ERROR_ENV_VARS=""

# Required for wp-config.php
if [ -z "$DB_NAME" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nDB_NAME"
fi
if [ -z "$DB_USER" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nDB_USER"
fi
if [ -z "$DB_PASSWORD" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nDB_PASSWORD"
fi

# Required for installing WordPress through WP-CLI
if [ -z "$SITE_URL_WITHOUT_HTTP" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nSITE_URL_WITHOUT_HTTP"
fi
if [ -z "$SITE_URL_WITH_HTTP" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nSITE_URL_WITH_HTTP"
fi
if [ -z "$SITE_NAME" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nSITE_NAME"
fi
if [ -z "$ADMIN_USER" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nADMIN_USER"
fi
if [ -z "$ADMIN_PASSWORD" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nADMIN_PASSWORD"
fi
if [ -z "$ADMIN_EMAIL" ]
then
    ERROR_ENV_VARS="$ERROR_ENV_VARS\nADMIN_EMAIL"
fi

# If there are errors, return an error state
if [ -n "$ERROR_ENV_VARS" ]
then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color

    echo -e "${RED}Fatal error:${NC} The following environment variable(s) cannot be empty: ${GREEN}$ERROR_ENV_VARS${NC}"
    echo "Terminating process."
    exit 1
fi
