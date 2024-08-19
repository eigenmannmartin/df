#!/bin/sh

docker stop $(docker ps --filter "label=devcontainer.local_folder=$PWD" --format '{{.ID}}')
