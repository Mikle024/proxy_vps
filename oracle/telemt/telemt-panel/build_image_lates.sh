#!/bin/bash

sudo git clone --depth 1 https://github.com/amirotin/telemt_panel.git /tmp/tp_build && \
cd /tmp/tp_build && \
docker build -t telemt_panel:local . && \
cd / && sudo rm -rf /tmp/tp_build