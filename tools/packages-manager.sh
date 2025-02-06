#!/bin/bash

# Load package list from packages.txt
# The script checks if the "packages.txt" file exists in the same directory.
# If it exists, it reads the package names from the file into an array called package_list.
# If the file is not found, the script will display an error message and exit.

if [ -f "packages.txt" ]; then
  mapfile -t package_list < packages.txt  # Read each line from packages.txt into the array
else
  echo "Error: packages.txt not found! Please make sure the file exists in the same directory as this script."
  exit 1  # Exit the script if packages.txt is not found
fi

# Function to handle package operations (install/remove)
# This function performs the chosen operation (install or remove) on the packages.
handle_package_operation() {
  local operation=$1  # The operation passed (install/remove)
  local action=$2  # Action description (install/remove)

  clear  # Clear the screen for better readability
  echo "========================================"
  echo "Welcome to the Package Manager!"
  echo "========================================"
  echo "This tool allows you to $action packages listed in 'packages.txt'."
  echo "Choose from a list of available packages or select all to perform the operation for all packages."
  echo "========================================"

  # Display packages with numbers
  # This loop goes through each package in the list and displays it with a number for easy selection.
  for i in "${!package_list[@]}"; do
    echo "$((i+1)). ${package_list[$i]}"  # Display package number and name
  done
  echo "----------------------------------------"
  echo "Type 'all' to $action all packages or enter the package number/name:"
  read user_input  # Get the user's choice

  # Function to install or remove packages
  # This function performs the actual installation or removal.
  perform_operation() {
    local pkg=$1  # Package name passed to the function
    if [[ "$operation" == "install" ]]; then
      # Check if the package is already installed
      if dpkg -l | grep -q "^ii  $pkg "; then
        echo "$pkg is already installed. Skipping..."  # Skip if the package is already installed
      else
        # Install the package using apt and show a success or error message
        sudo apt install -y "$pkg" && echo "$pkg installed successfully!" || echo "Error installing $pkg"
      fi
    elif [[ "$operation" == "remove" ]]; then
      # Check if the package is installed before removing it
      if dpkg -l | grep -q "^ii  $pkg "; then
        # Remove the package using apt and show a success or error message
        sudo apt remove -y "$pkg" && echo "$pkg removed successfully!" || echo "Error removing $pkg"
      else
        echo "$pkg is not installed. Skipping removal."  # Skip if the package is not installed
      fi
    fi
  }

  # Check if the input is 'all' (the user wants to apply the operation to all packages)
  if [[ "$user_input" == "all" ]]; then
    echo "$action all packages..."
    for pkg in "${package_list[@]}"; do
      perform_operation "$pkg"  # Apply the operation to all packages
    done
  # Check if the input is a number and within the valid range of package list
  elif [[ "$user_input" =~ ^[0-9]+$ ]] && [ "$user_input" -ge 1 ] && [ "$user_input" -le "${#package_list[@]}" ]; then
    selected_package="${package_list[$user_input-1]}"  # Get the package based on the user's input
    perform_operation "$selected_package"  # Apply the operation to the selected package
  # If the input is a valid package name, install/remove it
  elif [[ " ${package_list[@]} " =~ " $user_input " ]]; then
    perform_operation "$user_input"  # Apply the operation to the valid package name
  else
    echo "Invalid input. Please try again."  # If the input is invalid, prompt the user to try again
  fi
}

# Function to check if packages are installed
# This function checks whether each package in the list is installed or not and prints the result.
check_installed_packages() {
  clear  # Clear the screen for better readability
  echo "========================================"
  echo "Checking installed packages:"
  echo "========================================"
  
  for pkg in "${package_list[@]}"; do
    # Check if the package is installed using dpkg command
    if dpkg -l | grep -q "^ii  $pkg "; then
      echo "$pkg is installed."  # If the package is installed, print the message
    else
      echo "$pkg is not installed."  # If the package is not installed, print the message
    fi
  done
}

# Main menu with options to install, remove, or check installed packages
# The script starts by displaying a main menu to the user.
clear  # Clear the screen for better readability
echo "========================================"
echo "Welcome to the Package Manager Script!"
echo "========================================"
echo "This script makes it easy to manage packages on your system."
echo "You can install, remove, or check the installation status of packages listed in 'packages.txt'."
echo ""
echo "Before we get started, ensure that 'packages.txt' is in the same directory as this script."
echo ""
echo "========================================"
echo "What would you like to do?"
echo "========================================"
echo "1. Install packages"
echo "2. Remove packages"
echo "3. Check if packages are installed"
echo "========================================"
echo ""
read -p "Select an option (1, 2, or 3): " action  # Prompt the user to choose an action

# Handle the user's choice using a case statement
case $action in
  1) handle_package_operation "install" "install" ;;  # Call the function to install packages
  2) handle_package_operation "remove" "remove" ;;  # Call the function to remove packages
  3) check_installed_packages ;;  # Call the function to check installed packages
  *) echo "Invalid option. Please select 1, 2, or 3." ;;  # If the user inputs an invalid option, display an error
esac
