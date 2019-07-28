# Install WordPress through Composer and WP-CLI

Quickly launch a WordPress instance through Composer and WP-CLI

## Install

Via [Composer](https://getcomposer.org) and [WP-CLI](https://wp-cli.org/):

1. Create the [WordPress database and user](https://wordpress.org/support/article/how-to-install-wordpress/#step-2-create-the-database-and-a-user)
2. Set environment variables: Copy the code below to an editor, replace all values (such as `{YOUR_SITE_FOLDER_NAME}`) with your own values, and then paste it on the terminal to execute:

```bash
export FOLDER_NAME={YOUR_SITE_FOLDER_NAME} #eg: MyAwesomeSite
export DB_NAME={YOUR_SITE_DB_NAME} #eg: database
export DB_USER={YOUR_SITE_DB_USER} #eg: admin
export DB_PASSWORD={YOUR_SITE_DB_PASSWORD} #eg: sADF!kl9diq@#Sjfk
export DB_HOST={YOUR_SITE_DB_HOST} #eg: 127.0.0.1
export SITE_URL_WITHOUT_HTTP={YOUR_SITE_URL_WITHOUT_HTTP} #eg: localhost
export SITE_URL_WITH_HTTP={YOUR_SITE_URL_WITH_HTTP} #eg: http://localhost
export SITE_NAME="{YOUR_SITE_NAME}" #eg: "My awesome website"
export ADMIN_USER={ADMIN_USER} #eg: admin
export ADMIN_PASSWORD={ADMIN_PASSWORD} #eg: JKo$@sfjASD00w
export ADMIN_EMAIL={ADMIN_EMAIL} #eg: pedro@example.com
```

3. In the terminal, `cd` to the folder where to install the site, and execute script:

```bash
wget -O - https://raw.githubusercontent.com/leoloso/wp-install/master/install.sh | bash
```

(Or copy/paste the contents of [install.sh](https://github.com/leoloso/wp-install/blob/master/install.sh) in the terminal, eg: for Windows users)

4. Wait for a few minutes ☕️😁
5. Check that WordPress was successfully installed:
    - WordPress site: {YOUR_SITE_URL_WITH_HTTP}
    - WordPress admin: {YOUR_SITE_URL_WITH_HTTP}/wp/wp-admin/

## Credits

- [Leonardo Losoviz][link-author]

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

[link-author]: https://github.com/leoloso
