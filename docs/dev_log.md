# 📝 ShuttleBiz — Dev Log

Bitácora cronológica del desarrollo de ShuttleBiz (MVP).

Sirve para:

- Seguir la fase y el estado real del proyecto
- Registrar decisiones y bloqueos
- Conectar specs/roadmap con el trabajo diario
- Permitir a cualquier dev retomar sin perder contexto

---

# 📍 Estado actual

Fase activa: **0 — punto 9: Guías visuales básicas en progreso (tipografía lista)**
Última actualización: 2025-11-27

---

# 📅 Diario de desarrollo

## 🗓️ Día 1 — 2025-11-20

### ✔ Trabajo realizado:

- Estructura `/docs` revisada
- `SPECIFICATIONS.md` consolidado
- `ROADMAP.md` revisado

### 🧠 Decisiones tomadas:

- Riverpod + GoRouter + Firebase (Auth/Firestore/FCM) se mantienen
- MVP arranca sin backups Drive/iCloud ni multimedia en chat
- Flujos de conductor: solo asignación manual (sin automatismos 5/40 min al inicio)

### ⚠️ Problemas encontrados:

- Ninguno

### 🎯 Próximos pasos:

- Completar la sección de interfaz del Nivel Grupo en `SPECS.md`.
- Ajustar `ROADMAP.md` para reflejar la fase de cierre de especificaciones.
- Bosquejar guía visual básica (tipografía, paleta, patrones de modales/chips).

---

## 🗓️ Día 2 — 2025-11-24

### ✔ Trabajo realizado:

- Se completó la sección 5 (Nivel Grupo) de la interfaz gráfica en `SPECS.md`.
- Se detalló el flujo de creación/edición de lanzaderas y accesos a ajustes (menú ⋮) en nivel grupo.

### 🧠 Decisiones tomadas:

- Mantener patrón BottomNavigationBar + PageView para el nivel grupo y exponer ajustes en el menú ⋮.
- Posponer el cierre del resto de secciones de SPECS y la guía visual básica a una fase dedicada en el roadmap.

### ⚠️ Problemas encontrados:

- Falta una fase explícita en el roadmap para cerrar SPECS y definir guías visuales básicas.

### 🎯 Próximos pasos:

- Completar el resto de SPECS (niveles grupo/lanzadera, pantallas 6.x+).
- Definir el aspecto básico de las pantallas (tipografía, colores, componentes principales) como guía de desarrollo.
- Actualizar el roadmap con la fase de cierre de especificaciones y guía visual.

---

## 🗓️ Día 3 — 2025-11-25

### ✔ Trabajo realizado:

- Se definió la **Pantalla 8 — Mis Solicitudes** en `SPECS.md`, con acceso desde el icono ✋ en Home/Chat/Horarios/Mapa de los 3 niveles y sin icono en pantallas secundarias.
- Se creó `docs/GLOSSARY.md` y se enlazó desde specs/README; términos CTA/Salida/Badge referenciados.
- Se completó la especificación de **Navegación y Menús Superiores Contextuales** (breadcrumb, stack PageView por nivel, menús ⋮ por pantalla, botón atrás del sistema, transiciones).
- Se cerró el **Flujo de Horarios y Gestión Modular**: separación edición lanzadera vs. horarios, flujo de creación sin horarios + modal, detalle de salida (solicitar/anular), chips Ida/Vuelta y comentario único por lanzadera.
- Se cerró el **Sistema de Conflictos de Días en Horarios**: días ocupados visibles en gris, modal con tarjetas comparativas (horas actuales/fusionar/nuevas) y confirmación, y guía visual de estados de día.
- Se cerró **Chats Privados entre Usuarios**: pestaña para cambiar entre chat grupal y lista de privados por nivel, botón de mensaje en perfil, y chat conductor↔creador/admin como panel fijo en gestión de vehículos.
- Se definió el **Centro de Notificaciones** (Pantalla 7): icono 🔔 con badge, tabs (no leídas, leídas, solicitudes, cambios, chats), filtros grupo/lanzadera, acciones (aceptar/rechazar invitaciones, abrir chat, eliminar) y alertas urgentes (ej. conductor sin ubicación con badge 📍).

### 🧠 Decisiones tomadas:

