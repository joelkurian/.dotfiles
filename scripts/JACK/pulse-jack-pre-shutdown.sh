#! /bin/bash

# pacmd set-card-profile alsa_card.pci-0000_00_1b.0 output:analog-stereo
# pacmd set-card-profile alsa_card.usb-0c76_USB_PnP_Audio_Device-00 output:analog-stereo+input:multichannel-input

# pacmd set-default-sink alsa_output.pci-0000_00_1b.0.analog-stereo
# amixer set Master 15%
