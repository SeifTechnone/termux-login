curl -o $HOME/.termux/termux-login.py https://raw.githubusercontent.com/SeifTechnone/termux-login/main/termux-login.py

curl -o $PREFIX/bin/termux-user-lock https://raw.githubusercontent.com/SeifTechnone/termux-login/main/termux-user-lock

curl -o $PREFIX/bin/termux-user-unlock https://raw.githubusercontent.com/SeifTechnone/termux-login/main/termux-user-unlock


chmod +x $HOME/.termux/termux-login.py
chmod +x $PREFIX/bin/termux-user-lock
chmod +x $PREFIX/bin/termux-user-unlock