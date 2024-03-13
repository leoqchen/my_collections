#!/bin/bash

ReadIni()
{
  file=$1
  section=$2
  key=$3
  val=`awk -F '=' '/\['$section'\]/{a=1}a==1 && $1~/'$key'/{print $2;exit}' $file`
  echo ${val}
}

file=sample.ini

echo "bar0=`ReadIni $file foo bar0`"
echo "bar1=`ReadIni $file foo bar1`"
echo "bar2=`ReadIni $file foo_2 bar2`"
echo "bar3=`ReadIni $file foo_2 bar3`"
