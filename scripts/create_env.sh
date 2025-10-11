#!/usr/bin/env bash
set -euo pipefail

# Resolve the directory this script lives in (works when sourced or executed)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Project root (assumes script is in scripts/ under repo root)
PROJECT_ROOT="${SCRIPT_DIR}/.."

ENV_FILE="${PROJECT_ROOT}/environment.yml"
PIP_SCRIPT="${SCRIPT_DIR}/install_pip_packages.sh"

if [ ! -f "${ENV_FILE}" ]; then
	echo "EnvironmentFileNotFound: '${ENV_FILE}' file not found" >&2
	exit 1
fi

# Initialize conda for non-interactive shells (works with conda >= 4.4)
if [ -n "${CONDA_EXE:-}" ]; then
	# conda already available in PATH
	:
else
	CONDA_BASE="$(conda info --base 2>/dev/null || true)"
	if [ -n "${CONDA_BASE}" ] && [ -f "${CONDA_BASE}/etc/profile.d/conda.sh" ]; then
		# shellcheck source=/dev/null
		source "${CONDA_BASE}/etc/profile.d/conda.sh"
	else
		echo "Warning: conda not found in PATH and base install wasn't discovered; hoping 'conda' is available." >&2
	fi
fi

# Create the environment (skip if it already exists)
ENV_NAME="$(basename "${ENV_FILE%.*}")"
if conda env list | awk '{print $1}' | grep -xq "${ENV_NAME}"; then
	echo "Conda environment '${ENV_NAME}' already exists. Skipping creation."
else
	conda env create -f "${ENV_FILE}"
fi

# Activate the environment in this script (so following commands run inside it)
# Use conda activate (requires conda.sh to be sourced)
if command -v conda >/dev/null 2>&1; then
	conda activate "${ENV_NAME}"
else
	echo "EnvironmentNameNotFound: Could not find conda environment: ${ENV_NAME}" >&2
	echo "You can list all discoverable environments with 'conda info --envs'." >&2
fi

# Run the pip install helper script from the scripts directory (if present)
if [ -x "${PIP_SCRIPT}" ]; then
	bash "${PIP_SCRIPT}"
elif [ -f "${PIP_SCRIPT}" ]; then
	bash "${PIP_SCRIPT}"
else
	echo "Warning: ${PIP_SCRIPT} not found; skipping pip package installation." >&2
fi

echo "Conda environment setup complete."