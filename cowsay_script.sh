#!/bin/bash

# Exit immediately if a command fails
set -e

echo "========== ASCII SCRIPT START =========="

# Check if cowsay is already installed
if ! command -v cowsay &> /dev/null
then
    echo "Installing cowsay..."
    sudo apt-get update -y
    sudo apt-get install cowsay -y
else
    echo "cowsay is already installed."
fi

# Generate dragon file
echo "Generating dragon ASCII art..."
cowsay -f dragon "Run for cover, I am a Dragon... RAWR!" > dragon.txt

# Verify file exists
if [ ! -f dragon.txt ]; then
    echo "Error: dragon.txt was not created!"
    exit 1
fi

# Validate content
echo "Validating content..."
if grep -iq "dragon" dragon.txt; then
    echo "Validation successful ✅"
else
    echo "Validation failed ❌"
    exit 1
fi

# Display file
echo "Displaying dragon.txt content:"
cat dragon.txt

echo "========== ASCII SCRIPT COMPLETED SUCCESSFULLY =========="
