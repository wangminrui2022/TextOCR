#!/bin/sh
# @author 王明凡
# @version v1.0.0 创建时间2013年

lipo -create arm7/libtesseract_all.a arm7s/libtesseract_all.a i386/libtesseract_all.a  -output ../lib/libtesseract_all.a
