# bash-config
###Config files for setting custom bash environment
- run `setup.sh`:
    - if exists: moves ~/.bash_config --> ~/.bash_config.off
    - copies ./.bash_config --> ~/.bash_config
    - runs ~/.bash_config (which sources the files in ./partials/)