#!/bin/bash

pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do cd `dirname "$SCRIPT_PATH"`; SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

source $SCRIPT_PATH/env.sh

ENTITY="$1"
DOWNLOADER_JSON_OUTPUT="$PWD/$2"

NAME=`basename "$0" ".sh" | cut -d'_' -f-2`

CMD="grep \"queued\": $DOWNLOADER_JSON_OUTPUT "
FOUND=`$CMD | wc -l`

if [ "$FOUND" -eq 0 ]; then 
    report "$NAME" "Completed" "$ENTITY"
    cat $DOWNLOADER_JSON_OUTPUT
    debug "$ENTITY" "Component $NAME marked $ENTITY as ok. FOUND was $FOUND, DOWNLOADER was $DOWNLOADER_JSON_OUTPUT. Contents was  `cat $DOWNLOADER_JSON_OUTPUT`"
    exit 0
else
    report "$NAME" "Queued" "$ENTITY"
    debug "$ENTITY" "Component $NAME marked $ENTITY as queued"
    exit 1
fi


