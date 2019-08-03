#!/bin/bash

# Configure wp-config.php through WP-CLI: (reference: https://developer.wordpress.org/cli/commands/config/set/)
wp config set DB_NAME $DB_NAME #eg: database
wp config set DB_USER $DB_USER #eg: admin
wp config set DB_PASSWORD $DB_PASSWORD #eg: sADF!kl9diq@#Sjfk
if [ -n "$DB_HOST" ]
then
    wp config set DB_HOST $DB_HOST #eg: 127.0.0.1
fi

# SALT keys
if [ -n "$SHUFFLE_SALT_KEYS" ]
then
    # Shuffle them (reference: https://developer.wordpress.org/cli/commands/config/shuffle-salts/)
    wp config shuffle-salts
else
    # Set them through environment variables
    wp config set AUTH_KEY "$AUTH_KEY"
    wp config set SECURE_AUTH_KEY "$SECURE_AUTH_KEY"
    wp config set LOGGED_IN_KEY "$LOGGED_IN_KEY"
    wp config set NONCE_KEY "$NONCE_KEY"
    wp config set AUTH_SALT "$AUTH_SALT"
    wp config set SECURE_AUTH_SALT "$SECURE_AUTH_SALT"
    wp config set LOGGED_IN_SALT "$LOGGED_IN_SALT"
    wp config set NONCE_SALT "$NONCE_SALT"
fi
