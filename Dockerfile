## ffmpeg included alpine linux
FROM bluenviron/mediamtx:latest-ffmpeg
RUN apk update
RUN apk add --no-cache tzdata font-noto
COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT [ "sh", "/run.sh" ]