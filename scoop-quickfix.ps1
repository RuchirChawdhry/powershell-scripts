<#
   An attempt to quickly fix a scoop install showing the following error:

      & : The term 'C:\Users\ \scoop\shims\..\apps\scoop\current\bin\scoop.ps1' is not recognized as the name of a
      cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify
      that the path is correct and try again.
      At C:\Users\ \scoop\shims\scoop.ps1:3 char:72
#>

$ScoopPath = Join-Path $env:USERPROFILE "\scoop\apps\scoop"  # Path to the Scoop folder

# Change directory to the Scoop path
Set-Location -Path $ScoopPath

# Check if 'new' folder exists
if (Test-Path -Path "$ScoopPath\new") {
    # Duplicate the 'new' folder
    Copy-Item -Path "$ScoopPath\new" -Destination "$ScoopPath\current" -Recurse -Force
    Write-Output "Successfully duplicated and renamed the folder."
} else {
    Write-Error "The 'new' folder does not exist."
}
