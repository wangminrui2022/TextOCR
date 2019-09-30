#!/bin/sh
# @author 王明凡
# @version v1.0.0 创建时间2013年

for i in `find . -name "lib*.a" | grep -v arm`;
do 
	cp -rvf $i outdir/arm7; 
done
