# Cómo trabajamos

Este documento se aplica a todos los repositorios de la organización. Resume cómo se piden, preparan y entregan las tareas. Está pensado para que cualquiera, técnico o no, sepa qué hacer.

> **Estado:** primera versión, pendiente de revisión antes de publicarse.

## 1. Cómo pedir un trabajo

Todo trabajo empieza como un **issue** (un ticket en GitHub). Si no hay issue, el trabajo no existe en el plan.

1. Entra en el repositorio del proyecto → **Issues** → **New issue** → **Tarea**.
2. Pon un título con el formato `[Cliente/Módulo] Resumen corto`. Ejemplo: `[Cliente1/Tabla-Gastos] Mostrar tabla de gastos por mes`.
3. Rellena el formulario:
   - **Pedido por**: quién lo pide y por qué canal (reunión, correo...).
   - **Motivo**: para qué se necesita.
   - **Descripción**: qué hay que hacer.
   - **Criterios de aceptación**: «se da por terminada cuando…», como lista de comprobaciones.
   - **Prioridad**: Alta, Media o Baja. Es una solicitud: la confirma el responsable de producto.
   - **Fecha límite**: solo si existe una fecha real (para el Roadmap).

Hay una plantilla para cada caso: **Tarea** (un trabajo concreto), **Error** (algo falla; incluye pasos para reproducirlo y la gravedad), **Épica** (un objetivo grande que se divide en tareas, ver sección 3) y **Cambio de alcance** (una petición que llega con el sprint empezado o que contradice lo acordado, ver sección 4).

**Qué no se pide al crear la tarea**: las horas, el responsable y las dependencias. Se deciden después, en el refinamiento. Quien pide el trabajo no estima ni asigna.

## 2. Ciclo de vida de una tarea

1. **Se propone la tarea (bandeja de entrada).** Se crea con el formulario. Queda sin estimar y sin responsable. La plantilla le pone sola tres etiquetas de control: `tipo:tarea`, `necesita-estimacion` y `necesita-asignacion`.
2. **Se refina en equipo.** En la sesión de refinamiento, el equipo:
   - estima las **horas**;
   - asigna al **responsable**;
   - enlaza las **dependencias** con las herramientas nativas de GitHub: *blocked by* (bloqueada por) si la tarea espera a otra, y *sub-issues* si hay que dividirla en pasos;
   - confirma la **prioridad** y la **fecha límite** en el Project;
   - quita las etiquetas `necesita-estimacion` y `necesita-asignacion` cuando ya no apliquen.
3. **Se arrastra al sprint.** Solo entra una tarea refinada: con horas, responsable y criterios de aceptación, y con el visto bueno del Scrum Master del proyecto. Una tarea estimada en más de 8 horas no se asigna: se divide en tareas menores.

Los sprints duran una semana por defecto (dos en proyectos puntuales que lo justifiquen) y se revisan los viernes.

### Etiquetas

| Etiqueta | Significa | Quién la quita |
|---|---|---|
| `tipo:tarea` | Es una tarea de trabajo | No se quita |
| `tipo:error` | Es un error | No se quita |
| `tipo:epica` | Es una épica (contenedor de tareas) | No se quita |
| `necesita-estimacion` | Aún sin horas | Quien refina, al estimar |
| `necesita-asignacion` | Aún sin responsable | Quien refina, al asignar |
| `necesita-desglose` | Épica aún sin dividir en tareas | Quien refina, al crear las tareas hijas |
| `tipo:cambio-de-alcance` | Es una petición de cambio de alcance | No se quita |
| `necesita-decision` | Cambio pendiente de decidir | El Scrum Master, al decidir |
| `fuera-de-sprint` | Trabajo aprobado que entra con el sprint ya empezado | No se quita (deja constancia) |
| `tipo:investigacion` | Estudiar antes de hacer, para decidir con datos | No se quita |
| `tipo:documentacion` | Escribir o actualizar documentación | No se quita |
| `necesita-aclaracion` | Ticket con información insuficiente | Quien pidió el trabajo, al aclararlo |
| `no-se-hara` | Rechazado o descartado | No se quita |
| `duplicado` | Ya existe otro ticket igual | No se quita |

