### Install
Install xclip and xsel in Linux -

Both xclip and xsel packages available in the default repositories of most Linux distributions. Please note that you don't have to install both utilities. Just install any one of the above utilities.

To install them on Arch Linux and its derivatives, run:
```bash
sudo pacman -S xclip xsel
```

### On Fedora:
```bash
sudo dnf install xclip xsel
```

### On Debian, Ubuntu, Linux Mint:
```bash
sudo apt install xclip xsel
```

### Create Alias
```bash
nano ~/.bashrc
```

If you want to use xclip, paste the following lines:

```bash
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
```

If you want to use xsel, paste the following lines in your ~/.bashrc file.

```bash
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
```

### Try out
```bash
pbcopy < /proc/cpuinfo 
pbpaste > tst.txt
cat tst.txt 
```
What you're expecting to see if you use "xsel" is for the file "cpuinfo" in the "/proc/" directory to be copied to the clipboard and paste into a file "tst.txt"

```bash
cat tst.txt
```

Should be the same as
```bash
cat /proc/cpuinfo
```

Tweeked from
1) https://ostechnix.com/how-to-use-pbcopy-and-pbpaste-commands-on-linux/
2) https://gist.github.com/diegopacheco/75de31680b3eaeb8824e994b81889f82
