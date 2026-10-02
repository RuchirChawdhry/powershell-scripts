$ErrorActionPreference = 'Stop'

# $ScoopGlobalRoot = 'C:\Tools\Scoop'
$ScoopUserRoot   = Join-Path $HOME 'Tools\Scoop'

# Persist Scoop root for future shells
[Environment]::SetEnvironmentVariable('SCOOP', $ScoopUserRoot, 'User')
$env:SCOOP = $ScoopUserRoot

# Install Scoop if missing
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    $installer = Join-Path $env:TEMP 'install-scoop.ps1'

    Invoke-RestMethod https://get.scoop.sh -OutFile $installer

    & $installer -ScoopDir $ScoopUserRoot

    # Make shims immediately available in this shell
    $env:PATH += ";$ScoopUserRoot\shims"
}

# Packages I want on every machine
$packages = @(
    'git'
    '7zip'
    'aria2'
    'curl'
    'jq'
    'ripgrep'
    'fd'
    'fzf'
    'go'
    'yq'
    'nano'
    'rclone'
)

$apps = @(
    'powertoys'
    'vscode'
    ''
)

$buckets = @(
    'extras'
    'nirsoft'
    'java'
)

foreach ($package in $packages) {
    scoop install $package
}

foreach ($bucket in $buckets) {
    scoop bucket add $bucket
}

foreach ($app in $apps) {
    scoop install $app
}