Las tareas y los errores nacen con `necesita-estimacion` y `necesita-asignacion`. Las épicas nacen con `necesita-desglose`. Los cambios de alcance nacen con `necesita-decision`. Filtrando por estas etiquetas se ve de un vistazo qué sigue «huérfano» antes de meterlo en un sprint.

**Reglas de uso de las etiquetas**
- Cada ticket lleva **exactamente una** etiqueta `tipo:`.
- Las etiquetas `necesita-` son pendientes: se quitan al resolverlos.
- **Prioridad, fase, estimación, responsable, sprint y horas no son etiquetas**: son campos del Project.
- Las etiquetas estándar se crean en cada repositorio con el script `etiquetas/sincronizar-etiquetas.sh` de este repo. Se ejecuta a mano y nunca borra etiquetas.
- **Etiquetas por área** (por ejemplo `area:frontend`, `area:backend` o `area:database`): no forman parte del set estándar, para no recargar los proyectos pequeños. Se pueden añadir manualmente en los repositorios específicos que las necesiten.

## 3. Épicas

Una **épica** es un objetivo grande que el cliente entiende, por ejemplo «Panel de gastos mensual». Es un **contenedor**: agrupa tareas y muestra una barra de progreso.

1. **Las épicas no entran en un sprint.** A los sprints solo bajan sus tareas hijas.
2. **Las horas de una épica no se estiman a mano.** Son la suma de las horas de sus tareas.
3. **Las tareas hijas se crean en el refinamiento**, como *sub-issues* de la épica. Al crearlas se quita `necesita-desglose`.
4. **El responsable** que hace el seguimiento de la épica se asigna también en el refinamiento.
5. **Tamaño máximo: 4 sprints.** Si una épica no cabe en un máximo de 4 sprints, se divide obligatoriamente en dos o más épicas.
6. **«Qué NO incluye» es obligatorio.** Es lo que se deja fuera a propósito. Si una petición posterior cae ahí, no estaba incluida: se trata como un cambio de alcance.
7. **Se cierra a mano.** Cuando la barra de progreso llega al 100 %, se revisan los criterios de aceptación de la épica y se cierra.

## 4. Cambios a mitad de sprint

Un sprint tiene una **capacidad fija**: si entra algo nuevo, algo se retrasa, se deja fuera o se compensa de otra forma. Por eso, todo cambio se registra con la plantilla **Cambio de alcance**.

**Cuándo es obligatorio usarla**
- La petición llega con el sprint ya empezado.
- La petición **contradice el apartado «Qué NO incluye»** de una épica. En este caso siempre es obligatorio.
- Se pide sustituir trabajo del sprint por otro.

**Cómo evoluciona el ticket.** El ticket de cambio **no se convierte en otro ticket**: es el mismo y va evolucionando.

1. **Nace** con las etiquetas `tipo:cambio-de-alcance` y `necesita-decision`. No tiene horas ni responsable.
2. **Se decide.**
   - El responsable de producto (PO) decide si lo quiere.
   - El Scrum Master confirma la viabilidad técnica y la capacidad.
   - Se necesitan ambos. La decisión queda en un comentario del ticket con la fecha y quién la tomó.
3. **Si se aprueba**, sobre el mismo ticket:
   - se estiman las **horas**;
   - se asigna el **responsable**;
   - se quita `necesita-decision`;
   - se añade `fuera-de-sprint`;
   - se arrastra al tablero del sprint.
4. **Si se rechaza o se aplaza**, se escribe un comentario con el motivo y se cierra con `no-se-hara`, o vuelve al backlog como una tarea normal.

