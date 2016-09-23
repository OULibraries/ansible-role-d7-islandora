OULibraries.d7-islandora
=========

Installs Islandora 7.x-1.7 

Requirements
------------

Requires (and installs) pexpect on target host

Role Variables
--------------

```yaml
gsearch_pass: "fgsAdmin" # default password for gsearch admin

islandora_db_host: "localhost" # DBMS for Islandora Drupal
islandora_db_pass: "root"   # User account for Islandora Drupal db
islandora_db_user: "root"   # Password for Islandor Drupal db

islandora_site: "repository"   # Islandora Drupal Site name
```

Dependencies
------------

Depends on at least:

* OULibraries.centos7
* OULibraries.fcrepo3
* OULibraries.d7

Example Playbook
----------------

TBD

License
-------

TBD

Author Information
------------------

Written for OU Libraries