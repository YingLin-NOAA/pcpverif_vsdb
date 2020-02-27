#!/bin/ksh
###################################################################
# script: 
#         To run grid-to-grid program for all of single models
#  Author: Binbin Zhou, Apr. 9, 2014
###################################################################
set -x

model=$1
var=$2
ref=namnest

MODEL=`echo $model | tr '[a-z]' '[A-Z]'`

  $USHverf_g2g/verf_g2g_href.sh $vday $model $var $ref
  
  cycles="00 06 12 18"

  if [ ! -d $COMVSDB/${model}v3 ]; then
    mkdir -p $COMVSDB/${model}v3
  fi

  for ncyc in $cycles ; do
#    cat ${MODEL}_${var}_${vday}${ncyc}.vsdb >> $COMVSDB/${model}/${model}_${vday}.vsdb
    cat ${MODEL}_${var}_${vday}${ncyc}.vsdb | sed 's/HREF/HREFv3/g' >> $COMVSDB/${model}v3/${model}v3_${vday}.vsdb
  done
