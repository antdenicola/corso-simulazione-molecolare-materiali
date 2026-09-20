#!/usr/bin/env bash
set -euo pipefail

echo ">>> Creazione ambiente conda 'corso' (può richiedere alcuni minuti)"
conda env create -f environment.yml
conda clean -afy

echo ">>> Registrazione kernel Jupyter"
/opt/conda/envs/corso/bin/python -m ipykernel install --user \
    --name corso --display-name "Python (corso)"

echo ">>> Attivazione automatica dell'ambiente nei terminali"
echo 'conda activate corso' >> ~/.bashrc

# Strumenti opzionali per le lezioni accessorie (coarse-grained / Martini).
# Un errore qui non deve bloccare l'ambiente principale.
echo ">>> Strumenti opzionali (vermouth/martinize2, insane)"
/opt/conda/envs/corso/bin/pip install --no-cache-dir vermouth insane \
    || echo "ATTENZIONE: installazione opzionale fallita, si può rifare a mano."

echo ">>> Fatto."
