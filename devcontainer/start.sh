#!/bin/sh

devcontainer build --workspace-folder .
devcontainer up --workspace-folder .  --mount type=bind,source=$PWD/.devcontainer/,target=/mnt/devcontainer --dotfiles-repository $DOTFILES_REPOSITORY --remove-existing-container 
