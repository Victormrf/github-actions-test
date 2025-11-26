# Scripts de limpeza

Arquivos adicionados:

- `scripts/cleanup.ps1` — script PowerShell para executar no terminal do VSCode (Windows PowerShell)
- `scripts/cleanup.sh` — script Bash (WSL, Git Bash ou Linux/macOS)

Uso (PowerShell):

Executar com confirmação interativa:

```powershell
.\scripts\cleanup.ps1
```

Executar sem prompts (forçar):

```powershell
.\scripts\cleanup.ps1 -Force
```

Comandos PowerShell diretos (one-liners) — rodar a partir da raiz do repositório:

```powershell
Remove-Item -Path .\app.js -Force -Recurse; Remove-Item -Path .\package-lock.json -Force -Recurse
if (Test-Path .\.github) { if (-not (Test-Path .\myExpressApp\.github)) { Move-Item -Path .\.github -Destination .\myExpressApp\.github -Force } else { Write-Host 'Destino myExpressApp\.github já existe. Abortando.' } } else { Write-Host '.github não encontrada' }
```

Uso (bash / WSL):

```bash
./scripts/cleanup.sh
```

Observações:

- Os scripts verificam existência dos arquivos/pastas antes de agir.
- Faça commit/backup se quiser preservar os arquivos antes de removê-los.
- Se desejar que eu execute o script e faça o commit/ajuste no repositório, peça para eu prosseguir.
