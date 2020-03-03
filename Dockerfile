FROM node:11.9

ARG artifact_root="."
ARG branch="master"

COPY $artifact_root/build.sh /build.sh
COPY $artifact_root/entrypoint.sh /entrypoint.sh

RUN wget https://github.com/garreeoke/acme-air/archive/$branch.zip \
&& unzip $branch.zip \
&& ls \
&& mv acme-air-$branch /code/

RUN chmod +x /build.sh /entrypoint.sh && /build.sh

WORKDIR /usr/src/app

ENTRYPOINT ["/entrypoint.sh"]
