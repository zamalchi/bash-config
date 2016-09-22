# bash-config
###Config files for setting custom bash environment
- run `setup.sh`:
		- `-c <install_dir>` (location of bash-config/ directory) : default 
    - if exists: moves `~/.bashrc` --> `~/.bashrc.off`
    - copies `./.bashrc` --> `~/.bashrc`
- `source ~/.bashrc` which, in turn, sources: 
    - `./config` (which sources all the files in `./partials/`)
    - `./local` (if it exists)