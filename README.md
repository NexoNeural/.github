# Normas y plantillas comunes

Este repositorio contiene las plantillas y las normas de trabajo que comparten **todos los repositorios de la organización**.

## Qué contiene

| Archivo | Para qué sirve |
|---|---|
| `CONTRIBUTING.md` | Cómo trabajamos: pedir trabajo, refinar, sprints, cambios de alcance, ramas, Pull Requests, commits y definición de «Hecho». |
| `ISSUE_TEMPLATE/` | Los formularios de tickets: **Tarea**, **Error**, **Épica** y **Cambio de alcance**. El ticket en blanco está desactivado. |
| `PULL_REQUEST_TEMPLATE.md` | La plantilla que aparece al abrir un Pull Request. |
| `SECURITY.md` | Cómo avisar de un problema de seguridad. |
| `etiquetas/` | El set estándar de etiquetas y el script para crearlas en cada repositorio. |

## Qué se hereda y qué no

Los repositorios de la organización **heredan automáticamente** estos archivos, siempre que no tengan una versión propia:
`CONTRIBUTING.md`, `SECURITY.md`, `PULL_REQUEST_TEMPLATE.md` y los formularios de `ISSUE_TEMPLATE/`.

Las **etiquetas no se heredan**: cada repositorio tiene las suyas. Para crear las etiquetas estándar en un repositorio se usa el script de `etiquetas/`.

## Sincronizar las etiquetas de un repositorio

Requiere tener instalada la CLI de GitHub (`gh`) y haber iniciado sesión con `gh auth login`.

```
bash etiquetas/sincronizar-etiquetas.sh ORGANIZACION/REPOSITORIO --simular
bash etiquetas/sincronizar-etiquetas.sh ORGANIZACION/REPOSITORIO
```

- La primera orden solo muestra lo que haría, sin cambiar nada.
- La segunda crea las etiquetas que faltan y actualiza el color y la descripción de las que ya existen.
- El script **nunca borra** etiquetas.

El set de etiquetas está en `etiquetas/etiquetas.txt`, con el formato `nombre|color|descripción`.

## Cómo se cambia este repositorio

Este repositorio también sigue las normas: **los cambios se hacen por Pull Request y los revisa otra persona**. Si cambia una plantilla o una etiqueta, se actualiza aquí y se vuelve a ejecutar el script en los repositorios afectados.

## Importante

Este repositorio es **público**. Solo debe contener contenido genérico: nada de nombres de clientes, de proyectos concretos, de personas ni datos sensibles.
