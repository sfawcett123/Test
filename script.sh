#!/bin/bash

JSON=$( curl -s -X GET "https://api.github.com/repos/sfawcett123/Test/releases" |  jq '.[] | select( .tag_name=="xxxxx" )' )
NUM=$( echo ${JSON} | tr '\r\n' ' ' | jq '.id')
if [[ -z ${NUM} ]] ;
then
         echo "xxxxx not found"
         echo ::set-output name=release_id::""
else
              echo "xxxxx found id is ${NUM}"
              echo ::set-output name=release_body::"\"$( echo ${JSON} | tr '\r\n' ' ' | jq -r '.body')\""
fi
