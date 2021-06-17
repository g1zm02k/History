XButton2::SetTimer, YourLabel, % (Toggle:=!Toggle) ? 100 : "Off"

YourLabel:
    SendInput {w down}{a down}
    sleep 1750 ;0
    SendInput {w up}{a up}
    mouseMove, 52, 0, 20, R
    SendInput {w down}{d down}
    sleep 1750 ;0
    SendInput {w up}{d up}
    mouseMove, -52, 0, 20, R
return