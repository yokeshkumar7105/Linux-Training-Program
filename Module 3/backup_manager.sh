#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "args must be src dir, backup dir, extension"
    exit 1
fi
src_dir="$1"
bckup_dir="$2"
extension="$3"
if [ ! -d "$src_dir" ]; then
    echo "Source directory does not exist."
    exit 1
fi
if [ ! -d "$bckup_dir" ]; then
    mkdir -p "$bckup_dir" || {
        echo "Failed to create backup directory."
        exit 1
    }
fi
shopt -s nullglob
FILES=("$src_dir"/*"$extension")
shopt -u nullglob

if [ ${#FILES[@]} -eq 0 ]; then
    echo "No files with extension '$extension' found in source directory."
    exit 0
fi

export count=0
tot_size=0

echo "Files to be backed up:"

for file in "${FILES[@]}"; do
    size=$(stat -c %s "$file")
    echo "$(basename "$file") - $size bytes"
done



for file in "${FILES[@]}"; do
    filename=$(basename "$file")
    dest_file="$bckup_dir/$filename"

    if [ -f "$dest_file" ]; then
        if [ "$file" -nt "$dest_file" ]; then
            cp "$file" "$dest_file"
            ((count++))
            size=$(stat -c %s "$file")
            ((tot_size+=size))
        fi
    else
        cp "$file" "$dest_file"
        ((count++))
        size=$(stat -c %s "$file")
        ((tot_size+=size))
    fi
done

log="$bckup_dir/backup_report.log"
{
echo "Total files processed : $count"
echo "Total backup size     : $tot_size bytes"
echo "Backup directory      : $bckup_dir"
echo "Backup date           : $(date)"
} > "$log"
echo "Report saved in: $log"
