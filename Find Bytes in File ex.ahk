;Find the first occurance of the magic number in filename.ext
start := findBytes("filename.ext", 1, 0x88, 0x16, 0x88, 0x58)
;Find the second occurance of the magic number in filename.ext
end := findBytes("filename.ext", 2, 0x88, 0x16, 0x88, 0x58)

if (start and end)
  saveBytes("filename.ext", "kernel", start, end) ;Save content in filename.ext from start to end into kernel
else
  Msgbox Could not find magic bytes

start := findBytes("filename.ext", 1, 0x1F, 0x8B, 0x08)
saveBytes("filename.ext", "ramdisk.gz", start) ;Save content in filename.ext from start to end of the file into ramdisk.gz
return

;Searches for a sequence of bytes in "file", starting from the beginning of the file
;If the byte sequence occurs multiple times, you can search for each occurance with the "occurance" parameter
;This function is variadic, meaning you can specify as many or as few bytes as you wish, each as its own parameter
findBytes(file, occurance, bytes*)
{
  file := FileOpen(file, "r") ;Open file for reading
  matchesFound := 0, file.Pos := 0, searchByte := bytes[1]
  Loop, % file.Length
  {
    if (file.ReadUChar() = searchByte)
    { ;The first byte matches, check to see if the rest match
      oldpos := file.Pos, file.Pos-- ;Save starting pos
      for k,v in bytes
      {
        if (file.ReadUChar() != v)
        { ;Only a partial match
          file.Pos := oldpos ;Reset file ptr t
          continue, 2 ;Break to outer loop
        }
      }
      ;This is a match, but might not be the right occurance
      if (++matchesFound = occurance)
      {
        file.close()
        return oldpos-1 ;We're done
      }
      file.Pos := oldpos
    }
  }
  file.close()
  return 0 ;We went through the whole file without finding a match
}

;Save the the binary content of "sourceFile" between "start" (inclusive) and "end" (exclusive)
;The output file is "destFile"
;If "end" is not specified, it defaults to the last byte of the source file
saveBytes(sourceFile, destFile, start, end="")
{
  sourceFile := FileOpen(sourceFile, "r"), destFile := FileOpen(destFile, "w")
  if (end = "")
    end := sourceFile.Length
  numBytes := end-start
  VarSetCapacity(temp, numBytes)
  sourceFile.Pos := start
  sourceFile.RawRead(temp, numBytes)
  sourceFile.close()
  destFile.Pos := 0
  destFile.Length := numBytes
  destFile.RawWrite(temp, numBytes)
  destFile.close()
}