#!/usr/bin/bash
# 读入变量
echo -n 请输入变量a的值：
read a 
echo -n 请输入变量b的值：
read b
echo "a=$a\nb=$b"
echo

# 算术运算
echo '$((a+b))='$((a+b))
echo '`expr $a + $b`'=`expr $a + $b`

# C语句
echo b++
((b++))
echo b=$b

# 关系运算
test $a -lt $b
echo "a<b的值为$?"
test $a -le $b
if `echo 1 > &2`; then
	echo yes
else
	echo no
fi
