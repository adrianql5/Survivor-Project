# SurvivorProject 🦙🌍📚

> *¿Qué harías si mañana el mundo se apaga?*  
> Yo, por si acaso, ya tengo un plan.

## ¿Por qué existe este repositorio?

El 28 de abril de 2025 ocurrió un apagón en España. ¿Te imaginas quedarte sin internet, sin Google, sin reels? Así se me ocurrió la idea de este repositorio. Si el mundo se pone en modo “off”, mejor estar preparado.

## ¿Qué herramientas necesitas para sobrevivir en modo offline? 🤔

Después de pasar un día cojonudo sin usar ningún elemento tecnológico, jugando al fútbol y bebiendo cañas, me pregunté:  
**¿Qué necesito para sobrevivir si el apocalipsis digital vuelve?**

Mi lista de ideas no es (muy) conspiranoica, pero sí bastante útil y con un toque de humor:

### 1. Ollama con el modelo Llama 3.1 🦙

- **Ollama** es una herramienta que permite ejecutar modelos de lenguaje grandes (LLMs) *en local*, sin necesidad de internet ni servidores mágicos en la nube.
- **Llama 3.1** es uno de los modelos más potentes para tener conversaciones (en verdad es de los pocos que un portátil puede tirar), pedir ayuda, resolver dudas, y si tienes suerte, hasta te cuenta algún chiste malo.
- En resumen: conviertes tu ordenador en una especie de “ChatGPT de bolsillo”, listo para responderte incluso si los satélites caen.
- **IMPORTANTE**: Hay que tener en cuenta el hardware que tienes para instalar un modelo correcto. Normalmente necesitas el doble de RAM que lo que pide el modelo en la web de Ollama. Por ejemplo, si tienes 16GB de RAM, puedes ponerte el modelo: 8b, pero no el modelo: 64b, porque va a tardar cada prompt más que un lunes en llegar el viernes.

### 2. Descargar la Wikipedia 📚

- ¿Google caído? Con una copia local de Wikipedia puedes consultar cualquier cosa prácticamente.
- Es el equivalente digital a llevar una biblioteca en tu mochila, pero sin que te duela la espalda.
- Para visualizar el archivo se usa qwix

### 3. Un mapa mundial offline 🌍

- Porque si tienes que buscar refugio, escapar de zombis (o simplemente encontrar el supermercado más cercano), un mapa mundial offline puede salvarte.
- Además, así puedes impresionar a tus amigos diciendo: “Sé dónde estamos… y hacia dónde NO hay WiFi”.
- Consejo: No lo he probado pero tengo la sensación de que no funciona como Google Maps y vas a tener que orientarte usando una brújula, por lo que sea.
- Tras probarlo, el archivo de 100 GB pesa muchisimo y qgis desktop lo tira fatal, recomiendo descargarse los archivos por paises.

## ¿Y cómo se instala todo esto? 🚀

He creado un **script automático** que descarga todo lo necesario (Ollama + Llama 3.1 + Wikipedia + mapa mundial) de una tacada.  
**SOLO FUNCIONA EN LINUX**.  
Si usas Windows o macOS, tendrás que sobrevivir con tus propios recursos (o instalar Linux, que también es una forma de supervivencia).

**OJO:** Se van a descargar sobre 200 GB de contenido, así que asegúrate de tener espacio libre o usa un disco externo.

---

## ¿Quieres probarlo?

1. Clona este repositorio.
2. Ejecuta el script `survivor_setup.sh` (solo en Linux).
3. Disfruta con tus colegas y déjate de tanta pantalla.

---

### Nota 

Como primer consejo: busca una forma de cargar el ordenador porque si no vas a tener un buen pisapapeles.
