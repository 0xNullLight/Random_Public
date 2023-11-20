1) https://www.anaconda.com/download
2) https://repo.anaconda.com/archive/

# Install Anaconda

``` bash Anaconda3-2023.09-0-Linux-x86_64.sh ```

**Eval to execute arguments as shell commands**

``` eval "$(/home/[user]/anaconda3/bin/conda shell.bash hook)" ```

Once in the terminal utilizing anaconda, if you want to automatically be able to use to use conda commands inside terminal, run..

``` conda config --set auto_activate_base false ```

otherwise keep it..

``` conda config --set auto_activate_base true ```

HOWEVER, if you want to just add an **alias** so you can have better control on when to use conda, then you can open .bashrc

``` open ~/.bashrc ```

on the very bottom of that file add

``` alias conda_shell='eval "$(/home/[user]/anaconda3/bin/conda shell.bash hook)"' ```

now, whenever you run **conda_shell**, it brings up the conda
