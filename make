#!/bin/bash

# Copyright 2021 Melwyn Francis Carlo


OPTION=$(echo "$1" | tr '[:upper:]' '[:lower:]')


# Global constant denoting the maximum number of Project Euler problems.
# ---------------------------------------------------------------------------- #
MAX_N=761
# ---------------------------------------------------------------------------- #


# Function that displays error and warning messages.
display_error ()
{
    if [ $compile_status -ne 0 ]
    then
        echo -e "\n$compile_log"
        echo -ne "\n\n Errors have been encountered in file:  "
        echo -e  "$(tput bold)$file_name$(tput sgr0)\n\n"
        gedit "problems/${i}/$file_name"
        exit 1
    else
        temp_log=`echo "$compile_log" | tr '[:upper:]' '[:lower:]'`
        if [[ "$temp_log" == *"warning"* || "$temp_log" == *"error"* \
           || "$temp_log" == *"(style)"* ]]
        then
            echo -e "\n$compile_log"
            echo -ne "\n\n Warnings have been encountered in file:  "
            echo -e  "$(tput bold)$file_name$(tput sgr0)\n\n"
            gedit "problems/${i}/$file_name"
            exit 1
        fi
    fi
}

if [[ $OPTION == "clean" ]]
then

# Introductory message
# ---------------------------------------------------------------------------- #
    echo
    echo -n  "----------------------------------------"
    echo     "-----------------------------------"
    echo     " PROJECT EULER - PROBLEM ARCHIVES - SOLUTIONS : CLEANING"
    echo -n  "----------------------------------------"
    echo     "-----------------------------------"
    echo
# ---------------------------------------------------------------------------- #


    # Deleting the Run executable script file.
    echo " Removing the 'run' executable script file ..."
    rm -f "run"

    echo

    # Deleting the extracted ZIP contents over here.
    echo " Removing the extracted 'PrimeNumbers_Upto_1000000' file ..."
    rm -f "problems/003/PrimeNumbers_Upto_1000000"
    echo " Removing the extracted 'Prime_Numbers_Test_for_First_700...' file ..."
    rm -f "problems/058/Prime_Numbers_Test_for_First_700_Million_Natural_Numbers"

    echo

    # Deleting the 'bin' folders, that is, the executables and the MD5 checksum files.
    echo " Removing the 'bin' directories ..."
    for i in $(seq -f "%03g" 1 $MAX_N)
    do
        if [ -d "problems/${i}" ]
        then
            echo "   problems/${i}/bin"
            rm -rf "problems/${i}/bin"
        fi
    done

    echo -e "\n"

else

    # Checking whether or not the Linux 'unzip' terminal application exists.
    if ! command -v unzip &> /dev/null
    then
        echo -ne "\n\n The $(tput bold)unzip$(tput sgr0) tool is required to "
        echo -ne "proceed further.\n It can be installed by using the following "
        echo -ne "command:\n\n \t$(tput bold)sudo apt install unzip$(tput sgr0)"
        echo -e  "\n\n"
        exit 127
    fi

    # Checking whether or not the Linux 'gnat' terminal application exists.
    if ! command -v gnat &> /dev/null
    then
        echo -ne "\n\n The $(tput bold)unzip$(tput sgr0) tool is required to "
        echo -ne "proceed further.\n It can be installed by using the following "
        echo -ne "command:\n\n \t$(tput bold)sudo apt install gnat-10$(tput sgr0)"
        echo -e  "\n\n"
        exit 127
    fi

    echo
    echo -n  "----------------------------------------"
    echo     "-----------------------------------"
    echo     " PROJECT EULER - PROBLEM ARCHIVES - SOLUTIONS : MAKING"
    echo -n  "----------------------------------------"
    echo     "-----------------------------------"

    echo

    # Extracting the ZIP files over here.
    if [ ! -f "problems/003/PrimeNumbers_Upto_1000000" ]
    then
        echo " Extracting the PrimeNumbers_Upto_1000000 ZIP file ..."
        unzip -oqq problems/003/PrimeNumbers_Upto_1000000.zip -d problems/003
    fi
    if [ ! -f "problems/058/Prime_Numbers_Test_for_First_700_Million_Natural_Numbers" ]
    then
        echo " Extracting the Prime_Numbers_Test_for_First_700_Million... ZIP file ..."
        unzip -oqq problems/058/Prime_Numbers_Test_for_First_700_Million_Natural_Numbers.zip -d problems/058
    fi

    echo

    for i in $(seq -f "%03g" 1 $MAX_N)
    do
        # Checking if the problem directory exists.
        if [ -d "problems/${i}" ]
        then

            echo    " Problem Archives Number ${i}:"
            echo -n "   Checking  if  the 'bin' directory exists   ... "

            # Checking and then testing for an existing MD5 checksum match.
            if [ -d "problems/${i}/bin" ]
            then
                echo    "EXISTS."
                echo -n "   Checking  if  the  MD5  sum checks         ... "
                if [ -f "problems/${i}/bin/${i}.md5" ]
                then
                    md5sum --status -c "problems/${i}/bin/${i}.md5"
                    MD5_Check_Result=$?
                else
                    MD5_Check_Result=1
                fi
                if [ $MD5_Check_Result -eq 0 ]
                then
                    echo "SUCCESS."
                    echo
                    continue
                else
                    echo "FAILURE."
                fi
            else
                echo "NOT EXISTS."
                echo "   Creating  the 'problems/${i}/bin' directory ..."
                mkdir "problems/${i}/bin"
            fi


