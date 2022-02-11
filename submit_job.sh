#!/bin/sh
# exit if error
set -e

usage() {
    echo "you should input sh $0 [submit_file] [script1, script2, ...]"
}

# need at least 2 args
if [ $# -gt 2 ]; then
    submit_file=$1
    scripts_with_submit=$@
else
    usage
    exit 1
fi

submit_job() {
    script=$1
    script_name=${script%.*}


    # avoid destoying the original file
    submit_file_tmp=${submit_file}_tmp
    cp $submit_file $submit_file_tmp

    # replace the env variables of submit_file
    sed -i "s/SCRIPT/$script/g" $submit_file_tmp
    sed -i "s/JOB_NAME/$script_name/g" $submit_file_tmp

    condor_submit $submit_file_tmp

    echo "condor_submit $submit_file $script"

    # remove the tmp file
    rm $submit_file_tmp
    return 0
}

for script in $scripts_with_submit
do
    if [ "$script" = "$submit_file" ]; then
        continue
    fi
    submit_job $script
done


