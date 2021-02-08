#!/bin/sh -l

if [ !(-d /repo) ]
then
 git clone --recursive $1 repo
 cd repo
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
  astyle --style=otbs \
  --indent=spaces=2 \
  --attach-closing-while \
  --indent-switches \
  --indent-labels \
  --indent-preproc-define \
  --indent-col1-comments \
  --min-conditional-indent=0 \
  --max-continuation-indent=60 \
  --break-blocks=all \
  --pad-comma \
  --pad-oper \
  --pad-header \
  --delete-empty-lines \
  --align-pointer=name \
  --align-reference=name \
  --break-closing-braces \
  --break-one-line-headers \
  --add-braces \
  --attach-return-type \
  --convert-tabs \
  --max-code-length=70 \
  --break-after-logical \
  --pad-method-prefix \
  --pad-return-type \
  --pad-param-type \
  --pad-method-colon=after \
  --suffix=none \
  --recursive ./*.c,*.h \
  --exclude=_resources/STMems_Machine_Learning_Core \
  --exclude=_resources/STMems_Finite_State_Machine \
  --exclude=_prj_NucleoF411 \
  --exclude=_prj_MKI109V3 \
  --verbose \
  --formatted \
  --lineend=windows
fi

echo "your input $1 $2 $3"
myvar="Hello"
echo "::set-output name=results::$myvar"
