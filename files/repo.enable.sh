#!/bin/bash


drush -r /srv/repository/drupal -y -u 1 en islandora
drush -r /srv/repository/drupal -y -u 1 en islandora_basic_collection
drush -r /srv/repository/drupal -y -u 1 en imagemagick islandora_basic_image
drush -r /srv/repository/drupal -y -u 1 en islandora_solr
