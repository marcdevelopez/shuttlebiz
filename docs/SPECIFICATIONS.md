<div align="center">
  <img src="assets/diagrams/hand-icon-light.png" width="70" alt="Hand Icon" style="margin: 0 20px;">
  <img src="assets/diagrams/shuttlebiz-logo.png" width="85" alt="ShuttleBiz Logo" style="margin: 0 20px;">
  <img src="assets/diagrams/hand-icon-strong.png" width="63" alt="Strong Hand Icon" style="margin: 0 20px;">
</div>

<br>

<div align="center">

<img src="assets/diagrams/ShuttleBiz-title.png" width="250" alt="ShuttleBiz Title" style="margin: -50px 0;">

## Requerimientos Funcionales

#### **Aplicación donde los usuarios crean y usan lanzaderas para unir personas en un vehículo para viajar a determinado destino, con la posibilidad de comunicarse y saber la posición de cada uno.**

</div>

---

## **1\. Autenticación y Roles de Usuario**

- 🔐 **Login por número de teléfono** (usuario \+ contraseña).
- ✅ **Sesión persistente** tras primer acceso.
- 🔁 **Opción de recuperación** si el usuario cambia de número.
- 👥 Al usar una lanzadera, el usuario debe **elegir su rol**:

  - **Conductor**
  - **Viajero**

  ***

  ## **2\. Gestión de Grupos (“Biz”)**

- 📦 Los usuarios pueden **crear un grupo** (biz) para organizar lanzaderas.
- 👤 Solo el **creador del grupo** puede:
  - Crear o modificar lanzaderas.
  - Expulsar usuarios.
  - Asignar otro administrador.
- ✅ El grupo solo es visible para sus miembros.
- ➕ El creador debe **agregar manualmente a los usuarios**.
- 🏠 Los usuarios agregados verán automáticamente ese grupo en su pantalla Home.
- 📅 El sistema guarda internamente la **fecha/hora de incorporación al grupo**.
- 🚪 Cualquier usuario puede **salir del grupo** en cualquier momento.
- 🔄 Si el creador abandona:
  - El nuevo administrador será designado por él.
  - Si no hay designación, será el miembro más antiguo.
- 👥 Si tiene permisos, un usuario **puede invitar a otros**, pero **no puede crear lanzaderas**.

  ***

  ## **3\. Gestión de Lanzaderas**

  ### **3.1. Creación**

- ➕ El creador de un grupo puede crear lanzaderas dentro de él.
- 🛣️ Requiere definir:
  - **Nombre**
  - **Origen** y **destino**
  - **Periodicidad**: puntual (fecha única) o frecuencia semanal
  - **Plazas por defecto**
  - **Comentario** (opcional: normas, detalles de recogida)
- 🧭 Cada lanzadera pertenece a un único grupo (no es global).

  ### **3.2. Configuración de horarios**

- 🕒 Dos modos:
  - **Fecha única**: se elige mediante un calendario (DatePicker).
  - **Frecuencia semanal**:
    - Se seleccionan días de la semana (checkbox).
    - Se configuran horarios de ida y vuelta (TimePicker).
- 🔁 Lógica de **control de solapamientos y edición**:
  - La app detecta **solapamientos automáticamente**.
  - Al intentar modificar un día ya configurado, se mostrará una **alerta visual con dos opciones**:
    - ⚠️ Este día ya tiene horarios configurados. ¿Qué deseas hacer?
      - 🛠️ Editar grupo actual (modifica los horarios existentes).
      - ➕ Crear nuevo grupo de frecuencia (mantiene el grupo original y genera uno nuevo solo para ese día).
  - Mostrar horarios en ExpansionTile para mantener la vista limpia.
- 🔍 Vista previa antes de confirmar cambios:
  - Se muestra la frecuencia actual agrupada por días.  
    Cada grupo (conjunto de días con mismo horario) muestra:
    - 🗓️ Días incluidos.
    - 🕐 Horarios ida y vuelta.
    - 🧭 Sentido del trayecto.
- 📚 Organización visual en UI:
  - Los grupos de frecuencia se visualizan con ExpansionTile o tarjetas plegables.
  - Cada horario puede editarse individualmente con pulsación corta.
  - La pulsación larga permite eliminar uno o varios horarios del grupo.
  - Las listas de horarios están ordenadas por día y por sentido del viaje (ida/vuelta).
- 🛑 Botón “reset”:
  - Elimina todos los horarios del grupo seleccionado.
  - Aparece junto al nombre del grupo o al final de la lista.
