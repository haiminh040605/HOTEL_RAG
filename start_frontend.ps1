$ErrorActionPreference = "Stop"
$projectRoot = $PSScriptRoot
$frontend = Join-Path $projectRoot "frontend"
$npm = Get-Command npm.cmd -ErrorAction SilentlyContinue

if (-not $npm -and (Test-Path "C:\Program Files\nodejs\npm.cmd")) {
    $npmPath = "C:\Program Files\nodejs"
    $env:Path = "$npmPath;$env:Path"
    $npm = Get-Command npm.cmd -ErrorAction SilentlyContinue
}

if (-not $npm) {
    throw "npm.cmd not found. Install Node.js LTS and restart the terminal."
}

if (-not (Test-Path (Join-Path $frontend "node_modules"))) {
    throw "Frontend dependencies are missing. Run npm.cmd ci in the frontend directory."
}

Set-Location $frontend
& $npm.Source run dev
