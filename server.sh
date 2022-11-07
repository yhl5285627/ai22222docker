#!/bin/bash
set -e

cd appinventor

/home/developer/appengine/bin/dev_appserver.sh --port=8888 --address=0.0.0.0 appengine/build/war/
