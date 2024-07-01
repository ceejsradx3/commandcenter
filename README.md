# Windows Setup

![windows preview](https://raw.githubusercontent.com/cjmvincent/commandcenter/master/preview.png)

This repo has been created to automate the configuration of my Windows' installation. This is primarily tailored to my machine used for my line of work as an Engineer in the public school system. Feel free to explore, copy and re-use the code as you see fit.

## Installation

**Warning**: I recommend you fork and review the code first, before giving these scripts
a try. Be sure to set the execution policy by initiating either `Set-ExecutionPolicy Remotesigned` or `Set-ExecutionPolicy Bypass` first so the scripts can run. Once ready, provided you have git cli already installed, you can run the following command from your shell or terminal window to begin:

    git clone http://github.com/ceejsradx3/commandcenter.git && cd commandcenter && .\install.ps1

That's about it, I think... I'm sure as time passes, and I learn more things, this repo will evolve.

## What's included

Below is a list of the packages, utilities, and programs set to install:

- Google Chrome
- Discord
- Adobe Acrobat Reader DC
- Notepad++
- VLC
- 7zip
- Microsoft PowerToys
- GitHub Desktop
- Balena Etcher
- PuTTY
- Termius
- WinSCP
- Microsoft Teams
- VSCode
- Microsoft WindowsTerminal

Additionally, a few features will be enabled or installed:
- RSAT: Remote Server Administration Tools

You will also find scripts to remove the pesky default Windows apps, as well as enable/disable various windows features.

## Thanks to
Special thanks to [Jay Harris](https://github.com/jayharris/dotfiles-windows) and [Chris Titus](https://github.com/ChrisTitusTech/win10script) as a bulk of the inspriation and content came from them.
