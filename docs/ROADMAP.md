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

**2. Navegación y Menús Superiores Contextuales**
- Definir **stack/nested navigation** completo (Grupos → Grupo → Lanzadera con PageView)
- Especificar menús contextuales (⋮) por tipo de pantalla:
  - **MAPA**: Tipo de mapa, mostrar/ocultar tráfico, centrar ubicación, leyenda, configuración
  - **HORARIOS**: Ordenar por (proximidad/distancia), filtros (plazas/hoy/sentido), vista compacta/expandida, exportar
  - **HOME**: Ordenar grupos/lanzaderas, filtros activos, vista lista/cuadrícula
  - **CHAT**: Ya definido en P11
- Aclarar que cambio de nivel solo ocurre desde Home/ítems + flecha atrás
- Documentar animaciones de transición entre niveles (deslizamiento vertical/fade 150-200ms)
- Definir indicador visual de nivel actual (breadcrumb en AppBar: `Grupos > Trabajo > Nave-Estación`)
- Especificar gestión de stack de navegación y comportamiento del botón atrás del sistema

**3. Flujo de Horarios y Gestión Modular**
- Separar completamente edición de lanzadera vs. horarios:
  - **Pantalla edición lanzadera**: Solo nombre, origen/destino, comentario general, plazas por defecto (NO horarios)
  - **Pantalla dedicada horarios**: Crear, editar, eliminar horarios (accesible desde pestaña Horarios en nivel Lanzadera)
- Especificar flujo de creación: lanzadera sin horarios inicialmente + modal post-creación "¿Agregar primer horario?"
- Definir pantalla de detalle de salida (hora concreta) con solicitar/anular plaza, rol/conductor visible
- Implementar chips de Ida/Vuelta + resumen compacto de horarios
- Aclarar comentario único por lanzadera (no por horario)

**4. Sistema de Conflictos de Días en Horarios**
- Especificar validación de solapamiento al seleccionar día ya ocupado:
  - Mostrar días ocupados en gris
  - Modal de confirmación: [Cancelar] [Confirmar fusión]
- Definir modal de advertencia al deseleccionar días con confirmación explícita
- Documentar interfaz visual: días disponibles (azul/rojo), días ocupados (gris), días en edición (resaltado)

**5. Chats Privados entre Usuarios**
- Definir punto de acceso exacto: ¿icono específico/menú contextual/botón en perfil?
- Resolver conflicto: pulsar avatar/nombre abre perfil → especificar acceso alternativo a chat privado
- Documentar lista de chats privados activos: ubicación, organización, indicadores de no leídos
- Especificar chat privado conductor↔creador/admin para gestión de vehículos

#### 🟡 Prioridad Media (Post-MVP)

**6. Centro de Notificaciones (6.2)**
- Especificar pantalla completa: acceso desde menú principal, diseño de lista, categorización, filtros
- Definir tipos de notificaciones y acciones asociadas:
  - Nuevas lanzaderas, solicitudes aprobadas, conductor asignado, cambios en horarios, invitaciones, mensajes chat, alertas conductor sin ubicación
- Documentar gestión: marcar leída, archivar, eliminar, marcar todas como leídas

**7. Terminología y Contenido por Nivel**
- Unificar terminología: "**Frecuencia semanal**" vs. "**Fecha única**" en todo el documento
- Definir etiqueta dinámica del campo fecha (cambia según selección de días)
- Especificar comportamiento DatePicker en modo frecuencia
- Definir contenido exacto de Chat/Horario/Mapa en cada nivel:
  - **Chat**: Grupos (selector), Grupo (chat del grupo), Lanzadera (chat de lanzadera)
  - **Horario**: Grupos (elegir grupo), Grupo (lista lanzaderas con horarios), Lanzadera (horarios de esa lanzadera)
  - **Mapa**: Grupos (elegir grupo), Grupo (lista mapas), Lanzadera (mapa + posición/flecha)

**8. Historial de Reputación**
- Definir cálculo: fórmula (viajes solicitados vs. realizados), escala 1-5
- Documentar factores que afectan: cancelaciones (viajero/conductor), viajes completados, puntualidad, reportes
- Especificar visibilidad: perfil público (puntuación), perfil privado (desglose), lista viajeros (indicador rápido)

**9. Otras Funcionalidades**
- **Conductor visible en listado**: Mostrar "Conductor: Nombre" o "Sin conductor" en ítems de 5.3
- **Rol predeterminado**: Checkbox en selección de rol + opción en ajustes de lanzadera para cambiar; rol visible en UI
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
