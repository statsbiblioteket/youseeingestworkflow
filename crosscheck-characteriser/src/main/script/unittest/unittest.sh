#!/bin/bash

pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do cd `dirname "$SCRIPT_PATH"`; SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null


$SCRIPT_PATH/../crosscheckCharacterise.sh ~/TMP/DR1_20111123_212500_20111123_214500.mux ~/Projects/Medieplatform-config/crosscheckCharacterise/crosscheckCharacteriseConfig.sh