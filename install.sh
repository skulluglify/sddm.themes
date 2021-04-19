#! /usr/bin/env bash

TEMP="/tmp/sddm_themes_installer.sh"
INSTALLDIR="/usr/share/sddm/themes/"
WASINSTALL="/usr/share/sddm/themes/netlogin-userlists"
THEME="themes/netlogin-userlists"

cat << "EOF" >$TEMP
if [ -d $WASINSTALL ]; then
    option=
    read -r -p "want replace? (Y/n) " option </dev/tty
    case "$option" in
        Y|y)
            cp -r $THEME $INSTALLDIR
            ;;
        N|n)
            echo "see ya next time!" && exit 1
            ;;
        *)
            echo "nope!" && exit 1
            ;;
    esac
else
    if [ -d $INSTALLDIR -a -d $THEME ]; then
        cp -r $THEME $INSTALLDIR
    fi
fi
echo "install success!" && exit 1
EOF

pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY bash $TEMP