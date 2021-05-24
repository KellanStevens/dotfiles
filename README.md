<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][twitter-shield]][twitter-url]
<!-- [![MIT License][license-shield]][license-url] -->

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Kellan2002/Kellans-Scripts">
    <img src="Images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Kellan's Scripts</h3>

  <p align="center">
    This repo includes scripts to bootstrap Windows 10, MacOS and soon Linux
    <br />
    <br />
    ·
    <a href="https://github.com/Kellan2002/Kellans-Scripts/issues">Report Bug</a>
    ·
    <a href="https://github.com/Kellan2002/Kellans-Scripts/issues">Request Feature</a>
    .
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#steps-to-bootstrap-a-new-mac">MacOS</a></li>
        <li><a href="#steps-to-bootstrap-a-new-windows-10-install">Windows</a></li>
        <li><a href="#steps-to-bootstrap-a-new-debian-install">Linux</a></li>
      </ul>
    </li>
    <!-- <li><a href="#usage">Usage</a></li> -->
    <li><a href="#Contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#todo-list">TODO-List</a></li>
    <!-- <li><a href="#acknowledgements">Acknowledgements</a></li> -->
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
# About The Project
My main OS of use is MacOS. Windows 10 and Linux are my secondary, and I end up reinstalling these operating systems often. This process is similar to [`Bootstrapping`](https://www.techopedia.com/definition/3328/bootstrap), but in a way more basic sense. 
I decided to create multiple scripts to automate this process for all the OS platforms I use (MacOS, Linux(Debian), and of course Windows 10)

<!-- BUILT WITH -->
## Built With

* [Bash]()
* [Powershell]()

<!-- MACOS -->
# Getting Started
## Steps to bootstrap a new Mac
*I am still busy working on a single script for MacOS*
1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```
2. Clone repo into new hidden directory.

```bash
# Use SSH (if set up)...
git clone git@github.com:Kellan2002/Kellans-Scripts.git ~/.kellans_scripts

# ...or use HTTPS and switch remotes later.
git clone https://github.com/Kellan2002/Kellans-Scripts.git ~/.kellans_scripts
```

3. Create symlinks in the Home directory to the real files in the repo.
> *To Display Hidden Files in Finder: Command ⌘ + Shift ⇧ + .*

```zsh
# There are better and less manual ways to do this;
# investigating install scripts and bootstrapping tools.

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
<!-- WINDOWS 10 -->
## Steps to bootstrap a new Windows 10 install

> *Make sure you open PowerShell with Administrator*

### Run script.
````pwsh
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/Js8JO'))
````
<!-- Contributing -->
# Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch  `git checkout -b feature/AmazingFeature`
3. Commit your Changes  `git commit -m 'Add some AmazingFeature'`
4. Push to the Branch  `git push origin feature/AmazingFeature`
5. Open a Pull Request

<!-- CONTACT -->
# Contact

*You can DM me on twitter*

Kellan - [@stevenskellan](https://twitter.com/stevenskellan)
<!-- LICENSE -->
# License
Distributed under the MIT License. See `LICENSE` for more information.
<!-- TODO LIST -->
# TODO List

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command) to record and restore System Preferences and other macOS configurations.
- Organize these growing steps into multiple script files.
- Automate symlinking and run script files with a bootstrapping tool like [Dotbot](https://github.com/anishathalye/dotbot).
- Revisit the list in [`.zshrc`](.zshrc) to customize the shell.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Finish Windows 10 Debloat [`script.ps1`](script.ps1)
- Make chocolatey pacckage install code dynamic
- Allow users to choose exactly what applications they want to install with chocolatey
- ~~Finish chocolatey package list installer script~~

[contributors-shield]: https://img.shields.io/github/contributors/Kellan2002/Kellans-Scripts.svg?style=for-the-badge
[contributors-url]: https://github.com/Kellan2002/Kellans-Scripts/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Kellan2002/Kellans-Scripts.svg?style=for-the-badge
[forks-url]: https://github.com/Kellan2002/Kellans-Scripts/network/members
[stars-shield]: https://img.shields.io/github/stars/Kellan2002/Kellans-Scripts.svg?style=for-the-badge
[stars-url]: https://github.com/Kellan2002/Kellans-Scripts/stargazers
[issues-shield]: https://img.shields.io/github/issues/Kellan2002/Kellans-Scripts.svg?style=for-the-badge
[issues-url]: https://github.com/Kellan2002/Kellans-Scripts/issues
[twitter-shield]: https://img.shields.io/twitter/follow/stevenskellan?style=for-the-badge
[twitter-url]: https://twitter.com/stevenskellan/
[license-shield]: https://img.shields.io/github/license/github_username/repo.svg?style=for-the-badge
[license-url]: https://github.com/Kellan2002/Kellans-Scripts/blob/main/LICENSE