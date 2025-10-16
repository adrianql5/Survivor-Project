#!/bin/bash

curl -fsSL https://ollama.com/install.sh | sh
sleep 5

if ! command -v ollama &>/dev/null; then
  echo "Ollama no se instaló correctamente."
  exit 1
fi

ollama pull llama3.1:8b
echo "Ollama y el modelo llama3:8b están listos."

sudo apt update
sudo apt install -y kiwix qgis

read -p "Introduce la ruta de tu disco externo (ejemplo: /media/usb): " USB_PATH

mkdir -p "$USB_PATH/wikipedia"
mkdir -p "$USB_PATH/maps"

echo "Se van a descargar cerca de 200 GB en datos, asegurate de tener espacio libre suficiente"

WIKI_URL="https://download.kiwix.org/zim/wikipedia/wikipedia_en_all_maxi_2025-08.zim"
WIKI_DESC="Wikipedia EN (sin imágenes, texto completo, ~100GB)"

MAP_URL="https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf"
MAP_DESC="Mapa mundial completo OSM (~100GB)"

if [ -n "$WIKI_URL" ]; then
  echo "Descargando $WIKI_DESC ..."
  wget -O "$USB_PATH/wikipedia/wikipedia.zim" "$WIKI_URL"
else
  echo "No se descargará Wikipedia: $WIKI_DESC"
fi

if [ -n "$MAP_URL" ]; then
  echo "Descargando $MAP_DESC ..."
  wget -O "$USB_PATH/maps/map.osm.pbf" "$MAP_URL"
else
  echo "No se descargará mapa: $MAP_DESC"
fi

echo
echo "=== INSTRUCCIONES DE USO ==="
echo
echo "1. Para consultar Wikipedia OFFLINE:"
echo "   - Abre Kiwix desde el menú o ejecuta 'kiwix' en terminal."
echo "   - Haz clic en 'Abrir archivo' y selecciona:"
echo "     $USB_PATH/wikipedia/wikipedia.zim"
echo
echo "2. Para visualizar el mapa mundial/vectorial:"
echo "   - Abre QGIS desde el menú o ejecuta 'qgis' en terminal."
echo "   - Ve a 'Capa' > 'Añadir capa vectorial'."
echo "   - Selecciona:"
echo "     $USB_PATH/maps/map.osm.pbf"
echo
echo "¡Listo! Wikipedia y el mapa están preparados en tu disco externo según el espacio disponible."
