#!/bin/sh

function clean () {
	if [ "$DISTRO" == "debian" ]; then
		sudo apt clean
	fi
}


function autoremove () {
	if [ "$DISTRO" == "debian" ]; then
		yes | sudo apt autoremove
	fi
}

function upgrade () {
	if [ "$DISTRO" == "debian" ]; then
		yes | sudo apt upgrade
	fi
}

function update () {
	if [ "$DISTRO" == "debian" ]; then
		sudo apt update
	fi
}

function checkPkgMgr () {
	apt
	if [ $? == 0 ]; then
		DISTRO=debian
	fi
}


# Pre-running sudo to run as root (to give a nicer ui flow) and init a clear screen
sudo echo ""
checkPkgMgr
clear

#--- Greeting
echo "+------------------------+"
echo "|Lue Distro Updater 1.2.2|"
echo "+------------------------+"
echo "I will take care of your system and automatically agree to promts."
echo ""
sleep 3
clear

#--- Update downloads the list of packages 
echo "Running syncing repos... (1/4)"
echo ""
update
exit 0
echo ""
#---

#--- Upgrade installs new versions
#--- I use echo "y" | to automatically agree to the promt
echo "running apt upgrade... (2/4)"
echo ""
upgrade
echo ""
#---

#--- Autoremove removes unneeded packages
echo "running apt autoremove... (3/4)"
echo ""
autoremove
echo ""
#---

#--- Removes cached packages
echo "cleaning up... (4/4)"
echo ""
clean
echo ""
sleep 1
clear

#--- Endmessage
echo "+--------------------------+"
echo "|Your system is up-to-date!|"
echo "+--------------------------+"
echo ""
