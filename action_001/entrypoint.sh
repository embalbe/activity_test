#!/bin/sh -l

if [ ! -d 'wd' ]
then
 git clone --recursive $1 wd
fi

cd wd

if [ $2 != "SKIP" ]
then
  pwd
  codespell --config $2
fi


if [ $3 != "SKIP" ]
then
  pwd
  astyle --options=$3 --recursive ./*.c,*.h
fi

echo "your input $1 $2 $3"
myvar="Hello"
echo "::set-output name=results::$myvar"
