# 🧭 Arquitectura y Directrices Técnicas – ShuttleBiz

Este documento define la estructura, patrones y convenciones que deben seguirse en todo el desarrollo de ShuttleBiz.
Su objetivo es asegurar que la app sea escalable, mantenible y consistente, independientemente de la fase del proyecto o de la persona que colabore.

## 🧱 1. Arquitectura Base

### Stack técnico:

- **Frontend**: Flutter 3.x
- **State Management**: Riverpod (v2)
- **Routing**: GoRouter
- **Backend**: Firebase (Auth, Firestore, Cloud Functions, FCM)
- **Mensajería**: Firestore + FCM
- **Local Caching**: riverpod + shared_preferences/hive para datos offline
- **Maps**: Google Maps API (ubicación de usuarios)
- **Storage**: Firebase Storage (fotos de perfil, archivos multimedia)

### Patrón de arquitectura recomendado:

**Feature-first + Clean Architecture + Riverpod**

### Estructura base de carpetas:

```
lib/
 ├─ core/
 │   ├─ config/          # Temas, constantes, colores, providers globales
 │   ├─ utils/           # Funciones auxiliares, helpers
 │   ├─ routing/         # GoRouter y rutas globales
 │   └─ services/        # Firebase, notificaciones, local storage...
 ├─ features/
 │   ├─ auth/
 │   │   ├─ data/       # modelos y repos relacionados con auth
 │   │   ├─ providers/  # providers de Riverpod
 │   │   └─ ui/         # pantallas y widgets de auth
 │   ├─ groups/
 │   ├─ shuttles/
 │   ├─ bookings/
 │   ├─ vehicles/
 │   ├─ chat/
 │   ├─ notifications/
 │   ├─ profile/
 │   └─ onboarding/
 ├─ shared/
 │   ├─ widgets/        # Widgets comunes reutilizables
 │   └─ styles/
 └─ main.dart
```

## 🌿 2. Uso de Riverpod

- Todos los estados y lógica reactiva se gestionan con **Riverpod**
- **No se usa setState** para estados complejos
- Los Provider deben separarse por capas:
  - `StateNotifierProviders` para lógica de negocio
  - `FutureProvider / StreamProvider` para datos de Firestore
  - `Provider` simples para dependencias, repos, configs

### Ejemplo patrón típico:

```
/features/groups/providers/group_list_provider.dart
/features/groups/data/group_repository.dart
/features/groups/ui/group_list_screen.dart
```

## 🧠 3. Principios de Diseño

### Separación clara de responsabilidades

- **UI** → en `ui/`
- **Lógica** → en `providers/`
- **Acceso a datos** → en `data/`

### Independencia entre features

- Cada feature debe ser **modular**, sin dependencias cruzadas directas innecesarias
- Comunicación entre features vía providers o eventos, no importando código de otra feature

### Escalabilidad prevista

- Se diseña desde el MVP pensando en futuras fases (ver [ROADMAP.md](ROADMAP.md))
- Las entidades y modelos ya incluyen campos necesarios para roles dinámicos, chat y notificaciones (ver [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md))

### Código declarativo y limpio

- Nombres descriptivos en **inglés** para clases, funciones y archivos
- Comentarios solo cuando agregan valor
- Mantener consistencia en estilos de widgets y providers

## 📐 4. Modelos y Datos

- Todos los modelos Dart usan **Freezed** + `fromFirestore` / `toFirestore` para consistencia
- La estructura sigue exactamente la definida en [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md)
- **No se deben crear colecciones o campos arbitrarios** sin actualizar primero este esquema

## 🔄 5. Flujo de Desarrollo

1. Crear rama `feature/` para cada nueva funcionalidad
2. Seguir los pasos definidos en [ROADMAP.md](ROADMAP.md).
3. Para convenciones de Git, commits y PRs, consultar [GIT_GUIDE.md](GIT_GUIDE.md)

## 🧪 6. Pruebas y Calidad

- Cada feature debe incluir al menos **tests básicos** de providers y lógica crítica
- Se usarán `flutter_test` y `mocktail` para unit tests
- No se bloquea el desarrollo por tests iniciales, pero se debe planificar refactor para **cobertura >80%** antes de producción

## 📲 7. Convenciones de UI

### Estilo visual coherente

Colores definidos en [SPECS.md](SPECS.md)

- **Azul intenso**: `#0077B6`
- **Rojo coral**: `#FF6B6B`

### Organización

- Widgets reutilizables van en `shared/widgets`
- Navegación inferior y títulos de pantalla según UX definido en las specs

## 🚀 8. Extensibilidad

Este proyecto está diseñado para crecer en fases:

- **MVP** → Booking completo y privacidad
- **Post-MVP** → Chat avanzado, IA, reputación, etc.

### Por tanto:

- No mezclar lógica "temporal" o "de prueba" dentro de la base
- Usar flags y providers para activar/desactivar features si es necesario

## ⚠️ 9. Qué evitar

❌ **Providers globales únicos** con toda la lógica → cada feature debe tener los suyos

❌ **setState en pantallas complejas** → usar Riverpod

❌ **Importar directamente providers** de otras features → crear abstracciones si hace falta compartir datos

❌ **Hardcodear valores** que podrían cambiar (IDs de grupos, roles, colores, etc.)

## 📎 10. Referencias internas

- 📄 [SPECS.md](SPECS.md) → Requerimientos funcionales completos
- 🗄️ [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md) → Estructura de datos oficial
- 🧭 [ROADMAP.md](ROADMAP.md) → Fases de desarrollo y objetivos
- 📖 [README.md](../README.md) → Presentación del proyecto

---

## ✅ Cumplimiento Obligatorio

**Cumplir estas directrices es obligatorio para todas las nuevas features.**

Esto garantiza que ShuttleBiz mantenga una base sólida, flexible y escalable durante todas las fases del desarrollo.
