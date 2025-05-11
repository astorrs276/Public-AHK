#SingleInstance Force

^Esc::ExitApp

DirList(pattern, attr := "") {
    files := []
    Loop Files pattern, attr {
        files.Push(A_LoopFileFullPath)
    }
    return files
}

$g::{
    path := "C:\test"
    Send "g"
    if (DirExist(path)) {
        for file in DirList(path "\*") {
            MsgBox file
            Run file
        }
    } else {
        DirCreate(path)
    }
}
