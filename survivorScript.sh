#!/usr/bin/env bash

set -euo pipefail

MODEL_NAME="llama3.1:8b"
WIKI_URL="https://download.kiwix.org/zim/wikipedia/wikipedia_en_all_maxi_2025-08.zim"
WIKI_DESC="Wikipedia en ingles sin imagenes (~100 GB)"
MAP_URL="https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf"
MAP_DESC="Mapa mundial de OpenStreetMap (~100 GB)"
DEFAULT_DATA_PATH="$HOME/survivor-data"

log() {
  printf '%s\n' "$*"
}

fail() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

require_linux() {
  [[ "$(uname -s)" == "Linux" ]] || fail "este script solo esta preparado para Linux."
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || fail "falta el comando '$1'."
}

install_ollama() {
  if command -v ollama >/dev/null 2>&1; then
    log "Ollama ya esta instalado."
    return
  fi

  log "Instalando Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh

  if ! command -v ollama >/dev/null 2>&1; then
    fail "Ollama no se instalo correctamente."
  fi
}

install_packages() {
  require_command sudo
  require_command apt

  log "Instalando dependencias del sistema..."
  sudo apt update
  sudo apt install -y kiwix qgis curl wget
}

prompt_data_path() {
  local input_path

  read -r -p "Ruta donde guardar los datos [${DEFAULT_DATA_PATH}]: " input_path
  DATA_PATH="${input_path:-$DEFAULT_DATA_PATH}"

  mkdir -p "$DATA_PATH/wikipedia" "$DATA_PATH/maps"
}

confirm_large_downloads() {
  local answer

  log
  log "Se van a descargar aproximadamente 200 GB en total."
  log "Destino:"
  log "  - Wikipedia: $DATA_PATH/wikipedia/wikipedia.zim"
  log "  - Mapa:      $DATA_PATH/maps/map.osm.pbf"
  log

  read -r -p "Continuar con las descargas? [y/N]: " answer
  case "$answer" in
    y|Y|yes|YES|si|SI|s|S) ;;
    *) fail "operacion cancelada por el usuario." ;;
  esac
}

download_file() {
  local url="$1"
  local destination="$2"
  local description="$3"

  log "Descargando $description..."
  wget -c -O "$destination" "$url"
}

print_next_steps() {
  log
  log "Archivos preparados en:"
  log "  - $DATA_PATH/wikipedia/wikipedia.zim"
  log "  - $DATA_PATH/maps/map.osm.pbf"
  log
  log "Uso rapido:"
  log "  1. Abre Kiwix y carga el archivo de Wikipedia."
  log "  2. Abre QGIS y anade el archivo .osm.pbf como capa vectorial."
}

main() {
  require_linux
  install_packages
  require_command curl
  require_command wget

  install_ollama

  log "Descargando el modelo $MODEL_NAME..."
  ollama pull "$MODEL_NAME"
  log "Modelo listo."

  prompt_data_path
  confirm_large_downloads

  download_file "$WIKI_URL" "$DATA_PATH/wikipedia/wikipedia.zim" "$WIKI_DESC"
  download_file "$MAP_URL" "$DATA_PATH/maps/map.osm.pbf" "$MAP_DESC"

  print_next_steps
}

main "$@"
