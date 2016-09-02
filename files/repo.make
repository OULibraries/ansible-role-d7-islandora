_; This file was auto-generated by drush make
core = 7.x

api = 2
projects[drupal][version] = "7.50"

; drupal.org  Modules

projects[imagemagick][version] = "1.0"
projects[libraries][version] = "2.3"
projects[colorbox][version] = "2.12"
projects[jquery_update][version] = "2.7"
projects[libraries][version] = "2.3"
projects[token][version] = "1.6"
projects[pathauto][version] = "1.3"
projects[subpathauto][version] = "1.3"

; Themes
projects[bootstrap][version] = "3.6"

projects[oulib_repositorytheme][type] = "theme"
projects[oulib_repositorytheme][download][type] = "git"
projects[oulib_repositorytheme][download][url] = "https://github.com/OULibraries/oulib_repositorytheme.git"

; Islandora modules
projects[islandora][type] = "module"
projects[islandora][download][type] = "git"
projects[islandora][download][url] = "https://github.com/Islandora/islandora.git"
projects[islandora][download][tag] = "7.x-1.7"

projects[islandora_pathauto][type] = "module"
projects[islandora_pathauto][download][type] = "git"
projects[islandora_pathauto][download][url] = "https://github.com/Islandora/islandora_pathauto.git"
projects[islandora_pathauto][download][tag] = "7.x-1.7"

projects[islandora_solr_search][type] = "module"
projects[islandora_solr_search][download][type] = "git"
projects[islandora_solr_search][download][url] = "https://github.com/Islandora/islandora_solr_search.git"
projects[islandora_solr_search][download][tag] = "7.x-1.7"

projects[php_lib][type] = "module"
projects[php_lib][download][type] = "git"
projects[php_lib][download][url] = "https://github.com/Islandora/php_lib.git"
projects[php_lib][download][tag] = "7.x-1.7"

projects[objective_forms][type] = "module"
projects[objective_forms][download][type] = "git"
projects[objective_forms][download][url] = "https://github.com/Islandora/objective_forms.git"
projects[objective_forms][download][tag] = "7.x-1.7"

projects[islandora_xml_forms][type] = "module"
projects[islandora_xml_forms][download][type] = "git"
projects[islandora_xml_forms][download][url] = "https://github.com/Islandora/islandora_xml_forms.git"
projects[islandora_xml_forms][download][tag] = "7.x-1.7"

projects[islandora_marcxml][type] = "module"
projects[islandora_marcxml][download][type] = "git"
projects[islandora_marcxml][download][url] = "https://github.com/Islandora/islandora_marcxml.git"
projects[islandora_marcxml][download][tag] = "7.x-1.7"

projects[islandora_openseadragon][type] = "module"
projects[islandora_openseadragon][download][type] = "git"
projects[islandora_openseadragon][download][url] = "https://github.com/Islandora/islandora_openseadragon.git"
projects[islandora_openseadragon][download][tag] = "7.x-1.7"

projects[islandora_solution_pack_collection][type] = "module"
projects[islandora_solution_pack_collection][download][type] = "git"
projects[islandora_solution_pack_collection][download][url] = "https://github.com/Islandora/islandora_solution_pack_collection.git"
projects[islandora_solution_pack_collection][download][tag] = "7.x-1.7"

projects[islandora_solution_pack_image][type] = "module"
projects[islandora_solution_pack_image][download][type] = "git"
projects[islandora_solution_pack_image][download][url] = "https://github.com/Islandora/islandora_solution_pack_image.git"
projects[islandora_solution_pack_image][download][tag] = "7.x-1.7"

projects[islandora_solution_pack_large_image][type] = "module"
projects[islandora_solution_pack_large_image][download][type] = "git"
projects[islandora_solution_pack_large_image][download][url] = "https://github.com/Islandora/islandora_solution_pack_large_image.git"
projects[islandora_solution_pack_large_image][download][tag] = "7.x-1.7"

projects[islandora_paged_content][type] = "module"
projects[islandora_paged_content][download][type] = "git"
projects[islandora_paged_content][download][url] = "https://github.com/Islandora/islandora_paged_content.git"
projects[islandora_paged_content][download][tag] = "7.x-1.7"

projects[islandora_solution_pack_book][type] = "module"
projects[islandora_solution_pack_book][download][type] = "git"
projects[islandora_solution_pack_book][download][url] = "https://github.com/Islandora/islandora_solution_pack_book.git"
projects[islandora_solution_pack_book][download][tag] = "7.x-1.7"

projects[islandora_internet_archive_bookreader][type] = "module"
projects[islandora_internet_archive_bookreader][download][type] = "git"
projects[islandora_internet_archive_bookreader][download][url] = "https://github.com/Islandora/islandora_internet_archive_bookreader.git"
projects[islandora_internet_archive_bookreader][download][tag] = "7.x-1.7"

; Libraries
libraries[tuque][type] = "library"
libraries[tuque][download][type] = "git"
libraries[tuque][download][url] = "https://github.com/Islandora/tuque.git"
libraries[tuque][download][tag] = "7.x-1.7"

libraries[openseadragon][type] = "library"
libraries[openseadragon][download][type] = "get"
libraries[openseadragon][download][url] = "http://openseadragon.github.io/releases/openseadragon-bin-0.9.129.zip"
libraries[openseadragon][directory_name] ="openseadragon"

libraries[colorboxy][type] = "library"
libraries[colorboxy][download][type] = "get"
libraries[colorboxy][download][url] = "https://github.com/jackmoore/colorbox/archive/1.x.zip"
libraries[colorboxy][directory_name] ="colorboxy"

libraries[bookreader][type] = "library"
libraries[bookreader][download][type] = "git"
libraries[bookreader][download][url] = "https://github.com/Islandora/internet_archive_bookreader"
libraries[bookreader][download][tag] ="7.x-1.7"
libraries[bookreader][directory_name] ="bookreader"
