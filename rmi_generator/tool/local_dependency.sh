#!/bin/bash --
cat >> "pubspec.yaml" <<EOM

dependency_overrides:
  rmi:
    path: ../rmi
EOM
