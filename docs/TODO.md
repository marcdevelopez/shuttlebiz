# 📝 TODO Técnico y Funcionalidades Faltantes

## 🚨 **Pantallas Principales - Nueva Numeración**

> **⚠️ Actualización:** Reorganización completa de pantallas para reflejar flujo: Grupos (4) → Grupo (5) → Lanzadera (6). Navegación con dos flechas consecutivas.

### Pantalla 4: Pantalla de Grupos (HOME principal)

**Prioridad: ALTA** | **Esfuerzo: 2-3 días** | **Asignado: POR DEFINIR**

- [ ] Diseñar interfaz de selección de rol (Conductor vs Viajero)
- [ ] Implementar persistencia de rol por lanzadera
- [ ] Agregar lógica de permisos basada en rol
- [ ] Actualizar flujo de navegación

**Criterios de Aceptación:**

- El usuario debe seleccionar rol antes de acceder a detalles de lanzadera
- La elección de rol persiste para cada lanzadera individualmente
- Diferentes elementos de UI mostrados según el rol

**Details:**

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

### Pantalla 8: Solicitud de Lanzadera

**Prioridad: ALTA** | **Esfuerzo: 2-3 días** | **Asignado: POR DEFINIR**

- [ ] Implementar interfaz y lógica de solicitud de lanzadera
- [ ] Validar disponibilidad de plazas y restricciones de rol
- [ ] Integrar con sistema de notificaciones para solicitudes/confirmaciones
- [ ] Manejar estados de error (lanzadera llena, sin conductor, etc.)

**Criterios de Aceptación:**

- El usuario puede solicitar plaza como viajero
- El usuario puede ofrecerse como conductor si no hay conductor asignado
- El sistema valida límites de plazas y conflictos de rol
- Se envían notificaciones al solicitar/confirmar/cancelar

**Details:**

- **Flujo:** Tras seleccionar rol, usuario accede a la pantalla de solicitud
- **Acciones:**
  - Solicitar plaza (si hay disponibilidad)
  - Ser conductor (si no hay conductor asignado)
  - Cancelar solicitud
  - Ver viajeros
- **Estados:**
  - Verde: plazas disponibles
  - Rojo: completo
  - Gris: no disponible
- **Indicadores:**
  - Próximo horario resaltado
  - Visualización de plazas y conductor asignado

---

### Pantalla 9: Gestión de Grupos

**Prioridad: ALTA** | **Esfuerzo: 1 semana** | **Asignado: POR DEFINIR**

- [ ] Panel de administración para creadores de grupos
- [ ] Lista de miembros con controles de administrador
- [ ] Sistema de invitaciones (códigos/enlaces)
- [ ] Configuración de ajustes del grupo

**Para creadores/administradores:**

- [ ] Información del grupo editable (nombre, fecha de creación, número de miembros)
- [ ] Gestión de miembros (promover a administrador, expulsar miembros)
- [ ] Configuración de grupo (público/privado, auto-aprobación)
- [ ] Acciones (invitar nuevos miembros, eliminar grupo con confirmación)

**Para miembros estándar (sin permisos de administrador):**

- [ ] Ver información del grupo y lista de miembros
- [ ] Solicitar plazas en lanzaderas existentes
- [ ] Gestionar sus propias solicitudes (anular, ver estado)
- [ ] Participar en chat relacionado con sus solicitudes
- [ ] Funcionalidad para abandonar grupo

**Issues Relacionados:** #3, #7, #12

---

### Pantalla 10: Unirse a Grupo Existente

**Prioridad: ALTA** | **Esfuerzo: 3-4 días** | **Asignado: POR DEFINIR**

- [ ] Interfaz de búsqueda/unión a grupos
- [ ] Validación de código de invitación (6 dígitos)
- [ ] Funcionalidad de enlace compartido
- [ ] Búsqueda de grupos públicos por nombre
- [ ] Vista previa del grupo con número de miembros y lanzaderas activas
- [ ] Solicitud de unión con mensaje opcional al administrador

**Métodos de acceso:**

- [ ] Invitation code (6 digits)
- [ ] Shared link
- [ ] Search by name (if public)
- [ ] List of nearby public groups