- Invitaciones visibles tanto en notificaciones como en chat privado del invitante con botones inline; aceptar en cualquiera desbloquea el chat.
- Pestaña `Solicitudes` resaltada si requiere respuesta urgente; badge 📍 en icono 🔔 si el conductor debe activar ubicación.
- Pantalla 8 es pantalla independiente, no modal; enlaces de acceso solo desde AppBars principales.
- Claridad de AppBars: se documentó explícitamente dónde se muestra/oculta el icono ✋ para evitar ambigüedades.
- Navegación: al bajar/subir de nivel se mantiene la pestaña activa del PageView; breadcrumb obligatorio en AppBar; transiciones slide+fade 150–200 ms; menús ⋮ definidos por nivel/pestaña.

### 🎯 Próximos pasos:

- Completar fase 0 pendientes (terminología por nivel, guías visuales básicas).
- `ROADMAP.md` actualizado: prioridad alta ítem 4 marcado como completado (especificación cerrada).
- Continuar con prioridades altas pendientes de Fase 0 (navegación/menús contextuales, flujo de horarios, sistema de conflictos, chats privados).
- Refinar guía visual básica (tipografía, paleta, patrones de modales/chips) en `SPECS.md`.

---

## 🗓️ Día 5 — 2025-11-26

### ✔ Trabajo realizado:

- Se cerró el punto **7. Terminología y Contenido por Nivel** de la Fase 0 en `SPECS.md` (terminología frecuencia/fecha única, etiquetas de fecha, comportamiento DatePicker y contenido de Chat/Horario/Mapa por nivel).
- Se elevó a MVP el **seguimiento básico en tiempo real** en el mapa de lanzadera (6.4) con refresco 5–10 s y alertas si falta ubicación, conectado a la regla de ubicación previa de conductores.
- Se actualizó `ROADMAP.md` marcando el ítem 7 como completado.
- Se añadió configuración de **ubicación de preparación/garaje** y **margen de preparación** en creación/edición de lanzadera, integrada en validaciones y tracking.
- Se completó el ítem **8. Historial de Reputación**: modal de valoración 1–5, categorías (puntualidad, fiabilidad, trato con peso 2), fórmula y visualización en perfil.
- Se aclaró que no hay logout ya que solo hay eliminación de cuenta o cambio de número
- Se añadió el extra de 12.1 para configuración de notificaciones.
- Creación de pantalla de edición de perfil de usuario.

### 🧠 Decisiones tomadas:

- Mantener tracking en vivo desde T-40 min configurable hasta llegada, priorizando refresco 5–10 s (máx. 15 s si se optimiza batería/datos).
- Alertas de falta de ubicación se reflejan tanto en mapa como en notificaciones (badge/⚠️).
- La reputación pondera trato x2 y puntualidad/fiabilidad x1, solo con viajes completados y valoración por viaje; valoraciones caducan a las 24 h.
- La app no tiene logout
- Eliminación de rol de conductor o viajero, se decide en la pantalla de horarios antes de usar una lanzadera.

### 🎯 Próximos pasos:

- Completar guías visuales básicas pendientes (tipografía, paleta, patrones de modales/chips) para cerrar entregables de Fase 0.
- Revisar `DATABASE_SCHEMA.md` para alinear nomenclatura de horarios/fechas con las specs finalizadas.

---

## 🗓️ Día 6 — 2025-11-27

### ✔ Trabajo realizado:

