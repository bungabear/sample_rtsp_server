# Usage

```
docker run -it --rm -p 8554:8554 -e TZ=Asia/Seoul ghcr.io/bungabear/sample_rtsp_server:latest
```

## Custom Video

```
docker run -it --rm -p 8554:8554 -v somevideo.mp4:/video.mp4 ghcr.io/bungabear/sample_rtsp_server:latest -v /video.mp4
```
