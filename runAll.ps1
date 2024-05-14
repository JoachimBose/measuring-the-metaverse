# Set the directory path
$directoryPath = "./Apks"

# Get all files in the specified directory
$files = Get-ChildItem -Path $directoryPath

# Loop through each file
foreach ($file in $files) {
    # Check if it's a file (not a directory)
    if ($file.GetType() -eq [System.IO.FileInfo]) {
        # Perform any action you want here
        # For example, you can print the file name
        Write-Host "Now running: $($file.Name)"

        adb install $file

        

        Write-Host "uninstalling"
        adb shell pm uninstall com.AtlargeResearch.Opencraft2
    }
}
