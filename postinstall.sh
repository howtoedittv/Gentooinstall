sudo emerge dev-vcs/git xorg-server xinit libXaw libXmu libX11 libXt xauth xdm windowmaker st mate-terminal pulseaudio pavucontrol alsa-utils
sudo rc-update add dbus default 
sudo rc-service dbus start
sudo emerge -C modemmanager xconsole 
echo "pulseaudio --start" | tee -a ~/.xsession
echo "exec wmaker" | tee -a ~/.xsession
chmod 777 ~/.xsession

echo "DISPLAYMANAGER='xdm'" | sudo tee /etc/conf.d/xdm
sudo chmod 777 /etc/conf.d/xdm

sudo rc-update add xdm default

echo ">=dev-libs/libdbusmenu-16.04.0-r3 gtk3" | sudo tee -a /etc/portage/package.use/nemo
echo ">=x11-libs/xapp-2.8.8-r1 introspection" | sudo tee -a /etc/portage/package.use/nemo

sudo emerge -aq nemo

read -p "Do you want to install Thorium Browser? (y/n): " x
if [[ "$x" == "y" ]]; then
    wget https://github.com/howtoedittv/thorium-browser-gentoo/releases/download/1.0/install.sh
    chmod 777 install.sh
    ./install.sh
else
    echo "Got it. You're done!"
    echo "After rebooting into Window Maker, open 'alsamixer', press 'm' to unmute, and adjust volume to enable sound."
fi
