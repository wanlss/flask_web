#!/usr/bin/env bash
val1=baseball
val2=hocky

# -n str1 检查str1的长度是否非0
# -z str1 检查str1的长度是否为0
if [[ ${val1} > ${val2} ]]; then
    echo "$val1 is greater than $val2"
else
    echo "$val1 is less than $val2"
fi

val1=testing
val2=''

if [[ -n ${val1} ]];then
    echo "The string '$val1' is not empty"
else
    echo "The string '$val1' is empty"
fi

if [[ -z ${val2} ]];then
    echo "The string '$val2' is empty"
else
    echo "The string '$val2' is not empty"
fi


# 文件比较
# -d file 检查file是否存在并且是个目录
# -e file 检查file是否存在
# -f file 检查file是否存在并是一个文件
# -r file 是否存在且可读
# -s file 是否存在并非空
# -w file 是否存在并可写
# -x file 是否存在并可执行
# -O file 是否存在并属于当前用户
# -G file 是否存在并且默认组与当前用户相同
# file1 -nt file2 file1是否比file2新
# file1 -ot file2 file1是否比file2旧


jump_directory=/home/arthur

if [[ -d ${jump_directory} ]]; then
    echo "The ${jump_directory} directory exists"
else
    echo "The ${jump_directory} directory does not exist"
fi

# 检查对象是否存在
location=$HOME
file_name="sentinel"

if [[ -e ${location} ]];then
    echo "OK on the ${location} directory"
    echo "Now checking on the file, ${file_name}"
    if [[ -e ${location}/${file_name} ]];then
        echo "OK on the filename"
        echo "Updating Current Date..."
        date >> ${location}/${file_name}
    else
        echo "File does not exisr"
        echo "Nothing to update"
    fi
else
    echo "The ${location} directory does not exist"
    echo "Nothing to update"
fi

# 检查文件
item_name=$HOME
echo
echo "Begin check: ${item_name}"
echo

if [[ -e ${item_name} ]]; then
    echo "The item, ${item_name}, does exist"
    echo "But is it a file"
    echo
    if [[ -f ${item_name} ]];then
        echo "Yes it is!"
    else
        echo "It's not a file"
    fi
else
    echo "The item, ${file_name}, does not exist"
fi

# 检查是否可读
pwfile=$HOME/test.sh
if [[ -f ${pwfile} ]];then
    if [[ -r ${pwfile} ]];then
        tail ${pwfile}
    else
        echo "Sorry can't read this file"
    fi
else
    echo "It's not a file"
fi























