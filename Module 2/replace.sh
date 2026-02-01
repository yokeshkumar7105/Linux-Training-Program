
# 2. replace all localhost to 127.0.0.1

# using sed command
sed '/s/localhost/127.0.0.1/g' config.txt > updated_config.txt

#using awk command
awk 'gsub("localhost","127.0.0.1") {print}' config.txt > updated_config.txt

cat updated_config.txt