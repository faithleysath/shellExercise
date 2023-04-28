#!/usr/bin/bash
False(){
	echo 11
	echo 22
	((1111))
	return $?
}

echo "$(False)"

if False; then
	echo true
else
	echo false
fi
for true
do
	echo `date`
done
