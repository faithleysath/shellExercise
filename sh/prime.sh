#!/usr/bin/bash
isprime(){
	n=$0
	flag=0
	for i in `echo {2..$n}`; do
		if((n%i==0)); then
			flag=1
			break
		fi
	done
	return flag
}
isprime 10
echo $?
