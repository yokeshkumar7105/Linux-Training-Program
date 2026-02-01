# 4. find high memory usage and terminate it



# format the ps outpt and sort them in descending order so high memory is on top
# use awk cmd to print the top memory's PID, Process, memory
ps -eo pid,comm,%mem --sort=-%mem | awk 'NR==2 {print "PID:",$1,"Process:",$2,"Memory:",$3"%"}'


kill 12345 # 12345 means PID which got during previous cmd