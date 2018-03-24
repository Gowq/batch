@echo off
setlocal enabledelayedexpansion
set /p "Var1= Digite o menor valor: "
set /p "Var2= Digite o maior valor?: "
for /l %%i in (1,1,%Var2%) do (
 set /a mod1=!var1! %% %%i
 set /a mod2=!var2! %% %%i
 if !mod1! == 0 (
  if !mod2! == 0 (
   set x=%%i
  )
 )
)
echo %x%&pause>nul