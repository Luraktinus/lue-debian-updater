#!/bin/sh

echo "Updating LDU.sh"
cd src
sudo rm /usr/bin/ldu.sh
sudo cp ldu.sh /usr/bin/
sudo desktop-file-install LDU.desktop
cd ..
echo "Done!"
