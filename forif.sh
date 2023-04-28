#!/bin/bash

echo "此程序于$(date)运行"

echo "本程序的PID为$$，脚本名为$0，有$#个参数"

for file in "$@"; do
	grep foobar "$file" > /dev/null 2>&1
      	if [[ $? -ne 0 ]]; then
       		echo "文件$file中不存在foobar，添加一个！"	   
		echo "# foobar" >> "$file"
	fi
done
