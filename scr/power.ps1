$pcfg = powercfg /getactivescheme
$arr = $pcfg -split ' '

$economizador = "a1841308-3541-4fab-bc81-f71556f20b4a"
$balanceado = "381b4222-f694-41f0-9685-ff5bb260df2e"

$activeplan = $arr[5]
$mode = "eco"

If($activeplan -match $balanceado){
    powercfg.exe /setactive $economizador
    $mode = "eco"
}
Else{
    powercfg.exe /setactive $balanceado
    $mode = "bal"
}

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$objBalloon = New-Object System.Windows.Forms.NotifyIcon
$objBalloon.Icon = "C:\Program Files (x86)\Scripts\Power\icon.ico"

# You can use the value Info, Warning, Error
#$objBalloon.BalloonTipIcon = "Info"

$mytitle = "Energy"
if($mode -match "eco"){
$myplan = "Power saver mode"}
else{
$myplan = "Balanced mode"}

switch ($PSUICulture)
    {
        es-ES {
            $mytitle = "Energía"
            if($mode -match "eco"){
            $myplan = "Modo economizador"}
            else{
            $myplan = "Modo equilibrado"}
        }          

    }

# Put what you want to say here for the Start of the process
$objBalloon.BalloonTipTitle = $mytitle
$objBalloon.BalloonTipText = $myplan
$objBalloon.Visible = $True
$objBalloon.ShowBalloonTip(500)  
$objBalloon.dispose()   