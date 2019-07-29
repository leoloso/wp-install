#!/bin/bash

# Solution to adding colors: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# Solution to adding links: https://stackoverflow.com/questions/4414297/unix-bash-script-to-embolden-underline-italicize-specific-text
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
UNDERLINE=`tput smul`
NOUNDERLINE=`tput rmul`

# Install WordPress through Composer:
echo "Downloading and installing WordPress through Composer..."
echo -e "${YELLOW}(this may take a few minutes)${NC}"
composer create-project leoloso/wp-install $FOLDER_NAME dev-master

# Install the must-use plugins:
cd $FOLDER_NAME
composer install

## Check if WordPress is installed. If not, install it
echo "Checking if WordPress is installed: "
echo 
if ! $(wp core is-installed); then

    echo "WordPress is not installed yet. Installing WordPress through WP-CLI..."
    
    # Configure wp-config.php through WP-CLI: (reference: https://developer.wordpress.org/cli/commands/config/set/)
    wp config set DB_NAME $DB_NAME #eg: database
    wp config set DB_USER $DB_USER #eg: admin
    wp config set DB_PASSWORD $DB_PASSWORD #eg: sADF!kl9diq@#Sjfk
    wp config set DB_HOST $DB_HOST #eg: 127.0.0.1

    # Generate random SALT keys through WP-CLI: (reference: https://developer.wordpress.org/cli/commands/config/shuffle-salts/)
    wp config shuffle-salts

    # Install WordPress: (reference: https://developer.wordpress.org/cli/commands/core/install/)
    wp core install --url=$SITE_URL_WITHOUT_HTTP --title="$SITE_NAME" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL

    # Update the site URL, adding "/wp"
    wp option update siteurl $SITE_URL_WITH_HTTP/wp

    # Check if the installation was successful. If not, show an error message
    if ! $(wp core is-installed); then
        echo -e "❌ ${RED}Installation unsuccessful.${NC} Please check the error messages displayed in the console to solve the issue, and then try again."
        echo -e "If you need help, please copy the console output and send it to Leo by email (${ORANGE}leo@getpop.org${NC}), and he will try to help."
        exit 1;
    fi
else
    echo -e "✅ ${GREEN}WordPress is already installed!${NC}"
    exit 0;
fi

echo
echo -e "✅ ${GREEN}Installation successful!${NC} Please check that the following URLs work fine:"
echo "############################################"
echo -e "🍎 WordPress site: ${ORANGE}${UNDERLINE}$SITE_URL_WITH_HTTP${NOUNDERLINE}${NC}"
echo -e "🍎 WordPress admin: ${ORANGE}${UNDERLINE}$SITE_URL_WITH_HTTP/wp/wp-admin/${NOUNDERLINE}${NC}"
echo "############################################"
echo
echo "Bye 👋 , happy using WordPress!"
exit 0;