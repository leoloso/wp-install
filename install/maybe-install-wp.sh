#!/bin/bash

# Solution to adding colors: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# Solution to adding links: https://stackoverflow.com/questions/4414297/unix-bash-script-to-embolden-underline-italicize-specific-text
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
UNDERLINE=`tput smul`
NOUNDERLINE=`tput rmul`

## Check if WordPress is installed. If not, install it
echo "Checking if WordPress is installed: "
echo
if ! $(wp core is-installed); then

    echo "WordPress is not installed yet. Installing WordPress through WP-CLI..."

    # Install WordPress: (reference: https://developer.wordpress.org/cli/commands/core/install/)
    wp core install --url=$SITE_URL_WITHOUT_HTTP --title="$SITE_NAME" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL

    # To make sure it contains https
    wp option update home $SITE_URL_WITH_HTTP

    # Update the site URL, adding "/wp"
    wp option update siteurl $SITE_URL_WITH_HTTP/wp

    # Check if the installation was successful. If not, show an error message
    if ! $(wp core is-installed); then
        echo -e "❌ ${RED}Installation unsuccessful.${NC} Please check the error messages displayed in the console to solve the issue, and then try again."
        echo -e "If you need help, please copy the console output and send it to Leo by email (${ORANGE}leo@getpop.org${NC}), and he will try to help."
        exit 1;
    fi

    echo -e "✅ ${GREEN}Installation successful!${NC} Please check that the following URLs work fine:"
    echo -e "🍎 WordPress site: ${ORANGE}${UNDERLINE}$SITE_URL_WITH_HTTP${NOUNDERLINE}${NC}"
    echo -e "🍎 WordPress admin: ${ORANGE}${UNDERLINE}$SITE_URL_WITH_HTTP/wp/wp-admin/${NOUNDERLINE}${NC}"
else
    echo -e "✅ ${GREEN}WordPress is already installed!${NC}"
fi
