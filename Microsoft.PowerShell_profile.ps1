# variables
$work = "C:/work/"


# alias
Set-Alias -name la -value Get-ChildItem -force | Sort-Object {$_.Name}
Set-Alias -name which -value where.exe


# prompt
function Prompt {
    # inplace HOME to ~
    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower())){
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    # omit long path
    $maxPathLength = 40
    if ($curPath.Length -gt $maxPathLength) {
        $curPath = '...' + $curPath.SubString($curPath.Length - $maxPathLength + 3)
    }
    $host.UI.WriteLine("")
    $host.UI.Write("[")
    $host.UI.Write("Cyan", $host.UI.RawUI.BackgroundColor, $env:USERNAME)
    $host.UI.Write("@")
    $host.UI.Write("Cyan", $host.UI.RawUI.BackgroundColor, $env:COMPUTERNAME)
    $host.UI.Write("] ")
    $host.UI.Write("Yellow", $host.UI.RawUI.BackgroundColor, "> ")
    $host.UI.WriteLine("Green", $host.UI.RawUI.BackgroundColor, $curPath)
    $host.UI.Write("Red", $host.UI.RawUI.BackgroundColor, ">")
    $host.UI.Write("Yellow", $host.UI.RawUI.BackgroundColor, ">")
    $host.UI.Write("Green", $host.UI.RawUI.BackgroundColor, ">")
    " "
}
