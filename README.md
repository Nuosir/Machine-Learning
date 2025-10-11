# Labs 2025 — Conda Environment Setup

This repository contains the environment configuration and helper scripts to run the 2025 labs using Conda and Jupyter notebooks.

## Project Structure

```text
labs-2025-conda-setup
├── environment.yml
├── requirements.txt
├── .gitignore
├── scripts
│   ├── create_env.sh
│   └── install_pip_packages.sh
├── notebooks
│   └── Lab1_2025_solution.ipynb
├── src
│   └── main.py
└── README.md
```

## Prerequisites

- Linux operating system
- Miniconda or Anaconda installed
- Git

## Quick Setup

1. Clone the repository:

```bash
git clone <repository-url>
cd labs-2025-conda-setup
```

2. Make scripts executable:

```bash
chmod +x scripts/*.sh
```

3. Create the conda environment:

```bash
bash scripts/create_env.sh
```

The script will create the `labs-2025` environment, activate it, and install pip packages from `requirements.txt`.

### Manual Setup (Alternative)

```bash
conda env create -f environment.yml
conda activate labs-2025
pip install -r requirements.txt
```

## Running Jupyter Notebooks

```bash
conda activate labs-2025
jupyter lab --no-browser --ip=0.0.0.0 --port=8888
```

Open `http://localhost:8888` in your browser using the token from the terminal.

## GPU / CUDA (Optional)

- Ensure NVIDIA drivers are installed
- Verify with `nvidia-smi`
- PyTorch CUDA build specified in `environment.yml`

## Troubleshooting

**Conda not found:**

```bash
source $HOME/miniconda/etc/profile.d/conda.sh
```

**Permission errors:**

```bash
chmod +x scripts/*.sh
```

**Pip install failures:**
Check network access and Python version (3.8 required).

## Contributing

Contributions welcome via issues or pull requests.
