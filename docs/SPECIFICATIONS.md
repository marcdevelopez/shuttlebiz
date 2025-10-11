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

- 🔐 **Login por número de teléfono** con verificación SMS/OTP.
- ✅ **Sesión persistente** tras primer acceso.
- 🔁 **Sistema de recuperación y respaldo:**
  - **Recuperación por SMS**: Si se pierde el login, recuperable con el número registrado
  - **Datos básicos en Firebase**: UID, número de teléfono y datos mínimos de perfil
  - **Respaldo en la nube personal**: Chats e historial en Google Drive (Android) o iCloud (iOS)
  - **Respaldo local**: Opción alternativa configurable desde Ajustes
  - **Cambio de número**: Flujo en Configuración para actualizar número manteniendo UID
- 👥 **Sistema de roles flexible**: cualquier usuario puede usar tanto el rol de conductor como de viajero
  - **Selección dinámica**: al entrar a una lanzadera, el usuario decide qué rol tendrá en esa ocasión
  - **Configuración permanente**: opción para mantener un rol preferido por defecto
  - **Cambio de rol**: pantalla de ajustes con opción "Cambiar rol predeterminado" para modificar la preferencia

---

## **2\. Gestión de Grupos ("Biz")**

- 📦 Los usuarios pueden **crear un grupo** (biz) para organizar lanzaderas.
- 👤 Solo el **creador del grupo** puede:
  - Crear o modificar lanzaderas.
  - Expulsar usuarios.
  - Asignar otro administrador.
- 🔒 **Visibilidad del grupo** configurable al crearlo:
  - **Privado**: solo accesible por invitación directa del creador/admin
  - **Público**: aparece en la lista de grupos disponibles y permite solicitar acceso
  - 🔄 **Modificable**: la visibilidad puede cambiarse después de crear el grupo
- 👥 **Acceso según visibilidad**:
  - **Grupos privados**: solo invitación del creador/administrador
  - **Grupos públicos**: solicitud desde lista pública + aprobación del creador/admin
- 🏠 Los usuarios agregados verán automáticamente ese grupo en su pantalla Home.
- 📅 El sistema guarda internamente la **fecha/hora de incorporación al grupo**.
- 🚪 Cualquier usuario puede **salir del grupo** en cualquier momento.
- 🔄 Si el creador abandona:
  - El nuevo administrador será designado por él.
  - Si no hay designación, será el miembro más antiguo.

### **🚨 Alertas de Conductores (gestión por admins)**

- 👨‍💼 **Asignación de conductores potenciales**: Creadores y administradores pueden asignar conductores potenciales para el grupo
- 🔔 **Sistema de alertas**: El usuario seleccionado recibe un aviso de "servicio de lanzadera como conductor"
- ✅ **Respuesta requerida**: Puede aceptar o rechazar la solicitud
- 📝 **Motivo de rechazo**: Si rechaza, debe indicar motivo:
  - Respuestas rápidas: "Imprevisto urgente", "No estoy asignado", "Otro usuario será el conductor"
  - Opción de texto breve personalizado

---

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
- 🛑 Botón "reset":
  - Elimina todos los horarios del grupo seleccionado.
  - Aparece junto al nombre del grupo o al final de la lista.
- 🧾 Cada horario muestra de forma clara el día al que pertenece (etiqueta de fecha o subtítulo).
- 🧑‍💻 Si el usuario tiene permisos de edición (creador o administrador), podrá acceder a la pantalla completa de configuración de horarios.
- Para mayor usabilidad intentar implementar Copiar horarios con un botón "Copiar configuración a otro día".
- Colores diferenciados en Horarios de ida y Horarios de vuelta. Usar estos colores ya que además enlazan con los del logo de la app: \#0077B6 (azul intenso), \#FF6B6B (rojo coral).

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
  - Puede mostrarse como "estado completo".

---

## **5\. Reglas y Validaciones**

- 🚫 **Solo puede haber un conductor por horario**.
- 🔄 **Se puede anular una solicitud**.
- ✅ **Plazas disponibles visibles** en todo momento, con posibilidad de ver qué usuarios solicitaron plaza.
- 🛑 **No se puede solicitar plaza** si está completa.
- 🧾 Cada solicitud se guarda con fecha, rol y grupo asociado.
- 🧠 Validaciones para evitar solapamientos en la configuración de horarios.

---

## **6\. Comunicación y Notificaciones**

