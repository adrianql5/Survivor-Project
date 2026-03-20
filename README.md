# Survivor Project

Proyecto personal para preparar un equipo Linux con varias herramientas que siguen siendo útiles si te quedas sin conexión: un modelo local con Ollama, una copia offline de Wikipedia y datos de OpenStreetMap para consulta local.

## Contexto

La idea salió después del apagón en España del 28 de abril de 2025. Más que plantearlo como un escenario apocalíptico, lo vi como una excusa para dejar montado un kit offline razonable en un portátil o en un disco externo.

## Qué incluye

- `Ollama` con el modelo `llama3.1:8b`.
- Una copia de Wikipedia en formato `ZIM` para abrir con Kiwix.
- Un volcado global de OpenStreetMap en formato `PBF` para cargarlo en QGIS.

## Qué hace el script

El script `survivorScript.sh`:

- instala Ollama si no está disponible;
- descarga el modelo `llama3.1:8b`;
- instala `kiwix`, `qgis`, `curl` y `wget` usando `apt`;
- prepara la estructura de carpetas en la ruta que indiques;
- descarga los ficheros grandes para dejar el entorno listo.

## Requisitos

- Linux con `apt`.
- Permisos de `sudo`.
- Conexión a internet estable para la instalación inicial.
- Al menos 200 GB libres si vas a bajar Wikipedia y el mapa mundial completos.

## Uso

```bash
chmod +x survivorScript.sh
./survivorScript.sh
```

El script preguntará en qué ruta quieres guardar los datos y pedirá confirmación antes de empezar las descargas pesadas.

## Notas prácticas

- La Wikipedia configurada en este repositorio es la versión completa en inglés sin imágenes.
- El fichero global de OpenStreetMap ocupa mucho y QGIS no siempre lo mueve bien en equipos modestos. Si solo necesitas una zona concreta, suele tener más sentido descargar extractos por país o región.
- El proyecto no resuelve la parte energética. Si el equipo no tiene batería o una forma de recargarse, el modo offline dura poco.
- Las URLs de descarga pueden cambiar con el tiempo. Si alguna deja de funcionar, hay que actualizarla en el script.

## Limitaciones

Esto no intenta ser una solución universal ni una herramienta especialmente pulida. Es un script personal para automatizar una preparación concreta en Linux y dejar reunidos varios recursos útiles en local.
