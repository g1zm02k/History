#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
CoordMode ToolTip
SetBatchLines -1
CoordMode Mouse
CoordMode Pixel
SendMode Input

;Init

dBUG:=1,nBUG:=oBUG:=""                     ;## Debug 1/2 ##
If dBUG{
  SetTimer tBUG,50
  Gui gBUG:New,+AlwaysOnTop +ToolWindow
  Gui Font,s9,Consolas
  Gui Add,Text,x2 y0 w140 h140 vTXT
  Gui Show,NoActivate x200 y800 w144 h140,Debug
  WinSet Transparent,200,Debug
}                                          ;## DeEnd 1/2 ##

;Main
F2::Gui % (fBUG:=!fBUG)?"gBUG:Hide":"gBUG:Show",NoActivate
Esc::ExitApp

gBUGGuiClose:
	ExitApp

tBUG:                                      ;## Debug 2/2 ##
  nBUG:="+                  +"  "`n"
  nBUG.="                    "  "`n"
  nBUG.="                    "  "`n"
  nBUG.="                    "  "`n"
  nBUG.="                    "  "`n"
  nBUG.="                    "  "`n"
  nBUG.="                    "  "`n"
  nBUG.="                    "  "`n"
  nBUG.="                    "  "`n"
  nBUG.="+                  +"
  If (nBUG!=oBUG){
    GuiControl gBUG:,TXT,% nBUG
    oBUG:=nBUG
  }
Return                                     ;## DeEnd 2/2 ##