- 🧾 Cada horario muestra de forma clara el día al que pertenece (etiqueta de fecha o subtítulo).
- 🧑‍💻 Si el usuario tiene permisos de edición (creador o administrador), podrá acceder a la pantalla completa de configuración de horarios.
- Para mayor usabilidad intentar implementar Copiar horarios con un botón “Copiar configuración a otro día”.
- ## Colores diferenciados en Horarios de ida y Horarios de vuelta. Usar estos colores ya que además enlazan con los del logo de la app: \#0077B6 (azul intenso), \#FF6B6B (rojo coral).

  ## **4\. Consulta y Solicitud de Lanzaderas**

  ### **4.1. Vista en Home**

- 🏡 Se muestran las **lanzaderas** del **grupo activo**.
- Cada ítem incluye:

  - Nombre
  - Origen → destino
  - Plazas disponibles
  - Próximos horarios disponibles ese día
  - Estado visual con colores:
    - 🟢 Verde: disponible
    - 🔴 Rojo: fuera de horario o completa
    - ⚪ Gris: no disponible

- Se puede **cambiar de grupo** desde el nombre del grupo en la barra superior.

  ### **4.2. Vista de Detalle LANZADERA**

- Al **pulsar una lanzadera**:

  - Se muestra el nombre de Lanzadera, origen y destino.
  - Se muestra lista de horarios del día actual (diferenciando los aún disponibles).
  - Cada horario incluye (una vez pulsado, en nueva ventana):
    - Cantidad de viajeros
    - Nombre del conductor (si existe)
    - Botones:
      - "Solicitar plaza"
      - "Ser conductor"
      - "Cancelar solicitud"
      - "Ver viajeros"
    - Indicador del próximo horario.
  - Al seleccionar "conductor":
    - Si ya hay uno: se envía **notificación al ya existente para aprobar/rechazar**.
    - Si está libre: se solicita matrícula y plazas. Puede haber la posibilidad de tener una base de datos con las plazas de cada vehículo por defecto.
  - El botón de solicitud de plaza como viajero se bloquea si la lanzadera está completa.
  - Puede mostrarse como “estado completo”.

  ***

  ##

  ## **5\. Reglas y Validaciones**

- 🚫 **Solo puede haber un conductor por horario**.
- 🔄 **Se puede anular una solicitud**.
- ✅ **Plazas disponibles visibles** en todo momento, con posibilidad de ver qué usuarios solicitaron plaza.
- 🛑 **No se puede solicitar plaza** si está completa.
- 🧾 Cada solicitud se guarda con fecha, rol y grupo asociado.
- 🧠 Validaciones para evitar solapamientos en la configuración de horarios.

  ***

  ## **6\. Comunicación y Notificaciones**

- 📢 Chat general por lanzadera _(no incluido en MVP)_.
- 🔔 Notificaciones push:
  - Cuando un usuario se une a un grupo.
  - Cuando alguien solicita una plaza (informándose de plazas restantes).
  - Cuando comienza un viaje (para los viajeros).
- 🗺️ Visualización en tiempo real de la ubicación de conductor y viajeros _(no incluido en MVP)_.

  ***

  ## **7\. UX/UI Consideraciones**

- 🔀 Cambiar de grupo desde el nombre en la barra superior.
- 🟢 Estado visual por lanzadera y horario.
- 📅 Días sin lanzaderas muestran etiqueta “sin lanzadera”.
- 📊 Colores y etiquetas para horarios de ida y vuelta.
- 📚 Implementación recomendada:

  - Provider, Riverpod o Bloc para actualización reactiva.
  - ExpansionTile para mostrar horarios organizadamente.

  #

  #

  # **🚩 Navegación y Pantallas – ShuttleBiz**

## **🔹 Barra Superior de Navegación**

**Estructura:**

\[ Nombre de la App (HOME) \] \[ Nombre del grupo \] \[ Menú \]

###

### **Comportamiento del selector de grupo:**

- Si **no hay ningún grupo creado**, el texto mostrará: Agregar un Grupo, seguido de un icono \+.
  - Al pulsarlo: se abre una pantalla o diálogo para crear un nuevo grupo.
  - Este icono puede mantenerse visible o solo estar dentro del menú superior para evitar pulsaciones accidentales.
- Si **ya hay uno o varios grupos creados**, el string mostrará el nombre del grupo activo.

  - Al pulsarlo: se abre un diálogo con una lista desplegable para cambiar entre grupos.

  ***

  ##

  ##

  ## **📱 Pantallas**

### **1\. LOGIN**

- Primera pantalla de la app.
- Campos:
  - País
  - Número de móvil (obligatorio)
- Botón: Siguiente
  - Enlaza con pantalla de **Registro con Código**.
