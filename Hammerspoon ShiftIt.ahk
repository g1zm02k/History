SysGet WA,MonitorWorkArea        ;WkArea Metrics
Global SX:=WALeft                ;Visible Scrn X
Global SY:=WATop                 ;Visible Scrn Y
Global SW:=WARight-WALeft        ;Visible Scrn W
Global SH:=WABottom-WATop        ;Visible Scrn H
Global DW:=SW/12                 ;Move by Dist W
Global DH:=SH/12                 ;Move by Dist H

^#!Left:: WinMove A,,SX  ,SY  ,SW/2,SH   ;LftHlf
^#!Right::WinMove A,,SW/2,SY  ,SW/2,SH   ;RgtHlf
^#!Up::   WinMove A,,SX  ,SY  ,SW  ,SH/2 ;TopHlf
^#!Down:: WinMove A,,SX  ,SH/2,SW  ,SH/2 ;BotHlf
^#!1::    WinMove A,,SX  ,SY  ,SW/2,SH/2 ;TopLft
^#!2::    WinMove A,,SW/2,SY  ,SW/2,SH/2 ;TopRgt
^#!3::    WinMove A,,SX  ,SH/2,SW/2,SH/2 ;BotLft
^#!4::    WinMove A,,SW/2,SH/2,SW/2,SH/2 ;BotRgt
^#!m::    WinMaximize A                  ;MaxWin
^#!c::    wm(  )                         ;Centre
^#!-::    wm(-1)                         ;Shrink
^#!=::    wm( 1)                         ;Bigger

wm(WD:=0){                       ;Default Centre
  WinGetPos WX,WY,WW,WH,A        ;Window Metrics
  If (WD>0){                     ;Bigger Windows
    WW+=DW
    WH+=DH                        
    WX-=DW/2
    WY-=DH/2
    WW:=% WW>=SW?SW:WW           ;Constrain MaxW
    WH:=% WH>=SH?SH:WH           ;Constrain MaxH
    WX:=% WX<=SX?SX:WX           ;Constrain MinX
    WY:=% WY<=SY?SY:WY           ;Constrain MinY
    WX:=% WX+WW>=SW?SW-WW:WX     ;Constrain MaxX
    WY:=% WY+WH>=SH?SH-WH:WY     ;Constrain MaxY
  }Else If (WD<0){               ;Shrink Windows
    If ((WX>SX)&&(WX+WW=SW)){      ;RH Side Only
      WX+=DW
      WW-=DW
    }Else If ((WX=SX)&&(WX+WW<SW)) ;LH Side Only
      WW-=DW
    Else{                          ;Neither/Both
      WX+=DW/2
      WW-=DW
    }
    If ((WY>SY)&&(WY+WH=SH)){      ;Up Side Only
      WY+=DH
      WH-=DH
    }Else If ((WY=SY)&&(WY+WH<SH)) ;Dn Side Only
      WH-=DH
    Else{                          ;Neither/Both
      WY+=DH/2
      WH-=DH
    }
  }Else{                           ;Centred Only
    WX:=(SW-WW)/2,WY=(SH-WH)/2
  }
  WinMove A,,WX,WY,WW,WH
}

