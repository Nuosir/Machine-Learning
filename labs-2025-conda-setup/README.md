# Labs 2025 Conda Setup

This project provides a setup for running the labs for the 2025 course using a Conda environment. It includes all necessary configurations and scripts to facilitate the installation of required libraries and dependencies.

## Project Structure

```
labs-2025-conda-setup
├── environment.yml          # Conda environment configuration
├── requirements.txt         # Additional Python packages for pip installation
├── .gitignore               # Files and directories to ignore in Git
├── scripts                  # Scripts for environment setup
│   ├── create_env.sh       # Script to create the Conda environment
│   └── install_pip_packages.sh # Script to install pip packages
├── notebooks                # Jupyter notebooks for the labs
│   └── Lab1_2025_solution.ipynb # Lab 1 notebook
├── src                      # Source code for the labs
│   └── main.py             # Main entry point for the application
└── README.md                # Project documentation
```

## Setup Instructions

1. **Clone the Repository**
   Clone this repository to your local machine using:
   ```
   git clone <repository-url>
   ```

2. **Create the Conda Environment**
   Navigate to the project directory and run the following command to create the Conda environment:
   ```
   bash scripts/create_env.sh
   ```

3. **Install Additional Python Packages**
   After creating the environment, activate it and install the additional packages listed in `requirements.txt`:
   ```
   bash scripts/install_pip_packages.sh
   ```

4. **Launch Jupyter Notebook**
   You can now launch Jupyter Notebook to work with the provided notebooks:
   ```
   jupyter notebook notebooks/Lab1_2025_solution.ipynb
   ```

## Usage

- Use the provided Jupyter notebooks to explore and complete the labs.
- Modify the `src/main.py` file to implement any additional logic or functionality required for the labs.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.