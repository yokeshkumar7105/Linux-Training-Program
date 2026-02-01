# 3. search for ERROR in log file and output it in new file

awk 'match($0, /ERROR/) {print}' log.txt > filtered_log.txt
# $0 means entire line

cat filtered_log.txt