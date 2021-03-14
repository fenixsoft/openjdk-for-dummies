#!/bin/bash
set -e
echo Start building OpenJDK

# 初始化环境
args="--with-boot-jdk=/bootstrap --with-version-opt=icyfenix --build=x86_64-unknown-linux-gnu --host=x86_64-unknown-linux-gnu --with-conf-name=linux-x86_64-default"

# 判断是否位于Micorsoft WSL2环境中。
# 目前OpenJDK并未对WSL2编译进行测试，尽管在命令中提供了支持，但依然不建议在WSL2中编译Linux的OpenJDK
if uname --kernel-release | grep "microsoft"; then
	args="${args} --build=x86_64-unknown-linux-gnu --host=x86_64-unknown-linux-gnu"
fi

echo "Build Args:" $args $*

# 开始编译
cd /source
bash ./configure $args $*
make clean images

# 清理并提取编译结果
find build/linux-x86_64-default/images/jdk -name "*.debuginfo" | xargs rm -f
cp -a build/linux-x86_64-default/images/jdk /dist
