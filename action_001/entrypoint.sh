#!/bin/sh -l

if [ ! -d 'wd' ]
then
 git clone --recursive $1 wd
fi

cd wd

if [ $2 != "SKIP" ]
then
  pwd
  codespell --builtin clear,rare,code,names --ignore-words-list ths,dur,ois,tim,stdio --interactive 0 --skip="./.git,./_prj_NucleoF411,./_prj_MKI109V3,./_prj_spc584b,./_bin,./_resources/STMems_Finite_State_Machine,./_resources/STMems_Machine_Learning_Core" 
fi


if [ $3 != "SKIP" ]
then
  pwd
  astyle --options=$3 --recursive ./*.c,*.h
fi

echo "your input $1 $2 $3"
myvar="Hello"
echo "::set-output name=results::$myvar"
