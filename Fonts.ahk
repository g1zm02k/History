gosub, getFonts
loop, parse, fontList, |
    fontCount := a_index
allFonts := fontList
thisLine = 0

gui, +resize
gui, add, ddl, section gSelectFont vfontType w270, % allFonts
gui, add, button, ys gChange, Next Font
gui, add, edit, ys w50
gui, add, updown, gFontSizeUD vfontSizeUD, 15
gui, add, edit, xm gInputText vinputText w400, The quick brown fox jumps over the lazy dog.
gui, font, s15
gui, add, text, w400 h60 0x1000 voutputText, The quick brown fox jumps over the lazy dog.
gui, show,, AHK Fonts
return

GuiClose:
exitapp

GuiSize:
if (a_eventinfo != 0)
	return
wingetpos, winX, winY, winW, winH, A
guicontrol, movedraw, OutputText, % "W" winW-35 "H" winH-110
return

FontSizeUD:
gui, submit, nohide
gui, font, s%fontSizeUD%
guicontrol, font, outputText
return

InputText:
gui, submit, nohide
guicontrol,, outputText, % InputText
return

Change:
thisLine++
if (thisLine = fontCount) 
	thisLine = 0
loop, parse, allFonts, |
{
	if (A_Index != thisLine)
		continue
	thisFont := A_LoopField
}
guicontrol, chooseString, fontType, % thisFont
gosub, makeChanges
return

SelectFont:
gui, submit, nohide
loop, parse, allFonts, |
{
	if (a_loopfield != fontType)
		continue
	thisFont := a_loopfield
	gosub, makeChanges
	break
}
return

MakeChanges:
gui, font, s15, %thisFont%
guicontrol, font, OutputText
guicontrol, movedraw, OutputText
return

getFonts:
fontList =
(
Abadi MT Condensed Light|Andale Mono|Arial|Arial Alternative Regular|Arial Alternative Symbol|Arial Black|Arial Bold|Arial Bold Italic|Arial Italic|Book Antiqua|Calisto MT|Century Gothic|Century Gothic Bold|Century Gothic Bold Italic|Century Gothic Italic|Comic Sans MS|Comic Sans MS Bold|Copperplate Gothic Bold|Copperplate Gothic Light|Courier|Courier New|Courier New Bold|Courier New Bold Italic|Courier New Italic|Estrangelo Edessa|Franklin Gothic Medium|Franklin Gothic Medium Italic|Gautami|Georgia|Georgia Bold|Georgia Bold Italic|Georgia Italic|Georgia Italic Impact|Impact|Latha|Lucida Console|Lucida Handwriting Italic|Lucida Sans Italic|Lucida Sans Unicode|Marlett|Matisse ITC|Modern|Modern MS Sans Serif|MS Sans Serif|MS Serif|Mv Boli|News Gothic MT|News Gothic MT Bold|News Gothic MT Italic|OCR A Extended|Palatino Linotype|Palatino Linotype Bold|Palatino Linotype Bold Italic|Palatino Linotype Italic|Roman|Script|Small Fonts|Smallfonts|Symbol|Tahoma|Tahoma Bold|Tempus Sans ITC|Times New Roman|Times New Roman Bold|Times New Roman Bold Italic|Times New Roman Italic|Trebuchet|Trebuchet Bold|Trebuchet Bold Italic|Trebuchet Italic|Trebuchet MS|Trebuchet MS Bold|Trebuchet MS Bold Italic|Trebuchet MS Italic|Tunga|Verdana|Verdana Bold|Verdana Bold Italic|Verdana Italic|Webdings|Westminster|Wingdings|WST_Czech|WST_Engl|WST_Fren|WST_Germ|WST_Ital|WST_Span|WST_Swed
)
return