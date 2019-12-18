ENABLE_SYNCING=true
AUTO_SYNC=true
SYNC_LOG=~/.sync.log

# FORMAT: "USER_PATH;REMOTE_BACKUP_PATH"
#
# WARNING: Currenly folders inside a synced folder, will not be synced.
# This means for example that if your setup user path is "$HOME/foo", which includes the following:
# * foo.png
# * foobar.png
# * bar/    - folder
#   * bar.png
# Then the synced files are only foo.png and foobar.png.
# We are open for pull requests.
SYNC_PATHS=(\
 # TablePlus Connections Syncing
 #"$HOME/Library/Application Support/com.tinyapp.TablePlus/Data/;$HOME/Dropbox/.sync/table-plus-data" \
)