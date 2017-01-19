#!/usr/bin/env bash
ENVS_PATH=/topologies
REQUIREMENTS_SOURCE=/env_specs

setup_virt_env() {
   cd $ENVS_PATH
   env_name=$1
   virtualenv $env_name
   cd $env_name
   source bin/activate
   cp $REQUIREMENTS_SOURCE/$env_name.txt requirements.txt
   pip install -r requirements.txt
   rm requirements.txt
   echo $env_name
}

ENV_NAME=$1
setup_virt_env $1