#!/bin/sh
set -euo pipefail

# Moves an entity into another location and symlinks it back
function move_link_dir() {
    DIRECTORY=$1

    # Copy non-existing folder contents
    mkdir -p "$HOME/userdata/$DIRECTORY"
    if ! readlink "$HOME/app/$DIRECTORY" 2>&1 >/dev/null && test -d "$HOME/app/$DIRECTORY"; then
        cp -rn "$HOME/app/$DIRECTORY/." "$HOME/userdata/$DIRECTORY/"
        rm -rf "$HOME/app/$DIRECTORY"
    fi

    # Link folder back
    ln -sf "$HOME/userdata/$DIRECTORY" "$HOME/app/$DIRECTORY"
}

# Moves an entity into another location and symlinks it back
function move_link_file() {
    FILE=$1

    # Copy non-existing file
    if ! readlink "$HOME/app/$FILE" 2>&1 >/dev/null && test -f "$HOME/app/$FILE"; then
        cp -n "$HOME/app/$FILE" "$HOME/userdata/$FILE"
        rm -f "$HOME/app/$FILE"
    fi

    # Link file back
    ln -sf "$HOME/userdata/$FILE" "$HOME/app/$FILE"
}

# All potentially persistent files/dirs
move_link_dir "public/assets"
move_link_dir "public/backgrounds"
move_link_dir "public/characters"
move_link_dir "public/chats"
move_link_dir "public/context"
move_link_dir "public/groups"
move_link_dir "public/group chats"
move_link_dir "public/instruct"
move_link_dir "public/movingUI"
move_link_dir "public/KoboldAI Settings"
move_link_dir "public/NovelAI Settings"
move_link_dir "public/OpenAI Settings"
move_link_dir "public/TextGen Settings"
move_link_dir "public/QuickReplies"
move_link_dir "public/themes"
move_link_dir "public/User Avatars"
move_link_dir "public/worlds"
move_link_dir "public/user"
move_link_file "public/settings.json"
move_link_file "secrets.json"

# Start sillytavern
cd /home/sillytavern/app
node /home/sillytavern/app/server.js
