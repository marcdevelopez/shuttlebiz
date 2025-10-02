# 🗄️ Database Schema & Models Reference

## 📋 Desarrollo - Orden Recomendado

### **Implementación Sugerida:**
1. **Modelos básicos** (User, Group) con Freezed
2. **Firebase setup** y autenticación
3. **Providers básicos** con Riverpod
4. **CRUD de grupos** (crear, listar)
5. **Modelos de Shuttle** y configuración
6. **Sistema de reservas** (Booking)
7. **Sistema de vehículos** (Vehicle)
8. **Chat y notificaciones**

---

## 🔥 Firebase Firestore Structure

### 👥 USERS Collection
```javascript
users: {
  [userId]: {
    id: string,
    phoneNumber: string,
    displayName?: string,
    profileImage?: string,
    preferredRole?: string,        // 🆕 conductor/viajero/none
    showPhoneNumber: boolean,      // 🆕 privacy setting
    createdAt: timestamp,
    groups: string[]               // IDs de grupos donde participa
  }
}
```

### 🏢 GROUPS Collection
```javascript
groups: {
  [groupId]: {
    id: string,
    name: string,
    description?: string,          // 🆕 optional description
    createdBy: string,             // userId del creador
    admins: string[],              // userIds con permisos admin
    members: string[],             // todos los miembros
    visibility: string,            // 🆕 'private' | 'public'
    createdAt: timestamp,
    settings: {
      autoApproval: boolean        // 🆕 for public groups
    }
  }
}
```

### 🚗 VEHICLES Collection
```javascript
vehicles: {
  [vehicleId]: {
    id: string,
    groupId: string,               // 🆕 belongs to specific group
    licensePlate: string,          // 🆕 required
    seats: number,                 // 🆕 required
    model?: string,                // 🆕 optional
    brand?: string,                // 🆕 optional
    color?: string,                // 🆕 optional
    createdBy: string,             // 🆕 User ID
    createdAt: timestamp,          // 🆕
    isActive: boolean              // 🆕
  }
}
```

### 🚌 SHUTTLES Collection
```javascript
shuttles: {
  [shuttleId]: {
    id: string,
    name: string,
    groupId: string,
    createdBy: string,
    origin: string,
    destination: string,
    defaultSeats: number,
    comment?: string,
    
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
    
    // Detalles específicos del viaje
    date: string,                // 'YYYY-MM-DD'
    time: string,                // '08:00'
    role: 'driver' | 'passenger',
    vehicleId?: string,          // 🆕 if role = driver
    
    // Estado
    status: 'requested' | 'confirmed' | 'cancelled',
    requestedAt: timestamp,
    confirmedAt?: timestamp
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
    rideTime?: string            // '08:00'
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
    
    // Vehicle management: conductors can create, admins can edit/delete
    match /vehicles/{vehicleId} {
      allow read: if request.auth != null && 
        request.auth.uid in get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.members;
      allow create: if request.auth != null;
      allow update, delete: if request.auth != null && 
        (request.auth.uid == get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.createdBy ||
         request.auth.uid in get(/databases/$(database)/documents/groups/$(resource.data.groupId)).data.admins);
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