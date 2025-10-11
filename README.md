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
# Labs 2025 — Conda setup and usage

This repository contains the environment configuration and helper scripts to run the 2025 labs using a Conda environment and Jupyter notebooks.

This README covers: prerequisites, quick setup (Linux/WSL recommended), creating the conda environment, installing pip requirements, running notebooks, and troubleshooting.

## Project structure

```
labs-2025-conda-setup
├── environment.yml          # Conda environment configuration
├── requirements.txt         # Additional Python packages for pip installation
├── .gitignore               # Files and directories to ignore in Git
├── scripts                  # Scripts for environment setup
│   ├── create_env.sh        # Script to create the Conda environment
│   └── install_pip_packages.sh # Script to install pip packages
├── notebooks                # Jupyter notebooks for the labs
│   └── Lab1_2025_solution.ipynb # Lab 1 notebook
├── src                      # Source code for the labs
│   └── main.py              # Main entry point for the application
# Labs 2025 — Conda setup and usage

This project provides the environment configuration and helper scripts to run the 2025 labs using a Conda environment and Jupyter notebooks. This README covers: prerequisites, quick setup (recommended: WSL2 / Linux), creating the conda environment, installing pip requirements, running notebooks, and troubleshooting.

## Project structure

```bash
labs-2025-conda-setup
├── environment.yml          # Conda environment configuration
├── requirements.txt         # Additional Python packages for pip installation
├── .gitignore               # Files and directories to ignore in Git
├── scripts                  # Scripts for environment setup
│   ├── create_env.sh        # Script to create the Conda environment
│   └── install_pip_packages.sh # Script to install pip packages
├── notebooks                # Jupyter notebooks for the labs
│   └── Lab1_2025_solution.ipynb # Lab 1 notebook
├── src                      # Source code for the labs
│   └── main.py              # Main entry point for the application
└── README.md                # Project documentation
```

## Prerequisites

- Linux or WSL2 (recommended). On Windows we recommend using WSL2 + Ubuntu 24.04 LTS.
- Miniconda or Anaconda installed inside the environment you'll use to run the scripts.
- Git (to clone the repository).

## Quick setup (recommended: WSL2 / Linux)

1. Clone the repository and change into the project root:

```bash
git clone <repository-url>
cd labs-2025-conda-setup
```

1. Make the scripts executable (if needed):

```bash
chmod +x scripts/*.sh
```

1. Create the conda environment and install pip requirements using the helper script:

```bash
bash scripts/create_env.sh
```

The script will:

- locate `environment.yml` in the project root
- create the `labs-2025` conda environment if missing
- activate the environment and run `scripts/install_pip_packages.sh` to install pip packages from `requirements.txt`

If you prefer to run the commands manually:

```bash
conda env create -f environment.yml
conda activate labs-2025
pip install -r requirements.txt
```

## Running notebooks

Activate the environment and start Jupyter Lab / Notebook:

```bash
conda activate labs-2025
jupyter lab --no-browser --ip=0.0.0.0 --port=8888
```

Open your browser at `http://localhost:8888` and use the token printed in the terminal.

## Windows note — use WSL2

For Windows users we strongly recommend using WSL2 (Ubuntu 24.04) and following the Linux steps inside WSL. This avoids many cross-platform issues with conda activation and path handling.

## GPU / CUDA (optional)

If you need GPU acceleration (PyTorch with CUDA):

- On WSL2, install the NVIDIA WSL driver on Windows host and verify `nvidia-smi` inside WSL.
- Use the PyTorch packages built for CUDA (install via conda/pip as appropriate).

## Troubleshooting

- If `conda` is not found, ensure Miniconda is installed inside the environment you are using and restart the shell (or run `source $HOME/miniconda/etc/profile.d/conda.sh`).
- If scripts fail due to permissions, run `chmod +x scripts/*.sh`.
- If pip installs fail, ensure you have network access and correct Python version (3.8 in `environment.yml`).

## Contributing

Contributions welcome — open an issue or submit a PR. For significant changes, please add tests or a short explanation in your PR description.

## Files of interest

- `environment.yml` — conda environment spec
- `requirements.txt` — pip-only packages
- `scripts/create_env.sh` — creates and activates conda env and runs pip installs
- `scripts/install_pip_packages.sh` — installs pip requirements
- `notebooks/` — lab notebooks
- `src/` — code used by the labs

---

If you'd like, I can add a `scripts/create_env.ps1` (PowerShell) for native Windows users or create a short `docs/WSL_SETUP.md` with step-by-step WSL instructions.
