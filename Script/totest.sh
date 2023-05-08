#!/usr/bin/zsh
count=1
while true
do
	./betest.sh &>> out.log
	if [[ $? -ne 0 ]]; then
		cat out.log
		echo "failed after $count times"
		break
	fi
	((count++))
done
