# Corso di Simulazione Molecolare

Ambiente riproducibile (GROMACS, gfortran, Python/Jupyter, MDAnalysis, py3Dmol, NGLview)
eseguibile nel browser tramite GitHub Codespaces. Nessuna installazione locale.

## Come iniziare (studenti)
1. Accedi a GitHub, apri questo repository e scegli **Use this template -> Create a new repository** (cosi hai una copia tua dove salvare il lavoro).
2. Nella tua copia: **Code -> Codespaces -> Create codespace on main**.
3. Al primo avvio attendi qualche minuto (se e stato configurato il prebuild, e quasi immediato).
4. Nel terminale: `./scripts/check_env.sh`
5. **A fine sessione fermare il Codespace** (menu Codespaces -> Stop) e fare `git commit` + `git push` del lavoro.

## Struttura
- `lezioni/` laboratori 1-8 (Lab 1 = setup + primo programma Fortran)
- `lezioni_accessorie/` approfondimenti A1-A4
- `mdp/` file di parametri GROMACS pronti (AMBER99SB-ILDN + TIP3P, 300 K)
- `scripts/` utility (verifica ambiente, download PDB)
- `data/` strutture di partenza

## Note
- Le traiettorie e i file binari di GROMACS sono ignorati da git (vedi `.gitignore`).
- La visualizzazione avviene nel notebook (py3Dmol / NGLview), non con VMD.
