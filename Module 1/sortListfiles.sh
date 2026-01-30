# 5.create 3 files and redirect the o/p of list cmd sorted by timestamp to another file

# create 3 files & added dummy content

nano file1.txt
nano file2.txt
nano file3.txt

#redirecting sorted list to file
ls -lt directoryOne > directoryOne/timestamp.txt

cat timestamp.txt

