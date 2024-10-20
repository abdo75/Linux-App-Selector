#!/bin/bash

sudo dnf up -y

# Install necessary packages
sudo dnf install newt -y

# Install basic packages
sudo dnf install curl wget jq -y

# Define applications and their corresponding installation scripts
declare -A apps
apps["Docker"]="sudo dnf -y install dnf-plugins-core && \
                sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo && \
                sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
                sudo systemctl start docker && \
                sudo systemctl enable docker"

# Fixed width and height for the dialog
dialog_width=32
dialog_height=20

# Create the checklist using whiptail with fixed width and height
app_choices=$(whiptail --title "App Selection" --checklist \
"Choose applications to install (use space to toggle)" \
$dialog_height $dialog_width 10 \
"Docker" "Install Docker" OFF \
3>&1 1>&2 2>&3)

# Check if user canceled or didn't select anything
if [ $? -ne 0 ] || [ -z "$app_choices" ]; then
    echo "No applications selected. Exiting."
    exit 1
fi

# Parse the selected apps and install them
for app_name in $app_choices; do
    app_name=$(echo $app_name | tr -d '"')  # Remove quotes around app name
    echo "Installing $app_name..."
    eval "${apps[$app_name]}"
    echo "$app_name installation completed."
done

echo "All selected applications have been installed."