# Compilation process
# ---------------------------------------------------------------------------- #
# If you are using other programming languages, 
# then you may replace the compilation commands with 
# their equivalents for the other programming languages.
# Make sure to set the standard flag, all errors and warnings flags, 
# as well as the level 3 optimization flag.


            # Compiling the C program file.
            echo "   Compiling the '${i}.c'      program file    ..."
            #---------- C program compilation command, starts here. -----------#
            compile_log=$(gcc -O3 -Wall -std=c17 -Wextra -Wpedantic \
            -pedantic-errors "problems/${i}/${i}.c" -o \
            "problems/${i}/bin/c${i}" -lm 2>&1)
            #---------- C program compilation command, ends here.   -----------#
            compile_status=$?
            file_name="${i}.c"
            display_error


            # Compiling the Fortran program file.
            echo "   Compiling the '${i}.f90'    program file    ..."
            #------- Fortran program compilation command, starts here. --------#
            compile_log=$(gfortran -O3 -Wall -std=f2008 -Wextra -Wpedantic \
            -pedantic-errors "problems/${i}/${i}.f90" -o \
            "problems/${i}/bin/f${i}" 2>&1)
            #------- Fortran program compilation command, ends here.   --------#
            compile_status=$?
            file_name="${i}.f90"
            display_error


            # Compiling the Ada program file.
            echo "   Compiling the 'a${i}.adb'   program file    ..."
            #--------- Ada program compilation command, starts here. ----------#
            compile_log=$(gnat make -f -gnat12 -gnatVa -gnaty9y -gnato \
            -gnatw.e -gnatw.O -O3 "problems/${i}/a${i}.adb" -o \
            "problems/${i}/bin/a${i}" 2>&1)
            #--------- Ada program compilation command, ends here.   ----------#
            compile_status=$?
            file_name="a${i}.adb"
            display_error

            echo "   Removing  the redundant Ada output files   ..."
            # Deleting the redundant Ada output files.
            rm -f "a${i}.ali"
            rm -f "a${i}.o"
            rm -f "problems/${i}/a${i}.ali"
            rm -f "problems/${i}/a${i}.o"
# ---------------------------------------------------------------------------- #


            echo "   Creating  the '${i}.md5'   checksum file    ..."
            # Creating a new set of MD5 checksums.
            echo `md5sum "$PWD/problems/${i}/${i}.c"`     > "problems/${i}/bin/${i}.md5"
            echo `md5sum "$PWD/problems/${i}/${i}.f90"`  >> "problems/${i}/bin/${i}.md5"
            echo `md5sum "$PWD/problems/${i}/a${i}.adb"` >> "problems/${i}/bin/${i}.md5"

            echo
        fi
    done

    echo " Creating the 'run' executable script file    ..."

    # Creating the Run executable script file.
    run_file_contents="#!/bin/bash\n\n# Copyright 2021 Melwyn Francis Carlo"
    run_file_contents+="\n\nPROBLEM_NUM=\$1\n\n"
    run_file_contents+="if ! [[ \"\$PROBLEM_NUM\" =~ ^[0-9]+$ ]]\nthen\n\t"
    run_file_contents+="echo -e \"\\\n\\\n Error: The problem number must be "
    run_file_contents+="of integer value.\\\n\\\n\"\n\texit 22\nfi\n\n"
    run_file_contents+="if [ \"\$PROBLEM_NUM\" -le 0 ] || [ \"\$PROBLEM_NUM\" "
    run_file_contents+="-gt $MAX_N ]\nthen\n\t"
    run_file_contents+="echo -e \"\\\n\\\n Error: The problem number must be "
    run_file_contents+="in the range [1, $MAX_N]."
    run_file_contents+="\\\n\\\n\"\n\texit 22\nfi\n\n"
    echo -e "$run_file_contents" > run
    run_file_contents="PROBLEM_NUM_PAD=\$(printf %03d \$PROBLEM_NUM)\n\n"
    run_file_contents+="echo -e \"\\\n\"\n"
    run_file_contents+="echo -n  \"----------------------------------------\"\n"
    run_file_contents+="echo     \"-----------------------------------\"\n"
    run_file_contents+="echo \" PROJECT EULER - PROBLEM ARCHIVES "
    run_file_contents+="SOLUTION - PROBLEM \$PROBLEM_NUM_PAD\"\n"
    run_file_contents+="echo -n  \"----------------------------------------\"\n"
    run_file_contents+="echo     \"-----------------------------------\"\n"
    run_file_contents+="echo\n"

# You may replace the programming language names as required.
# Make sure to realign the text.
# ---------------------------------------------------------------------------- #
    run_file_contents+="\necho -n \"       C Program Result : \"\n"
    run_file_contents+="\"problems/\$PROBLEM_NUM_PAD/bin/c\$PROBLEM_NUM_PAD\"\n"
    run_file_contents+="\necho -n \"     Ada Program Result : \"\n"
    run_file_contents+="\"problems/\$PROBLEM_NUM_PAD/bin/a\$PROBLEM_NUM_PAD\"\n"
    run_file_contents+="\necho -n \" Fortran Program Result : \"\n"
    run_file_contents+="\"problems/\$PROBLEM_NUM_PAD/bin/f\$PROBLEM_NUM_PAD\"\n"
# ---------------------------------------------------------------------------- #

    run_file_contents+="echo -e \"\\\n\"\n"
    echo -e "$run_file_contents" >> run
    chmod +x "run"

    echo -e "\n"
fi

