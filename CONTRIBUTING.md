# Cómo trabajamos

Este documento se aplica a todos los repositorios de la organización. Resume cómo se piden, preparan y entregan las tareas. Está pensado para que cualquiera, técnico o no, sepa qué hacer.

## 1. Cómo pedir un trabajo

Todo trabajo empieza como un **issue** (un ticket en GitHub). Si no hay issue, el trabajo no existe en el plan.

1. Entra en el repositorio del proyecto → **Issues** → **New issue** y elige el formulario que corresponda (ver más abajo).
2. Pon un título con el formato `[Cliente/Módulo] Resumen corto`. Ejemplo: `[Cliente1/Tabla-Gastos] Mostrar tabla de gastos por mes`.
3. Responde las preguntas del formulario. Son pocas y cada una lleva una línea de ayuda. Casi todos piden qué hay que hacer, para qué sirve y cuándo se da por terminado, como lista de comprobaciones.
4. En la **barra lateral** ya aparecen el **tipo** del ticket y sus **campos**. Rellena los que conozcas:
   - **Pedido por**: quién lo pide, persona o entidad.
   - **Prioridad**: Urgente, Alta, Media o Baja. Es una solicitud: la confirma el responsable de producto.
   - **Fecha de inicio** y **Fecha límite**: solo si existe una fecha real (para el Roadmap).

Hay un formulario por cada tipo de ticket:

| Tipo | Se usa para |
|---|---|
| **Tarea** | Un trabajo concreto, de 1 a 8 horas, para una persona |
| **Error** | Algo que no funciona como debería. Incluye pasos para reproducirlo |
| **Mejora** | Funcionalidad nueva o cambio de algo que ya existe |
| **Épica** | Un objetivo grande que se divide en tareas (ver sección 3) |
| **Investigación** | Un estudio o prueba para decidir algo, sin entregable de código |
| **Documentación** | Redactar o corregir un documento |
| **Reunión** | Una reunión o ceremonia del equipo o con el cliente (planificación, daily, reunión semanal, demo). Así su tiempo consume capacidad del sprint y se ve |
| **Cambio de alcance** | Una petición que llega con el sprint empezado o que contradice lo acordado (ver sección 4) |

**Qué no se pide al crear el ticket**: las horas, el esfuerzo, el responsable y las dependencias. Se deciden después, en el refinamiento. Quien pide el trabajo no estima ni asigna.

**Quién ha creado el ticket queda siempre registrado** por GitHub. Si «Pedido por» queda vacío, se le pregunta directamente a quien lo creó.

## 2. Ciclo de vida de una tarea

1. **Se propone la tarea (bandeja de entrada).** Se crea con el formulario. Queda sin estimar y sin responsable. El formulario le pone solo dos etiquetas de control: `necesita-estimacion` y `necesita-asignacion`. El **tipo** lo fija el propio formulario.
2. **Se refina en equipo.** En la sesión de refinamiento, el equipo:
   - estima las **horas** (campo «Horas estimadas») y el **esfuerzo** (Bajo, Medio o Alto);
   - asigna al **responsable**;
   - enlaza las **dependencias** con las herramientas nativas de GitHub: *blocked by* (bloqueada por) si la tarea espera a otra, y *sub-issues* si hay que dividirla en pasos;
   - confirma la **prioridad** y las **fechas** en los campos del ticket;
   - quita las etiquetas `necesita-estimacion` y `necesita-asignacion` cuando ya no apliquen.
3. **Se arrastra al sprint.** Solo entra una tarea refinada: con horas, responsable y criterios de aceptación, y con el visto bueno del Scrum Master del proyecto. Una tarea estimada en más de 8 horas no se asigna: se divide en tareas menores.

Los sprints duran una semana por defecto (dos en proyectos puntuales que lo justifiquen) y se revisan los viernes.

### Tipos y campos

El **tipo** del ticket y sus datos (prioridad, fechas, horas, quién lo pide) son **nativos de GitHub**, no etiquetas. Los define la organización una sola vez y valen para todos los repositorios.

