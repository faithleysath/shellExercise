#!/usr/bin/zsh
fib() {
	if [[ $1 -eq 1 || $1 -eq 2 ]]; then
		echo 1
	else
		echo $(expr `fib $(($1-1))` + `fib $(($1-2))`)
	fi
}
echo `fib 10`
