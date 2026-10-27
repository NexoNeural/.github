#!/usr/bin/env bash
# Crea o actualiza en un repositorio las etiquetas estándar de etiquetas.txt.
# Nunca borra etiquetas: solo crea las que faltan y actualiza color y descripción de las que ya existen.
#
# Uso:
#   bash etiquetas/sincronizar-etiquetas.sh ORGANIZACION/REPOSITORIO --simular   (solo muestra lo que haría)
#   bash etiquetas/sincronizar-etiquetas.sh ORGANIZACION/REPOSITORIO             (aplica los cambios)
#
# Requisitos: tener instalada la CLI de GitHub (gh) y haber iniciado sesión con "gh auth login".

set -u

repo="${1:-}"
modo="${2:-}"

if [ -z "$repo" ]; then
  echo "Uso: bash etiquetas/sincronizar-etiquetas.sh ORGANIZACION/REPOSITORIO [--simular]" >&2
  exit 1
fi

if [ "$modo" != "" ] && [ "$modo" != "--simular" ]; then
  echo "Opción no reconocida: $modo (la única válida es --simular)" >&2
  exit 1
fi

if [ "$modo" != "--simular" ] && ! command -v gh >/dev/null 2>&1; then
  echo "No se encuentra la CLI de GitHub (gh). Instálala e inicia sesión con: gh auth login" >&2
  exit 1
fi

carpeta="$(cd "$(dirname "$0")" && pwd)"
archivo="$carpeta/etiquetas.txt"

if [ ! -f "$archivo" ]; then
  echo "No se encuentra $archivo" >&2
  exit 1
fi

total=0
fallos=0

while IFS='|' read -r nombre color descripcion || [ -n "$nombre" ]; do
  # Quita el retorno de carro por si el archivo se editó en Windows
  nombre="${nombre%$'\r'}"
  color="${color%$'\r'}"
  descripcion="${descripcion%$'\r'}"

  # Salta líneas vacías y comentarios
  case "$nombre" in
    ""|\#*) continue ;;
  esac

  total=$((total + 1))

  if [ "$modo" = "--simular" ]; then
    echo "[simulación] $nombre  (#$color)  $descripcion"
    continue
  fi

  if gh label create "$nombre" --color "$color" --description "$descripcion" --repo "$repo" --force >/dev/null; then
    echo "OK  $nombre"
  else
    echo "FALLO  $nombre" >&2
    fallos=$((fallos + 1))
  fi
done < "$archivo"

echo "Etiquetas procesadas: $total. Fallos: $fallos."
[ "$fallos" -eq 0 ]
