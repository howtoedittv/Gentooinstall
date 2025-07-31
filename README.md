# Gentooinstall
Script that installs gentoo without the need from user input 

# install procces
the script leaves the network setup and the parttionoing and mounting of your drives to you after you did that do the next commend:

wget https://github.com/howtoedittv/Gentooinstall/releases/download/1.0/gentooinstall.sh

chmod 777 gentooinstall.sh
./install.sh

this takes you all the way to the step after you chroot and then closess it will put a new script base-system-install.sh in /mnt/gentoo

chmod 777 base-system-install.sh 
./base-system-install.sh

this will take you all the way to the end of the install proceses and put a new script called postinstall.sh in the home folder of your user

before running it you will need to give you user sudo premisons to do that do the fallowing:

su root 
EDITOR=nano visudo

uncoment the line that says "wheel all(all:all)"
press ctrl + o enter and ctrl +  x
and then return to your user

and run the following commend:

sudo chmod 777 postinstall.sh
./postinstall.sh

thats it!!
