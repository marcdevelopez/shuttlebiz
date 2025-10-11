# 🗄️ Database Schema & Models Reference

## 📋 Desarrollo - Orden Recomendado

### **Implementación Sugerida:**

1. **Modelos básicos** (User, Group) con Freezed
2. **Firebase setup** y autenticación
3. **Sistema de respaldo** (Drive/iCloud integration)
4. **Providers básicos** con Riverpod
5. **CRUD de grupos** (crear, listar)
6. **Modelos de Shuttle** y configuración
7. **Sistema de reservas** (Booking)
8. **Sistema de vehículos** (Vehicle)
9. **Chat y notificaciones**
10. **Mapas y geolocalización** (incluido en MVP)
11. **Alertas de conductores** (Driver Alerts)

---

## 🔥 Firebase Firestore Structure

### 👥 USERS Collection (datos básicos para recuperación)

```javascript
users: {
  [userId]: {
    id: string,
    phoneNumber: string,
    displayName?: string,
    profileImage?: string,          // URL opcional
    preferredRole?: string,         // conductor/viajero/none
    showPhoneNumber: boolean,       // privacy setting
    createdAt: timestamp,
    groups: string[],               // IDs de grupos donde participa

    // 🆕 Configuración de respaldo
    backupSettings: {
      driveEnabled: boolean,        // Google Drive backup (Android)
      icloudEnabled: boolean,       // iCloud backup (iOS)
      localBackupEnabled: boolean,  // Respaldo local como alternativa
      lastBackup?: timestamp,       // Último respaldo realizado
      autoBackup: boolean          // Respaldo automático
    },

    // 🆕 Estadísticas básicas (para reputación futura)
    stats: {
      totalTrips: number,           // Viajes completados
      cancelledTrips: number,       // Viajes cancelados
      timesAsDriver: number,        // Veces como conductor
      driverCancellations: number   // Cancelaciones como conductor
    }
  }
}
```

### 🏢 GROUPS Collection

```javascript
groups: {
  [groupId]: {
    id: string,
    name: string,
    description?: string,
    groupImage?: string,             // 🆕 Foto de perfil del grupo
    createdBy: string,
    admins: string[],
    members: string[],
    potentialDrivers: string[],      // 🆕 Conductores potenciales asignados por admins
    visibility: string,              // 'private' | 'public'
    createdAt: timestamp,
    settings: {
      autoApproval: boolean,
      autoCancel15MinRule: boolean,  // 🆕 Cancelar si no hay conductor 15min antes
      allowMemberVehicles: boolean   // 🆕 Permitir que miembros agreguen vehículos
    }
  }
}
```

### 🚗 VEHICLES Collection (por grupo)

```javascript
vehicles: {
  [vehicleId]: {
    id: string,
    groupId: string,
    licensePlate: string,
    seats: number,
    model?: string,
    brand?: string,
    color?: string,
    vehicleImage?: string,           // 🆕 Foto del vehículo (iCloud/Drive URL)
    createdBy: string,
    createdAt: timestamp,
    isActive: boolean,
    status: string,                  // 'approved' | 'pending' | 'rejected'
    approvedBy?: string,
    approvedAt?: timestamp,

    // 🆕 Información adicional
    description?: string,            // Descripción adicional del vehículo
    isFrequent: boolean             // Vehículo marcado como frecuente
  }
}
```

### 🚗 VEHICLE_REQUESTS Collection (🆕 for approval system)

```javascript
vehicleRequests: {
  [requestId]: {
    id: string,
    vehicleData: {                 // 🆕 vehicle data being requested
      licensePlate: string,
      seats: number,
      model?: string,
      brand?: string,
      color?: string
    },
    groupId: string,               // 🆕 target group
    requestedBy: string,           // 🆕 conductor requesting
    status: string,                // 🆕 'pending' | 'approved' | 'rejected'
    reviewedBy?: string,           // 🆕 admin who reviewed
    reviewMessage?: string,        // 🆕 optional message
    createdAt: timestamp,
    reviewedAt?: timestamp
  }
}
```

### �🚌 SHUTTLES Collection

