#!/bin/bash

export LD_LIBRARY_PATH="/home/lucas/.local/amdgpu-pro/opt/amdgpu-pro/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"
export LIBGL_DRIVERS_PATH="/home/lucas/.local/amdgpu-pro/usr/lib/x86_64-linux-gnu/dri"
export dri_driver="amdgpu"

/usr/bin/blender
