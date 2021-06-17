; Alternative Font Dialog
#NoEnv
#Warn

Global hFontDlg := 0
Global FontList := []

Menu Tray, Icon, main.cpl, 4

GoSub ShowFontDialog
Return

ShowFontDialog:
    Gui FontDlg: New, LabelFontDlg hWndhFontDlg
    Gui Color, 0xFEFEFE

    Gui Add, CheckBox, vChkFontName gPreviewFont x10 y12 w152 h23, Font name:
    Gui Add, Edit, vEdtFontName gDisplayFontName x10 y38 w152 h23, Ms Shell Dlg
    Gui Add, ListBox, vLbxFontName gDisplayFontName x10 y66 w152 h160 -HScroll Sort

    Gui Add, CheckBox, vChkFontWeight gPreviewFont x170 y12 w100 h23, Weight:
    Gui Add, Edit, vEdtFontWeight gDisplayFontWeight x170 y38 w100 h23, Norm
    Gui Add, ListBox, vLbxFontWeight gDisplayFontWeight x170 y66 w100 h43, Regular|Semibold|Bold

    Gui Add, CheckBox, vChkFontSize gPreviewFont x278 y12 w60 h23, Size:
    Gui Add, Edit, vEdtFontSize gDisplayFontSize x278 y38 w60 h23, 8
    Gui Add, ListBox, vLbxFontSize gDisplayFontSize x278 y66 w60 h160, 8|9|10|11|12|13|14|15|16|17|18|20

    Gui Add, CheckBox, vChkFontColor gPreviewFont x346 y12 w60 h23, Color:
    Gui Add, ListView, vFontColorPreview gChooseFontColor x434 y14 w16 h16 -Hdr +Border AltSubmit
    Gui Add, ComboBox, vCbxFontColor gDisplayFontColor x346 y38 w106, 0x003399|0x0066CC|0x3399FF|0x1E75BB|0x0090B3|0x00AEFF
    Gui Add, ListBox, vLbxFontColor gDisplayFontColor x346 y66 w107 h160
    , Black|Blue|Navy|Green|Teal|Olive|Maroon|Red|Purple|Fuchsia|Lime|Yellow|Aqua|Gray|Silver|White

    Gui Add, CheckBox, vChkItalic gPreviewFont x170 y112 w100 h23, Italic
    Gui Add, CheckBox, vChkUnderline gPreviewFont x170 y134 w100 h23, Underline
    Gui Add, CheckBox, vChkStrikeout gPreviewFont x170 y156 w100 h23, Strikeout
    Gui Add, CheckBox, vChkQuality gPreviewFont x170 y180 w100 h21, Quality:
    Gui Add, DropDownList, vCbxQuality gCheckQuality x170 y205 w100 AltSubmit, Default||Draft|Proof|Non-antialiased|Antialiased|Cleartype

    Gui Add, Text, vSampleText gSetSampleText x10 y234 w443 h44 +0x201 +E0x200

    Gui Add, ListView, x-1 y286 w467 h49 Disabled
    Gui Add, Button, gFontDlgOK x154 y299 w75 h23 Default, &OK
    Gui Add, Button, gFontDlgClose x234 y299 w75 h23, &Cancel

    Gui Show, w464 h334, Font

    LoadFonts()

    PopulateDialogFields("Segoe UI", "s12 c0x003399", "Automation. Hotkeys. Scripting")
Return

FontDlgEscape:
FontDlgClose:
    ;Gui FontDlg: Cancel
    ExitApp
Return

LoadFonts() {
    EnumFonts()

    Loop % FontList.MaxIndex() {
        GuiControl,, LbxFontName, % FontList[A_Index]
    }

    GuiControl,, LbxFontName, Ms Shell Dlg
    GuiControl,, LbxFontName, Ms Shell Dlg 2
}

EnumFonts() {
    hDC := DllCall("GetDC", "UInt", DllCall("GetDesktopWindow"))
    Callback := RegisterCallback("EnumFontsCallback", "F")
    DllCall("EnumFontFamilies", "UInt", hDC, "UInt", 0, "Ptr", Callback, "UInt", lParam := 0)
    DllCall("ReleaseDC", "UInt", hDC)
}

EnumFontsCallback(lpelf) {
    FontList.Push(StrGet(lpelf + 28, 32))
    Return True
}

