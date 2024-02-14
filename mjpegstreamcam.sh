#!/bin/bash

# Default values
video_int=0
width=1280
framerate="30/1"
host_prefix="192.168."
host_last_segments="2.3"
port_number="5600"

# Function to display usage information
# example: ./mjpegstreamcam.sh -w 1920 -f "30/1" -h 2.3 -p 5600 -v 0
usage() {
    echo "Usage: $0 [-v <video_int>] [-w <width>] [-f <framerate>] [-h <host_last_segments>] [-p <port_number>]" 1>&2
    exit 1
}

# Parse command line options
while getopts ":v:w:f:h:p:" opt; do
    case ${opt} in
        v)
            video_int=$OPTARG
            ;;
        w)
            width=$OPTARG
            ;;
        f)
            framerate=$OPTARG
            ;;
        h)
            host_last_segments=$OPTARG
            ;;
        p)
            port_number=$OPTARG
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# Build the host IP
host="$host_prefix$host_last_segments"

# Execute the command with provided configurations
uname -r
gst-launch-1.0 v4l2src device=/dev/video$video_int ! image/jpeg,width=$width,framerate=$framerate ! rtpjpegpay ! udpsink host=$host port=$port_number
