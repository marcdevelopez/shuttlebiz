# 📝 Technical TODO & Missing Features

## 🚨 **Critical Missing Screens**

### Screen 8: Role Selection

**Priority: HIGH** | **Effort: 2-3 days** | **Assignee: TBD**

- [ ] Design role selection UI (Driver vs Passenger)
- [ ] Implement role persistence per shuttle
- [ ] Add role-based permissions logic
- [ ] Update navigation flow

**Acceptance Criteria:**

- User must select role before accessing shuttle details
- Role choice persists for each shuttle individually
- Different UI elements shown based on role

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

### Screen 9: Group Management

**Priority: HIGH** | **Effort: 1 week** | **Assignee: TBD**

- [ ] Admin panel for group creators
- [ ] Member list with admin controls
- [ ] Invite system (codes/links)
- [ ] Group settings configuration

**For creators/administrators:**

- [ ] Editable group information (name, creation date, member count)
- [ ] Member management (promote to admin, expel members)
- [ ] Group configuration (public/private, auto-approval)
- [ ] Actions (invite new members, delete group with confirmation)

**For regular members:**

- [ ] View group information and member list
- [ ] Leave group functionality

**Related Issues:** #3, #7, #12

---

### Screen 10: Join Existing Group

**Priority: HIGH** | **Effort: 3-4 days** | **Assignee: TBD**

- [ ] Group search/join interface
- [ ] Invite code validation (6 digits)
- [ ] Shared link functionality
- [ ] Public group search by name
- [ ] Group preview with member count and active shuttles
- [ ] Join request with optional message to admin

**Methods of access:**

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

### Screen 11: Notifications Management

**Priority: MEDIUM** | **Effort: 4-5 days** | **Assignee: TBD**

- [ ] Notification types configuration
- [ ] Push notification setup (FCM)
- [ ] In-app notification center
- [ ] User preference settings

**Notification Types:**

- [ ] Nueva lanzadera creada en grupo
- [ ] Alguien solicita plaza en tu viaje
- [ ] Plaza confirmada/rechazada
- [ ] Recordatorio 30min antes del viaje
- [ ] Cambios en horarios
- [ ] Mensajes del chat específico
- [ ] **Group invitation received** (invitación para ser miembro de un grupo)

**Configuration:**

- [ ] Usuario puede desactivar tipos específicos
- [ ] Push notifications con FCM

---

### Screen 12: User Profile

**Priority: MEDIUM** | **Effort: 2-3 days** | **Assignee: TBD**

- [ ] Personal information display/edit
- [ ] Profile photo upload (optional)
- [ ] User statistics dashboard
- [ ] App configuration settings

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

### Screen 13: Detailed Chat System

**Priority: MEDIUM** | **Effort: 1-2 weeks** | **Assignee: TBD**

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

**Message Features:**

- [ ] Estados de mensajes (enviado, entregado, leído)
- [ ] Indicador de "escribiendo"
- [ ] Message timestamps
- [ ] Offline message queue

---

## 🎨 **UI/UX Improvements**

### Navigation & Header Improvements

**Priority: HIGH** | **Effort: 1-2 days** | **Assignee: TBD**

- [ ] **Add screen titles in upper left corner** (Groups, Shuttles, Schedules, Chat, etc.)
- [ ] **Bottom navigation bar** for Groups, Shuttles, and Chat screens
- [ ] **Add (+) button in shuttle screens** (bottom right corner)
- [ ] **Add (+) button in groups screen** (top bar, center-left, before hamburger menu)

### Missing States & Error Handling

- [ ] Offline state indicators
- [ ] Loading states for all screens
- [ ] Error messages and retry mechanisms
- [ ] Empty states with helpful actions

**HOME Screen States:**

- [ ] **Estado sin conexión:** Qué se muestra cuando no hay internet
- [ ] **Grupos archivados:** Dónde van los grupos inactivos
- [ ] **Límite de grupos:** ¿Cuántos grupos puede tener un usuario?

**SHUTTLE Screen States:**

