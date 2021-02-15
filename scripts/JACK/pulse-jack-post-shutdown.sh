#! /bin/bash

# Enable Soundcards
# Enable Built-in Audio
pacmd set-card-profile alsa_card.pci-0000_00_1b.0 output:analog-stereo

# Enable USB Audio
pacmd set-card-profile alsa_card.usb-0c76_USB_PnP_Audio_Device-00 output:analog-stereo+input:multichannel-input
