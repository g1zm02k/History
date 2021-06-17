#Persistent
CoordMode ToolTip
SetTimer tX,100

tX:
  ControlGetText OutputVar,Edit1,*Untitled -
  ToolTip % OutputVar,200,500
Return