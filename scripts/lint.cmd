@REM Checks the source code's syntax with extra errors

cobc ^
  -I ../src ^
  -fsyntax-only ../src/*.cbl ^
  -Wall -Wextra -Wno-terminator
