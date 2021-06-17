Menu, Tray, Add
Menu, Tray, Add, Show, gshow
Menu, Tray, Default, Show
Menu, Tray, Click, 1
Gui, +ToolWindow
Gui, Font, bold
Gui, Add, Text, w25, String:
Gui, Font
Gui, Add, Edit, vstring w175
Gui, Add, Button, section gConv default, Convert!
Gui, Add, Radio, vcb2t ys+5, bin2text
Gui, Add, Radio, vct2b ys+5 checked, txt2bin
gshow:
Gui, Show,, 0110001000110010011101002
Return

Conv:
Gui, Submit, NoHide
if cb2t  = 1
	txt := bin2txt(string)
else
	txt := txt2bin(string)
clipboard = %txt%
Msgbox, %txt%
Return

bin2txt(string) 
{ 
autotrim, off 
loop 
{ 
var=128 
ascii=0
StringRight, byte, string, 8 
if byte= 
break 
StringTrimRight, string, string, 8 
Loop, parse, byte 
{ 
if a_loopfield = 1 
ascii+=%var% 
var/=2 
} 
transform, text, Chr, %ascii% 
alltext=%text%%alltext% 
} 
autotrim, on 
return alltext 
}
txt2bin(string) 
{ 
	Loop, parse, string 
	{ 
		var=128 
		Transform, tobin, Asc, %A_LoopField% 
		loop, 8 
		{ 
			oldtobin=%tobin% 
			tobin:=tobin-var 
			transform, isnegative, Log, %tobin% 
			value=1 
			if isnegative= 
			{ 
				tobin=%oldtobin% 
				value=0 
			} 
			var/=2 
			allvalues=%allvalues%%value% 
		} 
	} 
	return allvalues 
}
Return
GuiClose:
ExitApp