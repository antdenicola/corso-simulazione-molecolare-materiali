#!/usr/bin/env bash
# Verifica rapida dell'ambiente: da lanciare come prima cosa.
echo "== GROMACS =="; gmx --version | head -n 5
echo; echo "== gfortran =="; gfortran --version | head -n 1
echo; echo "== Python e librerie =="
python - <<'PY'
import importlib
for m in ["numpy","scipy","matplotlib","pandas","MDAnalysis","mdtraj","nglview","py3Dmol","Bio","parmed"]:
    try:
        mod = importlib.import_module(m)
        print(f"OK   {m:12s} {getattr(mod,'__version__','')}")
    except Exception as e:
        print(f"FAIL {m:12s} {e}")
PY
echo; echo "== Core disponibili =="; nproc
