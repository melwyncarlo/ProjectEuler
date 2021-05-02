#!/bin/bash

OPTION=$(echo "$1" | tr '[:upper:]' '[:lower:]')
MAX_N=745

display_error ()
{
    if [ $compile_status -ne 0 ]
    then
        echo -e "\n$compile_log"
        echo -ne "\n\n Errors have been encountered in file:  "
        echo -e  "$(tput bold)$file_name$(tput sgr0)\n\n"
        gedit "problems/${i}/$file_name"
        exit 1
    elif grep "warning:" <<<"${compile_log}" >/dev/null
    then
        echo -e "\n$compile_log"
        echo -ne "\n\n Warnings have been encountered in file:  "
        echo -e  "$(tput bold)$file_name$(tput sgr0)\n\n"
        gedit "problems/${i}/$file_name"
        exit 1
    fi
}

if [[ $OPTION == "clean" ]]
then
    rm -f "run"
    # Deleting the extracted ZIP contents over here.
    rm -f "problems/003/PrimeNumbers_Upto_1000000"
    for i in $(seq -f "%03g" 1 $MAX_N)
    do
        rm -f "problems/${i}/a${i}"
        rm -f "problems/${i}/c${i}"
        rm -f "problems/${i}/f${i}"
    done
else
    if ! command -v unzip &> /dev/null
    then
        echo -ne "\n\n The $(tput bold)unzip$(tput sgr0) tool is required to "
        echo -ne "proceed further.\n It can be installed by using the following "
        echo -ne "command:\n\n \t$(tput bold)sudo apt install unzip$(tput sgr0)"
        echo -e  "\n\n"
        exit 127
    fi
    if ! command -v gnat &> /dev/null
    then
        echo -ne "\n\n The $(tput bold)unzip$(tput sgr0) tool is required to "
        echo -ne "proceed further.\n It can be installed by using the following "
        echo -ne "command:\n\n \t$(tput bold)sudo apt install gnat-10$(tput sgr0)"
        echo -e  "\n\n"
        exit 127
    fi
    # Extracting the ZIP files over here.
    unzip -oqq problems/003/PrimeNumbers_Upto_1000000.zip -d problems/003
    for i in $(seq -f "%03g" 1 $MAX_N)
    do
        if [ -d "problems/${i}" ]
        then
            if [ -f "problems/${i}/${i}.c" ]
            then
                compile_log=$(gcc -Wall -std=c17 -Wextra -Wpedantic \
                -pedantic-errors "problems/${i}/${i}.c" -o \
                "problems/${i}/c${i}" -lm 2>&1)
                compile_status=$?
                file_name="${i}.c"
            fi
            display_error
            if [ -f "problems/${i}/${i}.f90" ]
            then
                compile_log=$(gfortran -Wall -std=f2008 -Wextra -Wpedantic \
                -pedantic-errors "problems/${i}/${i}.f90" -o \
                "problems/${i}/f${i}" 2>&1)
                compile_status=$?
                file_name="${i}.f90"
            fi
            display_error
            if [ -f "problems/${i}/a${i}.adb" ]
            then
                compile_log=$(gnat make -f -gnat12 -gnatVa -gnaty9y -gnato \
                -gnatw.e -gnatw.O -O3 "problems/${i}/a${i}.adb" -o \
                "problems/${i}/a${i}" 2>&1)
                compile_status=$?
                file_name="a${i}.adb"
            fi
            display_error
            rm -f "a${i}.ali"
            rm -f "a${i}.o"
            rm -f "problems/${i}/a${i}.ali"
            rm -f "problems/${i}/a${i}.o"
        fi
    done
    run_file_contents="#\!/bin/bash\n\nPROBLEM_NUM=\$1\nPROBLEM_LANG=\$2\n\n"
    run_file_contents+="if ! [[ \"\$PROBLEM_NUM\" =~ ^[0-9]+$ ]]\nthen\n\t"
    run_file_contents+="echo -e \"\\\n\\\n Error: The problem number must be "
    run_file_contents+="of integer value.\\\n\\\n\"\n\texit 22\nfi\n\n"
    run_file_contents+="if [ \"\$PROBLEM_NUM\" -le 0 ] || [ \"\$PROBLEM_NUM\" "
    run_file_contents+="-gt $MAX_N ]\nthen\n\t"
    run_file_contents+="echo -e \"\\\n\\\n Error: The problem number must be "
    run_file_contents+="in the range [1, $MAX_N]."
    run_file_contents+="\\\n\\\n\"\n\texit 22\nfi\n\n"
    run_file_contents+="if [[ \"\$PROBLEM_LANG\" != \"a\" ]] && "
    run_file_contents+="[[ \"\$PROBLEM_LANG\" != \"c\" ]] \\"
    echo -e "$run_file_contents" > run
    run_file_contents="&& [[ \"\$PROBLEM_LANG\" != \"f\" ]]\nthen\n\t"
    run_file_contents+="echo -ne \"\\\n\\\n Error: The problem language must "
    run_file_contents+="be in the set {a, c, f}, \"\n\techo -e \"\\\n        "
    run_file_contents+="representing {Ada, C, Fortran}."
    run_file_contents+="\\\n\\\n\"\n\texit 22\nfi\n\n"
    run_file_contents+="PROBLEM_NUM_PAD=\$(printf %03d \$PROBLEM_NUM)\n"
    run_file_contents+="\"problems/\$PROBLEM_NUM_PAD/"
    run_file_contents+="\$PROBLEM_LANG\$PROBLEM_NUM_PAD\""
    echo -e "$run_file_contents" >> run
    chmod +x "run"
fi


