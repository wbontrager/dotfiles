The scripts in this directory backup current settings based on the settings being modified in the dotfile `.macos` in the root directory of this repository (i.e. `../.macos`). This means if you backup and then edit the .macos file, the backup file will not include the edits if you added a new default to be changed. The advantage of this is you can test various changes and revert to the last known state. The disadvantage is restoring the settings back multiple levels.

To restore it looks for a backup file in the current directory and restores the settings from there.

Future Improvements:
- Add the backup files to the `.gitignore`.
- Add a timestamp to the backup file name.
- Restore from a backup file with a timestamp.
- Restore multiple backup levels.
