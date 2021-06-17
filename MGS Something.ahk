#NoEnv
#SingleInstance Force
#Include <BinFile>
SetTitleMatchMode 2
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, ToolTip, Screen

Gui, Font, s10, Lucida Console
Gui, Add, Text, x5 y5 w275 h30 vMaxHP, Not running.
Gui, Add, Text, x5 y20 w275 h30 vCurHP, Not running.
Gui, Add, Text, x5 y35 w275 h30 vCurWP, Not running.
Gui, Add, Text, x5 y50 w275 h30 vEquip, Not running.
Gui, Add, Text, x5 y65 w275 h30 vTimer, Not running.
Gui, Add, Text, x5 y80 w275 h30 vW1nam, Not running.
Gui, Add, Text, x5 y95 w275 h30 vW1lvl, Not running.
Gui, Add, Text, x5 y110 w275 h30 vW1nrg, Not running.
Gui, Add, Text, x5 y125 w275 h30 vW1max, Not running.
Gui, Add, Text, x5 y140 w275 h30 vW1cur, Not running.
Gui, Add, Text, x5 y155 w275 h30 vW1aaa, Not running.
Gui, Add, Text, x5 y170 w275 h30 vW1bbb, Not running.
Gui, Add, Text, x5 y185 w275 h30 vW1ccc, Not running.
Gui, Add, Button, x20 y225 w80 h28 vGMP, 5M GMP
Gui, Add, Button, x120 y225 w80 h28 vRes, Reset DP
Gui, Show, x550 y600 w220 h260, Demon Points
return

GuiClose:
ExitApp

file = f:\profile1.dat

byt := BinRead(file,bin,5,28)
Bin2Hex(hex,bin,byt)
MsgBox Hex = "%hex%"`nBin = "%bin%"`nByt = "%byt%"

Hex2Bin(hex,"FF000000FF")
bin := BinWrite(file,hex,5,28)
MsgBox Hex = "%hex%"`nBin = "%bin%"`nByt = "%byt%"

byt := BinRead(file,bin,5,28)
Bin2Hex(hex,bin,byt)
MsgBox Hex = "%hex%"`nBin = "%bin%"`nByt = "%byt%"
ExitApp

/*
res := BinWrite(file,b,17,0)
res := BinRead(file,data)
Bin2Hex(h,data,res)

res := BinWrite(file,b,3,-2)

&00#00::44 6F 30 34 31 32 32 30:0D 00 00 00 08 00 00 00:F3 24 02 00 00 E0 00 00
&18#24::02 00 00 00 03 00 00 00:01 00 00 00 00 00 00 00:00 00 00 00 00 00 00 00
                    ^^ <- !! -> ^^
                   &1C#28 ----> 5b

vLen=BR (File,vBin,bLen,bOff)
     B2H(vHex,vBin,vLen)

vLen=BW (File,vHex,bLen,bOff)
     H2B(vBin,vHex,vLen)


 * Hex2Bin(b,"000102030405060708090a0b0c0d0e0f00")
 * bytes := BinWrite(file,b,17,0)
 * bytes := BinRead(file,data)
 * Bin2Hex(hex,data,bytes)
 * MsgBox Data = "%hex%"
 * 
 * Hex2Bin(b,"aa00bb")
 * bytes := BinWrite(file,b,3,-2)
 * bytes := BinRead(file,data)
 * Bin2Hex(hex,data,bytes)
 * MsgBox Data = "%hex%"
 */
 