- 📢 Chat general por lanzadera _(no incluido en MVP)_.
- 🔐 **Privacidad de contacto**: el número de teléfono no será visible entre usuarios
  - Comunicación exclusivamente a través de mensajes dentro del grupo
  - **Versiones futuras**: llamada directa integrada en la app
  - **Opción personal**: cada usuario podrá configurar si mostrar su número de teléfono en su perfil
- 🔔 Notificaciones push:
  - Cuando un usuario se une a un grupo.
  - Cuando alguien solicita una plaza (informándose de plazas restantes).
  - Cuando comienza un viaje (para los viajeros).
- 🗺️ **Visualización de mapas incluida en MVP**:
  - **Pantalla de Grupo**: Mapas de todas las lanzaderas del grupo para consultar recorridos
  - **Pantalla de Lanzadera**: Mapa específico con trayecto, origen, destino y ubicación del usuario
  - **Funcionalidad futura**: Seguimiento en tiempo real del vehículo durante el viaje

### **📍 Políticas de Geolocalización** _(para implementación con mapas)_

- **🚗 Conductor**: Geolocalización **obligatoria** durante el viaje
  - Se activa automáticamente al confirmar salida de lanzadera
  - Visible para todos los viajeros de esa lanzadera específica
  - Necesaria para coordinación y seguridad del grupo
  - **Consentimiento requerido**: Aceptar términos de conductor incluye localización
- **🧑‍🤝‍🧑 Viajero**: Geolocalización **opcional**
  - El usuario decide si mostrar su ubicación o no
  - **Impacto en perfil**: No mostrar ubicación queda reflejado en perfil público
  - Puede ser factor negativo para aceptación en futuros grupos
  - Solo visible para el conductor y otros viajeros de la misma lanzadera
  - **Consentimiento granular**: Preguntar en cada viaje o configuración general

### **🔒 Privacidad y Retención de Datos GPS**

- **Almacenamiento temporal**: Los datos GPS se almacenan solo durante el viaje activo
- **Eliminación automática**: Al finalizar viaje, los datos de ubicación se eliminan en 24 horas
- **Excepciones de retención** _(solo con consentimiento explícito)_:
  - Estadísticas de rutas (datos anonimizados)
  - Histórico de viajes para soporte técnico (máximo 30 días)
- **Control del usuario**: Derecho a eliminación inmediata de cualquier dato de ubicación
- **Transparencia**: Log de acceso a ubicación visible en configuración de privacidad

### **⏰ Ventana de Activación del Tracking** _(para implementación con mapas)_

- **Cuándo se activa la localización**:
  - **Opción 1**: Tiempo fijo antes de la salida (ej: 30 minutos)
  - **Opción 2**: Cuando el conductor activa "Iniciar viaje"
  - **Opción 3**: Cuando el propio usuario decide mostrar ubicación
- **Visibilidad de ubicaciones**:

  - **Conductor puede ver**: Ubicación de todos los viajeros (si la han activado)
  - **Viajeros pueden ver**: Solo ubicación del conductor + otros viajeros que lo permitan
  - **Seguridad**: Los viajeros NO se ven entre sí automáticamente (privacidad)

---

## **7\. UX/UI Consideraciones**

- 🔀 Cambiar de grupo desde el nombre en la barra superior.
- 🟢 Estado visual por lanzadera y horario.
- 📅 Días sin lanzaderas muestran etiqueta "sin lanzadera".
- 📊 Colores y etiquetas para horarios de ida y vuelta.
- 📚 Implementación recomendada:

  - Provider, Riverpod o Bloc para actualización reactiva.
  - ExpansionTile para mostrar horarios organizadamente.

<br>

#

# **🚩 Navegación y Pantallas – ShuttleBiz**

## **🔹 Barra Superior de Navegación**

### **Estructura:**

\[ Nombre de la App (HOME) \] \[ Nombre del grupo \] \[ Menú \]

### **Comportamiento del selector de grupo:**

- Si **no hay ningún grupo creado**, el texto mostrará: Agregar un Grupo, seguido de un icono \+.
  - Al pulsarlo: navega a una pantalla de creación de grupo que incluye configuración obligatoria de **Visibilidad** (Privado/Público) además del nombre.
  - Este icono puede mantenerse visible o solo estar dentro del menú superior para evitar pulsaciones accidentales.
- Si **ya hay uno o varios grupos creados**, el string mostrará el nombre del grupo activo.

  - Al pulsarlo: se abre un diálogo con una lista desplegable para cambiar entre grupos.

<br>

---

# **📱 Pantallas**

### **1\. LOGIN**

