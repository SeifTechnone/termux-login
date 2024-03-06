
# تعليقات تحديد البداية والنهاية للنص المراد حذفه
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

# حذف النص الموجود بين التعليقات
sed -i "/$start_comment/,/$end_comment/d" "$PREFIX/etc/bash.bashrc"

# إضافة التعليقات والنص إلى ملف bash.bashrc
{
echo "$start_comment"
echo "$text_to_remove"
echo "$end_comment"
} >> "$PREFIX/etc/bash.bashrc"

# حذف النص الموجود بين التعليقات
sed -i "/$start_comment/,/$end_comment/d" "$PREFIX/etc/bash.bashrc"

# إضافة التعليقات والنص إلى ملف bash.bashrc
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