- [ ] **Lanzadera inactiva:** Cómo se ve cuando está deshabilitada
- [ ] **Sin horarios hoy:** Estado cuando no hay viajes programados para hoy
- [ ] **Conflicto de horarios:** Qué pasa si hay overlapping entre viajes

### Accessibility & Usability

- [ ] Screen reader support
- [ ] Color contrast validation
- [ ] Font size accessibility
- [ ] Touch target minimum sizes

---

## ⚖️ **Business Rules & Conflict Resolution**

### Critical Business Logic Questions

**Priority: HIGH** | **Effort: Research & Design** | **Assignee: TBD**

#### **¿Qué pasa si...?**

- [ ] **Dos conductores** para la misma lanzadera/horario? → Define conflict resolution
- [ ] **Usuario solicita plaza** pero ya hay conductor? → Validation logic
- [ ] **Conductor cancela** el día del viaje? → Notification and rebooking system
- [ ] **Más solicitudes** que plazas disponibles? → Waiting list or first-come-first-served
- [ ] **Usuario abandona grupo** con lanzaderas activas? → Data cleanup and notifications
- [ ] **Creador del grupo** elimina su cuenta? → Ownership transfer or group dissolution
- [ ] **Lanzadera tiene reservas** pero se quiere eliminar? → Cancellation workflow

### Permission System Design

**Priority: HIGH** | **Effort: 2-3 days** | **Assignee: TBD**

- [ ] **Creador del grupo:** Puede todo
- [ ] **Administrador:** Puede gestionar miembros y lanzaderas
- [ ] **Miembro regular:** Solo puede crear lanzaderas y solicitar plazas
- [ ] **Invitado:** Solo puede ver (futuro)

---

## 🔧 **Backend & Infrastructure**

### Database Optimizations

- [ ] Firestore security rules
- [ ] Data validation schemas
- [ ] Backup and recovery procedures
- [ ] Performance monitoring

### Real-time Features

- [ ] WebSocket connections for chat
- [ ] Push notification service
- [ ] Real-time seat availability
- [ ] Location sharing (Phase 4)

---

## 🧪 **Testing & Quality**

### Unit Tests

- [ ] Provider tests (Riverpod)
- [ ] Model validation tests
- [ ] Business logic tests

### Integration Tests

- [ ] Authentication flow
- [ ] Group creation workflow
- [ ] Booking system end-to-end

### Performance

- [ ] App startup time optimization
- [ ] Memory usage profiling
- [ ] Network request optimization

---

## 🎯 **Development Priorities**

### **HIGH Priority (MVP Core):**

1. ✅ Screen 8: Role Selection
2. ✅ Screen 10: Join Existing Group
3. ✅ Screen 9: Basic Group Management
4. ✅ Screen 12: Basic User Profile
5. ✅ Business rules definition and conflict resolution
6. ✅ Navigation & Header improvements (títulos, botones +, navegación inferior)

### **MEDIUM Priority:**

7. ⚠️ Screen 11: Push Notifications
8. ⚠️ UI/UX improvements (error states, offline support)
9. ⚠️ Screen 13: Basic chat functionality
10. ⚠️ Estados de error y sin conexión
11. ⚠️ Validaciones y reglas de negocio

### **LOW Priority (Post-MVP):**

12. 🔮 Advanced chat features (multimedia, mentions)
13. 🔮 User statistics and rating system
14. 🔮 Advanced group features (public discovery)
15. 🔮 Sistema de calificaciones

---

## 📋 **Definition of Done**

For any feature to be considered complete:

- [ ] ✅ **Functionality** - All acceptance criteria met
- [ ] 🎨 **UI/UX** - Matches approved wireframes
- [ ] 📱 **Responsive** - Works on different screen sizes
- [ ] 🧪 **Tested** - Unit tests and manual QA completed
- [ ] 📖 **Documented** - Code comments and user docs updated
- [ ] 🔒 **Security** - Data validation and access controls
- [ ] ♿ **Accessible** - Screen readers and keyboard navigation

---

_Last updated: October 2024_  
_For live progress tracking, see our [GitHub Issues](https://github.com/marcosgarcialopez/shuttlebiz/issues)_
