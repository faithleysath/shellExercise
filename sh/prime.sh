#!/usr/bin/bash
isprime(){
	n=$1
	flag=0
	for i in {2...$((n-1))}; do
		if((n%i==0)); then
			flag=1
			break
		fi
	done
	return $flag
}
isprime 7
echo $?
nprime(){
	read n
	for i in $(seq 2 $n); do
		if isprime $i; then
			echo -n "$i "
		fi
	done
}
