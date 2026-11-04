$ErrorActionPreference = "Stop"
$projectRoot = $PSScriptRoot
$python = Join-Path $projectRoot ".venv\Scripts\python.exe"

if (-not (Test-Path $python)) {
    throw "Project virtualenv not found at $python"
}

Set-Location $projectRoot
& $python -m uvicorn app.main:app --app-dir (Join-Path $projectRoot "backend") --host 127.0.0.1 --port 8001
