# .dots
My archlinux dotfiles installer on steroids

## Usage
- `reset.sh` resets the installation
- `gen-install-scripts.sh` is for adding programs to `pkg/`
- `util.sh` are utility functions that the rest of  `.dots` uses
- `install.sh` is the program that will configure programs in `pkg/`

## This is a buggy tool that I made for myself.
Program configuration files are in the 'pkg/' directory. Each pkg has an `install` and `deps` script that instruct how to link configuration files for that program onto the rest of my system.

Can be used to rapidly bootstrap a new arch linux i3wm setup.

If more window managers, programs, etc. Are added those will be available as well. 

`./install.sh` will install all args given to it as pkgs. If no args are given it will install every pkg in 'pkg'`

My take on dotfiles
