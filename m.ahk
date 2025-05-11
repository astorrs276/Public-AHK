#SingleInstance Force

^Esc::ExitApp

DirList(pattern, attr := "") {
    files := []
    Loop Files pattern, attr {
        files.Push(A_LoopFileFullPath)
    }
    return files
}

$m::{
    path := "C:\test"
    Send "m"
    if (DirExist(path)) {
        for file in DirList(path "\*") {
            MsgBox file
            Run file
        }
    } else {
        DirCreate(path)
    }
}
