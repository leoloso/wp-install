#!/bin/bash

# Validate that all required environment variables are set
./install/validate-env-variables.sh
if [ $? -eq 0 ]
then
    # Fill wp-config.php
    ./install/set-wp-config.sh

    # Proceed to maybe install WordPress
    ./install/maybe-install-wp.sh
fi