- Primera pantalla de la app.
- Campos:
  - País
  - Número de móvil (obligatorio)
- Botón: Siguiente
  - Enlaza con pantalla de **Registro con Código**.
- Opcional: subir una imagen de usuario.

---

### **2\. REGISTRO CON CÓDIGO**

- Parte superior: texto indicando que se debe ingresar el código recibido por SMS.
- Se muestra el número de teléfono al que se envió el código.

  - Es editable tras pulsar "(editar)".

---

### **3\. ONBOARDING**

Tutorial interactivo sobre el funcionamiento de la app para nuevos usuarios (implementación detallada en Screen 14).

**Activación:**

- Automático para usuarios nuevos tras primer login
- Manual desde menú de configuración: Ajustes > Ayuda > Ver tutorial

**Referencia:** Ver Screen 14 para especificación completa

---

### **4\. PANTALLA DE GRUPOS** _(origen/home de la aplicación)_

**Función**: Permite ver los grupos del usuario y crear nuevos grupos. Es la pantalla principal de la app.

**Contenido**:

- **Lista de grupos**: Cada ítem representa un grupo con foto de perfil opcional
- **Estados**:
  - Si **no hay grupos**: Mostrar invitación a crear el primer grupo
  - Si **hay grupos**: Lista de todos los grupos del usuario
- **Acciones**:
  - Al pulsar un grupo: abre la **Pantalla de Grupo (5)**
  - Botón "+" para crear nuevo grupo
  - **Ícono de búsqueda**: Para descubrir grupos públicos disponibles
- **Búsqueda de grupos públicos**:
  - Al pulsar ícono de búsqueda: abre modal de búsqueda
  - Muestra grupos públicos ordenados por proximidad (si hay geolocalización)
  - Permite buscar por nombre del grupo
  - Cada resultado muestra: nombre, número de miembros, lanzaderas activas
- **Acceso permanente**: Logo de la app (la mano) da acceso a "Estado de Mis Solicitudes"

---

### **5\. PANTALLA DE GRUPO** _(vista completa del grupo)_

**Función**: Muestra todas las lanzaderas y funcionalidades de un grupo específico.

**Estructura**: BottomNavigationBar + PageView con 3 secciones:

#### **5.1 Horarios** _(sección principal)_

- Lista de próximas salidas de todas las lanzaderas del grupo
- Ordenadas por cercanía en tiempo
- Cada ítem muestra:
  - Nombre/identificación de la lanzadera
  - Sentido (origen → destino)
  - Hora de salida
  - Plazas solicitadas
- Al pulsar una salida: abre **Pantalla de Lanzadera**

#### **5.2 Chat** _(general del grupo)_

- Título visible: "Chat general [nombre del grupo]"
- Chat que abarca a todos los usuarios del grupo
- Más amplio que el chat de una lanzadera específica

#### **5.3 Mapa** _(incluido en MVP)_

- Visualización de mapas de todas las lanzaderas del grupo
- Permite consultar recorridos de todas las lanzaderas
- Vista panorámica de todos los trayectos del grupo

**Navegación**: Flecha que regresa a **Pantalla de Grupos (4)**

---

### **5.4 NEW SHUTTLE** _(modal/diálogo desde Pantalla 5)_

**Función**: Modal para crear una nueva lanzadera desde la Pantalla de Grupo.

**Campos obligatorios**:

- Nombre de la lanzadera (debe ser corto para UI)
- Origen y destino (nombres cortos, se avisará de evitar nombres largos)
- Plazas por defecto
- Configuración de horario (fecha única o frecuencia)
- **Coordenadas opcionales**: Para origen y destino (mapas)
- **Doble sentido**: Checkbox para ida y vuelta

**Subpantalla 5.4.1**: Comentario ampliado con área de texto expandida

---

### **6\. PANTALLA DE LANZADERA** _(vista específica de lanzadera)_

**Función**: Vista detallada de una lanzadera específica accesible desde Pantalla de Grupo.

**Estructura**: BottomNavigationBar + PageView con 3 secciones:

#### **6.1 Horarios** _(sección central)_

- Lista de salidas del día actual de esta lanzadera específica
- **Encabezado**:
  - Izquierda: "IDA" o "VUELTA" (sentido actual en grande)
  - Derecha: Botón pequeño para cambiar sentido (si tiene doble sentido)
- **Cada ítem muestra**:
  - Sentido (origen → destino, truncado si es necesario)
  - Hora de salida
  - Plazas en formato [solicitadas]/[plazas del vehículo]
