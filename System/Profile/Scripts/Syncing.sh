# Usage: syncfiles
# Will sync all files/folders defined in the Sync.sh configuration.
# Can be used to sync files between 2 locations.
# Example between one application and a backup at Dropbox.

SYNC_HAD_ERRORS=false
if [[ $ENABLE_SYNCING == true && $INSTALL_COMPLETE != true ]]; then
  function syncfiles () {
    for SYNC_PATH in "${SYNC_PATHS[@]}"; do
      SYNC_USER_PATH=`echo $SYNC_PATH | awk '{split($0,a,";"); print a[1]}'`
      SYNC_REMOTE_PATH=`echo $SYNC_PATH | awk '{split($0,a,";"); print a[2]}'`

      if [[ -d "${SYNC_USER_PATH}" ]];then
        if [[ -d $SYNC_REMOTE_PATH ]];then
          for FILE in `ls "${SYNC_USER_PATH}/"`; do
            if [ ! -e "${SYNC_REMOTE_PATH}/${FILE}" ]; then
              cp $SYNC_USER_PATH/$FILE $SYNC_REMOTE_PATH/$FILE
              TIMESTAMP=$(date +%F_%T)
              echo "$TIMESTAMP: Copied $SYNC_USER_PATH/$FILE to $SYNC_REMOTE_PATH/$FILE" >> $SYNC_LOG
              TIMESTAMP=$(date +%Y%m%d%H%M.%S)
              touch -mt $TIMESTAMP $SYNC_USER_PATH/$FILE
              touch -mt $TIMESTAMP $SYNC_REMOTE_PATH/$FILE
            else
              SSH_FILE_MODIFIED_DATE=$(stat -f "%Sm" -t "%Y%m%dT%H%M%S" $SYNC_USER_PATH/$FILE)
              SSH_BACKUP_FILE_MODIFIED_DATE=$(stat -f "%Sm" -t "%Y%m%dT%H%M%S" $SYNC_REMOTE_PATH/$FILE)
              if [[ $SSH_FILE_MODIFIED_DATE > $SSH_BACKUP_FILE_MODIFIED_DATE ]]; then
                rm $SYNC_REMOTE_PATH/$FILE
                TIMESTAMP=$(date +%F_%T)
                echo "$TIMESTAMP: Removed $SYNC_REMOTE_PATH/$FILE" >> $SYNC_LOG
                cp $SYNC_USER_PATH/$FILE $SYNC_REMOTE_PATH/$FILE
                TIMESTAMP=$(date +%F_%T)
                echo "$TIMESTAMP: Copied $SYNC_USER_PATH/$FILE to $SYNC_REMOTE_PATH/$FILE" >> $SYNC_LOG
                TIMESTAMP=$(date +%Y%m%d%H%M.%S)
                touch -mt $TIMESTAMP $SYNC_USER_PATH/$FILE
                touch -mt $TIMESTAMP $SYNC_REMOTE_PATH/$FILE
              else
                if [[ $SSH_FILE_MODIFIED_DATE < $SSH_BACKUP_FILE_MODIFIED_DATE ]]; then
                  rm $SYNC_USER_PATH/$FILE
                  TIMESTAMP=$(date +%F_%T)
                  echo "$TIMESTAMP: Removed $SYNC_USER_PATH/$FILE" >> $SYNC_LOG
                  cp $SYNC_REMOTE_PATH/$FILE $SYNC_USER_PATH/$FILE
                  TIMESTAMP=$(date +%F_%T)
                  echo "$TIMESTAMP: Copied $SYNC_REMOTE_PATH/$FILE to $SYNC_USER_PATH/$FILE" >> $SYNC_LOG
                  TIMESTAMP=$(date +%Y%m%d%H%M.%S)
                  touch -mt $TIMESTAMP $SYNC_USER_PATH/$FILE
                  touch -mt $TIMESTAMP $SYNC_REMOTE_PATH/$FILE
                fi
              fi
            fi
          done

          for FILE in `ls $SYNC_REMOTE_PATH/`; do
            if [ ! -e "$SYNC_USER_PATH/$FILE" ]; then
              cp $SYNC_REMOTE_PATH/$FILE $SYNC_USER_PATH/$FILE
              TIMESTAMP=$(date +%F_%T)
              echo "$TIMESTAMP: Copied $SYNC_REMOTE_PATH/$FILE to $SYNC_USER_PATH/$FILE" >> $SYNC_LOG
              TIMESTAMP=$(date +%Y%m%d%H%M.%S)
              touch -mt $TIMESTAMP $SYNC_USER_PATH/$FILE
              touch -mt $TIMESTAMP $SYNC_REMOTE_PATH/$FILE
            fi
          done

        else
          print_error "Sync failed, remote path does not exist: ${SYNC_REMOTE_PATH}"
          SYNC_HAD_ERRORS=true
        fi
      else
        echo print_error "Sync failed, user path does not exist: ${SYNC_USER_PATH}"
        SYNC_HAD_ERRORS=true
      fi
    done

    if [[ $SYNC_HAD_ERRORS == true ]]; then
      echo ""
      echo "How to get rid of thise errors?"
      echo ""
      echo "1) Open the configuration file and check that the paths are correct: open ~/.SetupUserConfig/Sync.sh"
      echo "2) Ensure the paths exists and are absolute (with usage of \"\$HOME\" instead of \"~\")."
      echo "3) For remote path issues with a location for Dropbox or any other cloud based solution, please check the following:"
      echo "3a) Ensure that Dropbox is installed."
      echo "3b) Ensure that you are logged into Dropbox."
      echo "3c) Ensure that Dropbox is synced"
      echo "3d) Ensure that the folder exists in your Dropbox."
      echo ""
      echo "If you need help, proceed to http://github.com/marktopper/.setup and fill a issue."
      echo ""
      echo "Thanks, Mark Topper"
      echo ""
    fi
  }

  if [[ $AUTO_SYNC == true ]]; then
    syncfiles
  fi
fi
