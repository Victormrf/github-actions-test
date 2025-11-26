param(
    [switch]$Force
)

$root = Get-Location

$filesToRemove = @("app.js","package-lock.json")
$githubSrc = Join-Path $root ".github"
$githubDst = Join-Path $root "myExpressApp\.github"

foreach ($f in $filesToRemove) {
    $path = Join-Path $root $f
    if (Test-Path $path) {
        if ($Force -or (Read-Host "Remover '$f'? Digite Y para confirmar") -match '^[Yy]') {
            Remove-Item $path -Force -Recurse
            Write-Host "Removido: $path"
        } else {
            Write-Host "Pulando: $path"
        }
    } else {
        Write-Host "Não existe: $path"
    }
}

if (Test-Path $githubSrc) {
    if (-not (Test-Path $githubDst)) {
        if ($Force -or (Read-Host "Mover '.github' para 'myExpressApp'? Digite Y para confirmar") -match '^[Yy]') {
            Move-Item $githubSrc $githubDst -Force
            Write-Host "Movido '.github' para $githubDst"
        } else {
            Write-Host "Pulando mover .github"
        }
    } else {
        Write-Host "Destino já existe: $githubDst. Abortando mova manualmente."
    }
} else {
    Write-Host "Pasta '.github' não encontrada em $root"
}