- **Al pulsar un horario**: Abre **Detalle de Salida** con:
  - Lista de usuarios (viajeros con plaza)
  - Conductor en parte superior con descripción del vehículo
  - Al pulsar usuario: chat individual/privado
  - **Al pulsar imagen del usuario**: abre perfil con datos de reputación
  - Foto del vehículo (almacenada en iCloud/Drive)

#### **6.2 Chat** _(de la lanzadera)_

- Chat específico de esta lanzadera
- Solo usuarios solicitantes/viajeros de esta lanzadera
- Más específico que el chat general del grupo

#### **6.3 Mapa** _(incluido en MVP)_

- Trayecto en línea azul
- Punto de origen
- Punto de destino
- Punto donde está el usuario
- **Futuras versiones**: Seguimiento del vehículo en tiempo real

**Navegación**:

- **Primera flecha**: Pantalla de Lanzadera → Pantalla de Grupo (5)
- **Segunda flecha**: Pantalla de Grupo → Pantalla de Grupos (4)
- **Total**: Dos flechas consecutivas para llegar al origen

---

### **7\. CONFIGURACIÓN (Settings)**

**Función**: Configuración general de la aplicación.

**Opciones**:

- Idioma (si se plantea multilenguaje)
- Tema claro/oscuro
- Avisos/notificaciones
- **Configuración de copia de seguridad** (Drive/iCloud)
- **Cambiar número de teléfono** (mantiene UID)
- Ayuda/contacto
- **Eliminar cuenta** (flujo crítico)

---

### **8\. ESTADO DE MIS SOLICITUDES**

**Función**: Vista permanente de todas las solicitudes del usuario.

**Acceso**: Logo de la app (la mano) en barra superior

**Contenido**:

- **Solicitudes futuras**: Lista de próximas reservas
- **Solicitudes pasadas**: Historial de viajes
- **Acciones**: Cancelar solicitud desde esta pantalla
- **Información detallada**: Fecha, hora, grupo, lanzadera, rol, estado

---

### **9\. PERFIL DE USUARIO**

**Función**: Gestión del perfil personal y estadísticas.

**Configuración disponible**:

- Editar foto de perfil
- Nombre/alias
- País/número (número no editable directamente)
- **Historial completo**: Solicitudes y viajes realizados
- **Estadísticas visibles**:
  - Viajes completados
  - Viajes cancelados (importante para reputación futura)
  - Veces como conductor
  - Cancelaciones como conductor
- **Sección opcional**: "Mis lanzaderas frecuentes"

**Nota**: Datos del historial se guardan en iCloud/Drive del usuario

---

### **10\. GESTIÓN DE VEHÍCULOS** _(por grupo)_

**Función**: Ver, agregar, editar y eliminar vehículos frecuentes del grupo.

**Acceso**: Desde Ajustes del grupo (cada grupo maneja sus vehículos)

**Interfaz**:

- Lista de ítems: vehículo + miniatura circular
- Al pulsar vehículo: editar datos

**Para conductores**:

- Ver lista de vehículos frecuentes del grupo
- Al seleccionar uno: opciones "Elegir", "Editar", "Crear nuevo"
- Al elegir: se asigna al viaje y usuario queda como conductor
- **Foto del vehículo**: Almacenada en iCloud/Drive del usuario

---

### **11\. ESTADOS ESPECIALES DE LA APP**

#### **11.1 Gestión automática de cancelaciones**

- **15 minutos antes**: Si no hay conductor, aviso a creador y administradores
- **Hora de salida pasada**: Cancelación automática y aviso a usuarios con plaza
- **Conductor tardío**: Si aparece después, notificar salida tardía con tiempo de retraso

#### **11.2 Estados de inicio**

- **Sin grupos**: Invitación a crear primer grupo
- **Con grupos**: Lista normal de grupos disponibles

  #### **Vista previa de cada lanzadera:**

- Nombre
- Origen \- Destino
- Plazas disponibles
- Estado visual:

  - Verde claro: activa, con plazas disponibles.
  - Rojo: sin plazas o fuera de horario.

---

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

---

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

---

### **7. SELECCIÓN DE ROL**

Antes de acceder a la pantalla de lanzadera, el usuario debe elegir su rol para esa sesión.

- **Cuándo aparece:** Al pulsar una lanzadera desde HOME
- **Opciones:**
  - 🚗 **Conductor** - Ofrece el vehículo y maneja la lanzadera
  - 🧑‍🤝‍🧑 **Viajero** - Solicita plaza como pasajero
