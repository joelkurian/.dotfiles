#! /bin/bash

# Setup JACK clients
# Add Headphone to JACK
alsa_in -j 'headphone_in' -d hw:2 &
alsa_out -j 'headphone_out' -d hw:2 &

# Setup noise-suppression-for-voice
jalv -i https://github.com/werman/noise-suppression-for-voice &


# Setup PulseAudio devices
# Headphone sink
pacmd load-module module-jack-sink channels=2 sink_name=headphone_out client_name="Headphone\ Output" connect=false

# Game sink
pacmd load-module module-jack-sink channels=2 sink_name=game_out client_name="Game\ Output" connect=false
pacmd set-sink-volume game_out 20%

# Discord sink
pacmd load-module module-jack-sink channels=2 sink_name=discord_out client_name="Discord\ Output" connect=false
pacmd set-sink-volume discord_out 20%

# Music sink
pacmd load-module module-jack-sink channels=2 sink_name=music_out client_name="Music\ Output" connect=false
pacmd set-sink-volume music_out 20%


# Connect everything
# Disconnect system:capture from PulseAudio Source
jack_disconnect system:capture_1 "PulseAudio JACK Source:front-left"
jack_disconnect system:capture_2 "PulseAudio JACK Source:front-right"

# Mic -> noise-suppression-for-voice -> PulseAudio Source
jack_connect headphone_in:capture_1 "Noise Suppression (RnNoise):in"
jack_connect "Noise Suppression (RnNoise):out" "PulseAudio JACK Source:front-left"
jack_connect "Noise Suppression (RnNoise):out" "PulseAudio JACK Source:front-right"

# PulseAudio sink(Headphone Output) -> headphone_out
jack_connect "Headphone Output:front-left" headphone_out:playback_1
jack_connect "Headphone Output:front-right" headphone_out:playback_2

# PulseAudio sink(Game Output) -> headphone_out
jack_connect "Game Output:front-left" headphone_out:playback_1
jack_connect "Game Output:front-right" headphone_out:playback_2

# PulseAudio sink(Discord Output) -> headphone_out
jack_connect "Discord Output:front-left" headphone_out:playback_1
jack_connect "Discord Output:front-right" headphone_out:playback_2


# Setup default PulseAudio sink/source
pacmd set-default-sink jack_out
pacmd set-default-source jack_in
