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

# DBMS Settings for Islandora Drupal
islandora_db_host: "{{ mariadb_host }}"       
islandora_db_port: "{{ mariadb_port }}"        
islandora_db_user: root        
islandora_db_pass: root        

islandora_site: "repository"   # Islandora Drupal Site name
islandora_db: "drupal_{{islandora_site}}_{{environment_name}}" 
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