# Add custom functions to path.
if [ -f ~/drive/work/dev/scripts/bash/bash_functions.sh ]; then
    . ~/drive/work/dev/scripts/bash/bash_functions.sh
fi

# Sync Google Drive folders
function sync() {
    old_dir=$PWD

    echo "*****"
    cd /home/cillian/drive/work/
    grive
    echo "*****"

    echo "*****"
    cd /home/cillian/drive/personal/
    grive
    echo "*****"

    cd $old_dir
}
