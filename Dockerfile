FROM ubuntu

RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN apt-add-repository -y ppa:kirillshkrogalev/ffmpeg-next && \
apt-get update && \
apt-get install -y git mercurial xvfb xfonts-base xfonts-75dpi xfonts-100dpi xfonts-cyrillic gource ffmpeg screen

ADD ./gource_generator.bash /tmp/gource_generator.bash

ENV TITLE "Example title"

VOLUME ["/repoRoot", "/avatars", "/results"]

WORKDIR /repoRoot

CMD bash /tmp/gource_generator.bash
