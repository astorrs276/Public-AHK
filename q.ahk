#SingleInstance Force

^Esc::ExitApp

DirList(pattern, attr := "") {
    files := []
    Loop Files pattern, attr {
        files.Push(A_LoopFileFullPath)
    }
    return files
}

$q::{
    path := "C:\test"
    Send "q"
    if (DirExist(path)) {
        for file in DirList(path "\*") {
            MsgBox file
            Run file
        }
    } else {
        DirCreate(path)
    }
}
