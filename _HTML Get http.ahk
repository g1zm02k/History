GetWebPage(WebPage)
{
  whr:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
  whr.Open("GET",WebPage,True)
  whr.Send()
  whr.WaitForResponse()
  RefSource:=whr.ResponseText
  Return RefSource
}