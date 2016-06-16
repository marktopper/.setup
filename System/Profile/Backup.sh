# Usage: backup
# Will backup all the folders in the configuration

# Usage: backup /path/to/folder
# Will only backup the selected folder

# Usage: restore 1D
# Will restore all the folders in the configuration from 1 day

# Usage restore 1D /path/to/folder
# Will restore the selected folder from 1 day

if [[ $ENABLE_BACKUPS == true ]]; then
  function backup () {
    for backup in $BACKUPS; do
      while IFS='=' read -ra parts; do
        folder=''
        backup_folder=''
        for i in "${parts[@]}"; do
          if [[ $folder == '' ]]; then
            folder=$i
          else
            if [[ $backup_folder == '' ]]; then
              backup_folder=$i
            fi
          fi
        done
      done <<< "$backup"
      #echo "folder: "$folder
      #echo "backup_folder: "$backup_folder

      # TODO: below!
        # if folder exists
          # if ! backup folder exists
            # create it
          # rdiff-backup --force --terminal-verbosity 8 --print-statistics $folder $backup >$BACKUP_LOG 2>&1
        # else print_error "Folder [$backup] for backup not found"
    done
  }

  if [[ $ENABLE_RESTORE == true ]]; then
    restore () {
      TIME=$1
      PATH=$2

      if [[ ! -z $TIME ]]; then
        echo ""
        echo "Usage: restore time path"
        echo "  Example: restore 1D /path/to/folder"
        echo "  Restores the folder \"/path/to/folder\" back 1 day."
        echo "  Time options:"
        echo "    D = days"
        echo "" # TODO: Add more
      else
        if [[ -z $PATH ]]; then
          echo "Usage: restore time path"
          echo "  Example: restore 1D /path/to/folder"
          echo "  Restores the folder \"/path/to/folder\" back 1 day."
          echo "  Time options:"
          echo "    D = days"
          echo "" # TODO: Add more
        else
          if backup_path_exists $PATH; then
            $BACKUP_PATH=$(get_backup_path $PATH)
            rsync_backup -r "$TIME" $BACKUP_PATH $PATH
          else
            print_error "Path [$PATH] does not exists in configuration!"
          fi
        fi
      fi
    }
  fi

  if [[ $AUTO_BACKUP == true ]]; then
    # TODO: Maybe only do once a day [OPTIONAL]
    backup
  fi
fi
