#!/bin/bash
cd rmi;
pub get
pub upgrade
pub run build_runner build \
  --fail-on-severe
dartfmt -w . 
dartanalyzer \
  --fatal-warnings \
  --fatal-infos \
  .
cd ..;
cd rmi_generator;
tool/local_dependency.sh
pub get
pub upgrade
pub run build_runner build \
  --fail-on-severe
dartfmt -w .
dartanalyzer \
  --fatal-warnings \
  --fatal-infos \
  .
pub run test --platform vm;
pub run test --platform chrome;
pub run test --platform node;
cd ..;
