param (
    [Parameter(Mandatory=$true)][string]$apkPath
)

cd "C:\Users\joach\Desktop\measuring-the-metaverse"
#cd $MyInvocation.MyCommand.Path

Write-Host "Stopping VR monitor..."
# Stop-Job -Id $VrJob
Write-Host "Stopping host monitor..."
# Stop-Job -Id $HostJob
adb shell am force-stop com.AtlargeResearch.Opencraft2

$apkName = Split-Path $apkPath -LeafBase

$apkName = ".\measurements\" + $apkName

if(Test-Path $apkName){
    rm -r $apkName
}

mkdir $apkName | Out-Null
echo $apkName
mv ./uptime.log $apkName\uptime.log
mv ./net_dev.log $apkName\net_dev.log
mv ./meminfo.log $apkName\meminfo.log
mv ./stat.log $apkName\stat.log
mv ./loadavg.log $apkName\loadavg.log
mv ./battery.log $apkName\battery.log
mv ./OVRRemoteService.log $apkName\OVRRemoteService.log
mv ./CompanionService.log $apkName\CompanionService.log


