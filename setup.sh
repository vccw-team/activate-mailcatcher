#!/usr/bin/env bash

set -ex

WP_MU_PUGINS_DIR=$(wp eval 'echo WP_CONTENT_DIR;')/mu-plugins

mkdir -p $WP_MU_PUGINS_DIR

echo "{
    \"name\": \"mu-plugins\",
    \"require\": {
        \"vccw/mailcatcher\": \"*\"
    }
}" > ${WP_MU_PUGINS_DIR}/composer.json

cd ${WP_MU_PUGINS_DIR}
composer install

echo "<?php
/*
Plugin Name: VCCW
*/

require_once dirname( __FILE__ ) . '/vendor/autoload.php';" > ${WP_MU_PUGINS_DIR}/plugin.php

mailcatcher --http-ip=$(ohai | jq -r .network.interfaces.eth1.routes[0].src)
