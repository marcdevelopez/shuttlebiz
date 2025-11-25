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

## 🗓️ Día 3 — 2025-11-25

### ✔ Trabajo realizado:

- Se definió la **Pantalla 8 — Mis Solicitudes** en `SPECS.md`, con acceso desde el icono ✋ en Home/Chat/Horarios/Mapa de los 3 niveles y sin icono en pantallas secundarias.
- Se creó `docs/GLOSSARY.md` y se enlazó desde specs/README; términos CTA/Salida/Badge referenciados.
- `ROADMAP.md` actualizado: prioridad alta ítem 1 marcado como completado (especificación cerrada).
- Se completó la especificación de **Navegación y Menús Superiores Contextuales** (breadcrumb, stack PageView por nivel, menús ⋮ por pantalla, botón atrás del sistema, transiciones).
- `ROADMAP.md` actualizado: prioridad alta ítem 2 marcado como completado (especificación cerrada).

### 🧠 Decisiones tomadas:

- Pantalla 8 es pantalla independiente, no modal; enlaces de acceso solo desde AppBars principales.
- Claridad de AppBars: se documentó explícitamente dónde se muestra/oculta el icono ✋ para evitar ambigüedades.
- Navegación: al bajar/subir de nivel se mantiene la pestaña activa del PageView; breadcrumb obligatorio en AppBar; transiciones slide+fade 150–200 ms; menús ⋮ definidos por nivel/pestaña.

### 🎯 Próximos pasos:

- Continuar con prioridades altas pendientes de Fase 0 (navegación/menús contextuales, flujo de horarios, sistema de conflictos, chats privados).
- Refinar guía visual básica (tipografía, paleta, patrones de modales/chips) en `SPECS.md`.

---

# 🧾 Notas generales

- Actualiza al final de cada sesión
- Viñetas cortas; enlaza issues/PRs si los hay
- Cuando cambien fases o alcance, reflecta también en `ROADMAP.md`
