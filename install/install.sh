#!/bin/bash

# Fill wp-config.php
./install/set-wp-config.sh

# Proceed to maybe install WordPress
./install/maybe-install-wp.sh
