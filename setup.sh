#!/usr/bin/env bash

set -ex

mkdir -p `wp eval 'echo WP_CONTENT_DIR;'`/mu-plugins
