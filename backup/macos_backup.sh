#!/bin/bash

# Source: https://github.com/mathiasbynens/dotfiles/pull/58

function process () {
  # Create a backup file if one doesn't exists
  if [[ ! -e '.macos_settings_backup' ]]; then
    echo "Backup Settings" > .macos_settings_backup
  else
    # If a backup already exists, the script exits to prevent
    # the backup being overwrittern with the modified values
    echo "Backup already created. Cancelling operation..."
    exit
  fi

  echo "Creating backup..."

  # extract the settings being modified by .macos
  settings=`egrep "^defaults (-currentHost )?write [[:alnum:][:punct:]]+ [[:alnum:][:punct:]]+ (-array |-bool |-int |-string |-dict-add |-array-add )?.*" ../.macos | sed "s/write/read/" | sed "s/\(defaults\)\(.*\)\(read [a-zA-Z[:punct:] ]*\) -.*/\1\2\3/"`

  # Bash workaround to enable iteration over array values that have whitespace
  oldifs=$IFS
  IFS=$(echo -en "\n\b")

  # Iterate over the settings array - storing the current value in .macos_settings_backup
  for s in ${settings[*]}; do
    t=`eval "$s 2>/dev/null"`

    # replace the action with a placeholder
    # to easily swap it out during settings restore
    c=`echo $s | sed "s/ read / :action: /"`
    if [[ $t ]]; then
      echo $c ":" $t >> .macos_settings_backup
    else
      echo $c ": default" >> .macos_settings_backup
    fi
  done
  IFS=$oldifs

  # Backup Launchpad DB
  for file in ~/Library/Application\ Support/Dock/*.db; do
    cp "$file" "$file.bak";
  done

  echo "Settings backed up to .macos_settings_backup"
}

process

exit
