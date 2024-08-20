#!/bin/sh

devcontainer exec \
  --workspace-folder . \
  --remote-env SHELL=/bin/zsh \
  --remote-env STARSHIP_SHELL=/bin/zsh \
  /bin/zsh

