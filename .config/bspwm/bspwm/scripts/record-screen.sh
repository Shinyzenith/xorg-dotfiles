#/bin/sh
outputs=$(pacmd list-sources | grep name: | awk '{print $2}'| sed 's|<||;s|>||' | tee /tmp/outputsourcesffmpeg)
if [[ ! $(grep sink /tmp/outputsourcesffmpeg) ]];then
	alacritty -e ffmpeg -r 30 -f pulse -i $(grep output /tmp/outputsourcesffmpeg) -f x11grab -i :0.0 ~/Videos/recordings/$(date | sed 's|\s|-|g;s|--|-|g').mp4; notify-send 'Recording finished! Video file written to disk' -a 'ffmpeg screen recorder' -u critical -t 5000
else
	alacritty -e ffmpeg -r 30 -f pulse -i $(grep sink /tmp/outputsourcesffmpeg) -f x11grab -i :0.0 ~/Videos/recordings/$(date | sed 's|\s|-|g;s|--|-|g').mp4; notify-send 'Recording finished! Video file written to disk' -a 'ffmpeg screen recorder' -u critical -t 5000
fi
