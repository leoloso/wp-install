#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Required for wp-config.php
if [ -z $DB_NAME ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}DB_NAME${NC}\" cannot be empty. Terminating process."
    exit 1
fi
if [ -z $DB_USER ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}DB_USER${NC}\" cannot be empty. Terminating process."
    exit 1
fi
if [ -z $DB_PASSWORD ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}DB_PASSWORD${NC}\" cannot be empty. Terminating process."
    exit 1
fi

# Required for installing WordPress through WP-CLI
if [ -z $SITE_URL_WITHOUT_HTTP ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}SITE_URL_WITHOUT_HTTP${NC}\" cannot be empty. Terminating process."
    exit 1
fi
if [ -z $SITE_URL_WITH_HTTP ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}SITE_URL_WITH_HTTP${NC}\" cannot be empty. Terminating process."
    exit 1
fi
if [ -z $SITE_NAME ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}SITE_NAME${NC}\" cannot be empty. Terminating process."
    exit 1
fi
if [ -z $ADMIN_USER ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}ADMIN_USER${NC}\" cannot be empty. Terminating process."
    exit 1
fi
if [ -z $ADMIN_PASSWORD ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}ADMIN_PASSWORD${NC}\" cannot be empty. Terminating process."
    exit 1
fi
if [ -z $ADMIN_EMAIL ]
then
    echo -e "${RED}Fatal error:${NC} Environment constant \"${GREEN}ADMIN_EMAIL${NC}\" cannot be empty. Terminating process."
    exit 1
fi
