#!/bin/bash
url='http://kingsiliwangi.com'
attempts=5
timeout=5

echo "Checking Kingsiliwangi status of $url."

for (( i=1; i<=$attempts; i++ ))
do
  code=`curl -sL --connect-timeout 20 --max-time 30 -w "%{http_code}\\n" "$url" -o /dev/null`

  echo "Found code $code for $url."

  if [ "$code" = "200" ]; then
    echo "Website $url is online."
    break
  else
    echo "Kingsiliwangi $url seems to be offline. Waiting $timeout seconds."
    sleep $timeout
  fi
done
