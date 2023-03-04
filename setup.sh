#! /usr/bin/env bash

DATE=$(date '+%y%m%d%H%M%S%N')
CONFIGDIR=$HOME/.config
declare -A PATHS=( ["config"]="$CONFIGDIR" ["dot"]="$HOME" )
SCRIPTPATH="$( cd -- "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"
BACKUPDIR=$CONFIGDIR/dotbackup$DATE
# Log prefix
PRE="\e[35m#\e[0m"

# Telling the user what's going to happen and asking them if they want to continue
# or not
echo "This script will replace your existing configuration with the dotfiles in this repository."
echo "Before that, it will make a backup of your existing dotfiles to \"${BACKUPDIR}\""
echo "Do you want to continue? (y)"
read contvar

# If the user has definitely accepted the stuff then we can continue, we exit otherwise
if [[ $contvar != "y" ]] && [[ $contvar != "" ]]; then
    exit 0
fi

echo ""
echo -e "$PRE The script is running from $SCRIPTPATH"
echo ""

# Making a backup directory where we can put the old dotfiles
echo -e "$PRE Creating backup directory"
mkdir $BACKUPDIR

# Making the script be able to interact with hidden files
shopt -s dotglob

# Looping through the dot path types
for TYP in "${!PATHS[@]}"; do
    # Making a subdir in the backup folder so the backup is organized
    mkdir $BACKUPDIR/$TYP
    echo -e "$PRE ($TYP) Starting the replacing process..."

    # Looping through the dotfiles in this repo
    for REPODOTPATH in ${SCRIPTPATH}/${TYP}/*; do
        REPODOTNAME=$(basename $REPODOTPATH)

        # This shit goes berserk if i dont check this:
        #
        # It tries moving every directory into the backup folder
        # because the basename is "*" (and this is not very cool)
        if [[ $REPODOTNAME == *\* ]]; then
            echo -e "$PRE$PRE ($TYP) Dir empty, skipping..."
            break
        fi

        # Looping through the local dotfiles
        for LOCALDOTPATH in ${PATHS[$TYP]}/*; do
            LOCALDOTNAME=$(basename $LOCALDOTPATH)

            # If there's a local dotfile that can be replaced by the ones
            # located in the repo, we back it up to the newly created backup dir
            if [[ $LOCALDOTNAME == $REPODOTNAME ]]; then
                echo -e "$PRE$PRE ($TYP) Found local $LOCALDOTNAME, backing up..."
                mv $LOCALDOTPATH $BACKUPDIR/$TYP # > /dev/null 2>&1
            fi
        done

        # We make a symlink to the repo's dotfiles
        echo -e "$PRE$PRE ($TYP) Linking $REPODOTNAME..."
        ln -s $SCRIPTPATH/$TYP/$REPODOTNAME ${PATHS[$TYP]}/$REPODOTNAME
    done
done

echo ""
echo "Setup done! If you haven't encountered any errors then it's probably successful too."
echo "Note: Please do not mess with the dotfiles in this repository if you don't know what you're doing."
echo "If you want to remove the dotfiles, remove the symlinks first in your local directories"
echo ""
