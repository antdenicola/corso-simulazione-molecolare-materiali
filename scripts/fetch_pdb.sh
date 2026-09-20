#!/usr/bin/env bash
# Uso: ./scripts/fetch_pdb.sh 1UBQ   -> scarica data/1UBQ.pdb
set -euo pipefail
ID="${1:?Uso: $0 <PDB_ID>}"
mkdir -p data
curl -fsSL "https://files.rcsb.org/download/${ID^^}.pdb" -o "data/${ID^^}.pdb"
echo "Scaricato data/${ID^^}.pdb"
