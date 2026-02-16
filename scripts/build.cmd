@REM Compiles the app

cobc ^
  -I ../src ^
  -x ../src/*.cbl ^
  -o ../bin/CobMerge ^
  -w -q
