# Clean APT cache
du -sh /var/cache/apt/archives
sudo apt-get clean

# Remove old kernels (CAUTION)
sudo apt-get autoremove --purge
