#! /bin/bash
CONTAINER_UP=$(devcontainer up --workspace-folder .)
CONTAINER_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(echo $CONTAINER_UP | jq ".containerId" -r ))
CONTAINER_PATH=$(echo $CONTAINER_UP | jq ".remoteWorkspaceFolder" -r )
CONTAINER_USER=$(echo $CONTAINER_UP | jq ".remoteUser" -r )
devcontainer exec --workspace-folder . /bin/bash -c "mkdir -p /home/\$(whoami)/.ssh && echo '$(op read "op://Private/SSH-martin/public key")' >> /home/\$(whoami)/.ssh/authorized_keys"
ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o "RemoteForward=[localhost]:2226 [127.0.0.1]:2226" -A -t $CONTAINER_USER@$CONTAINER_IP "cd $CONTAINER_PATH; /bin/zsh --login" 
