@REM Checks the source code's syntax

cobc ^
  -I ../src ^
  -fsyntax-only ../src/*.cbl ^
  -Wall -Wextra -Wno-terminator
