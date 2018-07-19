#!/bin/bash

time_out=1800

plan()
{
    echo '------------------------------------------------------'
    # $1: directory path,
    domain=$1/domain-abs.ebpd
    echo '------------------------------------------------------'

    if [[ ! -f $domain ]]; then
          echo "'$domain' does not exist"
          return
    fi
    
    rm -fr $1/$(basename "$1")*.avg
    echo '# $problem $search_time $total_time $eval_node $gen_node $memory $plan_length' > $1/$(basename "$1")_abs.avg
    echo '# $problem $search_time $total_time $eval_node $gen_node $memory $plan_length' > $1/$(basename "$1").avg

    for problem in $1/*.ebpd; do
      if [[ $problem == *domain* ]]; then continue;
      else
        echo $problem
        case $1 in
           *satellite*)
              timeout $time_out nice -n 0 swipl -q -f sbpabs_h_add.pl --goal -t "[schemata/satellite_schemata,h_add], solve_sbpabs('$domain','$problem')."
            ;;
           *logistic)
              timeout $time_out nice -n 0 swipl -q -f sbpabs_h_add.pl --goal -t "[schemata/logistic_schemata,h_add], solve_sbpabs('$domain','$problem')."
            ;;
           *bin)
              timeout $time_out nice -n 0 swipl -q -f sbpabs_h_add.pl --goal -t "[schemata/bin_schemata,h_diff], solve_sbpabs('$domain','$problem')."
            ;;
           *jaco)
              timeout $time_out nice -n 0 swipl -q -f sbpabs_h_add.pl --goal -t "[schemata/robotic_arm_schemata,h_diff], solve_sbpabs('$domain','$problem')."
            ;;
           *gripper)
              timeout $time_out nice -n 0 swipl -q -f sbpabs_h_diff.pl --goal -t "[schemata/gripper_schemata,h_diff], solve_sbpabs('$domain','$problem')."
            ;;
           *stripped_tower_s)
              timeout $time_out nice -n 0 swipl -q -f sbpabs_h_diff.pl --goal -t "[schemata/stripped_tower_s_schemata,h_diff], solve_sbpabs('$domain','$problem')."
            ;;
           *stripped_tower)
              timeout $time_out nice -n 0 swipl -q -f sbpabs_h_diff.pl --goal -t "[schemata/stripped_tower_schemata,h_diff], solve_sbpabs('$domain','$problem')."
            ;;
        esac
        if [[ $? -eq 124 ]]; then 
            echo -e "\e[0;31m''$problem' time out!\n\e[0m"
        fi
      fi
    done
    # --------------------------------------------------------
}

print_help()
{
        echo -e "\e[1;31mThis script run abstract and sbp planners on given domains.\e[0m"
        echo "Following options are allowed:"
        echo " ./sbp_abs.sh  <Path> Run on a domain in <Path>."
        echo " ./sbp_abs.sh  all    Run on all domains in 'test' directory."
        echo "                      e.g., './sbp_abs.sh  test/jaco'"
}

case $1 in
   *satellite*)
            plan "test/satellite"
    ;;
   *logistic*)
            plan "test/logistic"
    ;;
   *bin*)
            plan "test/bin"
    ;;
   *jaco*)
            plan "test/jaco"
    ;;
   *gripper*)
            plan "test/gripper"
    ;;
   *stripped_tower_s*)
            plan "test/h_diff/stripped_tower_s"
    ;;
   *stripped_tower*)
            plan "test/h_diff/stripped_tower"
    ;;
   "h" | "")
        print_help
    ;;
   "all")

        for i in test/*; do
            plan $i
        done
    ;;
esac




