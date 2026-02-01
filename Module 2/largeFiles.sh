

# 1. Cmd for listing file size > 1mb to a file

ls -lh #lists all files

#checks col 5 (which is size) is in Mb or Gb and greater than 1 if so it outputs file name and size to a file
ls -lh | awk '$5 ~ /M|G/ && $5+0>1 {print $9"\t"$5}' > large_files.txt

#check the files
cat large_files.txt
