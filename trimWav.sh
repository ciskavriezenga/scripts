#! /bin/bash

if [ `file --mime-type -b`==audio/x-wav ]; then
  echo "input 1 is an audio file"
fi

if [ $# -lt 3 ]; then
  echo "$0: geef alsjeblieft start trim en lengte trim op"
  exit
else
  FILENAME=$1
  NEWNAME=`basename "$1" .wav`_trimmed.wav
  NEWNAME2=`basename "$1" .wav`_faded.wav  
  echo "NEWNAME: $NEWNAME"
  STARTTIJD=$2
  echo "starttijd: $STARTTIJD"
  LENGTE=$3
  echo "lengte: " $LENGTE
fi                  

`sox $FILENAME $NEWNAME  trim $STARTTIJD $LENGTE`
`sox $NEWNAME $NEWNAME2 fade 0.1 $LENGTE` 
