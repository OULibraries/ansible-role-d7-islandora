#!/bin/bash

source /opt/d7/etc/d7_conf.sh

ISLANDORA_ROOT="/srv/repository/drupal"

drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora islandora_basic_collection php_lib

# Solr, forms, and metadata
drush -r "$ISLANDORA_ROOT" -y -u 1 en objective_forms xml_forms xml_form_builder xml_schema_api xml_form_elements xml_form_api 
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_solr islandora_solr_config


# Basic Image and Large Image
drush -r "$ISLANDORA_ROOT" -y -u 1 en imagemagick islandora_basic_image islandora_large_image islandora_openseadragon
drush -r "$ISLANDORA_ROOT" eval "variable_set('islandora_book_page_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'))"


# Book
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_paged_content islandora_book
drush -r "$ISLANDORA_ROOT" eval "variable_set('islandora_large_image_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'))"

# Sample Content Generator
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_batch islandora_book_batch islandora_scg
