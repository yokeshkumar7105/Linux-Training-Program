# 1. create a file and add executable permissions to all users

# create file with name mymodule
touch mymodule.sh

# change mode to give executable permission to all type of users
chmod a+x mymodule.sh

# view the permissions given and verify
ls -l mymodule.sh




# output came in ubuntu
# -rwxr-xr-x 1 yokeshkumarn yokeshkumarn 0 Jan 30 15:20 mymodule.sh

# -rwxr-xr-x is file permission where rwx is for user, r-x is for group, r-x for others (x means executable)
# yokeshkuman yokeshkumarn is my username and group name 
# 0 stands for size of file
# date & time modified 
# file name