| Campo | Qué es | Quién lo rellena |
|---|---|---|
| **Pedido por** | Quién lo pide | Quien crea el ticket |
| **Prioridad** | Urgente, Alta, Media o Baja | Quien crea el ticket la solicita; la confirma el responsable de producto |
| **Fecha de inicio** y **Fecha límite** | Fechas reales, si existen | Quien crea el ticket o el refinamiento |
| **Esfuerzo** | Bajo, Medio o Alto: tamaño relativo | El refinamiento |
| **Horas estimadas** | Estimación en horas | El refinamiento |
| **Horas reales** | Horas realmente dedicadas | Quien revisa el PR, al fusionar |

Las **épicas** no tienen horas: se calculan sumando las de sus tareas.

### Etiquetas

Las etiquetas quedan solo para avisos temporales y marcas de estado:

| Etiqueta | Significa | Quién la quita |
|---|---|---|
| `necesita-estimacion` | Aún sin horas | Quien refina, al estimar |
| `necesita-asignacion` | Aún sin responsable | Quien refina, al asignar |
| `necesita-desglose` | Épica aún sin dividir en tareas | Quien refina, al crear las tareas hijas |
| `necesita-decision` | Cambio pendiente de decidir | El Scrum Master, al decidir |
| `necesita-aclaracion` | Ticket con información insuficiente | Quien pidió el trabajo, al aclararlo |
| `fuera-de-sprint` | Trabajo aprobado que entra con el sprint ya empezado | No se quita (deja constancia) |
| `no-se-hara` | Rechazado o descartado | No se quita |
| `duplicado` | Ya existe otro ticket igual | No se quita |

Las tareas, mejoras, errores, investigaciones, documentación y reuniones nacen con `necesita-estimacion` y `necesita-asignacion`. Las épicas nacen con `necesita-desglose`. Los cambios de alcance nacen con `necesita-decision`. Filtrando por estas etiquetas se ve de un vistazo qué sigue «huérfano» antes de meterlo en un sprint.

**Reglas de uso**
- Cada ticket tiene **exactamente un tipo** (Tarea, Error, Mejora, Épica, Investigación, Documentación, Reunión o Cambio de alcance).
- Las etiquetas `necesita-` son pendientes: se quitan al resolverlos.
- **El tipo, la prioridad, las fechas, el esfuerzo y las horas no son etiquetas**: son campos del propio ticket. La **fase** es el milestone (su nombre lleva siempre como prefijo, entre corchetes, el nombre del repositorio, p. ej. `[NOMBRE-DEL-REPO] Fase 1`), el **responsable** es el asignado y el **sprint** es la iteración del Project.
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

Un sprint tiene una **capacidad fija**: si entra algo nuevo, algo se retrasa, se deja fuera o se compensa de otra forma. Por eso, todo cambio se registra con el formulario **Cambio de alcance**.

**Cuándo es obligatorio usarla**
- La petición llega con el sprint ya empezado.
- La petición **contradice el apartado «Qué NO incluye»** de una épica. En este caso siempre es obligatorio.
- Se pide sustituir trabajo del sprint por otro.

**Cómo evoluciona el ticket.** El ticket de cambio **no se convierte en otro ticket**: es el mismo y va evolucionando.

1. **Nace** con el tipo **Cambio de alcance** y la etiqueta `necesita-decision`. No tiene horas ni responsable.
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

**La pregunta «Qué se retrasa o se deja fuera».** No siempre hay que sacar una tarea entera del sprint: a veces el cambio es de una hora. Vale cualquier alternativa acordada, siempre que quede por escrito y justificada. Ejemplos:
- «Se aplaza la exportación a hoja de cálculo.»
- «Asumido como hora extra de esta semana.»
- «Se compensa descontando 1 hora de capacidad en el planning del siguiente sprint.»

Si quien pide el cambio no lo sabe, escribe «lo decide el Scrum Master».