**Pantalla de búsqueda:**

- [ ] Campo para código/nombre
- [ ] Lista de grupos públicos cercanos

**Vista previa del grupo:**

- [ ] Nombre, descripción
- [ ] Número de miembros
- [ ] Lanzaderas activas (preview)

**Solicitud:**

- [ ] Botón "Solicitar unirse"
- [ ] Mensaje opcional al administrador

---

### Pantalla 12: Gestión de Vehículos

**Prioridad: ALTA** | **Esfuerzo: 3-4 días** | **Asignado: POR DEFINIR**

- [ ] Interfaz de operaciones CRUD de vehículos con permisos basados en rol
- [ ] Gestión de vehículos específica por grupo
- [ ] Creación de vehículos por conductores durante reserva de lanzadera
- [ ] Validación de permisos de edición/eliminación para administradores/creadores
- [ ] Integración con flujo de creación de lanzaderas

**Criterios de Aceptación:**

- **Acceso crear:** Administradores y creadores pueden agregar vehículos directamente. Cualquier miembro actuando como conductor puede solicitar aprobación para crear nuevos vehículos
- **Acceso editar/eliminar:** Administradores y creadores pueden modificar cualquier vehículo. El conductor que creó un vehículo puede editarlo sin autorización adicional
- Campos obligatorios: matrícula, número de plazas
- Campos opcionales: modelo, marca, color
- Los vehículos pueden reutilizarse en lanzaderas del mismo grupo
- Integración con creación de lanzaderas (selector de vehículo + opción "agregar nuevo")
- Solicitud de creación de vehículo in-situ cuando miembro actúa como conductor

**Details:**

- **Acceso crear:** Administradores y creadores agregan directamente. Cualquier miembro como conductor puede solicitar aprobación para crear nuevos vehículos
- **Acceso editar/eliminar:** Administradores y creadores pueden editar/eliminar cualquier vehículo. Conductor que creó vehículo puede editarlo sin autorización
- **Funcionalidades:** Sistema de aprobación solo para creación de nuevos vehículos, trazabilidad automática de modificaciones, chat disponible durante aprobación
- **Datos obligatorios:** Matrícula, número de plazas
- **Datos opcionales:** Modelo, marca, color
- **Persistencia:** Por grupo, reutilizable por cualquier conductor

**Issues Relacionados:** #15, #16

---

### Pantalla: Estado de Mis Solicitudes

**Prioridad: ALTA** | **Esfuerzo: 2-3 días** | **Asignado: POR DEFINIR**

- [ ] Acceso permanente desde logo de la app (la mano)
- [ ] Vista con dos listas: solicitudes futuras y pasadas
- [ ] Cancelar solicitud desde esta pantalla
- [ ] Información detallada: fecha, hora, grupo, lanzadera, rol, estado
- [ ] Integración con respaldo Drive/iCloud

**Criterios de Aceptación:**

- Accesible desde cualquier pantalla via logo superior
- Separación clara entre solicitudes futuras y pasadas
- Funcionalidad de cancelación desde la lista
- Datos sincronizados con respaldo en la nube

---

### Sistema de Respaldo Drive/iCloud

**Prioridad: ALTA** | **Esfuerzo: 1-2 semanas** | **Asignado: POR DEFINIR**

- [ ] Configuración de respaldo en Settings
- [ ] Integración con Google Drive (Android)
- [ ] Integración con iCloud (iOS)
- [ ] Respaldo local como alternativa
- [ ] Recuperación automática en reinstalación
- [ ] Cambio de número manteniendo UID

**Criterios de Aceptación:**

- Respaldo automático configurable
- Historial de chats y viajes en nube personal
- Datos básicos en Firebase para recuperación
- Flujo de cambio de número sin pérdida de datos

---

### Alertas de Conductores (Admin Management)

**Prioridad: MEDIA** | **Esfuerzo: 3-4 días** | **Asignado: POR DEFINIR**

- [ ] Sistema de asignación de conductores potenciales
- [ ] Interfaz para admins: seleccionar y alertar usuarios
- [ ] Notificación de "servicio de lanzadera como conductor"
- [ ] Respuestas rápidas para rechazo
- [ ] Tracking de respuestas y motivos

