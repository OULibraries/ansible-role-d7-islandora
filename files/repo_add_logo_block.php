<?php
# bootstrap themes and block enough to succesfully build and submit block
# add form.
drupal_theme_initialize();
$my_theme = variable_get("theme_default", $repo_theme);
module_load_include('inc', 'block', 'block.admin');
$blocks = _block_rehash($my_theme);

$form_state['values']['info']=t('Library Logo');
$form_state['values']['body']['value']=t('<p><a href="http://libraries.ou.edu"><img alt="Logo" class="img-responsive" src="/sites/all/themes/oulib_repo/img/ou_lib_logo.png" /></a></p>');
$form_state['values']['body']['format']=t('full_html');
$form_state['values']['regions'][$my_theme]=t('logo');
$form_state['values']['visibility']=0;
$form_state['values']['custom']=0;
$form_state['values']['visibility__active_tab']=t('edit-path');
$form_state['values']['op']=t('Save+block');
drupal_form_submit('block_add_block_form', $form_state);
drupal_flush_all_caches();
