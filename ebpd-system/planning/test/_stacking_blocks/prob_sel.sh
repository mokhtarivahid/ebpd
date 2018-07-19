#!/bin/bash

declare -a arr=("1/p22.pddl.ebpd" "3/p22.pddl.ebpd" "1/p24.pddl.ebpd" "3/p24.pddl.ebpd" "1/p26.pddl.ebpd" "3/p26.pddl.ebpd" "1/p28.pddl.ebpd" "1/p30.pddl.ebpd" "3/p28.pddl.ebpd" "3/p30.pddl.ebpd" "1/p32.pddl.ebpd" "4/p22.pddl.ebpd" "3/p32.pddl.ebpd" "1/p34.pddl.ebpd" "3/p34.pddl.ebpd" "1/p36.pddl.ebpd" "3/p36.pddl.ebpd" "1/p38.pddl.ebpd" "3/p38.pddl.ebpd" "5/p24.pddl.ebpd" "5/p22.pddl.ebpd" "3/p40.pddl.ebpd" "4/p24.pddl.ebpd" "5/p26.pddl.ebpd" "5/p28.pddl.ebpd" "1/p40.pddl.ebpd" "4/p26.pddl.ebpd" "1/p42.pddl.ebpd" "3/p42.pddl.ebpd" "4/p28.pddl.ebpd" "4/p30.pddl.ebpd" "3/p44.pddl.ebpd" "1/p44.pddl.ebpd" "5/p30.pddl.ebpd" "4/p32.pddl.ebpd" "5/p32.pddl.ebpd" "1/p46.pddl.ebpd" "3/p46.pddl.ebpd" "5/p34.pddl.ebpd" "4/p34.pddl.ebpd" "3/p48.pddl.ebpd" "5/p36.pddl.ebpd" "1/p48.pddl.ebpd" "1/p50.pddl.ebpd" "4/p36.pddl.ebpd" "3/p50.pddl.ebpd" "5/p38.pddl.ebpd" "4/p40.pddl.ebpd" "4/p38.pddl.ebpd" "5/p42.pddl.ebpd" "5/p40.pddl.ebpd" "4/p42.pddl.ebpd" "4/p44.pddl.ebpd" "5/p44.pddl.ebpd" "5/p46.pddl.ebpd" "4/p46.pddl.ebpd" "5/p48.pddl.ebpd" "4/p48.pddl.ebpd" "5/p50.pddl.ebpd" "4/p50.pddl.ebpd")

j=1
for i in "${arr[@]}"; do
   echo "$i"
   cp $i exp/p$j.ebpd
   j=$((j+1))
done