```javascript
shuttles: {
  [shuttleId]: {
    id: string,
    name: string,
    groupId: string,
    createdBy: string,
    origin: string,                  // Debe ser corto para UI
    destination: string,             // Debe ser corto para UI
    originCoords?: {                 // 🆕 Coordenadas para mapas
      lat: number,
      lng: number
    },
    destinationCoords?: {            // 🆕 Coordenadas para mapas
      lat: number,
      lng: number
    },
    defaultSeats: number,
    comment?: string,
    hasBothDirections: boolean,      // 🆕 Si tiene ida y vuelta

    // Configuración de horario
    scheduleType: 'date' | 'frequency',

    // Si es tipo 'date'
    specificDates?: {
      date: string,              // 'YYYY-MM-DD'
      times: string[]            // ['08:00', '17:30']
    }[],

    // Si es tipo 'frequency'
    frequency?: {
      days: number[],            // [1,2,3,4,5] = L-V
      times: string[],
      startDate: string,
      endDate?: string
    },

    isActive: boolean,
    createdAt: timestamp
  }
}
```

### 🎫 BOOKINGS Collection

```javascript
bookings: {
  [bookingId]: {
    id: string,
    shuttleId: string,
    userId: string,
    groupId: string,
    date: string,                    // 'YYYY-MM-DD'
    time: string,                    // '08:00'
    direction: 'outbound' | 'return', // 🆕 Ida o vuelta
    role: 'driver' | 'passenger',
    vehicleId?: string,

    // 🆕 Estado detallado
    status: 'requested' | 'confirmed' | 'cancelled' | 'completed',
    requestedAt: timestamp,
    confirmedAt?: timestamp,
    cancelledAt?: timestamp,
    completedAt?: timestamp,
    cancellationReason?: string,     // Si se cancela

    // 🆕 Información del viaje real
    actualDepartureTime?: string,    // Hora real de salida
    delay?: number,                  // Retraso en minutos
    completionNotes?: string         // Notas del viaje completado
  }
}
```

### 💬 MESSAGES Collection

```javascript
messages: {
  [messageId]: {
    id: string,
    groupId: string,
    shuttleId?: string,          // null = chat general, con valor = chat específico de viaje
    userId: string,
    text: string,
    timestamp: timestamp,

    // Para chat específico de viaje
    rideDate?: string,           // 'YYYY-MM-DD'
    rideTime?: string,           // '08:00'

    // 🆕 Chat individual/privado
    recipientId?: string,        // Para chats privados entre usuarios
    isPrivate: boolean           // true para chats privados
  }
}
```

### 🚨 DRIVER_ALERTS Collection (🆕 para gestión de conductores)

```javascript
driverAlerts: {
  [alertId]: {
    id: string,
    groupId: string,
    shuttleId: string,
    targetUserId: string,        // Usuario seleccionado como conductor potencial
    createdBy: string,           // Admin/creador que envía la alerta
    date: string,                // 'YYYY-MM-DD'
    time: string,                // '08:00'
    direction: 'outbound' | 'return',

    status: 'pending' | 'accepted' | 'rejected',
    message?: string,            // Mensaje del admin
    response?: string,           // Respuesta del conductor
    rejectionReason?: string,    // Si rechaza: motivo

    createdAt: timestamp,
    respondedAt?: timestamp
  }
}
```

### 📋 MY_REQUESTS Collection (🆕 Estado de Mis Solicitudes)

```javascript
myRequests: {
  [userId]: {
    futureRequests: [
      {
        bookingId: string,
        shuttleId: string,
        shuttleName: string,
        groupName: string,
        date: string,
        time: string,
        direction: string,
        role: string,
        status: string
      }
    ],
    pastRequests: [
      {
        bookingId: string,
        shuttleId: string,
        shuttleName: string,
        groupName: string,
        date: string,
        time: string,
        direction: string,
        role: string,
        status: string,
        completedAt?: timestamp
      }
    ]
  }
}
```

---

## 🎯 Dart Models with Freezed

### 👤 User Model

```dart
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String phoneNumber,
    String? displayName,
    String? profileImage,
    String? preferredRole,         // 🆕 conductor/viajero/none
    @Default(false) bool showPhoneNumber,  // 🆕 privacy setting
    required DateTime createdAt,
    @Default([]) List<String> groups,
  }) = _User;

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      phoneNumber: data['phoneNumber'],
      displayName: data['displayName'],
      profileImage: data['profileImage'],
      preferredRole: data['preferredRole'],
      showPhoneNumber: data['showPhoneNumber'] ?? false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      groups: List<String>.from(data['groups'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'profileImage': profileImage,
      'preferredRole': preferredRole,
      'showPhoneNumber': showPhoneNumber,
      'createdAt': Timestamp.fromDate(createdAt),
      'groups': groups,
    };
  }
}
```

### 🏢 Group Model

