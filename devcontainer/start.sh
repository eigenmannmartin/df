#!/bin/sh

devcontainer build --workspace-folder .
devcontainer up --workspace-folder . --dotfiles-repository $DOTFILES_REPOSITORY --remove-existing-container 
