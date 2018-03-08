#!/bin/sh

# Pre-running sudo to run as root (to give a nicer ui flow) and init a clear screen
sudo echo ""
clear

#--- Greeting
echo "+------------------------+"
echo "|Lue Debian Updater 1.2.1|"
echo "+------------------------+"
echo "I will take care of your system and automatically agree to promts."
echo ""
sleep 3
clear


#--- Update downloads the list of packages 
echo "running apt update... (1/4)"
echo ""
sudo apt update
echo ""
#---

#--- Upgrade installs new versions
#--- I use echo "y" | to automatically agree to the promt
echo "running apt upgrade... (2/4)"
echo ""
echo "y" | sudo apt upgrade 
echo ""
#---

#--- Autoremove removes unneeded packages
echo "running apt autoremove... (3/4)"
echo ""
echo "y" | sudo apt autoremove
echo ""
#---

#--- Removes cached packages
echo "cleaning up... (4/4)"
echo ""
sudo apt clean
echo ""
sleep 1
clear

#--- Endmessage
echo "+--------------------------+"
echo "|Your system is up-to-date!|"
echo "+--------------------------+"
echo ""
