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

now, whenever you run **conda_shell**, it brings up the **conda**

To look through a list of what conda has that you can download..

``` conda list ```

To search for Python versions..

``` conda search "^python$" ```

Installing **conda** automatically comes with Jupyter Notebook package

To use Jupyter Notebook, create a directory or go to a directory of your choice and on the terminal run..

``` jupyter notebook ```

And it should create a Jupyter Notebook for you that you should be able to access at

``` http://localhost:8888/tree ```
