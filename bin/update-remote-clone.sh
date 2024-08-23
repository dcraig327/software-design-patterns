#!/bin/bash
# This script is run anytime a new file is to be uploaded to the web server.
# It creates a hard link in the web server directory to the new project file.
# If that web server directory isn't created, it'll attempt to create it.
# The auto option will automating running this script after each new file is
#  added. (Requires inotifywait)
# The remove option will remove all hard links in the web server directory
#  then remove that directory.

################################################################################
# GLOBAL VARIABLES ----------------------------------------------------------- #
################################################################################
REMOTE_ROOT="/var/www/software-design-patterns"
WWWROOT=`realpath "../wwwroot"`

################################################################################
# FUNCTIONS ------------------------------------------------------------------ #
################################################################################
function createRemoteRootDirectory {
  if [ ! -d "$REMOTE_ROOT" ]; then
    mkdir $REMOTE_ROOT
  fi
}

function enableHardLinks {
  for filepath in "$WWWROOT"/*; do
    local filename=`basename "$filepath"`
    local remotepath="$REMOTE_ROOT"/"$filename"
    if [ ! -f "$remotepath" ]; then
      ln "$filepath" "$remotepath"
    fi
  done
}
function disableBrokenHardLinks {
  for filepath in "$REMOTE_ROOT"/*; do
    local filename=`basename "$filepath"`
    local localpath="$WWWROOT"/"$filename"
    if [ ! -f "$localpath" ]; then
      rm "$filepath"
    fi
  done
}

function removeRootDirectory {
  if [ -d "$REMOTE_ROOT" ]; then
    rm -rf "$REMOTE_ROOT"
  fi
}

function disableHardLinks {
  for filepath in "$WWWROOT"/*; do
    local filename=`basename "$filepath"`
    local remotepath="$REMOTE_ROOT"/"$filename"
    if [ -f "$remotepath" ]; then
      rm "$remotepath"
    fi
  done
}

function removeHardLinks {
  disableHardLinks
  removeRootDirectory
  exit 0;
}

function updateHardLinks {
  createRemoteRootDirectory
  enableHardLinks
  disableBrokenHardLinks
}

function activateWWWRootMonitoring {
  inotifywait -m "$WWWROOT" -e create -e move -e delete |
    while read dir action file; do
      updateHardLinks
    done
    exit 0;
}

function helpPage {
  echo "update-remote-clone [auto|remove]"
  echo
  echo "Use with no options after adding/removing a file in wwwroot to update the server."
  echo
  echo "The possible options:"
  echo "-h: this page"
  echo "-a: automating runs this script after each new file is added. (Requires inotifywait)"
  echo "-r: remove all hard links in the web server directory then remove that directory."
  exit 0;
}

################################################################################
# MAIN FUNCTION -------------------------------------------------------------- #
################################################################################
function main {
  if [[ "$#" > 1 ]]; then
    helpPage
  fi

  case "$1" in
    -h|?|-h|--h|-help|--help)
      helpPage
      ;;
    -a)
      activateWWWRootMonitoring
      ;;
    -r)
      removeHardLinks
      ;;
  esac
  updateHardLinks
}

################################################################################
# ENTRYPOINT ----------------------------------------------------------------- #
################################################################################
main "$@"