```dart
@freezed
class Group with _$Group {
  const factory Group({
    required String id,
    required String name,
    String? description,           // 🆕 optional
    required String createdBy,
    @Default([]) List<String> admins,
    @Default([]) List<String> members,
    @Default('private') String visibility,  // 🆕 private/public
    required DateTime createdAt,
    @Default(false) bool autoApproval,      // 🆕 for public groups
  }) = _Group;

  factory Group.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Group(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      createdBy: data['createdBy'],
      admins: List<String>.from(data['admins'] ?? []),
      members: List<String>.from(data['members'] ?? []),
      visibility: data['visibility'] ?? 'private',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      autoApproval: data['settings']?['autoApproval'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'createdBy': createdBy,
      'admins': admins,
      'members': members,
      'visibility': visibility,
      'createdAt': Timestamp.fromDate(createdAt),
      'settings': {
        'autoApproval': autoApproval,
      },
    };
  }
}
```

### 🚗 Vehicle Model

```dart
@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    required String groupId,
    required String licensePlate,
    required int seats,
    String? model,
    String? brand,
    String? color,
    required String createdBy,
    required DateTime createdAt,
    @Default(true) bool isActive,
    @Default('approved') String status,    // 🆕 'approved' | 'pending' | 'rejected'
    String? approvedBy,                    // 🆕 Admin/Creator who approved
    DateTime? approvedAt,                  // 🆕 When approved
  }) = _Vehicle;

  factory Vehicle.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Vehicle(
      id: doc.id,
      groupId: data['groupId'],
      licensePlate: data['licensePlate'],
      seats: data['seats'],
      model: data['model'],
      brand: data['brand'],
      color: data['color'],
      createdBy: data['createdBy'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      isActive: data['isActive'] ?? true,
      status: data['status'] ?? 'approved',
      approvedBy: data['approvedBy'],
      approvedAt: data['approvedAt'] != null ? (data['approvedAt'] as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'groupId': groupId,
      'licensePlate': licensePlate,
      'seats': seats,
      'model': model,
      'brand': brand,
      'color': color,
      'createdBy': createdBy,
      'createdAt': Timestamp.fromDate(createdAt),
      'isActive': isActive,
      'status': status,
      'approvedBy': approvedBy,
      'approvedAt': approvedAt != null ? Timestamp.fromDate(approvedAt!) : null,
    };
  }
}
```

### 🚌 Shuttle Model

```dart
@freezed
class Shuttle with _$Shuttle {
  const factory Shuttle({
    required String id,
    required String name,
    required String groupId,
    required String createdBy,
    required String origin,
    required String destination,
    required int defaultSeats,
    String? comment,
    required ScheduleType scheduleType,
    List<SpecificDate>? specificDates,
    Frequency? frequency,
    @Default(true) bool isActive,
    required DateTime createdAt,
  }) = _Shuttle;

  factory Shuttle.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Shuttle(
      id: doc.id,
      name: data['name'],
      groupId: data['groupId'],
      createdBy: data['createdBy'],
      origin: data['origin'],
      destination: data['destination'],
      defaultSeats: data['defaultSeats'],
      comment: data['comment'],
      scheduleType: ScheduleType.values.firstWhere(
        (e) => e.toString().split('.').last == data['scheduleType'],
      ),
      specificDates: data['specificDates'] != null
          ? (data['specificDates'] as List)
              .map((e) => SpecificDate.fromMap(e))
              .toList()
          : null,
      frequency: data['frequency'] != null
          ? Frequency.fromMap(data['frequency'])
          : null,
      isActive: data['isActive'] ?? true,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'groupId': groupId,
      'createdBy': createdBy,
      'origin': origin,
      'destination': destination,
      'defaultSeats': defaultSeats,
      'comment': comment,
      'scheduleType': scheduleType.toString().split('.').last,
      'specificDates': specificDates?.map((e) => e.toMap()).toList(),
      'frequency': frequency?.toMap(),
      'isActive': isActive,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}

enum ScheduleType { date, frequency }

@freezed
class SpecificDate with _$SpecificDate {
  const factory SpecificDate({
    required String date,        // 'YYYY-MM-DD'
    required List<String> times, // ['08:00', '17:30']
  }) = _SpecificDate;

  factory SpecificDate.fromMap(Map<String, dynamic> map) {
    return SpecificDate(
      date: map['date'],
      times: List<String>.from(map['times']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'times': times,
    };
  }
}

@freezed
class Frequency with _$Frequency {
  const factory Frequency({
    required List<int> days,     // [1,2,3,4,5] = L-V
    required List<String> times,
    required String startDate,
    String? endDate,
  }) = _Frequency;

  factory Frequency.fromMap(Map<String, dynamic> map) {
    return Frequency(
      days: List<int>.from(map['days']),
      times: List<String>.from(map['times']),
      startDate: map['startDate'],
      endDate: map['endDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'days': days,
      'times': times,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
```

