#! /usr/bin/env bash
TEST_CSV=test.csv
TEST_SCRIPT=simple.xml
WORKING_DIR=$(pwd)/$TEST_CSV
SERVER_LOC=$1
TURN_ON_CACHE=${2:-false}
TURN_ON_PAGINATION=${3:-false}
DRY_RUN=${4:-false}
QUERY_STRING="?cached_matches=$TURN_ON_CACHE\\&amp;paginate=$TURN_ON_PAGINATION"

if [ -z "$SERVER_LOC" ]
then
    echo "Please provide a server address without http and suffix slash. Also, do not use this test script on local."
    exit
fi

if [ "$TURN_ON_CACHE" != "true" ] && [ "$TURN_ON_CACHE" != "false" ]
then
  echo "Please either put true or false for the second argument to turn on cache. By default, it is set to false"
  echo "$TURN_ON_CACHE"
  exit
fi

if [ "$TURN_ON_PAGINATION" != "true" ] && [ "$TURN_ON_PAGINATION" != "false" ]
then
  echo "Please either put true or false for the third argument to turn on pagination. By default, it is set to false"
  echo "$TURN_ON_PAGINATION"
  exit
fi

echo "You have created the following query string"
echo "$QUERY_STRING"

if [ "$DRY_RUN" != "true" ]
then
  curl -b cookie.txt -c cookie.txt -X POST \
    http://$SERVER_LOC/users/sign_in \
    -H 'Accept: */*' \
    -H 'Cache-Control: no-cache' \
    -H 'Connection: keep-alive' \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -H 'Postman-Token: 31d1d4c3-d4bc-4cda-bf29-303ecfc9e67d,0c821ad7-1bc8-44b0-9e46-5819777be9a6' \
    -H 'User-Agent: PostmanRuntime/7.11.0' \
    -H 'accept-encoding: gzip, deflate' \
    -H 'cache-control: no-cache' \
    -H 'cookie: _arkamatch_session=UurbD48IERey6wZJrZpn9oAOnqnp5yL%2F8IMlhUWtq2%2Bco08Lr5ZE6xfgTRU%2BvsBmOVfc7bJ7UHoRZpclGStQcsW43ap6ZjTza1Gw%2B03n4QWlu0Td2WBHeW7ouPhXoMPKAORx7Ns8wR8HwVRJkwk0OAJNWhWeduS8%2BhPj2KSUnQ66Zc%2B1eOM4L6QEr3FytHRo55nphVnzVJ9ue15PtnFCOvIxUI0gGRukpj3CrIraSZHd3j3RK8HcNb%2BAI5uljIhN3k85pnm45qS8KUafyetKupWT%2BE%2Bc7tqvxvI%3D--af%2BNkCWNT5eS93hD--P%2Fjvp245Ze%2F3WhmqRE7Xcw%3D%3D; _rails_chat_tutorial_session=HwMbg3mudHXqeJoHi24tl%2FMna8pWBPELw0lAHNwon28rPUIp3QMTcWQXWRDB%2BJI3PuFnqLatIlpfixjsUM0s1qBl%2BgB8hf36fH%2Fv5fVwzTCci%2B5lHv1cD0utVsvjsDyOfV646WTKosVSa1ZOW2xxZaoxocNh%2FjAdvcu2Y02Jb6Vi%2BxQ4B8Pm9aRa9S6Cx9TzBoS%2FCViDQxr73EmRISLOt6Ty0JT1ce4NcsAJzgotAL8sqBf1tWZR4ppYQdd3eWG%2BwevdIPSySfbbxJfUvnlG9EYpDjK2h8TkcLOMv4800%2BRBMmXUub76eBCBlvZJWEFIzWw5QZEgE37hMYNjtBm4M7DJpuNV7Q77qrU1emY9WfXEMbrL9dIq2wBIN2PY0K5fBWLuxekbQnvoWsz2npqvwxvNUa%2FNFR1NWKtIy0T6kkjGmT7isJpdpb%2Fel7SwQLO%2Fq4N67rlljpb14kWn6YECmOUuhTn%2B0fAYpHnTWUsrkxSxz7miW4dG%2FnyxSZByJAr2VEF4cj8SZAY4gvrtyRnYT1F2KSN3ZaA7U50T%2Fcj7NiT0BMQ60P11k3p0f74%3D--elx%2BQorxrHrCqKDm--QufoppOsW4EKaLO9%2FbTq8w%3D%3D; user.id=eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik1RPT0iLCJleHAiOm51bGwsInB1ciI6ImNvb2tpZS51c2VyLmlkIn19--32a03ae82d7861520c2f3847bd5d76461df7e258; _back_end_session=WY1hgsS5ECvrAteo95Nwy5%2FBbWAZZdwZuqlWsMu1KvyEJgHCcG%2BNxFy6Gq%2FTictHEq%2BhOzRDvb6N2lvigpViK%2BED1mGb%2BNDv%2FBzRyKfKO9duP0A1r8UX%2B1fZ7p6HAbIVR4Ts4DiEMHnpJiEJJt%2BzOK%2B3pqqhOd6rhdVkY1845R9i5MJcFkdGyejQJVEmeLr2SJImeBMyT9wRbKPEsrjO4cxQo3bsfNEDG9sVPSx1p3t1OoSh54hqD2LCcdtSqrrqXy%2BY0L8bt4WTapdo1EwSVx82I8xbjBm2qO%2FbGfoZlKaBv%2BveHVJnJXOQkYZoLuc%2Btjy%2F%2FFLl%2FfOtUpcnNHxi3XgZrdv9zuzNOsvMJ4QBmthXI2%2B0ItKj9nPq0DecLFg%2BoiNHExC%2FpwkOFKPDaIL%2FK4l8eT5r--GaRffxW0%2BsryIPTV--ItY2tTGQDY42cxcb1Shbew%3D%3D' \
    -d 'user%5Bemail%5D=system_admin%40bogus.com&user%5Bpassword%5D=Aa112324'

  curl -b cookie.txt -c cookie.txt -X GET \
    http://$SERVER_LOC/groups/new \
    -H 'Postman-Token: 6d1e67b7-2827-478c-b24c-ebe104bba8ef' \
    -H 'cache-control: no-cache'

  curl -b cookie.txt -c cookie.txt -X POST \
    http://$SERVER_LOC/groups \
    -H 'Accept: */*' \
    -H 'Cache-Control: no-cache' \
    -H 'Connection: keep-alive' \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -H 'Postman-Token: cfe19164-3619-4792-b4f4-f249f2138a81,550d3d69-1860-4e09-a8bb-c26afa856178' \
    -H 'User-Agent: PostmanRuntime/7.11.0' \
    -H 'accept-encoding: gzip, deflate' \
    -H 'cache-control: no-cache' \
    -d 'group%5Binterest%5D=&group%5Bperson%5D=&group%5Bgroup_number%5D=&group%5Bversion%5D='
fi

sed -i -e 's|'PATH_PLACEHOLDER'|'"$WORKING_DIR"'|g' $TEST_SCRIPT
sed -i -e 's|'SERVER_PLACEHOLDER'|'"$SERVER_LOC"'|g' $TEST_SCRIPT
sed -i -e 's|'QUERY_PARAMETERS'|'"$QUERY_STRING"'|g' $TEST_SCRIPT
tsung -f $TEST_SCRIPT start
sed -i -e 's|'/user_matches.*e\"'|'/user_matchesQUERY_PARAMETERS\"'|g' $TEST_SCRIPT
sed -i -e 's|'"$SERVER_LOC"'|'SERVER_PLACEHOLDER'|g' $TEST_SCRIPT
sed -i -e 's|'"$WORKING_DIR"'|'PATH_PLACEHOLDER'|g' $TEST_SCRIPT
