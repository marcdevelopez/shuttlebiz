# 📝 ShuttleBiz — Dev Log

Bitácora cronológica del desarrollo de ShuttleBiz (MVP).

Sirve para:

- Seguir la fase y el estado real del proyecto
- Registrar decisiones y bloqueos
- Conectar specs/roadmap con el trabajo diario
- Permitir a cualquier dev retomar sin perder contexto

---

# 📍 Estado actual

Fase activa: **1 — Configuración inicial / Arquitectura**
Última actualización: 2025-11-24

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

# 🧾 Notas generales

- Actualiza al final de cada sesión
- Viñetas cortas; enlaza issues/PRs si los hay
- Cuando cambien fases o alcance, reflecta también en `ROADMAP.md`
