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

    # replace the env variables of submit_file
    sed -i "s/SCRIPT/$script/g" $submit_file
    sed -i "s/SCRIPT_NAME/$script_name/g" $submit_file

    condor_submit $submit_file

    echo "condor_submit $submit_file $script"

    return 0
}

for script in $scripts_with_submit
do
    if [ "$script" = "$submit_file" ]; then
        continue
    fi
    submit_job $script
done


