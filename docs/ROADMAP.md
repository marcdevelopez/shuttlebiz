# ShuttleBiz Development Roadmap (realista)

## 📍 Estado actual

- Última actualización: 20/11/2025
- Specs refinadas en docs/SPECIFICATIONS.md
- Arquitectura decidida: Flutter + Riverpod + GoRouter + Firebase (Auth/Firestore/FCM), Storage para medios
- Scope MVP recortado: sin backups Drive/iCloud, sin multimedia ni búsqueda en chat, sin automatismos avanzados de conductor (5/40 min) en primera iteración

---

## 📅 Fases

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
- “Mis solicitudes” histórico
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

1. Actualizar ROADMAP.md con este recorte y fechas realistas.
2. Crear docs/dev_log.md con entradas diarias.
3. Abrir issues por fase (F1/F2/F3…) en GitHub Projects con criterios de aceptación.
4. Arrancar Fase 1: bootstrap Flutter + Firebase + GoRouter/Riverpod y login por teléfono.
