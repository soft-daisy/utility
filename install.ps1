# Hi+OPTIMIZER (Free) - one-line installer/launcher
# Usage:  irm https://raw.githubusercontent.com/soft-daisy/utility/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

# --- EDIT THESE TWO LINES if your repo's branch or filename differs ---
$branch   = "main"
$fileName = "HI.OPTIMIZER.bat"
# -----------------------------------------------------------------------

$batUrl  = "https://raw.githubusercontent.com/soft-daisy/utility/refs/heads/main/HI.OPTIMIZER.bat"
$batPath = Join-Path $env:TEMP "HiOptimizer.bat"

Write-Host ""
Write-Host "  Hi+OPTIMIZER (Free) - downloading..." -ForegroundColor Cyan
Write-Host ""

try {
    Invoke-WebRequest -Uri $batUrl -OutFile $batPath -UseBasicParsing
}
catch {
    Write-Host "  Download failed. Check your internet connection or try again." -ForegroundColor Red
    Write-Host "  URL: $batUrl" -ForegroundColor DarkGray
    exit 1
}

Write-Host "  Launching Hi+OPTIMIZER (you'll get a UAC prompt - it needs admin rights)..." -ForegroundColor Cyan
Write-Host ""

# The tool needs Administrator, so relaunch elevated
Start-Process -FilePath $batPath -Verb RunAs
