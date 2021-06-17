;======================================================================================================
LegendOfGrimrock:
;======================================================================================================
;Edit the following variables to match your screen resolution's coordinates for all of these things.
;   The following values work for a 1920x1200 resolution... and probably not anything else.
;
;To find the values, install AutoHotKey if you haven't already, then run it. Right click on the AHK
;   systray icon, and select Window Spy. With that dialog visible, play the game and take note of
;   the coordinates of each of the following variables (see the comment to the right for what you
;   should be hovering over).
;------------------------------------------------------------------------------------------------------
;Original idea and code by Essobie


;changed for 1920x1080


colA := 1540      ; X Axis of the left hands of the left side characters.
colB := 1620      ; X Axis of the right hands of the left side characters.
colC := 1750      ; X Axis of the left hands of the right side characters.
colD := 1850      ; X Axis of the right hands of the right side characters.
row1 := 850      ; Y Axis of the top row characters.
row2 := 1000      ; Y Axis of the bottom row characters.

;for bottom left spellcaster
spellColLft := 1720   ; X Axis of the Spell Button Left Column.
spellColMid := 1770   ; X Axis of the Spell Button Middle Column.
spellColRgt := 1810   ; X Axis of the Spell Button Right Column.
spellColFar := 1860   ; X Axis of the Spell Button Enter and Cancel Column.
spellRowTop := 950    ; Y Axis of the Spell Button Top Row.
spellRowMid := 990    ; Y Axis of the Spell Button Middle Row.
spellRowBot := 1030   ; Y Axis of the Spell Button Bottom Row.

exit



;-----------------
;Hand Right Clicks
;-----------------
1LeftHand() {
global colA
global row1
Click right %colA%, %row1%
}
1RightHand() {
global colB
global row1
Click right %colB%, %row1%
}
2LeftHand() {
global colC
global row1
Click right %colC%, %row1%
}
2RightHand() {
global colD
global row1
Click right %colD%, %row1%
}
3LeftHand() {
global colA
global row2
Click right %colA%, %row2%
}
3RightHand() {
global colB
global row2
Click right %colB%, %row2%
}
4LeftHand() {
global colC
global row2
Click right %colC%, %row2%
}
4RightHand() {
global colD
global row2
Click right %colD%, %row2%
}

;--------------------
;NumbPad Spellcasting
;--------------------
spellNP1() {
global spellColLft
global spellRowBot
Click right %spellColLft%, %spellRowBot%
}
spellNP2() {
global spellColMid
global spellRowBot
Click right %spellColMid%, %spellRowBot%
}
spellNP3() {
global spellColRgt
global spellRowBot
Click right %spellColRgt%, %spellRowBot%
}
spellNP4() {
global spellColLft
global spellRowMid
Click right %spellColLft%, %spellRowMid%
}
spellNP5() {
global spellColMid
global spellRowMid
Click right %spellColMid%, %spellRowMid%
}
spellNP6() {
global spellColRgt
global spellRowMid
Click right %spellColRgt%, %spellRowMid%
}
spellNP7() {
global spellColLft
global spellRowTop
Click right %spellColLft%, %spellRowTop%
}
spellNP8() {
global spellColMid
global spellRowTop
Click right %spellColMid%, %spellRowTop%
}
spellNP9() {
global spellColRgt
global spellRowTop
Click right %spellColRgt%, %spellRowTop%
}
spellNPEnter() {
global spellColFar
global spellRowBot
Click right %spellColFar%, %spellRowBot%
}
spellNPCancel() {
global spellColFar
global spellRowTop
Click right %spellColFar%, %spellRowTop%
}

;--------------------
;Quick Spells
;--------------------
spellFireburst() {
   spellNPEnter()
   spellNP7()
   spellNPEnter()
}
spellIceShards() {
   spellNPEnter()
   spellNP1()
   spellNP3()
   spellNPEnter()
}
spellPoisonCloud() {
   spellNPEnter()
   spellNP1()
   spellNPEnter()
}
spellShock() {
   spellNPEnter()
   spellNP9()
   spellNPEnter()
}
spellPoisonBolt() {
   spellNPEnter()
   spellNP1()
   spellNP9()
   spellNPEnter()
}
spellInvisibility() {
   spellNPEnter()
   spellNP2()
   spellNP5()
   spellNP9()
   spellNPEnter()
}

;-------
;Hotkeys
;-------
#IfWinActive, Legend of Grimrock

;changed for azerty

u::1LeftHand()
i::1RightHand()
o::2LeftHand()
p::2RightHand()
j::3LeftHand()
k::3RightHand()
l::4LeftHand()
m::4RightHand()      ; You have to use the escape character `; to use semicolon for a hotkey!

NumPad0::4LeftHand()	;I use lefthand for wand - quicker shortcut to initiate spellcasting
NumPad1::spellNP1()
NumPad2::spellNP2()
NumPad3::spellNP3()
NumPad4::spellNP4()
NumPad5::spellNP5()
NumPad6::spellNP6()
NumPad7::spellNP7()
NumPad8::spellNP8()
NumPad9::spellNP9()
NumPadAdd::spellNPCancel()
NumPadEnter::spellNPEnter()
return