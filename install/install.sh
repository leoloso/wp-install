#!/bin/bash

# Configure wp-config.php through WP-CLI
bash -x ./install/set-wp-config.sh
#wget -O - https://raw.githubusercontent.com/leoloso/wp-install/master/install/set-wp-config.sh --quiet | bash

# Check if WordPress is installed. If not, install it
bash -x ./install/maybe-install-wp.sh
#wget -O - https://raw.githubusercontent.com/leoloso/wp-install/master/install/maybe-install-wp.sh --quiet | bash

