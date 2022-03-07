#!/bin/ash

#     author: thibault@desaules.me
#     contributor: none
#     licence: Apache License, Version 2.0 (https://opensource.org/licenses/Apache-2.0)

# info: prepare python virtual env
python3.9 -m venv .
source bin/activate
python3 -m pip install wheel
/opt/homeassistant/bin/python3 -m pip install --upgrade pip

# info: install homeassistant
pip3 install homeassistant==$HOME_ASSISTANT_VERSION