**Criterios de Aceptación:**

- Admins pueden asignar conductores potenciales
- Usuario recibe alerta clara y específica
- Opciones de respuesta: aceptar o rechazar con motivo
- Historial de alertas y respuestas

---

### Pantalla 11: Perfil de Usuario

**Prioridad: MEDIA** | **Esfuerzo: 2-3 días** | **Asignado a: Por Definir**

- [ ] Personal information display/edit
- [ ] Subida de foto de perfil (opcional)
- [ ] Dashboard de estadísticas de usuario
- [ ] Configuración de la aplicación

**Personal Information:**

- [ ] Foto de perfil (opcional)
- [ ] Nombre de usuario
- [ ] Número de teléfono (no editable)
- [ ] Fecha de registro

**Statistics:**

- [ ] Viajes completados
- [ ] Grupos activos
- [ ] Calificación como conductor/viajero (futuro)

**Settings:**

- [ ] Notificaciones push
- [ ] Visibilidad del perfil
- [ ] Tema de la app

---

### Pantalla 13: Recuperación de Cuenta

**Prioridad: ALTA** | **Esfuerzo: 2-3 días** | **Asignado: POR DEFINIR**

- [ ] Flujo de recuperación para pérdida de teléfono/cambio de número
- [ ] Sistema de verificación de identidad
- [ ] Mecanismo de transferencia de cuenta
- [ ] Validación de seguridad

**Criterios de Aceptación:**

- Accesible desde pantalla de login
- Múltiples métodos de recuperación (teléfono anterior, email, soporte)
- Proceso seguro de verificación de identidad
- Cuenta transferida exitosamente al nuevo número

**Details:**

- **Métodos:** Teléfono anterior, email, contacto con soporte
- **Flujo:** Nuevo número → verificación → transferencia → confirmación
- **Seguridad:** Proceso robusto para prevenir accesos no autorizados

**Issues Relacionados:** #17

---

### Pantalla 14: Onboarding Mejorado

**Prioridad: ALTA** | **Esfuerzo: 1 semana** | **Asignado: POR DEFINIR**

- [ ] Implementación de tutorial interactivo
- [ ] Flujo de onboarding multi-pantalla
- [ ] Indicadores de progreso y navegación
- [ ] Funcionalidad de saltar y repetir

**Criterios de Aceptación:**

- Tutorial de 5 pantallas cubriendo todas las funciones principales
- Activación automática para usuarios nuevos
- Acceso manual desde menú de configuración
- Animaciones y transiciones suaves

**Content Requirements:**

- **Pantalla 1:** Bienvenida y presentación
- **Pantalla 2:** Funcionamiento de grupos (público/privado)
- **Pantalla 3:** Crear y gestionar lanzaderas
- **Pantalla 4:** Roles y solicitud de plazas
- **Pantalla 5:** Comunicación y notificaciones

**Implementación Técnica:**

- PageView con indicadores de progreso
- Botones "Siguiente", "Saltar", "Empezar"
- Disponible como ayuda después de la primera ejecución

**Issues Relacionados:** #18

---

### Pantalla 15: Gestión de Notificaciones

**Prioridad: MEDIA** | **Esfuerzo: 4-5 días** | **Asignado a: Por Definir**

- [ ] Configuración de tipos de notificación
- [ ] Configuración de notificaciones push (FCM)
- [ ] Centro de notificaciones en la app
- [ ] Configuración de preferencias de usuario

**Tipos de Notificación:**

- [ ] Nueva lanzadera creada en grupo
- [ ] Alguien solicita plaza en tu viaje
- [ ] Plaza confirmada/rechazada
- [ ] Recordatorio 30min antes del viaje
- [ ] Cambios en horarios
- [ ] Mensajes del chat específico
- [ ] **Invitación de grupo recibida** (invitación para ser miembro de un grupo)

**Configuración:**

- [ ] Usuario puede desactivar tipos específicos
- [ ] Push notifications con FCM

---

### Pantalla 16: Sistema de Chat Detallado

