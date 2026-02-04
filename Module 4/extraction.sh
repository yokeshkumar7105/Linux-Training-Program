#!/bin/bash
if [ $# -ne 1 ]; then
    echo "give correct arguments"
    exit 1
fi
inp_file="$1"
op_file="output.txt"
if [ ! -f "$inp_file" ]; then
    echo "File does not exist."
    exit 1
fi
> "$op_file"
while IFS= read -r line; do
    if [[ "$line" == *"frame.time"* ]]; then
        echo "\"frame.time\": \"${line#*: }\"" >> "$op_file"
    fi
    if [[ "$line" == *"wlan.fc.type"* ]]; then
        echo "\"wlan.fc.type\": \"${line#*: }\"" >> "$op_file"
    fi
    if [[ "$line" == *"wlan.fc.subtype"* ]]; then
        echo "\"wlan.fc.subtype\": \"${line#*: }\"" >> "$op_file"
    fi
done < "$inp_file"
echo "output saved as output.txt"
