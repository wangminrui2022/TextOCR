#!/bin/sh
# @author 王明凡
# @version v1.0.0 创建时间2013年

lipo -create arm7/liblept.a arm7s/liblept.a i386/liblept.a  -output lib/liblept.a
