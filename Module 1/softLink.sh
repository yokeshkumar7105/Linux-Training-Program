# 3.create file and add softlink for that in different directory


#created 2 directories
mkdir directoryOne
mkdir directoryTwo

#orginal file and added content
touch directoryOne/orginalFile.txt
echo "frm directoryOne" >directoryOne/orginalFile.txt


#creates softlink in directorytwofor the file in directory one
ln -s ../directoryOne/orginalFile.txt directoryTwo/orginal_softlink.txt
#lists links
ls -l directoryTwo

#accessing file in directory1 using softlink from directory2
cat directoryTwo/orginal_softlink.txt
 