#!/bin/bash


drush -r /srv/repository/drupal -y -u 1 en islandora
drush -r /srv/repository/drupal -y -u 1 en islandora_basic_collection
drush -r /srv/repository/drupal -y -u 1 en islandora_solr
drush -r /srv/repository/drupal -y -u 1 en php_lib
drush -r /srv/repository/drupal -y -u 1 en objective_forms
drush -r /srv/repository/drupal -y -u 1 en islandora_xml_forms
drush -r /srv/repository/drupal -y -u 1 en islandora_solr_config
drush -r /srv/repository/drupal -y -u 1 en imagemagick islandora_basic_image
