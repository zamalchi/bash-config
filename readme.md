# bash-config
###Config files for setting custom bash environment
- run `setup.sh`:
    - if exists: moves ~/.bash_config --> ~/.bash_config.off
    - if exists: moves ~/.bashrc --> ~/.bashrc.off
    - copies ./.bash_config --> ~/.bash_config
    - copies ./.bashrc --> ~/.bashrc
    - runs ~/.bashrc which sources:
        - ~/.bash_config (which sources all the files in ./partials)
        - ~/.bash_local (if it exists)