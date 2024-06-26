# installs nvm (Node Version Manager)
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash`

# download and install Node.js
`nvm install 20`

# verifies the right Node.js version is in the environment
`node -v # should print v20.13.1`

# verifies the right NPM version is in the environment
`npm -v # should print 10.5.2`

**Source:**
- https://nodejs.org/en/download/package-manager
- https://codedamn.com/news/nodejs/nvm-installation-setup-guide
- https://stackoverflow.com/questions/16904658/node-version-manager-install-nvm-command-not-found
- https://stackoverflow.com/questions/42606837/how-do-i-use-bash-on-windows-from-the-visual-studio-code-integrated-terminal
- https://youtu.be/ssKcSMb9EuA

# Note:
`open ~/.bashrc`

you should see..
something similar to

`export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion`