- Se registró que el ítem **"Conductor visible en listado"** de la Fase 0 ya estaba cubierto en `SPECS.md` (sección 5.3: tarjetas de lanzaderas muestran `Conductor: Nombre` / `Sin conductor` junto a plazas).
- Se afinó **Gestión de vehículos**: acceso visible a creador/admin, conductores asignados/solicitados y creadores de un vehículo del grupo; permisos claros (creador/admin gestionan, conductores pueden elegir y solicitar alta/edición con aprobación). `SPECS.md` y `ROADMAP.md` actualizados.
- Se detalló la alerta **T-30 min sin vehículo**: push + banner persistente con CTA a Pantalla 10, recordatorio a 5 min, escalado a creador/admin y chat; badge rojo hasta asignar vehículo.
- Se especificó el flujo **“Elegir como lanzadera”** en Pantalla 10.2: visibilidad por rol (creador/admin, conductor asignado/solicitado, creador del vehículo), texto dinámico según número de salidas, selector cuando hay varias, validación de solapes y feedback con Snackbar + retorno a la pantalla previa; notificación T-30 abre Pantalla 10 con lanzadera preseleccionada.
- Se documentó el **Modal de continuidad de conductor** en Pantallas (6.3.2.a): UI, botones, timeout de 2 min, manejo si ya hay conductor asignado y salto al selector de vehículo si acepta sin vehículo.
- Se añadió el **Modal de conflictos de horario** (6.3.3.a): tarjetas comparativas (actuales/fusión/nuevas), layout, badges, selección única, confirmación/cancelación y avisos de conflicto.
- Se añadió el **Modal de eliminación de horario** (6.3.1.a): UI con campo “ELIMINAR”, advertencia de cancelación de solicitudes, botones, y notificaciones tras confirmar.
- Se incorporó la **Pantalla/Modal de invitación a grupo (receptor)** (7): detalle de invitación, botones Aceptar/Rechazar, info de grupo, integración con notificaciones y chat privado.
- Se especificó el **Modal de cambio rápido de grupo** (5.1.a): acceso desde el nombre del grupo en AppBar, bottom sheet con buscador, lista de grupos con rol/badges y próxima salida, selección mantiene la pestaña activa en el nuevo grupo.
- Se añadió el **Modal prioritario de activación de ubicación** (7.2): texto, acciones (activar ubicación / cancelar conducción), comportamiento de alerta/badge y flujo de reasignación al cancelar.
- Se añadió el **Modal de alertas de conductor (admin/creador → conductor)** (7.3): invitación/servicio, aceptación/rechazo con motivo, vista de estado para admin (reasignar, mensaje, cancelar) y flujos de reenvío/escalado.
- Se añadió la **Pantalla de solicitudes pendientes** (5.5.a): buscador, lista de solicitudes con contexto, acciones Aceptar/Rechazar con feedback, estado vacío e integración con gestión de grupo.
- Se añadió el **Modal de solicitud de membresía** (4.1.3.a): botón Solicitar unirse, mensaje opcional, resumen del grupo, feedback y estado en Mis Solicitudes.
- Se creó la **Pantalla de historial de notas/averías** (10.2.a): lista cronológica con iconos ℹ️/⚠️, autor/fechas, filtros, agregar/editar/eliminar propias notas, y diferenciación visual entre avería y característica.
- Se añadió visibilidad de averías activas: badge ⚠️ en listado de vehículos (10) y icono ⚠️ en encabezado de 10.2 que enlaza a 10.2.a filtrado por averías.
- Se detallaron **estados de error y vacíos** (sin conexión, sin grupos, sin lanzaderas, sin horarios hoy, conflicto de horarios con modal 6.3.3.a).
- Se definió el **Modal de guardar cambios** (6.3.3.b) para salidas sin guardar con opciones Descartar/Guardar/Cancelar.
- Se añadió patrón base de empty states (icono, título, descripción, CTA) y los estados de “sin notificaciones” y “sin solicitudes”.

### 🧠 Decisiones tomadas:

- Mantener la visibilidad de conductor únicamente en listados de horarios (5.3); no se replica en la pantalla de Chat (5.2) porque no aporta al flujo de chat.
- El creador de un vehículo puede proponer ediciones aunque no tenga rol de conductor activo; los cambios requieren aprobación de creador/admin si no tiene ese rol.

### 🎯 Próximos pasos:

- Continuar con el cierre de guías visuales básicas para completar la Fase 0.

---

## 🗓️ Día 7 — 2025-11-28

### ✔ Trabajo realizado:

- Se añadió la guía de **Tipografía oficial** de ShuttleBiz en `docs/SPECS.md` (Manrope principal, Space Grotesk/JetBrains Mono como acento numérico).
- Se documentó el snippet de carga de fuentes en Flutter (`pubspec.yaml` + `google_fonts`) y ejemplos de uso de la fuente acento en chips/badges/tablas.
- Se añadió la **paleta de color ShuttleBiz Core** en `docs/SPECS.md` con primario azul, secundario verde, neutrales, estados y guía de uso por componente/Flutter.
- Se documentó el **layout por nivel (Grupos/Grupo/Lanzadera)** como marco visual (breadcrumbs, tabs, padding/cards, empty states, modales, chips) aclarando que el contenido funcional sigue lo definido en pantallas 5.x/6.x/7.x/10.x.
- Se actualizaron los **patrones de modales y chips/badges** en `docs/SPECS.md`: tipos (confirmación, alerta, bottom sheet, formularios), layout/padding/colores según paleta, accesibilidad y estilo de chips de horarios/estados.

### 🧠 Decisiones tomadas:

- Mantener commits separados por bloque visual: tipografía, paleta, layouts/patrones.
- Rama para el punto 9: `feature/f0-visual-guides` con commits temáticos.

### 🎯 Próximos pasos:

- Documentar layouts/patrones de modales y chips para cerrar Fase 0.

---

# 🧾 Notas generales

- Actualiza al final de cada sesión
- Viñetas cortas; enlaza issues/PRs si los hay
- Cuando cambien fases o alcance, reflecta también en `ROADMAP.md`
