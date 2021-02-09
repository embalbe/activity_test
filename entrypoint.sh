#!/bin/sh -l

if [ ! -d /wd ]
then
 git clone --recursive $1 wd
 cd wd
fi

if [ $2 != "SKIP" ]
then
  codespell --builtin clear,rare,code,names \
  --ignore-words-list ths,dur,ois,tim,stdio \
  --interactive 0 \ 
  --skip="./.git,./_prj_NucleoF411, 
          ./_prj_MKI109V3,./_prj_spc584b, 
          ./_bin,./_resources/STMems_Finite_State_Machine, 
          ./_resources/STMems_Machine_Learning_Core" 
fi


if [ $3 != "SKIP" ]
then
  astyle --options = $3
fi

echo "your input $1 $2 $3"
myvar="Hello"
echo "::set-output name=results::$myvar"
