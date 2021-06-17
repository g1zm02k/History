#NoEnv
#SingleInstance Force
URL:="https://api.openweathermap.org/data/2.5/onecall?lat=54.9783&lon=1.6178&units=metric&exclude=current,minutely,hourly,alerts&appid=1c2583730735486a1a05bd4da622cf89"
URL:="https://loadingartist.com/comic/tongue-tied/"
TMP:="D:\downloads\htm.txt"
URLDownloadToFile % URL, % TMP
;https://api.openweathermap.org/data/2.5/onecall?lat=54.9783&lon=1.6178
;  &units=metric
;  &exclude=current,minutely,hourly,daily,alerts
;  &appid=1c2583730735486a1a05bd4da622cf89"
;Msb(URL)
;ExitApp