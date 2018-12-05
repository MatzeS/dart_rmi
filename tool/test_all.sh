#!/bin/sh

array=( invoker_generator proxy_generator remote_method_invocation_generator test )
for i in "${array[@]}"
do
      cd $i;
      echo "testing ${i}";
      pub run build_runner build && pub run test;
      cd ..;
done