#!/bin/bash

DATA_DIR=../../data
BIN_DIR=../bin
SRC_DIR=../src
OUT_DIR=../model


TEXT_DATA=$DATA_DIR/jb-zh.txt
PHRASES_DATA=$DATA_DIR/jb-zh-phrase.txt

pushd ${SRC_DIR} && make; popd

if [ ! -e $TEXT_DATA ]; then
  echo 'Training file does not exist, aborting...'
  exit
fi

echo -----------------------------------------------------------------------------------------------------
echo -- Creating phrases...
time $BIN_DIR/word2phrase -train $TEXT_DATA -output $PHRASES_DATA -threshold 200 -debug 2
