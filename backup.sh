#!/bin/bash

# TODO: grant super user access
#sudo -i

# Check the current time
CURRENT_MILLIS=$(($(date +%s%N)/1000000))
CURRENT_TIME=$(date)
CURRENT_DATE=$(date '+%Y-%m-%d')

# Set up some variables, files, directories etc.
BACKUP_ROOT="/"
if [ -z "$1" ]
then
    BACKUPS_DIR=/home/cillian/backups
else
    BACKUPS_DIR=$1
fi
BACKUP_DIR=$BACKUPS_DIR/$CURRENT_DATE
mkdir -p "$BACKUP_DIR"
BACKUP_FILE="$BACKUP_DIR/backup.tar.gz"
SUMMARY_FILE="$BACKUP_DIR/summary.txt"
CONTENTS_FILE="$BACKUP_DIR/contents.txt"
touch "$SUMMARY_FILE"
touch "$CONTENTS_FILE"

# TODO: remove below
printf "\n\$1: \n$1\n"
printf "\nBACKUPS_DIR: \n$BACKUPS_DIR\n"
printf "\nBACKUP_DIR: \n$BACKUP_DIR\n"
printf "\nBACKUP_FILE: \n$BACKUP_FILE\n"
printf "\nSUMMARY_FILE: \n$SUMMARY_FILE\n"
printf "\nCONTENTS_FILE: \n$CONTENTS_FILE\n"

# Output start time
printf "\nStart time (millis): \n$CURRENT_MILLIS\n"
printf "\nStart time (millis): \n$CURRENT_MILLIS\n" >> "$SUMMARY_FILE"
printf "\nStart time (date): \n$CURRENT_TIME\n"
printf "\nStart time (date): \n$CURRENT_TIME\n" >> "$SUMMARY_FILE"
printf "\nOutput folder: \n$BACKUP_DIR\n"
printf "\nOutput folder: \n$BACKUP_DIR\n" >> "$SUMMARY_FILE"

# TODO: sample backup for validation 
#TO_BE_BACKED_UP="/opt/Heimdall/"
#cd "$TO_BE_BACKED_UP"
#sudo tar cvpzf "$BACKUP_FILE" "$TO_BE_BACKED_UP"

# Take note of where we are
OLD_DIR=$PWD
cd "$BACKUP_ROOT"

# Back up home and opt directories
sudo tar cvpzf "$BACKUP_FILE" \
    --exclude="$BACKUPS_DIR" \
    --exclude=/home/cillian/Android \
    --exclude=/bin \
    --exclude=/boot \
    --exclude=/cdrom \
    --exclude=/dev \
    --exclude=/etc \
    --exclude=/lib \
    --exclude=/lib32 \
    --exclude=/lib64 \
    --exclude=/lost+found \
    --exclude=/media \
    --exclude=/mnt \
    --exclude=/proc \
    --exclude=/root \
    --exclude=/run \
    --exclude=/sbin \
    --exclude=/snap \
    --exclude=/srv \
    --exclude=/swapfile \
    --exclude=/sys \
    --exclude=/tmp \
    --exclude=/usr \
    --exclude=/var "$BACKUP_ROOT"

# Print the contents to a text file
tar -tf "$BACKUP_FILE" >> "$CONTENTS_FILE"

# Take note of the finish time
FINISH_MILLIS=$(($(date +%s%N)/1000000))
FINISH_TIME=$(date)
TIME_TAKEN_MS=$((FINISH_MILLIS-CURRENT_MILLIS))
TIME_TAKEN_S=$((TIME_TAKEN_MS/1000))
TIME_TAKEN_MINS=$((TIME_TAKEN_S/60))

# Go back to where we started
cd "$OLD_DIR"

# Tell the user how long it took
printf "\nFinish time (millis):\n$FINISH_MILLIS\n"
printf "\nFinish time (millis):\n$FINISH_MILLIS\n" >> "$SUMMARY_FILE"
printf "\nFinish time (date):\n$FINISH_TIME\n"
printf "\nFinish time (date):\n$FINISH_TIME\n" >> "$SUMMARY_FILE"
printf "\nTotal time taken:\n$TIME_TAKEN_MS (ms)\n$TIME_TAKEN_S (sec)\n$TIME_TAKEN_MINS (min)\n"
printf "\nTotal time taken:\n$TIME_TAKEN_MS (ms)\n$TIME_TAKEN_S (sec)\n$TIME_TAKEN_MINS (min)\n" >> "$SUMMARY_FILE"

# Tell the user we finished
printf "\nBackup complete...\n\n"
