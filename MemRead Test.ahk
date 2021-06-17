pattern := hexStrToAOBPattern("30303a3034")
; hexString is a string of hex bytes (2-digits) without the '0x' hex prefix.
; eg.
; DEADBEEF
; A byte can be denoted wild by using two question marks (or any other character that isn't a hex number)
; DEAD??EF - the third byte  is wild
hexStrToAOBPattern(hexString)
{
	AOBPattern := []
	length := StrLen(hexString)
	if !length || Mod(length, 2)
		return -1 ; no str or string is not an even number of characters - 2 characters per byte
	loop, % length/2
	{
		value := "0x" SubStr(hexString, 1 + 2 * (A_index-1), 2)
		if (value + 0 = "")
			value := "?"
		AOBPattern.Insert(value)
	}
	return AOBPattern
}
msgbox % pattern