**El campo «Qué se retrasa, se deja fuera o cómo se compensa».** No siempre hay que sacar una tarea entera del sprint: a veces el cambio es de una hora. Vale cualquier alternativa acordada, siempre que quede por escrito y justificada. Ejemplos:
- «Se aplaza la exportación a hoja de cálculo.»
- «Asumido como hora extra de esta semana.»
- «Se compensa descontando 1 hora de capacidad en el planning del siguiente sprint.»

Si quien pide el cambio no lo sabe, escribe «lo decide el Scrum Master».

**Excepción: error crítico en producción.** Un servicio caído no espera a un formulario. En ese caso:
1. Se crea un ticket con la plantilla **Error**, con gravedad **Crítica**.
2. El Scrum Master decide, con aviso posterior al PO, y añade `fuera-de-sprint` al ticket con un comentario: «Autorizado por X, fecha y motivo».
3. Se trabaja de inmediato. La estimación y el refinamiento llegan **después**.
4. El registro (ticket y comentario) debe estar completo el **mismo día laborable**.

Si la dirección insiste en un cambio, el cambio se hace, pero queda registrado quién lo autorizó y cuántas horas costó.

## 5. Reuniones con clientes

Las reuniones y llamadas también consumen capacidad, y se planifican para que no restén horas sin que se vea.

- **Reunión sobre un desarrollo específico:** sus horas se **suman a la estimación de la Tarea** a la que pertenece.
- **Reunión de seguimiento periódica:** se crea una **tarea genérica en el sprint**, con su bolsa de horas, con el título `[Cliente/Gestión] Reunión de seguimiento`. Así la capacidad que consume queda visible para todo el equipo.

## 6. Ramas y Pull Requests

Un **Pull Request** (PR) es una propuesta de cambios en el código que otra persona revisa antes de incorporarla. **Fusionar** es incorporar esos cambios a la rama de destino.

**Las ramas**
- **`desarrollo`** es la rama por defecto de cada repositorio. Es donde se integra el trabajo y a donde van los PR.
- **`main`** es producción. Solo el Scrum Master fusiona en `main`, mediante un PR de `desarrollo` a `main` cuando todo está probado.
- Cada trabajo se hace en una **rama propia**, creada a partir de `desarrollo`, con el nombre `tipo/NUMERO-descripcion`. Ejemplos: `feat/57-tabla-gastos` o `fix/63-carga-lenta`.

**El camino de un cambio**
1. Hay un ticket refinado y dentro del sprint.
2. Se crea una rama propia desde `desarrollo`.
3. Se trabaja y se suben los cambios **a esa rama**.
4. Se abre un PR hacia `desarrollo`, con la plantilla rellena y `Closes #NUMERO` para enlazar el ticket.
5. **Otra persona** revisa el PR.
6. Se fusiona en `desarrollo`, y el ticket se cierra solo gracias al `Closes #NUMERO`.
7. Quien revisa copia las **horas dedicadas** del PR al campo «Horas reales» del Project.

**Reglas**
- **Nunca se hace `push` directo a `desarrollo` ni a `main`.** Hacer `push` de tu propia rama sí está permitido.
- **Otra persona revisa**: nadie fusiona su propio PR.
- **A `main` solo fusiona el Scrum Master.**
- **No se reescribe el historial a la fuerza** (*force push*).
- Todo PR enlaza su ticket con `Closes #NUMERO` y trae la plantilla rellena, incluidas las horas dedicadas y los pasos de despliegue o configuración, o «Ninguno».
- Un ticket está «Hecho» cuando cumple las condiciones de la sección 8.

**Uso de IA y agentes.** Toda IA debe crear una rama propia, rellenar la plantilla `PULL_REQUEST_TEMPLATE.md` y abrir el PR con `gh pr create`, sin hacer push directo a `desarrollo` ni a `main`.

**Una nota sobre los candados.** En repositorios privados con el plan Free, GitHub no permite bloquear técnicamente el `push` a una rama ni obligar a que un PR tenga una revisión aprobada. Estas reglas se cumplen por acuerdo, y el rastro de tickets y PR permite comprobarlas.

