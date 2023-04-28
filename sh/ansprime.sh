#!/usr/bin/bash
is_prime(){
	n=$1
	flag=0
	for i in {2...$((n-1))}
	do
		if [ $((n%i)) -eq 0 ]
		then
			flag=1
			break
		fi
	done
	return $flag
}