- **Comportamiento:**
  - La elección afecta qué puede hacer en la pantalla de lanzadera
  - El conductor puede modificar plazas disponibles ese día
  - Los viajeros solo pueden solicitar plaza
- **Persistencia:** Se recuerda la última elección por lanzadera

---

### **8. SOLICITUD DE LANZADERA**

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

### **9. GESTIÓN DE GRUPOS**

Pantalla para administrar grupos existentes (accesible desde menú superior).

#### **Para creadores/administradores:**

- **Información del grupo:**
  - Nombre (editable)
  - Fecha de creación
  - Número de miembros
- **Gestión de miembros:**
  - Lista de usuarios del grupo
  - Promover a administrador
  - Expulsar miembros
- **Configuración:**
  - Grupo público/privado
  - Auto-aprobación de nuevos miembros
- **Acciones:**
  - Invitar nuevos miembros (código/enlace)
  - Eliminar grupo (confirmación)

#### **Para miembros regulares:**

- Ver información del grupo
- Lista de miembros
- Abandonar grupo

---

### **10. UNIRSE A GRUPO EXISTENTE**

Flujo para usuarios que quieren unirse a un grupo creado por otros.

- **Métodos de acceso:**
  - Código de invitación (6 dígitos)
  - Enlace compartido
  - Búsqueda por nombre (si es público)
- **Pantalla de búsqueda:**
  - Campo para código/nombre
  - Lista de grupos públicos cercanos
- **Vista previa del grupo:**
  - Nombre, descripción
  - Número de miembros
  - Lanzaderas activas (preview)
- **Solicitud:**
  - Botón "Solicitar unirse"
  - Mensaje opcional al administrador

---

### **11. PERFIL DE USUARIO**

Pantalla de gestión del perfil personal y configuración de la aplicación.

- **Información personal:**
  - Foto de perfil (opcional)
  - Nombre de usuario
  - Número de teléfono (no editable)
  - Fecha de registro
- **Estadísticas:**
  - Viajes completados
  - Grupos activos
  - Calificación como conductor/viajero (futuro)
- **Configuración:**
  - Notificaciones push
  - Visibilidad del perfil
  - Tema de la app
  - **Cambiar rol predeterminado**: opción para establecer rol preferido (conductor/viajero)

---

### **12. GESTIÓN DE VEHÍCULOS**

Pantalla dedicada para gestionar vehículos frecuentes o guardados por grupo.

- **Acceso para crear/agregar:**
  - **Creadores y administradores:** Pueden agregar vehículos directamente (aprobados automáticamente)
  - **Cualquier miembro actuando como conductor:** Puede solicitar aprobación para crear nuevos vehículos cuando va a conducir
- **Acceso para editar/eliminar:**
  - **Creadores y administradores:** Pueden editar/eliminar cualquier vehículo del grupo
  - **Conductor que creó el vehículo:** Puede editar su propio vehículo sin autorización adicional
- **Funcionalidades:**
  - **Sistema de aprobación:** Solo las solicitudes de creación de nuevos vehículos requieren aprobación del creador/admin del grupo
  - **Trazabilidad:** Se registra automáticamente quién hizo la última modificación en cada vehículo
  - **Notificaciones:** Administradores y creadores reciben notificación de nuevas solicitudes de creación
  - **Chat integrado:** Comunicación durante proceso de aprobación de nuevos vehículos
- **Datos del vehículo:**
  - **Obligatorios:**
    - Número de matrícula
    - Número de plazas
  - **Opcionales:**
    - Modelo del vehículo
    - Marca
    - Color
- **Persistencia:** Los vehículos se guardan por grupo y pueden ser reutilizados por cualquier conductor del grupo
- **Integración:** Al crear una lanzadera como conductor, se puede seleccionar de vehículos aprobados o solicitar agregar uno nuevo (con aprobación)
- **Estados:** Los vehículos pueden estar en estado 'aprobado', 'pendiente' o 'rechazado'

---

### **13. RECUPERACIÓN DE CUENTA**

Pantalla para casos de pérdida de móvil o cambio de número de teléfono.

- **Acceso:** Enlace desde pantalla de login
- **Métodos de recuperación:**
  - Verificación con número de teléfono anterior (si está disponible)
  - Verificación por email (si se configuró)
  - Contacto con soporte (último recurso)
- **Flujo de recuperación:**
  - Ingreso del nuevo número de teléfono
  - Verificación de identidad
  - Transferencia de cuenta al nuevo número
  - Confirmación y acceso restaurado
