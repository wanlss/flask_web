#!/usr/bin/env bash
testing=$(date)
echo "The date and tim are: " ${testing}

# 中间必须有空格
today=$(date +%y%m%d)
ls /usr/bin -al > log.${today}

# 使用方括号赋值
var1=$[1 + 5]
echo $var1

var2=$[$var1 * 2]
echo $var2