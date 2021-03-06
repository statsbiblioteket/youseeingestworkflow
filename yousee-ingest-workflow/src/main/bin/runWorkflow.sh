#!/bin/bash

SCRIPT_PATH=$(dirname $(readlink -f $0))

if [ -r "$SCRIPT_PATH"/setenv.sh ]; then
    source "$SCRIPT_PATH"/setenv.sh
fi

if [ -z "$YOUSEE_HOME" ]; then
   echo "YOUSEE_HOME is not set. Must be set before execution. Exiting"
   exit 1
fi


if [ -z "$TAVERNA_HOME" ]; then
   echo "TAVERNA_HOME is not set. Must be set before execution. Exiting"
   exit 1
fi

if [ -z "$JAVA_HOME" ]; then
   echo "JAVA_HOME is not set. Must be set before execution. Exiting"
   exit 1
fi

if [ -z "$YOUSEE_CONFIG" ]; then
   echo "YOUSEE_CONFIG is not set. Must be set before execution. Exiting"
   exit 1
fi

mkdir -p "$YOUSEE_LOGS"
mkdir -p "$YOUSEE_LOCKS"

if [ "$(ps -ef | grep [\ ]$YOUSEE_HOME/taverna/Yousee_ingest_workflow.t2flow)" != "" ] ; then
    echo "executeworkflow.sh was running, exiting!"
    exit 1 
fi


#TODO probably remove this, as it does not actually do anything after the logrotater was added
TAVERNA_OUT_DIR=$(mktemp -d -u --tmpdir="$YOUSEE_LOGS" "$1-runNr-XXX")


mkdir -p $HOME/tmp/taverna
#TODO where should this be
cleanup () {
   rm -rf "$TAVERNA_TEMP_DIR"
}
trap cleanup 0 3 15
TAVERNA_TEMP_DIR=$(mktemp -d --tmpdir="$HOME/tmp/taverna")
chmod a+r "$TAVERNA_TEMP_DIR"

# place damn tarverna logs the right place
cd $YOUSEE_LOGS

export TMPDIR="$TAVERNA_TEMP_DIR"
export TEMPDIR="$TAVERNA_TEMP_DIR"
export TMP="$TAVERNA_TEMP_DIR"
export TEMP="$TAVERNA_TEMP_DIR"
export _JAVA_OPTIONS="-Djava.io.tmpdir=$TAVERNA_TEMP_DIR"

$TAVERNA_HOME/executeworkflow.sh \
-inmemory \
-inputvalue Ingest_workflow_startDate "$1"  \
"$YOUSEE_HOME/taverna/Yousee_ingest_workflow.t2flow" \
-outputdir "$TAVERNA_OUT_DIR"