- **Seguridad:** Proceso de verificación robusto para prevenir accesos no autorizados

---

### **14. ONBOARDING MEJORADO**

Tutorial interactivo sobre el funcionamiento de la app para nuevos usuarios.

**Contenido del tutorial:**

- **Pantalla 1**: Bienvenida y presentación de ShuttleBiz
  - Logo y mensaje de bienvenida
  - Breve descripción: "Organiza viajes compartidos con tu comunidad"
- **Pantalla 2**: Cómo funcionan los grupos
  - Explicación de los "Biz" (grupos)
  - Diferencia entre grupos públicos y privados
  - Roles dentro de un grupo
- **Pantalla 3**: Crear y gestionar lanzaderas
  - Cómo crear una nueva lanzadera
  - Configurar horarios y frecuencias
  - Vista previa de lanzadera
- **Pantalla 4**: Solicitar plazas y ser conductor
  - Selección de rol (conductor/viajero)
  - Proceso de solicitud de plaza
  - Gestión de vehículos
- **Pantalla 5**: Comunicación y notificaciones
  - Sistema de chat por grupo
  - Tipos de notificaciones
  - Configuración de privacidad

**Características técnicas:**

- PageView con indicadores de progreso
- Botones "Siguiente", "Saltar" y "Empezar"
- Animaciones suaves entre pantallas
- Disponible después como ayuda en el menú: Ajustes > Ayuda > Ver tutorial

**Activación:**

- Automático para usuarios nuevos tras primer login
- Manual desde menú de configuración

---

### **15. GESTIÓN DE NOTIFICACIONES**

Sistema completo de notificaciones push e in-app para mantener informados a los usuarios.

- **Tipos de notificaciones:**
  - Nueva lanzadera creada en grupo
  - Alguien solicita plaza en tu viaje
  - Plaza confirmada/rechazada
  - Recordatorio 30min antes del viaje
  - Cambios en horarios
  - Mensajes del chat específico
  - **Invitación recibida** para ser miembro de un grupo
- **Configuración:** Usuario puede desactivar tipos específicos de notificaciones
- **Implementación:** Push notifications con Firebase Cloud Messaging (FCM)
- **Centro de notificaciones:** Historial in-app de notificaciones recibidas

---

### **16. SISTEMA DE CHAT DETALLADO**

Comunicación completa entre usuarios con múltiples canales de chat.

#### **Chat general del grupo:**

- Historial persistente de mensajes
- Mensajes multimedia (fotos, ubicación)
- Menciones @usuario
- Funcionalidad de búsqueda de mensajes

#### **Chat específico de viaje:**

- Solo visible para participantes de esa salida específica
- Se archiva automáticamente después del viaje
- Información contextual (hora, destino) siempre visible
- Lista de participantes del viaje

#### **Características de mensajes:**

- Estados de mensajes (enviado, entregado, leído)
- Indicador de "escribiendo..."
- Timestamps de mensajes
- Cola de mensajes offline

<br>

---

## **🎨 Mejoras de Interfaz y Experiencia de Usuario**

### **Navegación y Encabezados**

#### **Títulos de pantalla:**

- Mostrar en la esquina superior izquierda el nombre de cada pantalla (Grupos, Lanzaderas, Horarios, Chat, etc.)
- Seguir el patrón de aplicaciones exitosas para facilitar la orientación del usuario

#### **Navegación inferior:**

- Implementar paginador inferior (BottomNavigationBar) en:
  - Pantalla de grupos
  - Pantalla de lanzaderas
  - Pantalla de chat
- Mejora la accesibilidad y navegación rápida entre secciones principales

#### **Botones de acción:**

- **En pantalla de lanzaderas:** Botón (+) en esquina inferior derecha para crear nueva lanzadera
- **En pantalla de grupos:** Botón (+) en barra superior (centro-izquierda, antes del menú hamburguesa) para agregar grupos

### **Estados de Error y Casos Extremos**

#### **Pantalla HOME:**

- **Estado sin conexión:** Interfaz clara cuando no hay internet disponible
- **Grupos archivados:** Sistema para gestionar grupos inactivos
- **Límite de grupos:** Definir y manejar el máximo número de grupos por usuario

#### **Pantalla de LANZADERA:**

- **Lanzadera inactiva:** Visualización cuando está deshabilitada temporalmente
- **Sin horarios hoy:** Estado informativo cuando no hay viajes programados
- **Conflicto de horarios:** Manejo de overlapping entre diferentes viajes

