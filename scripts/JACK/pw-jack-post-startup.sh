#! /bin/bash

# Setup noise-suppression-for-voice
pw-jack jalv -i https://github.com/werman/noise-suppression-for-voice &


# Setup PulseAudio devices
# Mic source
pactl load-module module-null-sink object.linger=1 media.class=Audio/Source/Virtual sink_name=mic_in channel_map=front-left,front-right device.description=\"USB PnP Audio Device \(RnNoise\)\"


# Connect everything
# USB source -> Noise Suppression (RnNoise) -> USB source (RnNoise)
pw-jack jack_connect "USB PnP Audio Device Mono:capture_MONO" "Noise Suppression (RnNoise):in"
pw-jack jack_connect "Noise Suppression (RnNoise):out" "USB PnP Audio Device (RnNoise):input_FL"
pw-jack jack_connect "Noise Suppression (RnNoise):out" "USB PnP Audio Device (RnNoise):input_FR"


# Setup default PulseAudio sink/source
pactl set-default-source mic_in
