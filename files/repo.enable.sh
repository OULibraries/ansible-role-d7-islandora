#!/bin/bash

source /opt/d7/etc/d7_conf.sh

ISLANDORA_ROOT="/srv/repository/drupal"


# Site and theme basics
drush -r "$ISLANDORA_ROOT" -y -u 1 en jquery_update bootstrap oulib_repository
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('theme_default','oulib_repository')"
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora islandora_basic_collection php_lib

# Solr, forms, and metadata
drush -r "$ISLANDORA_ROOT" -y -u 1 en objective_forms xml_forms xml_form_builder xml_schema_api xml_form_elements xml_form_api islandora_marcxml
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_solr islandora_solr_config

# Repository access control will happen in XACML, so we open things up in Drupal
drush -r "$ISLANDORA_ROOT" -y -u 1 role-add-perm 'anonymous user' 'view fedora repository objects'
drush -r "$ISLANDORA_ROOT" -y -u 1 role-add-perm 'authenticated user' 'view fedora repository objects'

# Basic Image and Large Image
drush -r "$ISLANDORA_ROOT" -y -u 1 en imagemagick islandora_basic_image islandora_large_image islandora_openseadragon
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('image_toolkit', 'imagemagick')"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('imagemagick_convert', '/usr/bin/convert')"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('islandora_use_kakadu', TRUE)"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('islandora_kakadu_url', '/usr/local/bin/kdu_compress')"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('islandora_large_image_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'))"

# Books 
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_paged_content islandora_book islandora_internet_archive_bookreader
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('islandora_book_page_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'))"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('islandora_book_viewers', array('name' => array('none' => 'none', 'islandora_internet_archive_bookreader' => 'islandora_internet_archive_bookreader'), 'default' => 'islandora_internet_archive_bookreader'))"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('islandora_paged_content_djatoka_url', '/adore-djatoka')"
# no OCR because we don't do tesseract yet
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('islandora_book_ingest_derivatives', array( 'pdf' => 'pdf', 'image' => 'image', 'ocr' => 0 ))"


# Islandora oEmbed set up
drush -r "$ISLANDORA_ROOT" -y -u 1 en ctools
drush -r "$ISLANDORA_ROOT" -y -u 1 en link
drush -r "$ISLANDORA_ROOT" -y -u 1 en entity_iframe_theme
drush -r "$ISLANDORA_ROOT" -y -u 1 en oembed oembed_provider oembed_field
drush -r "$ISLANDORA_ROOT" -y -u 1 en themekey 
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_embed
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_embed_theme
drush -r "$ISLANDORA_ROOT" -y -u 1 en islandora_internet_archive_bookreader_custom

# URIs
drush -r "$ISLANDORA_ROOT" -y -u 1 en pathauto subpathauto islandora_pathauto
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('islandora_pathauto_selected_cmodels', array( 0 => 'islandora:pageCModel', 1 => 'islandora:bookCModel',  2 => 'islandora:sp_large_image_cmodel') )"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('pathauto_islandora_islandora:bookCModel_pattern', '/uuid/[fedora:shortpid]')"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('pathauto_islandora_islandora:pageCModel_pattern', '/uuid/[fedora:shortpid]')"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('pathauto_islandora_islandora:sp_large_image_cmodel_pattern', '/uuid/[fedora:shortpid]')"
drush -r "$ISLANDORA_ROOT" -y -u 1 eval "variable_set('subpathauto_depth', 4)"

