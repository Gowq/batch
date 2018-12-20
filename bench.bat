@echo on
    echo strMessage = Inputbox("How many threads?","Input Required") >> input.vbs
    echo WScript.Echo strMessage >> input.vbs
    cscript.exe //NoLogo "input.vbs" > "out.txt"
    del /q input.vbs
    msg * "Do not maximize the window" 

    for /f %%s in ('type "out.txt"') do (
        set "thr=%%s")

::Minimizar
    if not "%minimized%"=="" ( 
        goto :minimized)

    set minimized=true
    start /min cmd /C "%~dpnx0"

    goto :EOF


:minimized
    setlocal enabledelayedexpansion
    for /f "tokens=3 delims=:" %%t in ('echo/%time%') do (
        for /f "tokens=1 delims=." %%v in ('echo/%%t') do (
            set /a segundos = %%v
        )
    )

    echo/Espere um minuto
    set /a pontos=0
    set /a segundoMaster = segundos
    set /a umMinuto = segundos + 60

:loop
    set /a pontos += 1
    if !segundos! == !umMinuto! (
        cls
        msg * "!pontos!"
        pause>nul & exit
    )

    for /f "tokens=3 delims=:" %%t in ('echo/%time%') do (
        for /f "tokens=1 delims=." %%v in ('echo/%%t') do (
            set /a segundoAtual = %%v
            if !segundoAtual! NEQ !segundoMaster! ( 
                set /a segundoMaster = segundoAtual
                set /a segundos+=1
            )
        )
    )

goto loop