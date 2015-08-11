#!/bin/bash
#
# Generate all files for yesterday
#

cd /var/www/garage/`date --date='yesterday' +%m`_`date --date='yesterday' +%b`_`date --date='yesterday' +%Y`/`date --date='yesterday' +%d`

# Scale down
~/scripts/Scale_down.sh "cam0_2015_*.jpeg" 600 800

# Generate differences
~/scripts/Loop_over.sh "sc_cam0_2015_*" 30

# Create HTML files
~/scripts/Generate_biggest_diff_html.sh > big.html

~/scripts/Generate_html.sh > diffs.html