### **Accesibilidad:**

- Soporte para lectores de pantalla
- Validación de contraste de colores
- Tamaños de fuente accesibles
- Tamaños mínimos de áreas táctiles

<br>

---

## **⚖️ Reglas de Negocio y Resolución de Conflictos**

### **Preguntas Críticas del Sistema:**

#### **Conflictos de Conductores:**

1. **¿Qué pasa si hay dos conductores para la misma lanzadera/horario?**

   - Sistema de resolución: primer conductor confirmado tiene prioridad
   - Notificación al segundo solicitante con opciones alternativas

2. **¿Usuario solicita plaza pero ya hay conductor asignado?**
   - Validación automática antes de mostrar opciones
   - Interfaz clara del estado actual de la lanzadera

#### **Gestión de Plazas:**

3. **¿Conductor cancela el día del viaje?**

   - Sistema de notificaciones automáticas a todos los pasajeros
   - Opciones de rebooking o cancelación automática

4. **¿Más solicitudes que plazas disponibles?**
   - Sistema de lista de espera o first-come-first-served
   - Notificaciones automáticas cuando se liberen plazas

#### **Gestión de Grupos:**

5. **¿Usuario abandona grupo con lanzaderas activas?**

   - Limpieza automática de datos y notificaciones relevantes
   - Transferencia o cancelación de lanzaderas si es creador

6. **¿Creador del grupo elimina su cuenta?**

   - Sistema de transferencia de ownership automática
   - Disolución controlada del grupo si no hay sucesores

7. **¿Lanzadera tiene reservas pero se quiere eliminar?**
   - Workflow de cancelación con notificaciones previas
   - Confirmación obligatoria y período de gracia

### **Sistema de Permisos Detallado:**

- **Creador del grupo:** Permisos completos sobre todas las funcionalidades. También puede actuar como conductor en cualquier lanzadera del grupo
- **Administrador:** Gestión de miembros, creación de lanzaderas, aprobación de solicitudes de creación de nuevos vehículos, sin poder eliminar el grupo. También puede actuar como conductor en cualquier lanzadera del grupo
- **Miembro estándar:** Solo puede solicitar plazas y gestionar sus propias solicitudes
- **Cualquier miembro actuando como conductor:** Puede solicitar aprobación para crear nuevos vehículos cuando va a conducir una lanzadera (requiere aprobación de admin/creador del grupo). Una vez aprobado, puede editar el vehículo que creó sin autorización adicional. Sistema de trazabilidad registra quién hizo la última modificación

<br>

---

## **MODELO DE DATOS**

> 📋 **Referencia completa:** Ver [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md) para especificaciones detalladas de Firestore, modelos Dart con Freezed, reglas de seguridad y optimizaciones.

### **Entidades principales:**

- **User**: Perfil, roles, configuración de privacidad
- **Group**: Grupos públicos/privados con gestión de miembros
- **Vehicle**: Vehículos frecuentes por grupo con permisos específicos
- **Shuttle**: Lanzaderas con horarios únicos o recurrentes
- **Booking**: Reservas de plazas con roles de conductor/viajero
- **Message**: Chat general y específico por viaje

<br>

---

## **TECNOLOGÍAS:**

- Flutter
- State Management - Riverpod (manejar interacciones)
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

<br>

---

## 🧰 Helpers y Utilidades Globales

Archivo principal: `lib/core/utils/helpers.dart`

Centraliza funciones comunes que asisten a diferentes módulos de la app.  
No implementa lógica de negocio, pero mejora la consistencia y reusabilidad en toda la arquitectura.

### Categorías principales

- **UI**

  - `showSnackBarSuccess()` y `showSnackBarError()` para mensajes visuales coherentes.
  - `dismissKeyboard()` para cerrar el teclado desde cualquier pantalla.
  - Detección automática de modo oscuro.

- **Diálogos**

  - `showConfirmationDialog()` con título, mensaje y botones configurables.

- **Validación**

  - `validateEmail()`, `validateLink()`, `validateEmpty()` usados en formularios de login, grupos y lanzaderas.

- **Geolocalización básica**

  - `calculateDistance(lat1, lon1, lat2, lon2)` — cálculo aproximado de distancia (no sustituye el tracking GPS).

- **Utilidades generales**

  - `generateInvitationCode()` — usado en flujos de invitación por código.
  - `formatDuration()` — formatea duración de viajes u operaciones.
  - `getFileSize()` — devuelve tamaño legible de archivos.

