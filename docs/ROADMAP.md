# ShuttleBiz Development Roadmap (realista)

## 📍 Estado actual

- Última actualización: 24/11/2025
- Specs en progreso: sección 5 (Nivel Grupo) completada; pendiente cierre final y guía visual básica
- Arquitectura decidida: Flutter + Riverpod + GoRouter + Firebase (Auth/Firestore/FCM), Storage para medios
- Scope MVP recortado: sin backups Drive/iCloud, sin multimedia ni búsqueda en chat, sin automatismos avanzados de conductor (5/40 min) en primera iteración

---

## 📅 Fases

### Fase 0 — Cierre de especificaciones y guía visual (1 semana)

**Objetivo:** SPECS completas y base visual mínima para arrancar desarrollo.

#### 🔴 Prioridad Alta (Crítico para MVP)

**1. Pantalla 8 — Estado de Mis Solicitudes** ✅ _Especificación completada en `SPECS.md` (acceso ✋ y vistas viajero/conductor)_

- Completar especificación detallada de P8 con vista completa para **viajero** y **conductor** _(listo)_
- Definir interfaz de usuario: layout de lista (futuras vs. pasadas), diseño de cada ítem, acciones disponibles _(listo)_
- Documentar todos los estados: Pendiente de conductor, Confirmada, En curso, Completada, Cancelada (por usuario/falta conductor/administrador) _(listo)_
- Aclarar si es pantalla independiente o modal dentro de 6.1 _(listo: pantalla independiente con acceso desde icono ✋)_

**2. Navegación y Menús Superiores Contextuales** ✅ _Especificación cerrada en `SPECS.md`_

- Definir **stack/nested navigation** completo (Grupos → Grupo → Lanzadera con PageView) _(listo)_
- Especificar menús contextuales (⋮) por tipo de pantalla (Home/Chat/Horarios/Mapa) en cada nivel _(listo)_
- Cambio de nivel solo desde Home/ítems + flecha atrás, manteniendo pestaña activa del PageView _(listo)_
- Animaciones de transición (slide vertical + fade 150–200ms) _(listo)_
- Indicador visual de nivel (breadcrumb en AppBar: `Grupos > Grupo > Lanzadera`) _(listo)_
- Gestión de stack y botón atrás del sistema documentada _(listo)_

**3. Flujo de Horarios y Gestión Modular** ✅ _Especificación cerrada en `SPECS.md`_

- Separar completamente edición de lanzadera vs. horarios:
  - **Pantalla edición lanzadera**: Solo nombre, origen/destino, comentario general, plazas por defecto (NO horarios) _(listo)_
  - **Pantalla dedicada horarios**: Crear, editar, eliminar horarios (accesible desde pestaña Horarios en nivel Lanzadera) _(listo)_
- Especificar flujo de creación: lanzadera sin horarios inicialmente + modal post-creación "¿Agregar primer horario?" _(listo)_
- Definir pantalla de detalle de salida (hora concreta) con solicitar/anular plaza, rol/conductor visible _(listo)_
- Implementar chips de Ida/Vuelta + resumen compacto de horarios _(listo)_
- Aclarar comentario único por lanzadera (no por horario) _(listo)_

**4. Sistema de Conflictos de Días en Horarios** ✅ _Especificación cerrada en `SPECS.md`_

- Validación de solapamiento al seleccionar día ocupado: días ocupados visibles en gris; modal con opciones [Cancelar]/[Ver horas actuales] + tarjetas (horas actuales / fusionar / nuevas) y confirmación.
- Modal al deseleccionar día con confirmación explícita (eliminar horas / cancelar).
- Interfaz visual documentada: días disponibles (blanco/borde gris), seleccionados (azul/rojo), ocupados (gris).

**5. Chats Privados entre Usuarios** ✅ _Especificación cerrada en `SPECS.md`_

- Puntos de acceso: selector superior (pestaña) en chat grupal para ver lista de chats privados activos y abrirlos (nivel Grupo/Lanzadera); botón “Enviar mensaje” en perfil (globo) para abrir privado.
- Conflicto avatar/perfil: pulsar avatar abre perfil; el privado se inicia desde el botón de mensaje en perfil o la pestaña de chats privados.
- Lista de chats privados: en pestaña “Chats privados” (nombre, foto, último mensaje, no leídos); el mismo selector permite volver al chat grupal.
- Chat privado conductor↔creador/admin para gestión de vehículos: panel fijo inferior, siempre visible en la pantalla de vehículos; notificación abre la misma vista en el otro lado con el panel activo.

#### 🟡 Prioridad Media (Post-MVP)

**6. Centro de Notificaciones (6.2)** ✅ _Especificación cerrada en `SPECS.md`_

- Icono 🔔 con badge numérico (solo si hay no leídas) en AppBars principales; abre Pantalla 7.
- Tabs: No leídas, Leídas, Solicitudes, Cambios en horarios/lanzaderas, Chats.
- Acciones: aceptar/rechazar invitaciones (también inline en chat privado del invitante), ver cambios, abrir chat, eliminar, marcar todas como leídas.
- Filtros por grupo/lanzadera con checkboxes y limpiar filtros.
- Alertas urgentes (ej. conductor sin ubicación) resaltan pestaña/ícono; badge 📍 si aplica al conductor.

**7. Terminología y Contenido por Nivel** ✅ _Especificación cerrada en `SPECS.md` (26/11/2025)_

