# TODO: write your own  here ./exercises/files/2/run.sh
docker run \
    --publish=10000:80 \
    --detach \
    --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html \
    nginx