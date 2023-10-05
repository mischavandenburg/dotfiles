# Dotfiles

My configuration files for bash, vim, tmux and so forth.

The intention is to be able to run  a setup script after cloning the repo on a Mac or Ubuntu (WSL) system and be up and running very quickly.

# Setup Notes

## Windows and WSL setup

* Install WSL in powershell 

```
The above command only works if WSL is not installed at all, if you run wsl --install and see the WSL help text, please try running wsl --list --online to see a list of available distros and run wsl --install -d <DistroName> to install a distro. To uninstall WSL, see Uninstall legacy version of WSL or unregister or uninstall a Linux distribution.
```

* Use [chocolatey](https://chocolatey.org/install) to install Windows Terminal Preview using `choco install microsoft-windows-terminal --pre`
* Get gruvbox-material color scheme for Windows Terminal. 
* Open the settings.json in windows preview by opening a new tab and click on Settings while holding shift
* Paste in the colorschemes and asssign it to the Ubuntu profile in Windows Terminal
