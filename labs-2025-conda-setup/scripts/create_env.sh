#!/bin/bash

# Create the Conda environment from the environment.yml file
conda env create -f ../environment.yml

# Activate the newly created environment
source activate $(basename ../environment.yml .yml)

# Install additional pip packages
bash install_pip_packages.sh

echo "Conda environment setup complete."