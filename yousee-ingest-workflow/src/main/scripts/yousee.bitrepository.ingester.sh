#!/bin/bash

SCRIPT_PATH=$(dirname $(readlink -f $0))


NAME="${yousee.bitrepository.ingester}"


ENTITY=$1
LOCALFILEURL=$2
REMOTEFILEID=$3
CHECKSUM=$4
FILESIZE=$5

source $SCRIPT_PATH/common.sh

APPDIR="$YOUSEE_COMPONENTS/$NAME"


#FILEPATH="${LOCALFILEURL#"file://"}"
#cat $FILEPATH > /dev/null &
#PID1=$!
#cat $FILEPATH > /dev/null &
#PID2=$!
#cat $FILEPATH > /dev/null &
#PID3=$!
#wait $PID1 $PID2 $PID3

#dk.statsbiblioteket.medieplatform.bitrepository.ingester.TheMockClient \
CMD="$JAVA_HOME/bin/java -cp $APPDIR/bin/*:$APPDIR/external-products/* \
dk.statsbiblioteket.medieplatform.bitrepository.ingester.Ingester \
$CONFIGFILE $LOCALFILEURL $REMOTEFILEID $CHECKSUM $FILESIZE"

OUTPUT="`execute "$APPDIR" "$CMD" "$NAME" "$ENTITY"`"
RETURNCODE=$?
echo "$OUTPUT"
exit "$RETURNCODE"
