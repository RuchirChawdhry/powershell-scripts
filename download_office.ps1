$url = "https://otp.landian.vip/redirect/download.php?type=runtime&arch=x64&site=github"
$outputFolder = [System.IO.Path]::Combine([Environment]::GetFolderPath("UserProfile"), "Downloads")
$outputPath = Join-Path -Path $outputFolder -ChildPath "Office-Tool-Plus.zip"

Invoke-WebRequest -Uri $url -OutFile $outputPath
