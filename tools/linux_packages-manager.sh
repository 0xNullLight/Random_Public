#!/bin/bash

# Load package list from packages.txt
if [ -f "packages.txt" ]; then
  mapfile -t package_list < packages.txt
else
  echo "Error: packages.txt not found! Please make sure the file exists in the same directory as this script."
  exit 1
fi

# Function to handle package operations (install/remove)
handle_package_operation() {
  local operation=$1
  local action=$2

  clear
  echo "========================================"
  echo "Welcome to the Package Manager!"
  echo "========================================"
  echo "This tool allows you to $action packages listed in 'packages.txt'."
  echo "Choose from a list of available packages or select all to perform the operation for all packages."
  echo "========================================"

  for i in "${!package_list[@]}"; do
    echo "$((i+1)). ${package_list[$i]}"
  done
  echo "----------------------------------------"
  echo "Type 'all' to $action all packages or enter the package number/name:"
  read user_input

  perform_operation() {
    local pkg=$1
    if [[ "$operation" == "install" ]]; then
      if dpkg -l | grep -q "^ii  $pkg "; then
        echo "$pkg is already installed. Skipping..."
      else
        sudo apt install -y "$pkg" && echo "$pkg installed successfully!" || echo "Error installing $pkg"
      fi
    elif [[ "$operation" == "remove" ]]; then
      if dpkg -l | grep -q "^ii  $pkg "; then
        sudo apt remove -y "$pkg" && echo "$pkg removed successfully!" || echo "Error removing $pkg"
      else
        echo "$pkg is not installed. Skipping removal."
      fi
    fi
  }

  if [[ "$user_input" == "all" ]]; then
    echo "$action all packages..."
    for pkg in "${package_list[@]}"; do
      perform_operation "$pkg"
    done
  elif [[ "$user_input" =~ ^[0-9]+$ ]] && [ "$user_input" -ge 1 ] && [ "$user_input" -le "${#package_list[@]}" ]; then
    selected_package="${package_list[$user_input-1]}"
    perform_operation "$selected_package"
  elif [[ " ${package_list[@]} " =~ " $user_input " ]]; then
    perform_operation "$user_input"
  else
    echo "Invalid input. Please try again."
  fi
}

# Function to check installed packages
check_installed_packages() {
  clear
  echo "========================================"
  echo "Checking installed packages:"
  echo "========================================"

  for pkg in "${package_list[@]}"; do
    if dpkg -l | grep -q "^ii  $pkg "; then
      echo "$pkg is installed."
    else
      echo "$pkg is not installed."
    fi
  done
}

# Function to list all installed packages and save to a file
list_and_save_installed_packages() {
  clear
  echo "========================================"
  echo "Listing all installed packages:"
  echo "========================================"

  # Get list of all installed packages
  installed_packages=$(dpkg -l | grep '^ii' | awk '{print $2}')

  echo "$installed_packages"
  
  # Ask the user if they want to save the list to a file
  read -p "Do you want to save this list to 'installed_packages.txt'? (y/n): " save_choice
  if [[ "$save_choice" == "y" || "$save_choice" == "Y" ]]; then
    echo "$installed_packages" > installed_packages.txt
    echo "List of installed packages saved to 'installed_packages.txt'."
  else
    echo "The list will not be saved."
  fi
}

# Function to check if the packages in packages.txt are installed
check_packages_in_installed_list() {
  clear
  echo "========================================"
  echo "Checking if packages in 'packages.txt' are installed:"
  echo "========================================"

  # Load installed packages from installed_packages.txt (if it exists)
  if [ -f "installed_packages.txt" ]; then
    mapfile -t installed_list < installed_packages.txt
  else
    installed_list=($(dpkg -l | grep '^ii' | awk '{print $2}'))
  fi

  # Compare each package in packages.txt with the installed packages
  for pkg in "${package_list[@]}"; do
    if [[ " ${installed_list[@]} " =~ " $pkg " ]]; then
      echo "$pkg is installed."
    else
      echo "$pkg is NOT installed."
    fi
  done
}

# Main menu with options to install, remove, check installed packages, list installed packages, or check packages in installed list
clear
echo "========================================"
echo "Welcome to the Package Manager Script!"
echo "========================================"
echo "This script makes it easy to manage packages on your system."
echo "You can install, remove, or check the installation status of packages listed in 'packages.txt'."
echo ""
echo "Before we get started, ensure that 'packages.txt' is in the same directory as this script."
echo ""
echo "========================================"
echo "What would you like to do? ('packages.txt')"
echo "========================================"
echo "1. Install packages"
echo "2. Remove packages"
echo "3. Check if packages are installed"
echo ""
echo "========================================"
echo "Advance Usages"
echo "========================================"
echo "4. List all installed packages on computer and save to a file 'installed_packages.txt'"
echo "5. Check if packages in 'packages.txt' matches 'installed_packages.txt'"
echo "========================================"
echo ""
read -p "Select an option (1, 2, 3, 4, or 5): " action

# Handle the user's choice using a case statement
case $action in
  1) handle_package_operation "install" "install" ;;  # Call the function to install packages
  2) handle_package_operation "remove" "remove" ;;  # Call the function to remove packages
  3) check_installed_packages ;;  # Call the function to check installed packages
  4) list_and_save_installed_packages ;;  # Call the function to list and save installed packages
  5) check_packages_in_installed_list ;;  # Call the function to check if packages in packages.txt are installed
  *) echo "Invalid option. Please select 1, 2, 3, 4, or 5." ;;  # If the user inputs an invalid option, display an error
esac
