# 📝 Technical TODO & Missing Features

## 🚨 **Critical Missing Screens**

### Screen 7: Role Selection

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

### Screen 8: Shuttle Request

**Priority: HIGH** | **Effort: 2-3 days** | **Assignee: TBD**

- [ ] Implement shuttle request UI and logic
- [ ] Validate seat availability and role restrictions
- [ ] Integrate with notification system for requests/confirmations
- [ ] Handle error states (full shuttle, no driver, etc.)

**Acceptance Criteria:**

- User can request a seat as passenger
- User can offer to be driver if no driver assigned
- System validates seat limits and role conflicts
- Notifications sent on request/confirmation/cancellation

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

### Screen 12: Vehicle Management

**Priority: HIGH** | **Effort: 3-4 days** | **Assignee: TBD**

- [ ] Vehicle CRUD operations interface with role-based permissions
- [ ] Group-specific vehicle management
- [ ] Conductor vehicle creation during shuttle booking
- [ ] Admin/creator edit/delete permissions validation
- [ ] Integration with shuttle creation flow

**Acceptance Criteria:**

- **Create access:** Group admins/creators AND conductors can add vehicles
- **Edit/Delete access:** Only group admins/creators can modify/remove vehicles
- Required fields: license plate, seat count
- Optional fields: model, brand, color
- Vehicles can be reused across shuttles in same group
- Integration with shuttle creation (vehicle selector + "add new" option)
- In-situ vehicle creation during conductor booking flow

**Details:**

- **Acceso crear:** Administradores, creadores y conductores del grupo
- **Acceso editar/eliminar:** Solo administradores y creadores del grupo
- **Funcionalidades:** Conductores agregan vehículos cuando los usan, admins corrigen errores
- **Datos obligatorios:** Matrícula, número de plazas
- **Datos opcionales:** Modelo, marca, color
- **Persistencia:** Por grupo, reutilizable por cualquier conductor

**Related Issues:** #15, #16

---

### Screen 11: User Profile

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

### Screen 13: Account Recovery

**Priority: HIGH** | **Effort: 2-3 days** | **Assignee: TBD**

- [ ] Recovery flow for lost phone/number change
- [ ] Identity verification system
- [ ] Account transfer mechanism
- [ ] Security validation

**Acceptance Criteria:**

- Accessible from login screen
- Multiple recovery methods (old phone, email, support)
- Secure identity verification process
- Account successfully transferred to new number

**Details:**

- **Métodos:** Teléfono anterior, email, contacto con soporte
- **Flujo:** Nuevo número → verificación → transferencia → confirmación
- **Seguridad:** Proceso robusto para prevenir accesos no autorizados

**Related Issues:** #17

---

### Screen 14: Enhanced Onboarding

**Priority: HIGH** | **Effort: 1 week** | **Assignee: TBD**

- [ ] Interactive tutorial implementation
- [ ] Multi-screen onboarding flow
- [ ] Progress indicators and navigation
- [ ] Skip and replay functionality

**Acceptance Criteria:**

- 5-screen tutorial covering all main features
- Automatic trigger for new users
- Manual access from settings menu
- Smooth animations and transitions

**Content Requirements:**

- **Pantalla 1:** Bienvenida y presentación
- **Pantalla 2:** Funcionamiento de grupos (público/privado)
- **Pantalla 3:** Crear y gestionar lanzaderas
- **Pantalla 4:** Roles y solicitud de plazas
- **Pantalla 5:** Comunicación y notificaciones

**Technical Implementation:**

- PageView with progress indicators
- "Siguiente", "Saltar", "Empezar" buttons
- Available as help after first run

**Related Issues:** #18

---

### Screen 15: Notifications Management

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

### Screen 16: Detailed Chat System

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

## 🆕 **New Features Added (2/10/25)**

### Dynamic Role System

**Priority: HIGH** | **Effort: 2-3 days** | **Assignee: TBD**

- [ ] Implement flexible role selection per session
- [ ] Add "preferred role" setting in user profile
- [ ] Create role change interface in settings
- [ ] Update role persistence logic per shuttle

**Acceptance Criteria:**

- Users can be both driver and passenger across different shuttles
- Role selection happens when accessing shuttle details
- Preferred role setting affects default selection
- Settings screen includes "Change default role" option

**Related Issues:** #19

---

### Private/Public Groups

**Priority: HIGH** | **Effort: 3-4 days** | **Assignee: TBD**

- [ ] Add group visibility setting during creation
- [ ] Implement public group discovery
- [ ] Create join request/approval system
- [ ] Update group management UI

**Acceptance Criteria:**

- Clear visibility selection during group creation
- Private groups: invitation-only access
- Public groups: appear in discovery list + require approval
- Visibility can be changed after group creation
- Join requests include optional message to admin

**Related Issues:** #20

---

### Enhanced Privacy System

**Priority: MEDIUM** | **Effort: 2 days** | **Assignee: TBD**

- [ ] Hide phone numbers by default
- [ ] Implement in-app messaging only
- [ ] Add privacy settings per user
- [ ] Plan future direct calling integration

**Acceptance Criteria:**

- Phone numbers hidden from all user interfaces
- Communication only through group chats
- User profile setting: "Show phone number" (default: false)
- Preparation for future in-app calling feature

**Related Issues:** #21

---

### Vehicle Management System

**Priority: HIGH** | **Effort: 4-5 days** | **Assignee: TBD**

- [ ] Create Vehicle entity in Firestore
- [ ] Implement role-based vehicle CRUD operations
- [ ] Add vehicle selector + "create new" in shuttle booking
- [ ] Group-specific vehicle management with permissions

**Database Schema:**

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

**Acceptance Criteria:**

- Vehicles saved per group
- **Create permissions:** Conductors, admins, and creators can add vehicles
- **Edit/Delete permissions:** Only admins and creators can modify vehicles
- Integration with shuttle booking flow (select existing + create new)
- In-situ vehicle creation during conductor booking
- Vehicle reusability across multiple shuttles

**Related Issues:** #22

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

1. ✅ Screen 7: Role Selection (updated with dynamic system)
2. ✅ Screen 8: Shuttle Request
3. ✅ Screen 9: Basic Group Management (updated with private/public)
4. ✅ Screen 10: Join Existing Group
5. 🆕 Screen 11: User Profile
6. 🆕 Screen 12: Vehicle Management
7. 🆕 Screen 13: Account Recovery
8. 🆕 Screen 14: Enhanced Onboarding
9. 🆕 Dynamic Role System implementation
10. 🆕 Private/Public Groups functionality
11. 🆕 Vehicle Management System
12. ✅ Business rules definition and conflict resolution
13. ✅ Navigation & Header improvements

### **MEDIUM Priority:**

14. Screen 15: Notifications Management
15. Screen 16: Detailed Chat System
16. 🆕 Enhanced Privacy System
17. ⚠️ UI/UX improvements (error states, offline support)
18. ⚠️ Estados de error y sin conexión
19. ⚠️ Validaciones y reglas de negocio

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
