#! /usr/bin/env bash
TEST_CSV=test.csv
TEST_SCRIPT=simple.xml
WORKING_DIR=$(pwd)/$TEST_CSV
SERVER_LOC=$1

if [ -z "$SERVER_LOC" ]
then
    echo "Please provide a server address"
    exit
fi

sed -i -e 's|'PATH_PLACEHOLDER'|'"$WORKING_DIR"'|g' $TEST_SCRIPT
sed -i -e 's|'SERVER_PLACEHOLDER'|'"$SERVER_LOC"'|g' $TEST_SCRIPT
tsung -f $TEST_SCRIPT start
sed -i -e 's|'"$WORKING_DIR"'|'PATH_PLACEHOLDER'|g' $TEST_SCRIPT
sed -i -e 's|'"$SERVER_LOC"'|'SERVER_PLACEHOLDER'|g' $TEST_SCRIPT