PreviewFont:
    Gui FontDlg: Default

    Gui Font ; Reset
    GuiControl Font, SampleText

    GetFontOptions(FontName, Options)

    Separator := ""
    If (Options != "" && FontName != "") {
        Separator := ", "
    }

    WinSetTitle % "Font: " . FontName . Separator . Options

    If (Options != "" || FontName != "") {
        Gui Font, %Options%, %FontName%
        GuiControl Font, SampleText
    }
Return

DisplayFontName:
    Gui FontDlg: Submit, NoHide

    GuiControl,, ChkFontName, 1
    If (A_GuiControl != "EdtFontName") {
        GuiControl,, EdtFontName, % LbxFontName
    } Else {
        GuiControl ChooseString, LbxFontName, % EdtFontName
    }

    GoSub PreviewFont
Return

DisplayFontWeight:
    Gui FontDlg: Submit, NoHide

    GuiControl,, ChkFontWeight, 1
    If (A_GuiControl != "EdtFontWeight") {
        Weight := LbxFontWeight
        If (Weight = "Regular") {
            Weight := "Norm"
        } Else If (Weight = "Semibold") {
            Weight := "600"
        } Else {
            Weight := "Bold"
        }
        GuiControl,, EdtFontWeight, % Weight
    } Else {
        Weight := EdtFontWeight
        If Weight is Integer
        {
            If (Weight < 551) {
                Weight := "Regular"
            } Else If (Weight > 550 && Weight < 612) {
                Weight := "Semibold"
            } Else {
                Weight := "Bold"
            }
        }
        GuiControl ChooseString, LbxFontWeight, % Weight
    }

    GoSub PreviewFont
Return

CheckQuality:
    GuiControl,, ChkQuality, 1
    GoSub PreviewFont
Return

DisplayFontSize:
    Gui FontDlg: Submit, NoHide

    GuiControl,, ChkFontSize, 1
    If (A_GuiControl != "EdtFontSize") {
        GuiControl,, EdtFontSize, % LbxFontSize
    } Else {
        GuiControl ChooseString, LbxFontSize, % EdtFontSize
    }

    GoSub PreviewFont
Return

DisplayFontColor:
    Gui FontDlg: Submit, NoHide

    GuiControl,, ChkFontColor, 1
    If (A_GuiControl != "CbxFontColor") {
        GuiControl Text, CbxFontColor, %LbxFontColor%
    }

    GoSub PreviewFont
Return

ChooseFontColor:
    If (A_GuiEvent = "Normal") {
        Color := "0x0080C0"
        If (ChooseColor(Color, hFontDlg)) {
            Gui FontDlg: Default
            GuiControl +Background%Color%, FontColorPreview
            GuiControl Text, CbxFontColor, %Color%
            GuiControl,, ChkFontColor, 1
            GoSub PreviewFont
        }
    }
Return

GetFontOptions(ByRef FontName, ByRef Options) {
    Global

    Gui FontDlg: Default
    Gui Submit, NoHide

    FontName := "", Options := ""

    If (ChkFontName) {
        FontName := EdtFontName
    }
    If (ChkFontSize) {
        If (EdtFontSize != "") {
            Options .= "s" . EdtFontSize . " "
        }
    }
    If (ChkFontWeight) {
        If EdtFontWeight is Integer
            Options .= "w"
        Options .= EdtFontWeight . " "
    }
    If (ChkItalic) {
        Options .= "Italic "
    }
    If (ChkUnderline) {
        Options .= "Underline "
    }
    If (ChkStrikeout) {
        Options .= "Strike "
    }
    If (ChkQuality) {
        Options .= "q" . (CbxQuality - 1) . " "
    }
    If (ChkFontColor) {
        If (CbxFontColor != "") {
            Options .= "c" . CbxFontColor
            GuiControl +Background%CbxFontColor%, FontColorPreview
        }
    }

    Options := RTrim(Options)
}

FontDlgOK:
    GetFontOptions(FontName, FontOptions)

    If (FontOptions != "") {
        FontOptions := " " . FontOptions
    }

    If (FontName != "") {
        FontName := ", " . FontName
    }

    Output := % "Gui Font," . FontOptions . FontName

    Clipboard := Output
    MsgBox 0, Font, Copied to the Clipboard:`n`n%Output%

    ;GoSub FontDlgClose