## 7. Commits

Un **commit** es una foto guardada de tus cambios, con una nota que explica qué has hecho.

**Formato:** `tipo: descripción en español (#NUMERO)`. El **tipo va en inglés** (estándar *Conventional Commits*) y la **descripción en español**.

Ejemplo: `feat: añadir filtro de gastos por mes (#57)`

| Tipo | Se usa para |
|---|---|
| `feat` | Una función nueva |
| `fix` | Arreglar un error |
| `docs` | Documentación |
| `refactor` | Reordenar código sin cambiar lo que hace |
| `test` | Pruebas |
| `chore` | Tareas de mantenimiento |

**Reglas**
- Un commit, una idea.
- Descripción corta (unos 70 caracteres como máximo).
- El número del ticket va al final, entre paréntesis.
- Nunca se incluyen contraseñas, claves ni datos de clientes.
- Los mismos tipos se usan en el nombre de las ramas: `feat/57-tabla-gastos`.

## 8. «Hecho» y «Entregado»

Son dos momentos distintos. Confundirlos lleva a prometer al cliente algo que aún no está en producción.

**«Hecho»: el ticket está integrado en `desarrollo`.** Un ticket está «Hecho» cuando se cumplen **todas** estas condiciones:
- su PR está fusionado en `desarrollo`, con la revisión de otra persona;
- quien revisó comprobó los **criterios de aceptación**;
- las **horas reales** están registradas en el Project;
- la documentación está actualizada, si procede;
- el ticket está cerrado (lo hace solo `Closes #NUMERO`).

**«Entregado»: el trabajo ha llegado a `main` (producción).** Lo hace el Scrum Master, mediante un PR de `desarrollo` a `main`, cuando todo está probado.

**En la revisión de los viernes** se enseña lo que está «Hecho». Lo «Entregado» es lo que ya está en producción.

## 9. Guía para generar issues con IA

Cualquier persona puede usar una IA para redactar tickets o poblar el backlog. Es válido, con estas reglas:

1. **Mismo formulario, mismos campos.** Un issue generado con IA debe cumplir la plantilla de Tarea (o la que corresponda): mismo título normalizado, mismos campos y mismas etiquetas de control.
2. **Un issue por tarea.** No agrupar varios trabajos en un solo ticket.
3. **Sin horas, responsables ni dependencias.** La IA no los inventa: se deciden en el refinamiento.
4. **No inventar requisitos.** Lo que no se sepa se escribe como «por confirmar». Una IA no sustituye una decisión del cliente.
5. **Criterios verificables.** Cada criterio de aceptación debe poder comprobarse con un sí o un no.
6. **Constancia.** En **Pedido por** se indica la persona que lo solicita, y se añade «(redactado con IA)».
7. **Sin datos sensibles.** No incluir en los tickets ni en los textos que se pasen a la IA contraseñas, claves, datos personales ni datos de clientes.
8. **Revisión humana antes de crear.** Una persona lee y corrige el borrador antes de crear el issue.
9. **Refinamiento obligatorio.** Un issue generado con IA pasa por el refinamiento técnico como cualquier otro. Hasta entonces no puede entrar en un sprint.
10. **Si la IA también escribe código**, se aplica la sección 6: rama propia, plantilla de PR rellena y PR con `gh pr create`, sin push directo.

Ejemplo de instrucción para una IA:

```
Redacta una tarea para nuestro formulario de GitHub con estos campos:
título con formato [Cliente/Módulo] Resumen corto, Pedido por, Motivo,
Descripción, Criterios de aceptación (lista verificable), Prioridad
(Alta/Media/Baja) y Fecha límite (solo si existe).
No incluyas horas, responsables ni dependencias.
Marca como «por confirmar» todo lo que no sepas.
Contexto: <pega aquí lo que se necesita, sin datos sensibles>
```

