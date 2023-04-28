#!/usr/bin/bash
your_name="tom"
echo $your_name
your_name="mike"
# 变量
echo your\ name\ is\ ${your_name}bbbb
echo "aa""bb"

myurl="http"
# readonly myurl
myurl="https"
echo $myurl
# 删除变量
unset myurl
echo $myurl

# 获取字符串长度
string=abcd
echo ${string}
echo ${#string}

# 提取子字符串

string="runoob   is    a   great     site"
echo ${string:1:4}
# 有没有引号的区别
echo $string
echo "$string"

# 一维数组

num=(0 1 2 3 5 7)
num[11]=100 # 数组下标可以不连续

value1=${num[0]}
echo $value1
echo ${num[@]} # 获取数组所有元素

## 获取数组长度
length=${#num[@]}
length=${#num[*]}
length1=${#num[0]} # 获取数组某个元素的长度
echo $length $length1

# 关联数组（字典）
declare -A site=([google]=www.google.com ["runoob"]="www.runoob.com")
site["taobao"]="www.taobao.com"

echo "${site[@]}"
echo google=${site[google]}
