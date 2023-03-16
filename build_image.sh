# bash
export UID=$(id -u)
export GID=$(id -g)
docker build --no-cache --build-arg USER=$USER \
             --build-arg UID=$UID \
             --build-arg GID=$GID \
             --build-arg PW="docker" \
             -t px4-melodic \
             .
