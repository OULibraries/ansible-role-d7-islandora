#!/usr/bin/env bash

ISANDORA_HOSTNAME='{{ islandora_site }}.{{ httpd_dn_suffix}}'
SOLR_QUERY='RELS_EXT_hasModel_uri_s%3A%22info%3Afedora%2Fislandora%3ApageCModel%22&fl=RELS_EXT_hasModel_uri_s%2C+PID%2C+fgs_label_s&wt=json&indent=true&rows=100000'
DJATOKA_URL="https://${ISANDORA_HOSTNAME}/adore-djatoka/resolver"

# Query solr for PIDS and parse the JSON output.  Loop through each returned PID.
for UUID in $(curl -s  "http://localhost:8080/solr/collection1/select?q=${SOLR_QUERY}"  | jq .response.docs[].PID | jq --raw-output 'split(":")[1]')
do

  # Loop through each zoom level
  for ZOOM in {1..4}
  do
    # Progressively increase delay after caching higher zoom levels
    let "CURL_DELAY = ${ZOOM} * 5"

    # Per-zoom-level djatoka queries
    DJATOKA_QUERY="rft_id=https%3A%2F%2F${ISANDORA_HOSTNAME}%2Fuuid%2F${UUID}%2Fdatastream%2FJP2%2Fview&url_ver=Z39.88-2004&svc_id=info%3Alanl-repo%2Fsvc%2FgetRegion&svc_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajpeg2000&svc.format=image%2Fjpeg&svc.level=${ZOOM}&svc.rotate=0"

    # Print the requested djatoka URL to stdout
    echo "${DJATOKA_URL}?${DJATOKA_QUERY}"

    # Clear the cache and print print header info to stdout
    curl --head --silent --show-error -H "Cache-Control: must-revalidate" "${DJATOKA_URL}?${DJATOKA_QUERY}"

    # Give the system time to respond to the request
    sleep ${CURL_DELAY}
  done
done
