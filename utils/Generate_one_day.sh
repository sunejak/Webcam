#!/bin/bash
#
# Generate all files for yesterday
#
mydate=$1
if [[ ${mydate} == "" ]] ; then
    echo "Usage: Generate_one_day yesterday location"
    exit 1
fi
mylocation=$2
if [[ ${mylocation} == "" ]] ; then
    echo "Usage: Generate_one_day yesterday location"
    exit 1
fi


cd /var/www/html/${mylocation}/`date --date="${mydate}" +%m`_`date --date="${mydate}" +%b`_`date --date="${mydate}" +%Y`/`date --date="${mydate}" +%d`

# Scale down
~/scripts/Scale_down.sh "cam0_2015_*.jpeg" 600 800

# Generate differences
~/scripts/Loop_over.sh "sc_cam0_2015_*" 30

# Create HTML files
~/scripts/Generate_biggest_diff_html.sh > big.html

~/scripts/Generate_html.sh > diffs.html

