#!/bin/sh

function clean () {
	if [ "$DISTRO" == "debian" ]; then
		sudo apt clean
	fi

	if [ "$DISTRO" == "arch" ]; then
		yes | sudo pacman -Sc
	fi
}


function autoremove () {
	if [ "$DISTRO" == "debian" ]; then
		yes | sudo apt autoremove
	fi

	if [ "$DISTRO" == "arch" ]; then
		yes | sudo pacman -Rns $(pacman -Qdtq)
	fi
}

function upgrade () {
	if [ "$DISTRO" == "debian" ]; then
		yes | sudo apt upgrade
	fi

	if [ "$DISTRO" == "arch" ]; then
		yes | sudo pacman -Syu
	fi
}

function update () {
	if [ "$DISTRO" == "debian" ]; then
		sudo apt update
	fi

	if [ "$DISTRO" == "arch" ]; then
		sudo pacman -Syy
	fi
}

function checkPkgMgr () {
	apt
	if [ $? == 0 ]; then
		DISTRO=debian
	fi

	pacman
	if [ $? == 0 ]; then
		DISTRO=arch
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
echo "Syncing repos... (1/4)"
echo ""
update
exit 0
echo ""
#---

#--- Upgrade installs new versions
#--- I use echo "y" | to automatically agree to the promt
echo "Upgrading the system... (2/4)"
echo ""
upgrade
echo ""
#---

#--- Autoremove removes unneeded packages
echo "Removing unneeded deps... (3/4)"
echo ""
autoremove
echo ""
#---

#--- Removes cached packages
echo "Cleaning up the local cache... (4/4)"
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
