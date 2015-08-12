#!/usr/bin/env bash

set -ex

WP_MU_PUGINS_DIR=$(wp eval 'echo WP_CONTENT_DIR;')/mu-plugins

if [ -e ${WP_MU_PUGINS_DIR}/composer.json ] ; then
    echo ${WP_MU_PUGINS_DIR}'/composer.json already exists.'
    exit 1
fi

mkdir -p $WP_MU_PUGINS_DIR

echo "{
    \"name\": \"mu-plugins\",
    \"require-dev\": {
        \"vccw/mailcatcher\": \"*\"
    }
}" > ${WP_MU_PUGINS_DIR}/composer.json

cd ${WP_MU_PUGINS_DIR}
composer install

echo "<?php
/*
Plugin Name: MailCatcher
Author: VCCW Team
Description: Re-routes all WordPress emails to MailCatcher.
*/

require_once dirname( __FILE__ ) . '/vendor/autoload.php';" > ${WP_MU_PUGINS_DIR}/mailcatcher.php

mailcatcher --http-ip=$(ohai | jq -r .network.interfaces.eth1.routes[0].src)

exit 0
