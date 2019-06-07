#!/bin/sh
set -x
module purge
module use ../modulefiles
module load VERF_PRECIP

module list

sleep 1

BASE=`pwd`

if [ -d $BASE/../exec ]; then
  rm -f $BASE/../exec/*
else
  mkdir $BASE/../exec
fi

##############################

cd ${BASE}/verf_g2g_grid2grid_grib2.fd
make clean
make
make install
make clean

##############################


