#!/bin/bash

# Function to check if command succeeded
check_error() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Function to display step information
show_step() {
    echo "===================================="
    echo "Step $1: $2"
    echo "===================================="
}

# Step 1: Download Percona repository package
show_step "1" "Downloading Percona repository package"
wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb
check_error "Failed to download Percona repository package"

# Step 2: Install the repository package
show_step "2" "Installing Percona repository package"
sudo dpkg -i percona-release_latest.generic_all.deb
check_error "Failed to install Percona repository package"

# Step 3: Enable PBM release
show_step "3" "Enabling Percona Backup for MongoDB repository"
sudo percona-release enable pbm release
check_error "Failed to enable PBM repository"

# Step 4: Update package list
show_step "4" "Updating package list"
sudo apt update
check_error "Failed to update package list"

# Step 5: Install Percona Backup for MongoDB
show_step "5" "Installing Percona Backup for MongoDB"
sudo apt install -y percona-backup-mongodb
check_error "Failed to install Percona Backup for MongoDB"

# Step 6: Verify installation
show_step "6" "Verifying installation"
pbm version
check_error "Failed to verify PBM installation"

# Cleanup downloaded files
show_step "7" "Cleaning up"
rm -f percona-release_latest.generic_all.deb
check_error "Failed to clean up downloaded files"

echo "===================================="
echo "Installation completed successfully!"
echo "===================================="