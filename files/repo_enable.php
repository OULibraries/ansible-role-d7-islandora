<?php

$anonymous_role = user_role_load_by_name('anonymous user');
$authenticated_role = user_role_load_by_name('authenticated user');

module_enable( array('jquery_update', 'bootstrap', 'oulib_repository') );
variable_set('theme_default','oulib_repository');
module_enable( array('islandora', 'islandora_basic_collection', 'php_lib') );

# Solr, forms, and metadata
module_enable( array('objective_forms','xml_forms','xml_form_builder','xml_schema_api','xml_form_elements','xml_form_api','islandora_marcxml'));
module_enable( array('islandora_solr','islandora_solr_config'));

# Repository access control will happen in XACML, so we open things up in Drupal
user_role_grant_permissions( $anonymous_role->rid, array('view fedora repository objects'));
user_role_grant_permissions( $authenticated_role->rid, array('view fedora repository objects'));

# We probably want to let everyone do search
user_role_grant_permissions( $anonymous_role->rid, array('search islandora solr'));
user_role_grant_permissions( $authenticated_role->rid, array('search islandora solr'));

# Basic Image and Large Image
module_enable( array('imagemagick','islandora_basic_image','islandora_large_image','islandora_openseadragon'));
variable_set('image_toolkit', 'imagemagick');
variable_set('imagemagick_convert', '/usr/bin/convert');
variable_set('islandora_use_kakadu', TRUE);
variable_set('islandora_kakadu_url', '/usr/local/bin/kdu_compress');
variable_set('islandora_large_image_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'));

# Books
module_enable( array('islandora_paged_content', 'islandora_book', 'islandora_internet_archive_bookreader') );
variable_set('islandora_book_page_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'));
variable_set('islandora_book_viewers', array('name' => array('none' => 'none', 'islandora_internet_archive_bookreader' => 'islandora_internet_archive_bookreader'), 'default' => 'islandora_internet_archive_bookreader'));
variable_set('islandora_paged_content_djatoka_url', '/adore-djatoka');
# no OCR because we don't do tesseract yet
variable_set('islandora_book_ingest_derivatives', array( 'pdf' => 'pdf', 'image' => 'image', 'ocr' => 0 ));

# URIs
module_enable( array('pathauto', 'subpathauto', 'islandora_pathauto'));
variable_set('islandora_pathauto_selected_cmodels', array( 0 => 'islandora:pageCModel', 1 => 'islandora:bookCModel',  2 => 'islandora:sp_large_image_cmodel') );
variable_set('pathauto_islandora_islandora:bookCModel_pattern', '/uuid/[fedora:shortpid]');
variable_set('pathauto_islandora_islandora:pageCModel_pattern', '/uuid/[fedora:shortpid]');
variable_set('pathauto_islandora_islandora:sp_large_image_cmodel_pattern', '/uuid/[fedora:shortpid]');
variable_set('subpathauto_depth', 4);


# bootstrap themes and block enough to succesfully build and submit block
# settings form 
drupal_theme_initialize();
global $theme_key;
$theme  = drush_get_option('theme', $theme_key);
module_load_include('inc', 'block', 'block.admin');
$blocks = _block_rehash($theme);

# Enable Solr Search block 
$form_state['values']['blocks']['islandora_solr_simple']= array(
  'region' => 'sidebar_first',
  'theme'  => $theme,
  'weight' => 0,
);
# Disable default search block 
$form_state['values']['blocks']['search_form'] = array(
  'region' => BLOCK_REGION_NONE,
	'theme'  => $theme,
	'weight' => 0,
);
# Apply new settings 
drupal_form_submit('block_admin_display_form', $form_state, $blocks, $theme);

# Configure simple title-only result display with human-readable label 
$data = array(
  'solr_field' => 'dc.title',
  'field_type' => 'result_fields',
  'weight' => 0,
  'solr_field_settings' => 'a:11:{s:5:"label";s:5:"Title";s:7:"snippet";N;s:11:"date_format";s:0:"";s:15:"truncation_type";s:21:"separate_value_option";s:14:"maximum_length";s:1:"0";s:12:"add_ellipsis";b:0;s:8:"wordsafe";b:0;s:15:"wordsafe_length";s:1:"1";s:11:"permissions";a:3:{i:1;s:1:"1";i:2;s:1:"2";i:3;s:1:"3";}s:14:"link_to_object";b:1;s:14:"link_to_search";b:0;}'
);
db_merge('islandora_solr_fields')
->key(array('solr_field'=>'dc.title'))
->fields($data)->execute();;
