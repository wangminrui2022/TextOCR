#!/bin/sh
# @author 王明凡
# @version v1.0.0 创建时间2013年

tess_inc=( api/apitypes.h api/baseapi.h ccmain/thresholder.h ccstruct/publictypes.h ccutil/errcode.h
           ccutil/genericvector.h ccutil/helpers.h ccutil/host.h ccutil/ndminx.h ccutil/ocrclass.h
           ccutil/platform.h ccutil/tesscallback.h ccutil/unichar.h ccmain/ltrresultiterator.h ccutil/memry.h ccmain/pageiterator.h ccmain/resultiterator.h ccutil/strngs.h ccutil/unicharmap.h ccutil/unicharset.h)
for i in "${tess_inc[@]}"; do 
   cp -rvf $i outdir/include; 
done
