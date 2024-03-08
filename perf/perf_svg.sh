#!/bin/bash

# get script current path
script_path=$0
if [ -L $script_path ]; then
  # is symbol link
  script_path=`realpath $script_path`
fi
#echo "script_path=$script_path"
dir=`dirname $script_path`



FlameGraph=`realpath $dir/FlameGraph/`

PerfData=perf.data
while [ "$1" != "" ]; do
	PerfData=$1
	shift 1
done

if [ ! -e $PerfData ]; then
  echo "perf.data is not found !!!, do nothing"
  exit
fi


#perf record -g -p pid
perf script -i $PerfData &> perf.unfold
$FlameGraph/stackcollapse-perf.pl perf.unfold &> perf.folded
$FlameGraph/flamegraph.pl perf.folded > perf.svg

rm -f perf.unfold perf.folded
echo "generate \"perf.svg\" from \"$PerfData\" done"

