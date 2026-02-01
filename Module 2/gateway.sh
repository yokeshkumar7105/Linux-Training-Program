# 5. print all gateway in sorted manner


ip route | awk '/default/ {print $3}' | sort

# from the routing table extract default routes and prints gatway ip 