- Opcional: subir una imagen de usuario.

  ### **2\. REGISTRO CON CÓDIGO**

- Parte superior: texto indicando que se debe ingresar el código recibido por SMS.
- Se muestra el número de teléfono al que se envió el código.

  - Es editable tras pulsar "(editar)".

  ### **3\. ONBOARDING (próximamente)**

- Ayuda sobre el funcionamiento de la app.
- Disponible dentro del menú superior \> Ayuda.

  ***

  ### **4\. HOME**

- Pantalla por defecto tras iniciar sesión.
- Comportamiento:

  - Si el usuario **no tiene grupo**, solo verá el encabezado y el botón Agregar grupo (+).
    - NUEVO GRUPO
    - Al pulsar el botón \`Agregar Grupo (+)\`, se abre un **cuadro de diálogo** o pantalla modal.
    - Se solicita al usuario que **ingrese el nombre del nuevo grupo**.
    - Al confirmar, se **crea el grupo** y queda disponible en la barra superior y en la \`HOME\`.
    - A partir de ese momento, el usuario puede crear lanzaderas dentro del nuevo grupo.
    - Si el usuario **tiene grupo**, se mostrarán las lanzaderas del grupo activo.
    - Si el usuario es **creador del grupo seleccionado**, aparece un botón \+ abajo a la derecha:
      - Al pulsarlo: abre la pantalla NewShuttleScreen para crear una lanzadera.

  #### **Vista previa de cada lanzadera:**

- Nombre
- Origen \- Destino
- Plazas disponibles
- Estado visual:

  - Verde claro: activa, con plazas disponibles.
  - Rojo: sin plazas o fuera de horario.

  ***

  ### **5\. NEW SHUTTLE SCREEN**

  #### **Campos editables obligatorios:**

- Nombre de la lanzadera
- Origen y destino
- Plazas por defecto:
  - Será la capacidad habitual del vehículo, modificable por el conductor el día del viaje.
- Comentario (opcional):

  - Normas, instrucciones, etc.

  #### **Configuración de horario:**

- Dos modos excluyentes:

  - Fecha ✅
  - Frecuencia ✅
  - Se seleccionan con radio button o similar.

  ##### **Modo 1: Fecha puntual**

- Botón **Calendario**: abre un DatePicker para elegir la fecha del evento.
- Botón **Agregar horario**: abre un TimePicker para seleccionar horas de salida.
  - Los **horarios** se listan con el sentido del viaje y se agrupan por día de **forma compacta**, optimizando el espacio visual. Por ejemplo: "Lunes a Viernes: 08:00, 10:00, 11:00". Esto permite al usuario tener una visión rápida y clara del horario completo sin necesidad de múltiples vistas.
  - Botón paralelo: **Horario de vuelta** para agregar horarios de retorno en lista separada.
- Funciones adicionales:
  - Pulsar una hora para **modificarla**.
  - Pulsación larga para **eliminar** una o varias horas.
- La lanzadera podrá **reutilizarse** de dos formas:
  - ✅ Volviendo a activar la opción Fecha: el usuario podrá seleccionar una **nueva fecha igual o posterior** a la fecha actual del dispositivo para repetir la misma configuración de horarios.
  - 🔁 **Cambiando a la opción Frecuencia**: convierte la lanzadera en un trayecto recurrente semanal, permitiendo seleccionar múltiples días y replicar los horarios definidos.
- Al finalizar:

  - Botones de finalización con dos opciones claras: Guardar o Cancelar:
    - **Guardar**: los datos introducidos se almacenan y el usuario regresa a la vista de configuración general de la lanzadera, manteniéndose visibles los horarios añadidos.
    - **Cancelar**: descarta todos los cambios realizados durante esa sesión de configuración y vuelve a la pantalla anterior sin guardar nada.
  - **Regresa a la pantalla principal** de configuración de lanzadera (NewShuttleScreen), donde se visualizará la configuración generada. La frecuencia se visualizará en forma de grupo, con:
    - Título: días seleccionados (ej. L,M,X,J,V)
    - Sentido del viaje: origen → destino
    - Listas de horarios: ida y vuelta
  - Al pulsar cualquier lista de horarios se podrá volver a editar desde la misma pantalla de configuración.

  ##### **Modo 2: Frecuencia semanal**

- Botón **Calendario**: seleccionar fecha de inicio de la frecuencia.
- Botón **Agregar días \+**: abre selector con CheckBoxListTile (lunes a domingo).
- Tras seleccionar uno o varios días:

  - Botón **Agregar horario** (TimePicker): se listan horarios bajo cada grupo de días y sentido.
  - Botón **Vuelta**: igual que en modo Fecha, para agregar horarios de retorno.

  #### **Finalización:**

- Botón Guardar o Cancelar
  - **Guardar**: los datos introducidos se almacenan y el usuario regresa a la pantalla principal de configuración de lanzadera (NewShuttleScreen), donde podrá revisar y terminar de guardar todos los detalles de la nueva lanzadera. La frecuencia configurada se visualizará en forma de grupo.
  - **Cancelar**: descarta todos los cambios realizados durante esa sesión de configuración y vuelve a la pantalla anterior sin guardar nada.
- **Cada grupo**:

  - Tiene un título con días
  - Lista de ida y de vuelta (si existe)
  - Editable al pulsar las listas

  ***

  ### **6\. PANTALLA DE LANZADERA**

  ###

  ### Al pulsar sobre una lanzadera desde Home, dentro de un grupo:

  Se abre la pantalla de Lanzadera, que es un **BottomNavigationBar \+ PageView.**

  #### **Las Subpantallas navegables son:**

- **PLAZAS** (por defecto)
  - Aquí se organiza todo lo relacionado con la solicitud de plazas, es el centro de la app; sin esta parte, la app no tendría sentido.
  - Se lista las salidas del horario, del día actual, con el número de plazas solicitadas en cada salida y el conjunto de usuarios (tipo baraja de cartas o tarjetas juntas…) seguido del número total de plazas solicitadas en verde si aún quedan libres y en rojo si ya se completó que al pulsarlo abre un chat para solo los viajeros de esa salida, para poder preguntar algo a cada uno o hablar a todos los que hayan solicitado plaza. Este chat es distinto al Chat General del grupo. Se consigue así ser más específico a la hora de conversar para que no cause confusión al resto. Deberá de verse de forma clara arriba que este chat lo vean solamente los usuarios que han solicitado plaza en esa salida.
  - Botón para solicitar plaza si se elige el rol de viajero.
- **HORARIOS**
  - Editables si el usuario es el creador o administrador.
  - Icono de lápiz (solo visible si el usuario es creador o administrador del grupo: abre pantalla de configuración (NewShuttleScreen).
  - Se muestran horarios filtrados según día y hora actuales.
  - Botón adicional para ver todos los horarios futuros.
- **CHAT** (A todo el grupo, Chat general)
  - Se distinguirá del otro chat de hora en concreto de una salida, en que aparecerá arriba muy visible el nombre: Chat general \[nombre del grupo\]
- **MAPA** (no MVP)
  ***

### **7\. SOLICITUD DE LANZADERA**

#### **🧹 Reglas Generales de Solicitud**

- Solo se pueden solicitar lanzaderas en horarios del día actual (no pasados).
- El usuario debe elegir su rol antes de abrir la pantalla de detalle de Lanzaderar: `Viajero` o `Conductor`.

##### **🚗 Si elige Viajero:**

- Se muestra el número de plazas disponibles.
- Puede aceptar o cancelar.
- Al aceptar:
  - Se reserva una plaza.
  - Se actualiza el contador de plazas.
  - Se envía una notificación al resto de miembros del grupo indicando:
    - Nombre del solicitante
    - Hora de la lanzadera
    - Estado actualizado de plazas

##### **🚌 Si elige Conductor:**

- Solo puede haber un conductor por horario.
- Si ya hay uno:
  - Se notifica y se desactiva la opción.
- Si no hay:
  - Formulario:
    - Selector de vehículo frecuente o ingreso de nueva matrícula
    - Si el vehículo no está registrado:
      - Preguntar número de plazas
      - Opcionar guardar como "vehículo frecuente"
  - Al confirmar:
    - Se asigna como conductor
    - Se actualiza el estado de la lanzadera
    - Se envía una notificación al grupo indicando que hay conductor asignado

#### **✅ Confirmación**

- Mensaje de éxito: "Plaza reservada correctamente"
- Botón de cancelación visible si ya se tiene plaza.

---

**TECNOLOGÍAS:**

- Flutter
- State Management \- Bloc o Riverpod (manejar interacciones)
- Firebase Authentication (login)
- Firebase Firestore (datos en tiempo real y chats)
- Firebase Cloud Functions (automatizaciones: notificaciones, etc)
- Firebase Cloud Messaging (FCM) (notificaciones cuando el viaje inicia o hay cambios en la lanzadera)
- Flutter Location Package (obtener ubicación)
- Google Maps API (ubicación de usuarios)
- Geofencing Plugin (alerta de cercanía a punto de recogida)
- Firebase Storage (almacén de archivos, fotos…)
- Github:
  - ramas main, develop, feature…
  - Usar "GitHub Projects" o "Issues" para organizar tareas en sprints.

**PASOS DEL PROYECTO**:

1. MVP Minimal Viable Product: login, funcionalidad de grupo, lanzadera, chat? mapa?
2. User Interface (Miro): Diseño y navegación de pantallas.
3. Configurar Firebase y Google Maps API.
4. GitHub:
   1. gitignore para Flutter
   2. rama develop
      1. rama feature
   3. Tareas: cada developer tiene un issue asignado.
   4. Revisar antes de fusionar a develop y main: Pull Request (PR)

**FUTURAS FUNCIONALIDADES:**

- [ ] Viajeros reciben notificaciones de seguimiento del vehículo.
- [ ] Características del coche (color, matrícula, etc)
- [ ] usar Firebase Firestore para mensajes básicos, en el MVP o siguiente versión, sin necesidad de una interfaz muy avanzada en la primera versión.
- [ ] En la lanzadera se podrá definir el lugar exacto en el mapa para el origen y destino, además del nombre que ya tiene, quedando guardado para poderlo usar en el mapa cuando se implemente.
- [ ] Posibilidad de incorporar lanzadera a demanda de tal manera que no sea necesario tenerlas programadas pudiendo haber usuarios que entren a la aplicación directamente como conductor y que usuarios puedan solicitar a demanda un transporte por si hay algún conductor disponible con un vehículo en la lanzadera seleccionada.

**RECOMENDACIONES PARA VERSIONES FUTURAS**:

- [ ] Definir bien los permisos de los usuarios que pueden invitar a otros miembros dentro del grupo.
- [ ] Cuando implementes Firestore en el MVP, verificar costos y optimización para evitar lecturas innecesarias y consumo excesivo de recursos.
- [ ] Si se agrega tracking en tiempo real, usar Firebase Firestore con actualizaciones por eventos en vez de lecturas constantes.

Notas:

1. **Product Backlog**: Contiene todas las características, mejoras y correcciones que se desean en el producto final. Es gestionado por el Product Owner.
2. **Sprint Backlog**: Es una lista de tareas seleccionadas del Product Backlog que el equipo se compromete a completar durante un sprint (un período de trabajo definido, generalmente de 1 a 4 semanas). Esto lo hará el Scrum Master…

De modo que hay que hacer una lista de product backlog aquí:  
…  
(TODO)

Sería interesante organizar cada trabajo según estos roles, para mejor organización en github, por grupos de trabajo:

- **Product Manager / Product Owner**:

  - Define y supervisa la visión del producto, los objetivos y la hoja de ruta.
  - Entiende las necesidades del cliente y colabora con los interesados para alinear el producto con los objetivos comerciales.

- **Project Manager**:

  - Gestiona los plazos, recursos y comunicación del proyecto.
  - Asegura que el proyecto se mantenga dentro del cronograma y el presupuesto.

- **Scrum Master**:

  - Facilita la implementación de prácticas ágiles y elimina obstáculos que puedan ralentizar el progreso del equipo.
  - Trabaja con el Product Owner para gestionar el backlog del producto y priorizar tareas.

- **UX Designer**:

  - Se enfoca en la experiencia del usuario, asegurando que la aplicación sea intuitiva y fácil de usar.
  - Crea personas, storyboards de usuario y wireframes, así como flujos de interacción.

- **UI Designer**:

  - Se encarga de los aspectos visuales de la aplicación, como el diseño de la interfaz, colores y tipografía.
  - Crea maquetas y prototipos de las pantallas de la aplicación.

- **Developers**:

  - Construyen la aplicación según los requisitos y el diseño.
  - Pueden ser desarrolladores de Android (Kotlin/Java), iOS (Swift/Objective-C) o desarrolladores multiplataforma (React Native, Flutter).

- **QA Engineer**:

  - Realiza pruebas en la aplicación para identificar y resolver errores o problemas funcionales.
  - Colabora con los desarrolladores para asegurar la calidad del producto.

- **DevOps Engineer / Release Manager**:

  - Se encarga de desplegar la aplicación en marketplaces como App Store y Google Play.
  - Implementa procesos de automatización y monitoreo para asegurar un despliegue eficiente.

- **Otros roles** (opcional):

  - **Visual Designer**: Crea elementos visuales avanzados y animaciones.
  - **Technical Writer**: Elabora documentación técnica y guías de usuario.
  - **Growth Hacker**: Analiza y optimiza métricas de adquisición y compromiso de usuarios.
  - **Community Manager**: Facilita la retroalimentación de los usuarios.
  - **Data Analyst**: Monitorea el uso de la aplicación.