**Prioridad: MEDIA** | **Esfuerzo: 1-2 semanas** | **Asignado a: Por Definir**

**General Group Chat:**

- [ ] Historial persistente
- [ ] Mensajes multimedia (fotos, ubicación)
- [ ] Menciones @usuario
- [ ] Message search capability

**Chat específico de viaje:**

- [ ] Solo visible para participantes de esa salida
- [ ] Se archiva después del viaje
- [ ] Información contextual (hora, destino)
- [ ] Participant list display

**Funcionalidades de Mensajes:**

- [ ] Estados de mensajes (enviado, entregado, leído)
- [ ] Indicador de "escribiendo"
- [ ] Marcas de tiempo de mensajes
- [ ] Cola de mensajes offline

---

## 🎨 **Mejoras de UI/UX**

### Mejoras de Navegación y Encabezados

**Prioridad: ALTA** | **Esfuerzo: 1-2 días** | **Asignado: POR DEFINIR**

- [ ] **Agregar títulos de pantalla en esquina superior izquierda** (Grupos, Lanzaderas, Horarios, Chat, etc.)
- [ ] **Barra de navegación inferior** para pantallas de Grupos, Lanzaderas y Chat
- [ ] **Agregar botón (+) en pantallas de lanzaderas** (esquina inferior derecha)
- [ ] **Agregar botón (+) en pantalla de grupos** (barra superior, centro-izquierda, antes del menú hamburguesa)

### Estados Faltantes y Manejo de Errores

- [ ] Indicadores de estado sin conexión
- [ ] Estados de carga para todas las pantallas
- [ ] Mensajes de error y mecanismos de reintento
- [ ] Estados vacíos con acciones útiles

**HOME Screen States:**

- [ ] **Estado sin conexión:** Qué se muestra cuando no hay internet
- [ ] **Grupos archivados:** Dónde van los grupos inactivos
- [ ] **Límite de grupos:** ¿Cuántos grupos puede tener un usuario?

**SHUTTLE Screen States:**

- [ ] **Lanzadera inactiva:** Cómo se ve cuando está deshabilitada
- [ ] **Sin horarios hoy:** Estado cuando no hay viajes programados para hoy
- [ ] **Conflicto de horarios:** Qué pasa si hay overlapping entre viajes

### Accesibilidad y Usabilidad

- [ ] Soporte para lectores de pantalla
- [ ] Validación de contraste de colores
- [ ] Accesibilidad del tamaño de fuente
- [ ] Tamaños mínimos de objetivos táctiles

---

## ⚖️ **Reglas de Negocio y Resolución de Conflictos**

### Preguntas Críticas de Lógica de Negocio

**Prioridad: ALTA** | **Esfuerzo: Investigación y Diseño** | **Asignado a: Por Definir**

#### **¿Qué pasa si...?**

- [ ] **Dos conductores** para la misma lanzadera/horario? → Definir resolución de conflictos
- [ ] **Usuario solicita plaza** sin conductor asignado? → Informar que la lanzadera no sale sin conductor, usar chat para coordinar
- [ ] **Conductor cancela** el día del viaje? → Sistema de notificación y re-reserva
- [ ] **Más solicitudes** que plazas disponibles? → Lista de espera o por orden de llegada
- [ ] **Usuario abandona grupo** con lanzaderas activas? → Limpieza de datos y notificaciones
- [ ] **Creador del grupo** elimina su cuenta? → Transferencia de propiedad o disolución del grupo
- [ ] **Lanzadera tiene reservas** pero se quiere eliminar? → Flujo de cancelación

### Diseño del Sistema de Permisos

**Prioridad: ALTA** | **Esfuerzo: 2-3 días** | **Asignado: POR DEFINIR**

- [ ] **Creador del grupo:** Puede todo (permisos completos). También puede actuar como conductor
- [ ] **Administrador:** Puede gestionar miembros, crear lanzaderas y aprobar solicitudes de creación de vehículos. También puede actuar como conductor
- [ ] **Miembro estándar:** Solo puede solicitar plazas y gestionar sus propias solicitudes (anular, chat relacionado con su solicitud)
- [ ] **Cualquier miembro como conductor:** Puede solicitar aprobación para crear nuevos vehículos cuando va a conducir una lanzadera. Una vez aprobado, puede editar su vehículo sin autorización adicional. Sistema de trazabilidad registra modificaciones

