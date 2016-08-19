; This file was auto-generated by drush make
core = 7.x

api = 2
projects[drupal][version] = "7.50"

; drupal.org  Modules

projects[imagemagick][version] = "1.0"


; Islandora modules

projects[islandora][type] = "module"
projects[islandora][download][type] = "git"
projects[islandora][download][url] = "https://github.com/Islandora/islandora.git"
projects[islandora][download][tag] = "7.x-1.7"

projects[islandora_solution_pack_image][type] = "module"
projects[islandora_solution_pack_image][download][type] = "git"
projects[islandora_solution_pack_image][download][url] = "https://github.com/Islandora/islandora_solr_search.git"
projects[islandora_solution_pack_image][download][tag] = "7.x-1.7"

projects[islandora_solution_pack_collection][type] = "module"
projects[islandora_solution_pack_collection][download][type] = "git"
projects[islandora_solution_pack_collection][download][url] = "https://github.com/Islandora/islandora_solution_pack_collection.git"
projects[islandora_solution_pack_collection][download][tag] = "7.x-1.7"

projects[islandora_solution_pack_image][type] = "module"
projects[islandora_solution_pack_image][download][type] = "git"
projects[islandora_solution_pack_image][download][url] = "https://github.com/Islandora/islandora_solution_pack_image.git"
projects[islandora_solution_pack_image][download][tag] = "7.x-1.7"

; Libraries
libraries[tuque][type] = "library"
libraries[tuque][download][type] = "git"
libraries[tuque][download][url] = "https://github.com/Islandora/tuque.git"
libraries[tuque][download][tag] = "7.x-1.7"
