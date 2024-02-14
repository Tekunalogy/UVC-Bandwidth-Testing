#!/bin/bash

# Default values
video_int=2
host_prefix="192.168."
host_last_segments="2.3"
port_number="5600"

# Function to display usage information
# example: ./streamcam.sh -v 1 -h 10.0 -p 5601
usage() {
    echo "Usage: $0 [-v <video_int>] [-h <host_last_segments>] [-p <port_number>]" 1>&2
    exit 1
}

# Parse command line options
while getopts ":v:h:p:" opt; do
    case ${opt} in
        v)
            video_int=$OPTARG
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
gst-launch-1.0 v4l2src device=/dev/video$video_int ! video/x-h264, width=1920, height=1080 ! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=$host port=$port_number sync=false
