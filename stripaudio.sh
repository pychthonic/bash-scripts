# This bash script searches for all .webm files
# in the PWD, and if they don't have mp3
# versions, makes mp3 copies of them by sripping
# the audio away. I'm going to add a bunch of
# functionality to it in the future.


for FILE in *.webm; do
    if [ ! -f "$FILE%.webm}.mp3" ]; then
        echo -e "processing video '\e[32m$FILE\e[0m'";
        ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "$FILE%.webm}.mp3";
    fi
done
