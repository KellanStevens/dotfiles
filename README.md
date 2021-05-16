# Kellan's-Scripts
## Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```


2. Clone repo into new hidden directory.

```zsh
# Use SSH (if set up)...
git clone git@github.com:Kellan2002/Kellans-Scripts.git ~/.kellans_scripts

# ...or use HTTPS and switch remotes later.
git clone https://github.com/Kellan2002/Kellans-Scripts.git ~/.kellans_scripts
```


3. Create symlinks in the Home directory to the real files in the repo.

```zsh
# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.

ln -s ~/.kellans_scripts/.zshrc ~/.zshrc
ln -s ~/.kellans_scripts/.gitconfig ~/.gitconfig
```

4. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.kellans_scripts/Brewfile

# ...or move to the directory first.
cd ~/.kellans_scripts && brew bundle
```

## Steps to bootstrap a new Windows 10 install

> *Make sure you are using PowerShell with Administrator*


1. Install Chocolatey.

````pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
````

2. Run Debloat script.
````pwsh
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/Js8JO'))
````

3. Soon to be a chocolatey package dump list
````pwsh
choco install $List_of_packages
````


## TODO List

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command) to record and restore System Preferences and other macOS configurations.
- Organize these growing steps into multiple script files.
- Automate symlinking and run script files with a bootstrapping tool like [Dotbot](https://github.com/anishathalye/dotbot).
- Revisit the list in [`.zshrc`](.zshrc) to customize the shell.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Finish Windows 10 Debloat script
- Finish chocolatey package list installer script


