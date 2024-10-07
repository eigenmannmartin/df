#!/bin/sh


#--mount type=bind,source=/opt/1Password/op-ssh-sign,target=/opt/1Password/op-ssh-sign \
devcontainer up \
  --workspace-folder . \
  --mount type=bind,source="$PWD"/.devcontainer/,target=/mnt/devcontainer \
  --mount type=bind,source="$HOME"/.1password/agent.sock,target=/home/vscode/.1password/agent.sock \
  --mount type=bind,source=/opt/1Password/op-ssh-sign,target=/opt/1Password/op-ssh-sign \
  --dotfiles-repository $DOTFILES_REPOSITORY \
  --additional-features='{"ghcr.io/eigenmannmartin/devcontainer-features/neovim:0": {"version":"nightly"}, "ghcr.io/eigenmannmartin/devcontainer-features/xdg-open:0": {}, "ghcr.io/eigenmannmartin/devcontainer-features/neovim-essentials:0": {}, "ghcr.io/devcontainers/features/sshd:1": {}, "ghcr.io/devcontainers/features/java:1.6.0": {"version":"latest"}}' $@
