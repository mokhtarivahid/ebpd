#!/bin/sh
####################################
#
# Prolog planner script.
#
####################################

$1 # planning problem file

swipl-ld -o planner planner.cpp sbp.pl

./planner $1

