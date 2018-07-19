#!/bin/sh
####################################
#
# Prolog conceptualizer script.
#
####################################

$1 # episode id

swipl-ld -o conceptualizer conceptualizer.cpp init.pl

./conceptualizer $1

