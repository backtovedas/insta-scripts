#!/bin/bash

ffmpeg -i input.mp4 -c:v libx264 -crf 18 -preset slow -c:a copy output.mp4