**Excepción: error crítico en producción.** Un servicio caído no espera a un formulario. En ese caso:
1. Se crea un ticket con el formulario **Error**, con prioridad **Urgente**.
2. El Scrum Master decide, con aviso posterior al PO, y añade `fuera-de-sprint` al ticket con un comentario: «Autorizado por X, fecha y motivo».
3. Se trabaja de inmediato. La estimación y el refinamiento llegan **después**.
4. El registro (ticket y comentario) debe estar completo el **mismo día laborable**.

Si la dirección insiste en un cambio, el cambio se hace, pero queda registrado quién lo autorizó y cuántas horas costó.

## 5. Reuniones con clientes

Las reuniones y llamadas también consumen capacidad, y se planifican para que no restén horas sin que se vea.

- **Reunión sobre un desarrollo específico:** sus horas se **suman a la estimación de la Tarea** a la que pertenece.
- **Reunión de seguimiento periódica:** se crea un ticket de tipo **Reunión** en el sprint, con su bolsa de horas, con el título `[Cliente/Gestión] Reunión de seguimiento`. Así la capacidad que consume queda visible para todo el equipo.

## 6. Ramas y Pull Requests

Un **Pull Request** (PR) es una propuesta de cambios en el código que otra persona revisa antes de incorporarla. **Fusionar** es incorporar esos cambios a la rama de destino.

**Las ramas**
- **`desarrollo`** es la rama por defecto de cada repositorio. Es donde se integra el trabajo y a donde van los PR.
- **`main`** es producción. Solo el Scrum Master fusiona en `main`, mediante un PR de `desarrollo` a `main` cuando todo está probado.
- Cada trabajo se hace en una **rama propia**, creada a partir de `desarrollo`, con el nombre `tipo/NUMERO-descripcion`. Ejemplos: `feat/57-tabla-gastos` o `fix/63-carga-lenta`.

**El camino de un cambio**
1. Hay un ticket refinado y dentro del sprint.
2. Se crea una rama propia desde `desarrollo`, enlazada al ticket: `gh issue develop NUMERO --base desarrollo --name tipo/NUMERO-descripcion`. Así la rama aparece en la sección *Development* del ticket y el nombre sale siempre con el número correcto.
3. Se trabaja y se suben los cambios **a esa rama**.
4. Se abre un PR hacia `desarrollo`, con la plantilla rellena y `Closes #NUMERO` para enlazar el ticket.
5. **Otra persona** revisa el PR.
6. Se fusiona en `desarrollo`, y el ticket se cierra solo gracias al `Closes #NUMERO`.
7. Quien revisa copia las **horas dedicadas** del PR al campo «Horas reales» del ticket.

**Reglas**
- **Nunca se hace `push` directo a `desarrollo` ni a `main`.** Hacer `push` de tu propia rama sí está permitido.
- **Otra persona revisa**: nadie fusiona su propio PR.
- **A `main` solo fusiona el Scrum Master.**
- **No se reescribe el historial a la fuerza** (*force push*).
- Todo PR enlaza su ticket con `Closes #NUMERO` y trae la plantilla rellena, incluidas las horas dedicadas y los pasos de despliegue o configuración, o «Ninguno».
- Un ticket está «Hecho» cuando cumple las condiciones de la sección 8.

**Uso de IA y agentes.** Toda IA debe crear una rama propia desde el ticket (con `gh issue develop`), rellenar la plantilla `PULL_REQUEST_TEMPLATE.md` y abrir el PR con `gh pr create`, sin hacer push directo a `desarrollo` ni a `main`.

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
- las **horas reales** están registradas en el ticket;
- la documentación está actualizada, si procede;
- el ticket está cerrado (lo hace solo `Closes #NUMERO`).

**«Entregado»: el trabajo ha llegado a `main` (producción).** Lo hace el Scrum Master, mediante un PR de `desarrollo` a `main`, cuando todo está probado.

**En la revisión de los viernes** se enseña lo que está «Hecho». Lo «Entregado» es lo que ya está en producción.

## 9. Guía para generar issues con IA

Cualquier persona puede usar una IA para redactar tickets o poblar el backlog. Es válido, con estas reglas:

