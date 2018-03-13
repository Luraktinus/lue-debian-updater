#!/bin/sh
clean () {
	# Messages
	echo "Cleaning up the local cache... (4/4)"
	echo ""
	# ---
	if test "$DISTRO" = "Debian"
	then
		sudo apt clean
	fi

	if test "$DISTRO" = "Arch"
	then
		yes | sudo pacman -Sc
	fi
	echo ""
}


autoremove () {
	# Messages
	echo "Removing unneeded deps... (3/4)"
	echo ""
	# ---
	if test "$DISTRO" = "Debian"
	then
		yes | sudo apt autoremove
	fi

	if test "$DISTRO" = "Arch" 
	then
		yes | sudo pacman -Rns $(pacman -Qdtq)
	fi
	echo ""
}

upgrade () {
	# Messages
	echo "Upgrading the system... (2/4)"
	echo ""
	# ---
	if test "$DISTRO" = "Debian" 
	then
		echo "upgrade debian"
		yes | sudo apt upgrade
	fi

	if test "$DISTRO" = "Arch" 
	then
		yes | sudo pacman -Syu
	fi
	echo ""
}

update () {
	# Messages
	echo "Syncing repos... (1/4)"
	echo ""
	# ---
	
	if test "$DISTRO" = "Debian" 
	then
		sudo apt update
	fi

	if test "$DISTRO" = "Arch" 
	then
		sudo pacman -Syy
	fi
	echo ""
}

checkPkgMgr () {
	# Messages
	echo "Checking what distribution you use..."
	echo ""
	# ---
	
	echo "Detected Package manager:"
	if command -v apt
	then
		DISTRO=Debian
	fi

	if command -v pacman
	then
		DISTRO=Arch
	fi
	echo ""
	echo "You use $DISTRO"
	echo ""
}


# Pre-running sudo to run as root (to give a nicer ui flow) and init a clear screen
sudo echo ""
clear

#--- Greeting and initializing
echo "+------------------------+"
echo "|Lue Distro Updater 1.2.2|"
echo "+------------------------+"
echo "I will take care of your system and automatically agree to promts."
echo ""
checkPkgMgr
sleep 3
clear

#--- Update downloads the list of packages 
update

#--- Upgrade installs new versions
#--- I use echo "y" | to automatically agree to the promt
upgrade

#--- Autoremove removes unneeded packages
autoremove

#--- Removes cached packages
clean

#--- Endmessage
sleep 1
clear

echo "+--------------------------+"
echo "|Your system is up-to-date!|"
echo "+--------------------------+"
echo ""
