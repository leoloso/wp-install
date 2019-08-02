#!/bin/bash

# Solution to adding colors: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# Solution to adding links: https://stackoverflow.com/questions/4414297/unix-bash-script-to-embolden-underline-italicize-specific-text
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Install WordPress through Composer:
echo "Downloading and installing WordPress through Composer..."
echo -e "${YELLOW}(this may take a few minutes)${NC}"
composer create-project leoloso/wp-install $FOLDER_NAME dev-master

# Install the must-use plugins:
cd $FOLDER_NAME
composer install

# Configure wp-config.php through WP-CLI
#./set-wp-config.sh
wget -O - https://raw.githubusercontent.com/leoloso/wp-install/master/install/set-wp-config.sh | bash

## Check if WordPress is installed. If not, install it
#./maybe-install-wp.sh
wget -O - https://raw.githubusercontent.com/leoloso/wp-install/master/install/maybe-install-wp.sh | bash