---

## 🔧 **Backend e Infraestructura**

### Optimizaciones de Base de Datos

- [ ] Reglas de seguridad de Firestore
- [ ] Esquemas de validación de datos
- [ ] Procedimientos de respaldo y recuperación
- [ ] Monitoreo de rendimiento

### Funcionalidades en Tiempo Real

- [ ] Conexiones WebSocket para chat
- [ ] Servicio de notificaciones push
- [ ] Disponibilidad de plazas en tiempo real
- [ ] Compartir ubicación (Fase 4)

---

## 🆕 **Nuevas Funcionalidades Agregadas (2/10/25)**

### Sistema de Roles Dinámico

**Prioridad: ALTA** | **Esfuerzo: 2-3 días** | **Asignado: POR DEFINIR**

- [ ] Implementar selección flexible de rol por sesión
- [ ] Agregar configuración de "rol preferido" en perfil de usuario
- [ ] Crear interfaz de cambio de rol en configuración
- [ ] Actualizar lógica de persistencia de rol por lanzadera

**Criterios de Aceptación:**

- Los usuarios pueden ser conductor y pasajero en diferentes lanzaderas
- La selección de rol ocurre al acceder a los detalles de la lanzadera
- La configuración de rol preferido afecta la selección por defecto
- La pantalla de configuración incluye opción "Cambiar rol por defecto"

**Issues Relacionados:** #19

---

### Grupos Privados/Públicos

**Prioridad: ALTA** | **Esfuerzo: 3-4 días** | **Asignado a: Por Definir**

- [ ] Agregar configuración de visibilidad durante la creación del grupo
- [ ] Implementar descubrimiento de grupos públicos
- [ ] Crear sistema de solicitud/aprobación de ingreso
- [ ] Actualizar interfaz de gestión de grupos

**Criterios de Aceptación:**

- Selección clara de visibilidad durante la creación del grupo
- Grupos privados: acceso solo por invitación
- Grupos públicos: aparecen en lista de descubrimiento + requieren aprobación
- La visibilidad puede cambiarse después de crear el grupo
- Las solicitudes de ingreso incluyen mensaje opcional al administrador

**Issues Relacionados:** #20

---

### Sistema de Privacidad Mejorado

**Prioridad: MEDIA** | **Esfuerzo: 2 días** | **Asignado a: Por Definir**

- [ ] Ocultar números de teléfono por defecto
- [ ] Implementar solo mensajería dentro de la app
- [ ] Agregar configuración de privacidad por usuario
- [ ] Planificar futura integración de llamadas directas

**Criterios de Aceptación:**

- Números de teléfono ocultos en todas las interfaces de usuario
- Comunicación solo a través de chats grupales
- Configuración en perfil de usuario: "Mostrar número de teléfono" (por defecto: falso)
- Preparación para futura funcionalidad de llamadas dentro de la app

**Issues Relacionados:** #21

---

### Sistema de Gestión de Vehículos

**Prioridad: ALTA** | **Esfuerzo: 4-5 días** | **Asignado a: Por Definir**

- [ ] Crear entidad Vehicle en Firestore
- [ ] Implementar operaciones CRUD de vehículos basadas en roles
- [ ] Agregar selector de vehículo + "crear nuevo" en reserva de lanzadera
- [ ] Sistema de aprobación para solicitudes de vehículos de conductores
- [ ] Gestión de vehículos específica por grupo con permisos

**Esquema de Base de Datos:**

```
Vehicle {
  id: String
  groupId: String
  licensePlate: String (required)
  seats: Number (required)
  model: String (optional)
  brand: String (optional)
  color: String (optional)
  createdBy: String
  createdAt: Timestamp
  isActive: Boolean
}
```

**Criterios de Aceptación:**

