#! /bin/bash

#
# Ciska Vriezenga © 2015
#

TARGETDIR=trimmed_wavs

if [ -d $TARGETDIR ] ; then
  echo "$TARGETDIR directory exists"
else
  echo "creating $TARGETDIR directory"
  mkdir $TARGETDIR
fi

if [ $# -lt 2 ]; then
  echo "$0: please enter a starttime and length"
  exit
else
  #communicate starttime and length
  STARTTIME=$1
  echo "starttime: $STARTTIME"
  LENGTH=$2
  echo "length: " $LENGTH

 

  for f in *.wav; do  
    TRIMMEDFILENAME=`basename $f .wav`trimmed.wav     
    `sox $f ${TARGETDIR}/$TRIMMEDFILENAME trim $STARTTIME $LENGTH`
    `sox $f ${TARGETDIR}/$TRIMMEDFILENAME fade 0.1 $LENGTH`

  done
fi



