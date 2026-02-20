@REM Compiles the app without showing warnings

cobc ^
  -I ../src ^
  -x ../src/*.cbl ^
  -o ../bin/CobMerge ^
  -w -q
