# 2.create a file and remove write permission for group user

#create a file
touch mymodule.sh

#check current permissions (default is rw-r--r--)
ls -l mymodule.sh
#add write permission for group
chmod g+w mymodule.sh

# rmve write permission for grp user 
chmod g-w mymodule.sh

# verify permission
ls -l mymodule.sh


#output
# initial permision: -rw-r--r--
# after write permission to grp: -rw-rw-r-- 
# after rmving write permission to grp: -rw-r--r--