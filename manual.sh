echo " MANUAL "
echo "-------------------------------------"
while IFS= read -r line; do
	echo "$line"
done <manual.txt
