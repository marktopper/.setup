# Usage: sshmod
# Will cmod rsa_id to 600.

if [[ $ENABLE_SSH_MODDING == true && $INSTALL_COMPLETE != true ]]; then
  function sshmod () {
    if [[ -d $SSH_PATH ]];then
      for FILE in `ls $SSH_PATH/`; do
        chmod 600 $SSH_PATH/$FILE;
      done
    fi
  }

  if [[ $AUTO_MOD_SSH == true ]]; then
    sshmod
  fi
fi
