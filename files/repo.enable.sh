#!/bin/bash

source /opt/d7/etc/d7_conf.sh

ISLANDORA_ROOT="/srv/repository/drupal"

drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora islandora_basic_collection php_lib

# Solr, forms, and metadata
drush -r "$ISLANDORA_ROOT" -y -u 1 en objective_forms xml_forms xml_form_builder xml_schema_api xml_form_elements xml_form_api islandora_marcxml
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_solr islandora_solr_config

# Repository access control will happen in XACML, so we open things up in Drupal
drush -r "$ISLANDORA_ROOT" -y -u 1 role-add-perm 'anonymous user' 'view fedora repository objects'
drush -r "$ISLANDORA_ROOT" -y -u 1 role-add-perm 'authenticated user' 'view fedora repository objects'

# Basic Image and Large Image
drush -r "$ISLANDORA_ROOT" -y -u 1 en imagemagick islandora_basic_image islandora_large_image islandora_openseadragon
drush -r "$ISLANDORA_ROOT" eval "variable_set('image_toolkit', 'imagemagick')"
drush -r "$ISLANDORA_ROOT" eval "variable_set('imagemagick_convert', '/usr/bin/convert')"
drush -r "$ISLANDORA_ROOT" eval "variable_set('islandora_use_kakadu', TRUE)"
drush -r "$ISLANDORA_ROOT" eval "variable_set('islandora_kakadu_url', '/usr/local/bin/kdu_compress')"
drush -r "$ISLANDORA_ROOT" eval "variable_set('islandora_large_image_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'))"

# Book
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_paged_content islandora_book islandora_internet_archive_bookreader
drush -r "$ISLANDORA_ROOT" eval "variable_set('islandora_book_page_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'))"
drush -r "$ISLANDORA_ROOT" eval "variable_set('islandora_book_viewers', array('name' => array('none' => 'none', 'islandora_internet_archive_bookreader' => 'islandora_internet_archive_bookreader'), 'default' => 'islandora_internet_archive_bookreader'))"
