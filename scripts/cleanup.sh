#!/usr/bin/env bash
set -euo pipefail

ROOT="$(pwd)"
FILES=("app.js" "package-lock.json")

for f in "${FILES[@]}"; do
  if [ -e "$ROOT/$f" ]; then
    echo "Removendo $f"
    rm -rf "$ROOT/$f"
  else
    echo "Não existe: $f"
  fi
done

if [ -d "$ROOT/.github" ]; then
  if [ ! -d "$ROOT/myExpressApp/.github" ]; then
    echo "Movendo .github para myExpressApp/.github"
    mv "$ROOT/.github" "$ROOT/myExpressApp/.github"
  else
    echo "Destino já existe: myExpressApp/.github"
  fi
else
  echo ".github não encontrada em $ROOT"
fi