1. **Mismo formulario, mismo tipo.** Un issue generado con IA debe cumplir el formulario que corresponda a su tipo: mismo título normalizado, mismas preguntas, mismo tipo y mismas etiquetas de control.
2. **Un issue por tarea.** No agrupar varios trabajos en un solo ticket.
3. **Sin horas, responsables ni dependencias.** La IA no los inventa: se deciden en el refinamiento.
4. **No inventar requisitos.** Lo que no se sepa se escribe como «por confirmar». Una IA no sustituye una decisión del cliente.
5. **Criterios verificables.** Cada criterio de aceptación debe poder comprobarse con un sí o un no.
6. **Constancia.** En el campo **Pedido por** se indica la persona que lo solicita, y se añade «(redactado con IA)».
7. **Sin datos sensibles.** No incluir en los tickets ni en los textos que se pasen a la IA contraseñas, claves, datos personales ni datos de clientes.
8. **Revisión humana antes de crear.** Una persona lee y corrige el borrador antes de crear el issue.
9. **Refinamiento obligatorio.** Un issue generado con IA pasa por el refinamiento técnico como cualquier otro. Hasta entonces no puede entrar en un sprint.
10. **Si la IA también escribe código**, se aplica la sección 6: rama propia creada desde el ticket con `gh issue develop`, plantilla de PR rellena y PR con `gh pr create`, sin push directo.

Ejemplo de instrucción para una IA:

```
Redacta una tarea para nuestro formulario de GitHub con estas preguntas:
título con formato [Cliente/Módulo] Resumen corto, Qué hay que hacer,
Para qué sirve y Se da por terminada cuando… (lista verificable).
Indica además, aparte, quién la pide y la prioridad (Urgente/Alta/Media/Baja).
No incluyas horas, responsables ni dependencias.
Marca como «por confirmar» todo lo que no sepas.
Contexto: <pega aquí lo que se necesita, sin datos sensibles>
```


## 10. El tablero del proyecto

Cada proyecto tiene un **tablero** (un *Project* de la organización) con el mismo nombre que su repositorio. Además hay un tablero **general** con el avance de todos los proyectos, pensado para dirección. Los tableros se crean a partir de una plantilla común.

**Estados de un ticket en el tablero**

| Estado | Significa |
|---|---|
| **Bandeja de entrada** | Ticket nuevo, sin refinar |
| **Backlog refinado** | Con horas estimadas (ver criterio más abajo) |
| **En sprint** | Comprometido para el sprint actual |
| **En curso** | Alguien trabaja en él |
| **En revisión** | PR abierto, esperando visto bueno |
| **Hecho** | Integrado en `desarrollo` (sección 8) |
| **Entregado** | Ya en `main` (producción) |

**Criterio de «refinado».** Una tarea está en «Backlog refinado» cuando tiene **horas estimadas**. Una épica lo está cuando tiene sub-issues y todos tienen horas estimadas. Para entrar en un sprint la tarea necesita además responsable, criterios de aceptación y el visto bueno del Scrum Master (sección 2). El estado lo cambia el Scrum Master a mano.

**Sprints.** Son una iteración de una semana (lunes a domingo). «En sprint» solo contiene los tickets de la semana en curso; el resto espera en «Backlog refinado».

**Vistas del tablero de proyecto:** *Backlog* (agrupado por épica, con las horas de cada una), *Por refinar* (agrupado por estado), *Tablero del sprint* (columnas del sprint en curso), *Mis tareas* (lo mío del sprint), *Roadmap* (línea de tiempo por milestone) y *Revisión del viernes* (lo hecho esta semana, por persona).

**Vistas del tablero general** (solo para quien coordina y para dirección): avance por proyecto (solo épicas, con porcentaje), carga por persona, bloqueados y cambios de alcance, roadmap general y un Kanban de épicas.

**Milestones.** Su nombre lleva siempre el prefijo `[NOMBRE-DEL-REPO]` para distinguirlos en el tablero general.

**Horas reales.** Se cruzan cada semana con el registro de tiempos; para ello, la descripción de cada entrada de tiempo empieza por el número del ticket, por ejemplo `#57 ...`.
