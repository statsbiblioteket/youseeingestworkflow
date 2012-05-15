#!/bin/bash

downloadInitiatorConfig="$YOUSEE_CONFIG/ingest-initiator/ingest_initiator_media_files.properties"
youseeDownloaderConfig="$YOUSEE_CONFIG/youseeDownloader/youseeDownloaderConfig.sh"
handleQueuedFileConfig="$YOUSEE_CONFIG/downloaderQueuedReporter/youseeDownloaderConfig.sh"
crossCheckConfig="config.xml"
bibliographicMetadataValidatorConfig="config.xml"
ffprobeConfig="config.xml"
crossCheckValidatorConfig="$YOUSEE_CONFIG/crosscheckValidationProfile/crosscheck.sch"
ffprobeValidatorConfig="$YOUSEE_CONFIG/ffprobeValidationProfile/ffprobe.sch"
reportValidationFailureConfig="config.xml"
reportValidationSuccesConfig="config.xml"
bitRepository_uploadConfig="$YOUSEE_CONFIG/bitrepository-url-client/"
digiTVIngesterConfig="config.xml"
DomsIngesterConfig="config.xml"
markSuccesfulCompletionConfig="config.xml"