Return

SetSampleText:
    Gui +OwnDialogs
    InputBox, NewSampleText, Sample Text, New Text:,,,,,,,, Sample Text
    If (!ErrorLevel && NewSampleText != "") {
        GuiControl,, SampleText, %NewSampleText%
    }
Return

PopulateDialogFields(FontName, Options, Text := "Sample Text") {
    If (FontName != "") {
        GuiControl,, ChkFontName, 1
        GuiControl,, EdtFontName, % FontName
        GuiControl ChooseString, LbxFontName, % FontName
    }

    If (Options != "") {
        Options := StrSplit(Options, " ")
        Loop % Options.MaxIndex() {
            If (Options[A_Index] ~= "^w") {
                FontWeight := SubStr(Options[A_Index], 2)
                GuiControl,, ChkFontWeight, 1
                GuiControl,, EdtFontWeight, % FontWeight
                If (FontWeight < 551) {
                    GuiControl ChooseString, LbxFontWeight, Regular
                } Else If (FontWeight > 550 && FontWeight < 612) {
                    GuiControl ChooseString, LbxFontWeight, Semibold
                } Else {
                    GuiControl ChooseString, LbxFontWeight, Bold
                }
            }
            If (Options[A_Index] = "Bold") {
                GuiControl,, ChkFontWeight, 1
                GuiControl,, EdtFontWeight, Bold
                GuiControl ChooseString, LbxFontWeight, Bold
            }
            If (Options[A_Index] = "Italic") {
                GuiControl,, ChkItalic, 1
            }
            If (Options[A_Index] = "Underline") {
                GuiControl,, ChkUnderline, 1
            }
            If (Options[A_Index] = "Strike") {
                GuiControl,, ChkStrikeout, 1
            }
            If (Options[A_Index] ~= "^q") {
                FontQuality := SubStr(Options[A_Index], 2)
                GuiControl,, ChkQuality, 1
                GuiControl Choose, CbxQuality, % (FontQuality + 1)
            }
            If (Options[A_Index] ~= "^s") {
                FontSize := SubStr(Options[A_Index], 2)
                GuiControl,, ChkFontSize, 1
                GuiControl,, EdtFontSize, % FontSize
                GuiControl ChooseString, LbxFontSize, % FontSize
            }
            If (Options[A_Index] ~= "^c") {
                FontColor := SubStr(Options[A_Index], 2)
                GuiControl,, ChkFontColor, 1
                GuiControl ChooseString, LbxFontColor, % FontColor
                GuiControl Text, CbxFontColor, %FontColor%
            }
        }
    }

    If (Text != "") {
        GuiControl,, SampleText, %Text%
    }

    GoSub PreviewFont
}

ChooseColor(ByRef Color, hOwner := 0) {
    rgbResult := ((Color & 0xFF) << 16) + (Color & 0xFF00) + ((Color >> 16) & 0xFF)

    VarSetCapacity(CHOOSECOLOR, 36, 0)
    VarSetCapacity(CUSTOM, 64, 0)
    NumPut(36, CHOOSECOLOR, 0) ; DWORD lStructSize
    NumPut(hOwner, CHOOSECOLOR, 4)
    NumPut(rgbResult, CHOOSECOLOR, 12)
    NumPut(&CUSTOM, CHOOSECOLOR, 16) ; COLORREF *lpCustColors
    NumPut(0x103, CHOOSECOLOR, 20) ; Flags: CC_ANYCOLOR || CC_RGBINIT

    RetVal := DllCall("comdlg32\ChooseColorA", "Str", CHOOSECOLOR)
    If (ErrorLevel != 0) || (RetVal = 0) {
        Return False
    }

    rgbResult := NumGet(CHOOSECOLOR, 12)

    OldFormat := A_FormatInteger
    SetFormat Integer, Hex
    Color := (rgbResult & 0xFF00) + ((rgbResult & 0xFF0000) >> 16) + ((rgbResult & 0xFF) << 16)
    StringTrimLeft Color, Color, 2
    Loop % 6 - StrLen(Color) {
        Color := "0" . Color
    }
    Color := "0x" . Color
    SetFormat Integer, %OldFormat%
    Return True
}