### 🎫 Booking Model

```dart
@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String shuttleId,
    required String userId,
    required String groupId,
    required String date,        // 'YYYY-MM-DD'
    required String time,        // '08:00'
    required BookingRole role,
    String? vehicleId,           // 🆕 if role = driver
    required BookingStatus status,
    required DateTime requestedAt,
    DateTime? confirmedAt,
  }) = _Booking;

  factory Booking.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Booking(
      id: doc.id,
      shuttleId: data['shuttleId'],
      userId: data['userId'],
      groupId: data['groupId'],
      date: data['date'],
      time: data['time'],
      role: BookingRole.values.firstWhere(
        (e) => e.toString().split('.').last == data['role'],
      ),
      vehicleId: data['vehicleId'],
      status: BookingStatus.values.firstWhere(
        (e) => e.toString().split('.').last == data['status'],
      ),
      requestedAt: (data['requestedAt'] as Timestamp).toDate(),
      confirmedAt: data['confirmedAt'] != null
          ? (data['confirmedAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'shuttleId': shuttleId,
      'userId': userId,
      'groupId': groupId,
      'date': date,
      'time': time,
      'role': role.toString().split('.').last,
      'vehicleId': vehicleId,
      'status': status.toString().split('.').last,
      'requestedAt': Timestamp.fromDate(requestedAt),
      'confirmedAt': confirmedAt != null
          ? Timestamp.fromDate(confirmedAt!)
          : null,
    };
  }
}

enum BookingRole { driver, passenger }
enum BookingStatus { requested, confirmed, cancelled }
```

### 💬 Message Model

```dart
@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String groupId,
    String? shuttleId,           // null = chat general
    required String userId,
    required String text,
    required DateTime timestamp,
    String? rideDate,            // 'YYYY-MM-DD' for ride-specific chat
    String? rideTime,            // '08:00' for ride-specific chat
  }) = _Message;

  factory Message.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Message(
      id: doc.id,
      groupId: data['groupId'],
      shuttleId: data['shuttleId'],
      userId: data['userId'],
      text: data['text'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      rideDate: data['rideDate'],
      rideTime: data['rideTime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'groupId': groupId,
      'shuttleId': shuttleId,
      'userId': userId,
      'text': text,
      'timestamp': Timestamp.fromDate(timestamp),
      'rideDate': rideDate,
      'rideTime': rideTime,
    };
  }
}
```

---

## 🔐 Security Rules (Firestore)

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own user document
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }

    // Group members can read group data, admins can write
    match /groups/{groupId} {
      allow read: if request.auth != null &&
        request.auth.uid in resource.data.members;
      allow write: if request.auth != null &&
        (request.auth.uid == resource.data.createdBy ||
         request.auth.uid in resource.data.admins);
    }

    // Vehicle management: conductors can create (pending approval), admins can approve/edit/delete
    match /vehicles/{vehicleId} {
      allow read: if request.auth != null &&
        request.auth.uid in get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.members;
      allow create: if request.auth != null &&
        request.auth.uid in get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.members;
      allow update: if request.auth != null && (
        // Admins/creators can always update
        request.auth.uid == get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.createdBy ||
        request.auth.uid in get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.admins ||
        // Creator of vehicle can update their own vehicle
        (request.auth.uid == resource.data.createdBy && resource.data.status == 'approved')
      );
      allow delete: if request.auth != null &&
        (request.auth.uid == get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.createdBy ||
         request.auth.uid in get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.admins ||
         request.auth.uid == resource.data.createdBy);
    }

    // Similar rules for shuttles, bookings, messages...
  }
}
```

---

## 📊 Performance Optimization

### **Firestore Indexes Needed:**

- `groups` → `visibility` ASC, `createdAt` DESC (for public group discovery)
- `bookings` → `shuttleId` ASC, `date` ASC, `time` ASC
- `messages` → `groupId` ASC, `timestamp` DESC
- `vehicles` → `groupId` ASC, `isActive` ASC

### **Caching Strategy:**

- User profile → Local cache with TTL
- Active groups → Real-time listeners
- Bookings → Real-time for active dates
- Messages → Paginated with local cache

---

_Last updated: October 2, 2025_  
_This schema supports all features from SPECIFICATIONS.md including the 2/10/25 improvements_
