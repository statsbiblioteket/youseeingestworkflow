#!/bin/bash

source $YOUSEE_HOME/config/statemonitorClientConfig.sh

function report(){
    COMPONENT=$1
    STATE=$2
    MESSAGE=$3
    ENTITY=$4
    if [ -n $STATEMONTITORSERVER ]; then
        echo "<state><component>$COMPONENT</component><stateName>$STATE</stateName><message>$MESSAGE</message></state>" \
        | curl -s -i -H 'Content-Type: text/xml' -d@- $STATEMONTITORSERVER/states/$ENTITY > /dev/null
    fi
    return 0
}



