# Lab 1 - Workstation Set-up and First Fortran Program

Course: *Simulazione Molecolare di Materiali* (A.A. 2026/27)

## Learning goals
- Get a working Linux environment (GitHub Codespaces, or a local WSL/macOS install)
- Use the essential Linux commands and a terminal text editor
- Write, compile and run a first Fortran program

---

## Part A - Working environment

### Option 1 (recommended): GitHub Codespaces - nothing to install
1. Open the course template repository and click **Use this template -> Create a new repository**.
2. In your copy: **Code -> Codespaces -> Create codespace on main**.
3. In the terminal, check that everything works:
   ```bash
   ./scripts/check_env.sh
   ```
   You should see versions for GROMACS and gfortran and `OK` for the Python libraries.
4. When you finish: **stop the Codespace** and `git commit` / `git push` your work.

Notes for Codespaces:
- Graphical programs (xmgrace, VMD) do not run here. We plot with gnuplot/matplotlib and
  visualize molecules in notebooks (py3Dmol / NGLview) from Lab 3 on.
- If `vim` is missing: `sudo apt install -y vim`. `nano` and the VS Code editor also work.

### Option 2: local installation (needed only if you want VMD and xmgrace on your PC)

**Windows - WSL (Windows 10 v2004+ or Windows 11)**
1. Right-click the Start button -> *Terminal (Admin)*, then run `wsl --install` and reboot if asked.
2. Open *Ubuntu* from the Start menu and create a UNIX username and password
   (independent from your Windows account - do not forget them!).
3. Update the system and install the tools:
   ```bash
   sudo apt update
   sudo apt upgrade -y
   sudo apt install -y gfortran gromacs grace
   ```
4. Check: `gfortran --version` and `gmx --version`.
5. VMD is not in the Ubuntu repositories. After a free registration at
   <https://www.ks.uiuc.edu/Research/vmd/> download the Linux archive and run:
   ```bash
   tar xzf vmd-*.tar.gz
   cd vmd-*
   ./configure
   cd src
   sudo make install
   ```
   Launch with `vmd`. Graphical windows work through WSLg (built in on recent Windows builds).

**macOS - Homebrew**
1. Install Homebrew from <https://brew.sh> and follow the on-screen instructions to update your PATH.
2. Install the tools:
   ```bash
   brew install gcc gromacs
   ls $(brew --prefix)/bin/gfortran-*          # find the exact gfortran version
   ln -s $(brew --prefix)/bin/gfortran-15 $(brew --prefix)/bin/gfortran   # use your version number
   ```
3. xmgrace needs XQuartz (<https://www.xquartz.org>; log out and back in afterwards), then `brew install grace`.
4. VMD: download the macOS build (Apple Silicon or Intel) from the UIUC site, copy `VMD.app`
   into Applications, or launch it with `open -a VMD`.

---

## Part B - Essential Linux commands

| Command | Meaning |
|---|---|
| `ls` | list files in the current directory |
| `pwd` | print working directory |
| `cd` | change directory |
| `mkdir` | create a directory |
| `cp src dest` | copy a file |
| `mv src dest` | move/rename a file. **Warning:** silently overwrites a file with the same name at the destination |
| `rm file` | delete a file. **Irreversible** |

**Vim survival kit:** `i` insert text - `Esc` leave insert mode - `dd` delete line -
`:wq!` save and quit - `:q!` quit without saving.

**Exercise 1 (warm-up).** Create a directory `lab1` inside the lab folder, enter it, copy
`fortran/sum.f` into it, rename the copy, and remove it. Use `pwd` and `ls` after every step.

---

## Part C - Your first Fortran program

Three phases: **writing** (source code), **compilation** (source -> binary with the compiler),
**execution** (run the binary).

> **Note:** in fixed-form Fortran (files ending in `.f`) statements must start at
> **column 7** (a legacy of punched cards). Do not remove the leading spaces!

Input/output units: **5** = keyboard (input), **6** = screen (output).

The program `fortran/sum.f`:

```fortran
      Program Sum
      write(6,*) 'enter the first number'
      read(5,*) a
      write(6,*) 'enter the second number'
      read(5,*) b
      s = a + b
      write(6,*) 'the sum is'
      write(6,*) s
      stop
      end
```

Edit, compile and run:
```bash
cd lezioni/01_lab1_setup_e_primo_fortran/fortran
vim sum.f                 # or: nano sum.f / open it in the VS Code editor
gfortran -o sum sum.f     # compile
./sum                     # run: type a number, Enter, another number, Enter
```

Useful compile flags while learning: `gfortran -Wall -o sum sum.f` (show warnings).

### Exercise 2 - more operations
Open `fortran/ops.f` and complete it so that it prints, for two input numbers a and b:

| Operation | Fortran |
|---|---|
| product | `a * b` |
| division | `a / b` |
| square root | `sqrt(a)` |
| a squared | `a**2` (also `a**2.0`) |
| sine, cosine (radians) | `sin(a)`, `cos(a)` |
| **natural logarithm** | **`log(a)`** (base 10: `log10(a)`) |

What happens if you type `0` for b in the division? And a negative number in `sqrt` or `log`?
(Optional: protect these operations with `if ... then ... endif`.)

### Exercise 3 - integer vs real
Open `fortran/intdiv.f`. **Predict the output first**, then compile and run. Explain the result.

### Exercise 4 - break it on purpose
Delete the leading spaces of one line in `sum.f`, compile, and read the error message.
Then type a word instead of a number when the program asks for input. What happens?

---

## Deliverable
Commit and push `fortran/ops.f` (completed) and a short `notes.md` with your answers to
Exercises 3 and 4.
