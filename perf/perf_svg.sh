#!/bin/bash

FlameGraph=(FlameGraph path)
PerfData=perf.data

while [ "$1" != "" ]; do
	PerfData=$1
	shift 1
done

#perf record -g -p pid
perf script -i $PerfData &> perf.unfold
$FlameGraph/stackcollapse-perf.pl perf.unfold &> perf.folded
$FlameGraph/flamegraph.pl perf.folded > perf.svg

rm -f perf.unfold perf.folded
echo "generate \"perf.svg\" from \"$PerfData\" done"

