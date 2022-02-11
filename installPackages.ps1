vcpkg --overlay-triplets=. --triplet=rpi-triplet install
# Move-Item -Path "./vcpkg_installed/" -Destination "./build/vcpkg_installed" -Force
# Remove-Item -Path "./vcpkg_installed/" -Force
