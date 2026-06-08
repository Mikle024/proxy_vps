#!/bin/bash

git clone --depth 1 https://github.com/amirotin/telemt_panel.git $PWD/tp_build && \
cd tp_build/ && \
docker build -t telemt_panel:local . && \
cd .. && rm -rf tp_build