- Vehículos guardados por grupo (únicos dentro de cada grupo)
- **Permisos de creación:** Administradores y creadores agregan directamente. Conductores pueden solicitar creación con aprobación requerida de admin/creador
- **Permisos de edición/eliminación:** Administradores, creadores del grupo Y el conductor que agregó ese vehículo específico pueden modificar vehículos
- Integración con flujo de reserva de lanzadera (seleccionar existente + crear nuevo)
- Solicitud de creación de vehículo in-situ durante reserva de conductor (con aprobación)
- Sistema de notificaciones para aprobación de vehículos
- Chat integrado para comunicación durante proceso de aprobación
- Reutilización de vehículos en múltiples lanzaderas del mismo grupo
- **Importante:** Las lanzaderas son únicas dentro de cada grupo y no pueden existir en otros grupos

**Issues Relacionados:** #22

---

### 📌 **Nota sobre Issues Relacionados**

Los números de issues (#19, #20, #21, #22) son referencias tentativas para las nuevas funcionalidades agregadas el 2/10/25. Estos deberán crearse en GitHub Issues cuando se implemente el sistema de seguimiento.

---

## 🧪 **Pruebas y Calidad**

### Pruebas Unitarias

- [ ] Pruebas de Provider (Riverpod)
- [ ] Pruebas de validación de modelos
- [ ] Pruebas de lógica de negocio

### Pruebas de Integración

- [ ] Flujo de autenticación
- [ ] Flujo de creación de grupos
- [ ] Sistema de reservas end-to-end

### Rendimiento

- [ ] Optimización de tiempo de arranque de la app
- [ ] Perfilado de uso de memoria
- [ ] Optimización de peticiones de red

---

## 🎯 **Prioridades de Desarrollo**

### **Prioridad ALTA (Core MVP):**

1. ✅ Pantalla 7: Selección de Rol (actualizada con sistema dinámico)
2. ✅ Pantalla 8: Solicitud de Lanzadera
3. ✅ Pantalla 9: Gestión Básica de Grupos (actualizada con privado/público)
4. ✅ Pantalla 10: Unirse a Grupo Existente
5. 🆕 Pantalla 11: Perfil de Usuario
6. 🆕 Pantalla 12: Gestión de Vehículos
7. 🆕 Pantalla 13: Recuperación de Cuenta
8. 🆕 Pantalla 14: Onboarding Mejorado
9. 🆕 Implementación de Sistema de Roles Dinámico
10. 🆕 Funcionalidad de Grupos Privados/Públicos
11. 🆕 Sistema de Gestión de Vehículos
12. ✅ Definición de reglas de negocio y resolución de conflictos
13. ✅ Mejoras de navegación y encabezados

### **Prioridad MEDIA:**

14. Pantalla 15: Gestión de Notificaciones
15. Pantalla 16: Sistema de Chat Detallado
16. 🆕 Sistema de Privacidad Mejorado
17. ⚠️ Mejoras de UI/UX (estados de error, soporte offline)
18. ⚠️ Estados de error y sin conexión
19. ⚠️ Validaciones y reglas de negocio

### **Prioridad BAJA (Post-MVP):**

12. 🔮 Funcionalidades avanzadas de chat (multimedia, menciones)
13. 🔮 Sistema de estadísticas y calificación de usuarios
14. 🔮 Funcionalidades avanzadas de grupos (descubrimiento público)
15. 🔮 Sistema de calificaciones

---

## 📋 **Definición de Completado**

Para que cualquier funcionalidad se considere completa:

- [ ] ✅ **Funcionalidad** - Todos los criterios de aceptación cumplidos
- [ ] 🎨 **UI/UX** - Coincide con wireframes aprobados
- [ ] 📱 **Responsivo** - Funciona en diferentes tamaños de pantalla
- [ ] 🧪 **Probado** - Pruebas unitarias y QA manual completadas
- [ ] 📖 **Documentado** - Comentarios de código y documentación de usuario actualizados
- [ ] 🔒 **Seguridad** - Validación de datos y controles de acceso
- [ ] ♿ **Accesible** - Lectores de pantalla y navegación por teclado

---

_Última actualización: Octubre 2024_  
_Para seguimiento en vivo del progreso, ver nuestros [GitHub Issues](https://github.com/marcdevelopez/shuttlebiz/issues)_
