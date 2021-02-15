#! /bin/bash

# Disable cards from PulseAudio
pacmd set-card-profile alsa_card.pci-0000_00_1b.0 off
pacmd set-card-profile alsa_card.usb-0c76_USB_PnP_Audio_Device-00 off
