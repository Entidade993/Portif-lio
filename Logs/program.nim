import os, times, strutils

proc main() =
  while true:
    var logDir = ""
    when defined(windows):
      logDir = "C:\\Windows\\Logs"
    else:
      logDir = "/var/log"
    for arquivo in walkDir(logDir):
      if arquivo.kind == pcFile:
        try:
          let conteudo = readFile(arquivo.path)
          for linha in conteudo.splitLines():
            if linha.toLower().contains("erro"):
              echo now().format("HH:mm:ss") & " | " & arquivo.path & " | " & linha
        except IOError:
          discard
    sleep(5000)

main()