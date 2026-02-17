#!/bin/bash
FILE_NAME="cdx-00015.gz"

aws s3 cp s3://commoncrawl/cc-index/collections/CC-MAIN-2021-04/indexes/$FILE_NAME data/$FILE_NAME
