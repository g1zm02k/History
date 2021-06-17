#MaxThreadsPerHotkey 2
F1::
  fTog:=!fTog
  Loop{
    If !fTog
      break
    ToolTip % A_Index
  }
  ToolTip
Return

F2::
  fTog:=1
  Loop{
    If !fTog
      break
    ToolTip % A_Index
  }
  ToolTip
Return

F3::fTog:=0
  