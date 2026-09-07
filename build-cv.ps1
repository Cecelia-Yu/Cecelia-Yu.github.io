param()
$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    New-Item -ItemType Directory -Force '.cv-build' | Out-Null
    for ($pass = 0; $pass -lt 2; $pass++) {
        & pdflatex -interaction=nonstopmode -halt-on-error '-output-directory=.cv-build' files/WanyangYu_CV.tex
        if ($LASTEXITCODE -ne 0) { throw 'LaTeX compilation failed. See .cv-build/WanyangYu_CV.log.' }
    }
    Copy-Item -LiteralPath '.cv-build/WanyangYu_CV.pdf' -Destination 'files/WanyangYu_CV.pdf' -Force
    Write-Host 'Updated files/WanyangYu_CV.pdf'
} finally { Pop-Location }

