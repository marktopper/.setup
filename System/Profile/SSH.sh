# Usage: syncssh
# Will sync all files in the ~/.ssh folder with the backup folder

if [[ $ENABLE_SSH_SYNCING == true ]]; then
  function syncssh () {
    if [[ ! -d $SSH_PATH ]]; then
      mkdir $SSH_PATH
    fi

    if [[ -d $SSH_BACKUP_PATH ]];then
      for FILE in `ls $SSH_PATH/`; do
        if [ ! -e "$SSH_BACKUP_PATH/$FILE" ]; then
          cp $SSH_PATH/$FILE $SSH_BACKUP_PATH/$FILE
          TIMESTAMP=$(date +%F_%T)
          echo "$TIMESTAMP: Copied $SSH_PATH/$FILE to $SSH_BACKUP_PATH/$FILE" >> $SSH_BACKUP_LOG
          TIMESTAMP=$(date +%Y%m%d%H%M.%S)
          touch -mt $TIMESTAMP $SSH_PATH/$FILE
          touch -mt $TIMESTAMP $SSH_BACKUP_PATH/$FILE
        else
          SSH_FILE_MODIFIED_DATE=$(stat -f "%Sm" -t "%Y%m%dT%H%M%S" $SSH_PATH/$FILE)
          SSH_BACKUP_FILE_MODIFIED_DATE=$(stat -f "%Sm" -t "%Y%m%dT%H%M%S" $SSH_BACKUP_PATH/$FILE)
          if [[ $SSH_FILE_MODIFIED_DATE > $SSH_BACKUP_FILE_MODIFIED_DATE ]]; then
            rm $SSH_BACKUP_PATH/$FILE
            TIMESTAMP=$(date +%F_%T)
            echo "$TIMESTAMP: Removed $SSH_BACKUP_PATH/$FILE" >> $SSH_BACKUP_LOG
            cp $SSH_PATH/$FILE $SSH_BACKUP_PATH/$FILE
            TIMESTAMP=$(date +%F_%T)
            echo "$TIMESTAMP: Copied $SSH_PATH/$FILE to $SSH_BACKUP_PATH/$FILE" >> $SSH_BACKUP_LOG
            TIMESTAMP=$(date +%Y%m%d%H%M.%S)
            touch -mt $TIMESTAMP $SSH_PATH/$FILE
            touch -mt $TIMESTAMP $SSH_BACKUP_PATH/$FILE
          else
            if [[ $SSH_FILE_MODIFIED_DATE < $SSH_BACKUP_FILE_MODIFIED_DATE ]]; then
              rm $SSH_PATH/$FILE
              TIMESTAMP=$(date +%F_%T)
              echo "$TIMESTAMP: Removed $SSH_PATH/$FILE" >> $SSH_BACKUP_LOG
              cp $SSH_BACKUP_PATH/$FILE $SSH_PATH/$FILE
              TIMESTAMP=$(date +%F_%T)
              echo "$TIMESTAMP: Copied $SSH_BACKUP_PATH/$FILE to $SSH_PATH/$FILE" >> $SSH_BACKUP_LOG
              TIMESTAMP=$(date +%Y%m%d%H%M.%S)
              touch -mt $TIMESTAMP $SSH_PATH/$FILE
              touch -mt $TIMESTAMP $SSH_BACKUP_PATH/$FILE
            fi
          fi
        fi
      done

      for FILE in `ls $SSH_BACKUP_PATH/`; do
        if [ ! -e "$SSH_PATH/$FILE" ]; then
          cp $SSH_BACKUP_PATH/$FILE $SSH_PATH/$FILE
          TIMESTAMP=$(date +%F_%T)
          echo "$TIMESTAMP: Copied $SSH_BACKUP_PATH/$FILE to $SSH_PATH/$FILE" >> $SSH_BACKUP_LOG
          TIMESTAMP=$(date +%Y%m%d%H%M.%S)
          touch -mt $TIMESTAMP $SSH_PATH/$FILE
          touch -mt $TIMESTAMP $SSH_BACKUP_PATH/$FILE
        fi
      done
    else
      echo ""
      print_error "FAILED SYNCING SSH FILES!"
      echo ""
      echo "Greetings ${USER}!"
      echo ""
      echo "If you see this message it is because that you have enabled syncing ssh files."
      echo "However it seems that the path \"$SSH_BACKUP_PATH\" does not exists."
      echo ""
      echo "If this path is inside Dropbox, please check the following:"
      echo "1) Ensure that Dropbox is installed."
      echo "2) Ensure that you are logged into Dropbox."
      echo "3) Ensure that Dropbox is synced"
      echo "4) Ensure that the folder exists in your Dropbox."
      echo ""
      echo "If you do not use Dropbox, please create the folder from the path above."
      echo ""
      echo "If you need help, proceed to http://github.com/marktopper/.setup and fill a issue."
      echo ""
      echo "Thanks, Mark Topper"
      echo ""
    fi
  }

  if [[ $AUTO_SYNC_SSH == true ]]; then
    syncssh
  fi
fi
