WIP!!!

This docker images aims to help running streamparse (and storm supervisor) within docker containers

Because setting up ssh servers within docker containers is considered bad practice, and streamparse's default per-worker over ssh installation is pretty pointless and slow over many workers, this image relies on external (that should be shared between the image instances) volume for the virtualenvs. The virtual env setup is performed by seperate task image instanse by running


`docker run  -v SHARED_VIRTUAL_ENV_PATH:/topologies -v PATH_TOSTREAMPARSE_VIRTUALENVS_FOLDER:/env_specs  simsimy/docker-storm-supervisor-with-streamparse /sync-venv.sh TOPOLOGY_NAME`

*Running Storm:*
The storm path is based on the official storm image logic but runs from the official openjdk image (rather than the depricated alpine one). Basicly you can run with relevant port mappings 
`docker run  -v SHARED_VIRTUAL_ENV_PATH:/topologies simsimy/docker-storm-supervisor-with-streamparse storm [nimbus|supervisor|ui]`
