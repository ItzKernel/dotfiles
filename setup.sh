#! /usr/bin/env bash

DATE=$(date '+%y%m%d%H%M%S%N')
CONFIGDIR=$HOME/.config
DOTS=(eww fish hypr kitty neofetch nvim)
SCRIPTPATH="$( cd -- "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"
BACKUPDIR=$CONFIGDIR/dotbackup$DATE
# Log prefix
PRE="\e[35m#\e[0m"

echo "This script will replace your existing configuration with the dotfiles in this repository."
echo "Before that, it will make a backup of your existing dotfiles to \"${BACKUPDIR}\""
echo "Do you want to continue? (y)"
read contvar

if [[ $contvar != "y" ]] && [[ $contvar != "" ]]; then
    exit 0
fi

echo -e "$PRE The script is running from $SCRIPTPATH"

echo -e "$PRE Making backup..."

echo -e "$PRE$PRE Creating backup directory"
mkdir $BACKUPDIR

echo -e "$PRE$PRE$PRE Putting stuff inside the backup dir"
for dir in $CONFIGDIR/*; do
    BASENAME=$(basename $dir)

    # If the dots array contains the directory
    if [[ " ${DOTS[*]} " =~ " $BASENAME " ]]; then
        echo -e "$PRE$PRE$PRE Backing up ${BASENAME}..."
        mv ${dir} ${BACKUPDIR}
    fi
done

echo -e "$PRE Linking directories..."
for dir in "${DOTS[@]}"; do
    echo -e "$PRE$PRE Linking ${dir}"
    ln -s $SCRIPTPATH/$dir $CONFIGDIR/$dir
done

echo "Setup done! If you haven't encountered any errors then it's probably successful too."

