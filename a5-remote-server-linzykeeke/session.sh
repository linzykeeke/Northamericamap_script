#!/bin/bash
# --------------------------------------------------------------------------------
# document here the main bash commands you are using for the server access.  The file contains
# two parts: the first one for the commands you run on your laptop, and the second one for the
# commands on the remote server.
#
# The question lists give your some guidance what to do and report but you are free to do it
# in a different way.  If you use a graphical frontend instead of scp for copying files,
# just say which one in the appropriate place.
#
# Note: this file does not to be runnable
#
# -------------------- local commands --------------------
# 1. create a directory for this project.
cd Desktop
cd INFO_Homework
mkdir a5-remote-serer-linzykeeke
# 2. log onto the server
ssh keeke@info201.ischool.uw.edu
# 3. copy the small data subset from the server to your local machine
scp keeke@info201.ischool.uw.edu:/opt/data/temp-prec-tiny.csv.bz2 .

# 4. copy your R-script to the server
scp keeke@info201.ischool.uw.edu:scripts
# 5. (after succesfully running the script remotely): copy the output files back to your computer
scp keeke@info201.ischool.uw.edu:scripts/map.png "/"
# 6. inspect that the copy was successful
ls

# -------------------- remote commands --------------------
# 1. explore the data directory '/opt/data'.  How do you find out the size of the files?
cd /out/data
ls -l
# 2. explore the first few lines of the small sample data
bzcat temp-prec-tiny.csv.bz2 |head -10
# 3. create a directory for this project
mkdir map_scripts
# 4. (after copying your code from the laptop): inspect the files in the project directory
cd map_scripts
ls -l
# 5. run your script
Rscript map.R
# 6. How do you install missing R packages?
Rscript -e "install.packages ('missing')"
# 7. (after running the script): inspect the folder for output files
