#! /usr/bin/env bash
TEST_CSV=test.csv
TEST_SCRIPT=simple.xml
WORKING_DIR=$(pwd)/$TEST_CSV

sed -i '' -e 's|'PATH_PLACEHOLDER'|'"$WORKING_DIR"'|g' $TEST_SCRIPT
tsung -f $TEST_SCRIPT start
sed -i '' -e 's|'"$WORKING_DIR"'|'PATH_PLACEHOLDER'|g' $TEST_SCRIPT
