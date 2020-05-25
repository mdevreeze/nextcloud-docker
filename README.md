# Nextcloud 18 docker setup with S3QL for scalable external storage

## Requires
* Ansible
* S3QL (for mkfs.s3ql)
* Ubuntu 20.04 host (other Debian based might also work?)

## Installs
* Docker
* MariaDB (containerized)
* Nextcloud 18 on Apache-Php (containerized)
* S3QL
* Lets encrypt SSL certificate with auto renew (containerized)
* Nginx reverse proxy (containerized)

## Setup

1. Create an Ansible vault based on `nextcloud-secrets.template.yml`.
2. Create S3QL FS on your local PC with `mkfs.s3ql s3c://endpoint.com/container-name`, use same variables as in the vault.
3. Save the master key and passphrase somewhere.
4. Modify playbook:
     1. Specify the correct Ansible host.
     2. Specify the VIRTUAL_HOST and LETSENCRYPT_EMAIL vars.
     3. Specify the correct path to `docker-compose.prod.yml`.
5. Run the playbook e.g. `ansible-playbook -u root nextcloud-deploy.yml --ask-vault-pass`. 
6. Add `'overwriteprotocol' => 'https'` to `config/config.php` and make sure the `overwrite.cli.url` has https too:
```
  'overwrite.cli.url' => 'https://domain.name',
  'overwriteprotocol' => 'https',
```
7. Configure /s3ql as external storage in Nextcloud settings.

## Gateway timeouts
I've encountered several timeouts during setups. These can occur when installing the Document server for example, since that one takes a long time. AFIAK the setup will continue in the background and will probably succeed. If not: 
* You can install the app by going to Apps settings `https://domain.com/settings/apps/app-bundles` and install the `Hub bundle`.
* Or you can login to the nextcloud container:
`docker exec -it --user www-data nextcloud_app_1 bash` and install it with the occ tool: `php occ app:install documentserver_community`.
