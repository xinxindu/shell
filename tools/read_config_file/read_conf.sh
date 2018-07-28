#!/in/bash

# __readINI [配置文件路径+名称] [节点名]
function __readINI() {
   INIFILE=$1; SECTION=$2;
   _readIni=`awk '/\['$SECTION'\]/,/$^/' $INIFILE |sed '1d' |sed '$d'`
   echo ${_readIni}
}

#example

__readINI ./student.conf xiaoming
#output zhangsan

__readINI ./student.conf liwen
#outpu 123456

