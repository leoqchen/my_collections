#!/bin/bash

# get script current path
script_path=$0
if [ -L $script_path ]; then
  # is symbol link
  script_path=`realpath $script_path`
fi
#echo "script_path=$script_path"
dir=`dirname $script_path`
echo "dir=$dir"

tests=(
  buffer
  build
  bump
  conditionals
  desktop
  effect2d
  function
  ideas
  jellyfish
  loop
  pulsar
  refract
  shading
  shadow
  terrain
  texture
)

for i in "${tests[@]}"; do
  echo "$i"

  mkdir -p "$i"
  cd "$i"
  perf record -g -e cpu-clock glmark2-es2 2>2.log -b "$i"
  $dir/perf_svg.sh
  cd ../

  echo ""
done
