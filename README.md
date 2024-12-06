# Usage

```
docker run -it --rm -p 8554:8554 -e TZ=Asia/Seoul ghcr.io/bungabear/sample_rtsp_server:latest
```

## Custom Video

```
docker run -it --rm -p 8554:8554 -v somevideo.mp4:/video.mp4 ghcr.io/bungabear/sample_rtsp_server:latest -v /video.mp4
```

### Specification

#### [Dockerfile] Why don't use *WORKDIR /app*
- This image use **bluenviron/mediamtx:latest-ffmpeg**
- MediaMtx command file located at root
- So, if **the WORKDIR** chagned to other location it infects something like configuration file then execution will fail.

### Options

-v videofile default is smptebars=size=1920x1080] [-s sleepS default is 2][-u use myuser option]

#### [U] configure authenticate RTSP

- id and pasword are **myuser**
- id and password are not customable