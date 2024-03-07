#!/bin/bash

# delete the unnecessary motd files
motd_file="/data/data/com.termux/files/usr/etc/*motd*"

if [ -e "$motd_file" ]; then
    rm -rf "$motd_file"
fi

# Comments indicating the start and end of the text to be deleted
start_comment="# start of text to remove"
end_comment="# end of text to remove"

# النص المراد بحثه وحذفه بين التعليقين
text_to_remove='file="$HOME/.termux/user-lock"
keywords=("start-login" "start-exit")
commands=("python $HOME/.termux/termux-login.py 2>/dev/null" "exit 0")
if [ -f "$file" ] && [ -r "$file" ]; then
    for ((i=0; i<${#keywords[@]}; i++)); do
        keyword="${keywords[$i]}"
        command="${commands[$i]}"
        if grep -q "$keyword" "$file" > /dev/null 2>&1; then
            eval "$command"
        fi
    done
fi'

# Delete the text located between the comments
sed -i "/$start_comment/,/$end_comment/d" "$PREFIX/etc/bash.bashrc"

# Add the comments and text to the bash.bashrc file
{
echo "$start_comment"
echo "$text_to_remove"
echo "$end_comment"
} >> "$PREFIX/etc/bash.bashrc"

# Delete the text located between the comments
sed -i "/$start_comment/,/$end_comment/d" "$PREFIX/etc/bash.bashrc"

# Add the comments and text to the bash.bashrc file
{
echo "$start_comment"
echo "$text_to_remove"
echo "$end_comment"
} >> "$PREFIX/etc/bash.bashrc"

curl -o $HOME/.termux/termux-login.py https://raw.githubusercontent.com/SeifTechnone/termux-login/main/termux-login.py

curl -o $PREFIX/bin/termux-user-lock https://raw.githubusercontent.com/SeifTechnone/termux-login/main/bin/termux-user-lock

curl -o $PREFIX/bin/termux-user-unlock https://raw.githubusercontent.com/SeifTechnone/termux-login/main/bin/termux-user-unlock


chmod +x $HOME/.termux/termux-login.py
chmod +x $PREFIX/bin/termux-user-lock
chmod +x $PREFIX/bin/termux-user-unlock