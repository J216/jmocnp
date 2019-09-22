#!/bin/bash


ORIG_DIR="`pwd`"

# Set dir to jmedia.sh location
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
# change to current directory
cd "$DIR"


sepr=' - '

replace_amp () {
    firstString="$1"
    secondString='&AMP;'
    echo "${firstString/&/$secondString}"
}

loop_check () {
    single_check
    while true ; do
        stream_file="`mocp -i | grep File: | rev | cut -d '/' -f 1 | cut -d '-' -f 3- | rev | recode ascii..html`"
        touch ./nowcpst.tmp
        npMOCP="`mocp -i | grep SongTitle | cut -d " " -f 2- | awk '{$1=$1};1'`"
        npTitle=$(printf '%s\n' "${npMOCP//$sepr/$'\n'}" | cut -d "
" -f 1)
        npSong=$(printf '%s\n' "${npMOCP//$sepr/$'\n'}" | cut -d "
" -f 2)
        cST=`echo -e "$npTitle"' - '"$npSong"`
        if [ "`cat nowcpst.tmp`" != "$cST" ] ; then
            echo "$cST" > ./nowcpst.tmp
            cST=`echo -e "\n$npSong"`
            sleep 9
            npTitle=`echo "$npTitle" | recode ascii..html`
            npSong=`echo "$npSong" | recode ascii..html`
            export display=:0 ; notify-send --icon "`realpath jmocnp.png`" -t 12000 'Now Playing on '"$stream_file" "<span color='#df1010' font='26px'><i><b>""$npTitle"'</b>'"$cST"'</i></span>'
        else
            echo 'same song'
        fi
        sleep 0.7
    done
}

single_check () {
        stream_file="`mocp -i | grep File: | rev | cut -d '/' -f 1 | cut -d '-' -f 3- | rev | recode ascii..html`"
        npMOCP="`mocp -i | grep SongTitle | cut -d " " -f 2- | awk '{$1=$1};1'`"
        npTitle=$(printf '%s\n' "${npMOCP//$sepr/$'\n'}" | cut -d "
" -f 1)
        npSong=$(printf '%s\n' "${npMOCP//$sepr/$'\n'}" | cut -d "
" -f 2)
        echo "Artist: $npTitle"
        echo "Song: $npSong"
        echo "$npTitle"' - '"$npSong" > ./nowcpst.tmp
        cST=`echo -e "\n$npSong"`
        echo "$cST"
        sleep 3
        npTitle=`echo "$npTitle" | recode ascii..html`
        npSong=`echo "$npSong" | recode ascii..html`
        export display=:0 ; notify-send -t 12000 --icon "`realpath jmocnp.png`" 'Now Playing on '"$stream_file" "<span color='#df1010' font='26px'><i><b>""$npTitle"'</b>'"$cST"'</i></span>'
}

fast_check (){
        stream_file="`mocp -i | grep File: | rev | cut -d '/' -f 1 | cut -d '-' -f 3- | rev | recode ascii..html`"
        npMOCP="`mocp -i | grep SongTitle | cut -d " " -f 2- | awk '{$1=$1};1'`"
        npTitle=$(printf '%s\n' "${npMOCP//$sepr/$'\n'}" | cut -d "
" -f 1)
        npSong=$(printf '%s\n' "${npMOCP//$sepr/$'\n'}" | cut -d "
" -f 2)
        echo "$DIR"
        echo "Artist: $npTitle"
        echo "Song: $npSong"
        echo "$npTitle"' - '"$npSong" > ./nowcpst.tmp
        cST=`echo -e "\n$npSong"`
        echo "$cST"
        sleep 0.1
        npTitle=`echo "$npTitle" | recode ascii..html`
        npSong=`echo "$npSong" | recode ascii..html`
        export display=:0 ; notify-send -t 7000 --icon "`realpath jmocnp.png`" 'Now Playing on '"$stream_file" "<span color='#df1010' font='26px'><i><b>""$npTitle"'</b>'"$cST"'</i></span>'
}

case $1 in
    '-l')
        loop_check
        ;;
    '-f')
        fast_check
        ;;
    '-s')
        single_check
        ;;
    *)
        fast_check
        ;;
esac

