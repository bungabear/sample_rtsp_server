#/bin/sh

echo "Start initalize option for ffmpeg"

sleepS=2
video="smptebars=size=1920x1080"
smptebarOption="-f lavfi"
rtspURL="rtsp://localhost:8554/mystream"

# 옵션 처리하기
while getopts "v:s:u" opt; do
  case $opt in
    v)
      video=$OPTARG
      ;;
    s)
      sleepS=$OPTARG
      ;;
    u)
      rtspURL="rtsp://user:user@localhost:8554/mystream"
      ;;
    \?)
      echo "Usage: $0 [-v videofile default is smptebars=size=1920x1080] [-s sleepS default is 2]"
      exit 1
      ;;
  esac
done

echo "Finish initalize option for ffmpeg"

echo The video option is $video

case "$video" in
  smptebars*)
    echo "Use '$smptebarOption' option."
    ;;
  *)
    smptebarOption=""
    ;;
esac

/mediamtx & \
echo sleep $sleepS for server ready ; \
sleep $sleepS ; \
ffmpeg -re -stream_loop -1 $smptebarOption -i $video -vcodec libx264 -vf "drawtext=fontsize=60:fontcolor=yellow:text='%{localtime\:%T}':x=(w-text_w):y=(h-text_h),drawtext=fontsize=60:fontcolor=yellow:text='%{eif\:w\:d}x%{eif\:h\:d}':y=(h-text_h)" -vcodec libx264 -f rtsp $rtspURL ;