- Unificar terminología: "**Frecuencia semanal**" vs. "**Fecha única**" en todo el documento
- Campo de fecha y string anterior a fecha deben de estar claros y unificados en las specs.
- Especificar comportamiento DatePicker en modo frecuencia
- Definir contenido exacto de Chat/Horario/Mapa en cada nivel:
  - **Chat**: Grupos (selector), Grupo (chat del grupo), Lanzadera (chat de lanzadera)
  - **Horario**: Grupos (elegir grupo), Grupo (lista lanzaderas con horarios), Lanzadera (horarios de esa lanzadera)
  - **Mapa**: Grupos (elegir grupo), Grupo (lista mapas), Lanzadera (mapa + posición/flecha)

**8. Historial de Reputación** ✅ _Especificación cerrada en `SPECS.md` (26/11/2025)_

- Definir cálculo: fórmula (viajes solicitados vs. realizados), escala 0.0-5.0
- Documentar factores que afectan: cancelaciones (viajero/conductor), viajes completados, puntualidad, reportes
- Especificar visibilidad: perfil público (⭐ + desglose), perfil privado (estadísticas completas), lista de solicitudes por salida (puntuación rápida)

**9. Otras Funcionalidades**

- **Conductor visible en listado**: Mostrar "Conductor: Nombre" o "Sin conductor" en ítems de 5.3
- **Gestión de vehículos**: Enlace explícito desde ajustes de grupo (5.5)
- **Cerrar secciones pendientes**: Completar pantallas 6.x+ y reglas UI pendientes en `docs/SPECS.md`
- **Guías visuales básicas**: Tipografía, paleta, layout por nivel (Grupos/Grupo/Lanzadera), patrones de modales y chips de horarios

#### 🟢 Prioridad Baja (Versiones Futuras - Documentar para Roadmap)

**10. Backlog Futuro**

- OCR para horarios: agregar lanzadera desde imagen con sugerencia IA
- Crear `CHANGELOG.md` en raíz del proyecto con formato estándar

#### 📦 Entregables

- `SPECS.md` actualizada con todas las especificaciones de alta y media prioridad
- Guías visuales básicas: tipografía, paleta, layout por nivel, patrones de modales y chips
- Outline/kit de pantallas de referencia para el equipo

#### ✅ Criterio de Éxito

- SPECS completas y sin ambigüedades, listas para desarrollo
- Referencias visuales acordadas y documentadas
- Equipo puede comenzar Fase 1 sin bloqueos por falta de especificación

### Fase 1 — Fundaciones y Auth (2-3 semanas)

Objetivo: proyecto base listo con login funcional.

- Setup Flutter, theming base, GoRouter + Riverpod
- Firebase Auth (teléfono/SMS), Firestore bootstrap
- Navegación esqueleto de niveles (Grupos → Grupo → Lanzadera) y bottom tabs
- Criterio de éxito: usuario puede registrar/login y navegar esqueleto.

### Fase 2 — Grupos y Lanzaderas Básicas (3-4 semanas)

Objetivo: gestión de grupos y lanzaderas sin lujos.

- Crear/editar/grupo con visibilidad público/privado; unirse/salir; roles (creador/admin/miembro)
- Lista y detalle de grupos; lista de lanzaderas por grupo; creación lanzadera (nombre, origen/destino, plazas, comentario)
- Horarios: puntual o semanal, chips de horas; validación anti-solape por lanzadera
- Criterio de éxito: se puede crear grupo, crear lanzadera, definir horarios.

### Fase 3 — Reservas y Conducción Manual (3-4 semanas)

Objetivo: flujo de solicitud de plaza y conductor manual.

- Solicitar/cancelar plaza con cupos visibles
- Asignar conductor por admin/creador (sin automatismos 5/40 min), cambiar rol con confirmación
- "Mis solicitudes" histórico
- Notificaciones push básicas: alta grupo, nueva lanzadera, solicitud/cancelación, recordatorio previo a salida (al menos una ventana programada)
- Criterio de éxito: reserva end-to-end y conductor asignado manualmente.

### Fase 4 — Chat y Mapas MVP (3-4 semanas)

Objetivo: comunicación y mapas mínimos.

- Chat texto (grupo y lanzadera), estado enviado/leído, sin multimedia ni búsqueda
- Mapa básico: origen/destino + polyline; mostrar posición del conductor cuando comparte (sin tracking histórico)
- Ajustes mínimos de notificaciones para chat
- Criterio de éxito: chat usable de texto y mapa básico por lanzadera.

### Fase 5 — Pulido y Prerelase (2-3 semanas)

Objetivo: robustez y UX.

- Manejo de errores/empty states, accesibilidad mínima, loaders
- Test básicos (golden/UI smoke), lint/format, CI simple
- Optimizaciones de performance y cuotas (Firestore/FCM)
- Criterio de éxito: build estable listo para beta cerrada.

---

## 🧭 Backlog Post-MVP

- Backups Drive/iCloud y local
- Automatismos conductor 5/40 min, reasignaciones y avisos en cascada
- Multimedia y búsqueda en chat; menciones
- Vehicle management avanzado + historial + notas/averías
- Lista de espera y rebooking automático
- Tracking en tiempo real y retención configurable de GPS
- Reputation/ratings y métricas de usuario
- Onboarding ampliado y recuperación de cuenta avanzada

---

## 🎮 Próximos pasos inmediatos

1. ✅ Fase 0 añadida al roadmap con estimación realista y tareas detalladas por prioridad
2. Completar SPECS y guía visual básica (Fase 0) y reflejar avances en `dev_log.md`
3. Abrir issues por fase (F0/F1/F2…) en GitHub Projects con criterios de aceptación
4. Tras cerrar Fase 0, arrancar Fase 1: bootstrap Flutter + Firebase + GoRouter/Riverpod y login por teléfono