- **Depuración (Debug)**
  - `debugLog()` — imprime logs solo en modo desarrollo, evitando ruido en producción.

📘 _Estas funciones son auxiliares y se usarán a lo largo de las features definidas en las secciones anteriores (grupos, lanzaderas, chat, etc.) para mantener coherencia visual y lógica en toda la app._

<br>

---

## **PASOS DEL PROYECTO**:

1. MVP Minimal Viable Product: login, funcionalidad de grupo, lanzadera, chat? mapa?
2. User Interface (Miro): Diseño y navegación de pantallas.
3. Configurar Firebase y Google Maps API.
4. GitHub:
   1. gitignore para Flutter
   2. rama develop
      1. rama feature
   3. Tareas: cada developer tiene un issue asignado.
   4. Revisar antes de fusionar a develop y main: Pull Request (PR)

<br>

---

## **FUTURAS FUNCIONALIDADES:**

### **Post-Fase 5 (Polish & Deploy):**

- [ ] **Sistema de estadísticas de viajeros**:

  - Contador de viajes cancelados por usuario
  - Sistema de opiniones y puntuaciones entre usuarios
  - Reputación visible para otros miembros del grupo
  - Historial de comportamiento para mejorar la confianza

- [ ] **IA Asistente en ShuttleBiz**:

  - Interpretación de solicitudes en lenguaje natural
  - Sugerencias automáticas de horarios y rutas
  - Optimización de ocupación de vehículos
  - Predicción de demanda por rutas

- [ ] **Sistema de Ayuda Inteligente** _(tipo bot contextual)_:

  - **Sugerencias contextuales**: En cada pantalla, el sistema sugiere próximas acciones posibles
  - **Ejemplos de sugerencias**:
    - Al crear grupo → "¿Quieres crear tu primera lanzadera?"
    - Al configurar horario puntual → "¿Prefieres añadir frecuencia semanal?"
    - En pantalla vacía → "¿Necesitas ayuda para empezar?"
  - **Interfaz tipo chatbot**: Botón flotante que responde a consultas de usuario
  - **Navegación inteligente**: "Llévame a crear vehículo" → dirige automáticamente
  - **Aprendizaje de patrones**: Sugiere acciones basadas en comportamiento del usuario

- [ ] **Sistema de comunicación avanzado**:

  - Llamadas directas integradas en la app
  - Videollamadas para coordinación grupal
  - Sistema de mensajes de voz
  - Integración con servicios de mapas para ubicación en tiempo real

- [ ] **Configuración avanzada de privacidad**:
  - Opción por usuario para mostrar número de teléfono personal
  - Niveles de visibilidad del perfil (completo/básico/anónimo)
  - Control granular de notificaciones por tipo de evento

### **Funcionalidades adicionales:**

- [ ] Viajeros reciben notificaciones de seguimiento del vehículo.
- [ ] Características del coche (color, matrícula, etc)
- [ ] usar Firebase Firestore para mensajes básicos, en el MVP o siguiente versión, sin necesidad de una interfaz muy avanzada en la primera versión.
- [ ] En la lanzadera se podrá definir el lugar exacto en el mapa para el origen y destino, además del nombre que ya tiene, quedando guardado para poderlo usar en el mapa cuando se implemente.
- [ ] Posibilidad de incorporar lanzadera a demanda de tal manera que no sea necesario tenerlas programadas pudiendo haber usuarios que entren a la aplicación directamente como conductor y que usuarios puedan solicitar a demanda un transporte por si hay algún conductor disponible con un vehículo en la lanzadera seleccionada.

<br>

---

#### **RECOMENDACIONES PARA VERSIONES FUTURAS**:

- [ ] Definir bien los permisos de los usuarios que pueden invitar a otros miembros dentro del grupo.
- [ ] Cuando implementes Firestore en el MVP, verificar costos y optimización para evitar lecturas innecesarias y consumo excesivo de recursos.
- [ ] Si se agrega tracking en tiempo real, usar Firebase Firestore con actualizaciones por eventos en vez de lecturas constantes.

Notas:

1. **Product Backlog**: Contiene todas las características, mejoras y correcciones que se desean en el producto final. Es gestionado por el Product Owner.
2. **Sprint Backlog**: Es una lista de tareas seleccionadas del Product Backlog que el equipo se compromete a completar durante un sprint (un período de trabajo definido, generalmente de 1 a 4 semanas). Esto lo hará el Scrum Master…

De modo que hay que hacer una lista de product backlog aquí:

<br>

---

### Roles de trabajo en equipo

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
