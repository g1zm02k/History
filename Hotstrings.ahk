:*?:p1``::
:*?:t1``::
Clipboard=
(
Noob question: How do I send a paragraph of text with a shortcut?

recently discovered AHK. For now, I'm just using it for text expansion.
What I intend to do is send a paragraph or two of text when I press Ctrl+q.
Can I do that?
)
If (SubStr(A_ThisHotkey,5,1)="p")
	Send ^v
Else
	SendInput % Clipboard
Return
