#在创建shell脚本文件时，必须在文件的第一行指定要使用的shell
#!/bin/bash

#使用多个命令
#两个命令一起运行，可以 把它们放在同一行中，彼此间用分号隔开
date; who
echo "*******"

# This script displays the date and who's logged on
date
who
#shell会通过PATH 环境变量来查找命令
echo "*******"

echo "The time and date are: "
date
#把文本字符串和命令输出显示在同一行中, 用-n
echo -n "The time and date are: "
date
echo "*******"

#环境变量
# set命令来显示一份完整的当前环境变量列表
# set
# 可以在环境变量名称之前加上美元符($)或 ${} 来使用这些环境变量
echo USER: $USER
echo UID: ${UID}
echo HOME: $HOME
echo "*******"

#命令替换：
#将命令输出赋给变量 [1] 反引号字符(`) [2] $() 格式
testing=`date`
echo testing: $testing

testing2=$(date)
echo testing2: ${testing2}

today=$(date +%y%m%d)
ls -al /usr/bin  > log.$today

# 命令替换会创建一个子shell来运行对应的命令。
# 子shell(subshell)是由运行该脚本的shell 所创建出来的一个独立的子shell(child shell)。
# 正因如此，由该子shell所执行命令是无法使用脚本中所创建的变量的。 

# 在命令行提示符下使用路径./运行命令的话，也会创建出子shell;要是运行命令的时候 
# 不加入路径，就不会创建子shell。如果你使用的是内建的shell命令，并不会涉及子shell。

#Shell 内建命令，就是由Bash自身提供的命令，而不是文件系统中的某个可执行文件
#内建命令不需要子进程来执行，它已经和shell编译为一体。
#作为shell工具的组成部分存在。不需要借助外部程序文件来运行
echo "*******"

#输出重定向：将命令的输出重定向到文件 command > 文件
# > 覆盖
# >> 不覆盖，追加
who > log.$today

#输入重定向：
# <      将文件的内容重定向到命令 command < 文件
wc < log.$today

# <<   inline input redirection,无需使用文件进行重定向
# 内联输入重定向符号是远小于号(<<)。
# 除了这个符号，你必须指定一个文本标记来划分输入数据的开始和结尾。
# 任何字符串都可作为文本标记，但在数据的开始和结尾文本标记必须一致
wc << EOF
test string1
test string2
test string3
EOF

#管道(piping)：将一个命令的输出作为另一个命令的输入，数据传输不会用到任何中间文件或缓冲区
# command1 | command2
# $rpm -qa | sort | more > rpm.list

#执行数学运算
# [1] expr命令
expr 1 + 5
# [2] 使用方括号 $[ operation ]
var1=$[1+5]
echo ${var1}

#shell中运行的每个命令都使用退出状态码(exit status)告诉shell它已经运行完毕。
#退出状态码是一个0~255的整数值，在命令结束运行时由命令传给shell。可以捕获这个值并在脚本中使用

#变量$?来保存上个已执行命令的退出状态码,一个成功结束的命令的退出状态码是0
#Linux退出状态码: 比如1是一般性未知错误，状态码126表明用户没有执行命令的正确权限
echo $?

#exit命令允许你在脚本结束时指定一个退出状态码
exit 5