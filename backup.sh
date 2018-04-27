#!/bin/bash

CURRENT_MILLIS=$(($(date +%s%N)/1000000))
CURRENT_DATE=$(date)

HOME_DIR="/home/cillian"
BACKUP_FILE="backup.tar.gz"
SUMMARY_FILE="$HOME_DIR/backup-summary.txt"
CONTENTS_FILE="$HOME_DIR/backup-contents.txt"

printf "\nStart time (millis): \n$CURRENT_MILLIS\n"
printf "\nStart time (millis): \n$CURRENT_MILLIS\n" >> $SUMMARY_FILE
printf "\nStart time (date): \n$CURRENT_DATE\n"
printf "\nStart time (date): \n$CURRENT_DATE\n" >> $SUMMARY_FILE

OLD_DIR=$PWD
cd /

# Backs up home and opt directories.
sudo tar cvpzf $BACKUP_FILE \
    --exclude=/$BACKUP_FILE \
    --exclude=/home/cillian/Android \
    --exclude=/bin \
    --exclude=/boot \
    --exclude=/cdrom \
    --exclude=/core \
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
    --exclude=/sys \
    --exclude=/tmp \
    --exclude=/usr \
    --exclude=/var /

# Print the contents to a text file.
tar -tf $BACKUP_FILE >> $CONTENTS_FILE

FINISH_MILLIS=$(($(date +%s%N)/1000000))
FINISH_DATE=$(date)

TIME_TAKEN_MS=$((FINISH_MILLIS-CURRENT_MILLIS))
TIME_TAKEN_S=$((TIME_TAKEN_MS/1000))
TIME_TAKEN_MINS=$((TIME_TAKEN_S/60))

cd $OLD_DIR

printf "\nFinish time (millis):\n$FINISH_MILLIS\n"
printf "\nFinish time (millis):\n$FINISH_MILLIS\n" >> $SUMMARY_FILE
printf "\nFinish time (date):\n$FINISH_DATE\n"
printf "\nFinish time (date):\n$FINISH_DATE\n" >> $SUMMARY_FILE
printf "\nTotal time taken:\n$TIME_TAKEN_MS (ms)\n$TIME_TAKEN_S (sec)\n$TIME_TAKEN_MINS (min)\n"
printf "\nTotal time taken:\n$TIME_TAKEN_MS (ms)\n$TIME_TAKEN_S (sec)\n$TIME_TAKEN_MINS (min)\n" >> $SUMMARY_FILE

# Tell the user we finished.
printf "\nBackup complete...\n\n"
