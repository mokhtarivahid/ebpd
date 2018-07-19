#!/bin/bash

# schemata (an instance of each class of problems)
declare -a sch=("_class1.ebpd" "_class3.ebpd" "_class4.ebpd" "_class5.ebpd")

# problem files
declare -a probs=("p1.ebpd" "p2.ebpd" "p3.ebpd" "p4.ebpd" "p5.ebpd" "p6.ebpd" "p7.ebpd" "p8.ebpd" "p9.ebpd" "p10.ebpd" "p11.ebpd" "p12.ebpd" "p13.ebpd" "p14.ebpd" "p15.ebpd" "p16.ebpd" "p17.ebpd" "p18.ebpd" "p19.ebpd" "p20.ebpd" "p21.ebpd" "p22.ebpd" "p23.ebpd" "p24.ebpd" "p25.ebpd" "p26.ebpd" "p27.ebpd" "p28.ebpd" "p29.ebpd" "p30.ebpd" "p31.ebpd" "p32.ebpd" "p33.ebpd" "p34.ebpd" "p35.ebpd" "p36.ebpd" "p37.ebpd" "p38.ebpd" "p39.ebpd" "p40.ebpd" "p41.ebpd" "p42.ebpd" "p43.ebpd" "p44.ebpd" "p45.ebpd" "p46.ebpd" "p47.ebpd" "p48.ebpd" "p49.ebpd" "p50.ebpd" "p51.ebpd" "p52.ebpd" "p53.ebpd" "p54.ebpd" "p55.ebpd" "p56.ebpd" "p57.ebpd" "p58.ebpd" "p59.ebpd" "p60.ebpd")

# domain
dom="domain.ebpd"

# record the result in 'embedding.log'
echo "[\$problem] [\$task] [\$time (ms)]" > embedding.log

# for all files
for p in "${probs[@]}"; do

    time=0
    time_str=""
    
    printf %s "$p: "

    for s in "${sch[@]}"; do
        output=`abstraction -compare -domain:$dom -problem:${s} -problem:$p`

        ## accumulate total time
        if case ${output} in *"finished"*) true;; *) false;; esac; then
            tmp=${output##*finished in }
            tmp=${tmp%% ms*}
            time_str="$tmp + $time_str"
            time="$((time + tmp))"
        fi


        ## check weather the problem is embedded in the schema
        if case ${output} in *"true"*) true;; *) false;; esac; then
            # printf %s\\t "$p : $s"
            # printf %s\\n "$output"
            # echo -e "\e[1;33mtrue\e[0m"
            # echo -e "\e[32m$s\e[0m \c"
            echo -e "$s \c"
            break
        else
            # printf %s\\t "$p : $s"
            # printf %s\\n "$output"
            # echo -e "\e[1;31mfalse\e[0m"
            # echo -e "\e[9;31m$s\e[0m \c"
            echo -e "\e[9m$s\e[0m \c"
            continue
        fi

    done

    # report the time
    # echo -e "\e[1;36mtotal time: (${time_str% +*}) = $time ms\e[0m"
    # echo -e "\e[1;36m[in ${time_str% +*}=$time ms]\e[0m"
    if case ${time_str% +*} in *"+"*) true;; *) false;; esac; then
        echo -e "[$time (${time_str% +*}) ms]"
    else
        echo -e "[$time ms]"
    fi
    echo

    ## add the result to 'embedding.log'
    echo "${p%.ebpd}  ${s%.ebpd}  $time" >> embedding.log

done