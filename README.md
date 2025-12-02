# ShuttleBiz APP

[![CI](https://github.com/marcdevelopez/shuttlebiz/actions/workflows/ci.yml/badge.svg)](https://github.com/marcdevelopez/shuttlebiz/actions/workflows/ci.yml)

**ShuttleBiz** es una app móvil pensada para coordinar lanzaderas compartidas dentro de grupos con un propósito común (empleados, eventos, comunidades). La prioridad es **organizar viajes en grupo**, con chat, reserva de plazas y ubicación en tiempo real del conductor.

> El proyecto está en fase temprana de planificación y diseño, preparando requerimientos, wireframes y viabilidad técnica con Flutter y Firebase.

## Flujo de PR y CI

- CI = Integración Continua (pipeline automatizado que corre análisis, tests y build en GitHub Actions).
- Crea rama feature y haz push.
- Abre PR y espera a que CI aparezca y termine en verde antes de mergear.
- No merges si los checks están pendientes o fallidos.
- Tras merge a `main`, CI se ejecuta de nuevo; si falla, corrige en una rama nueva.
- Referencias visuales: consulta las capturas en `docs/assets/ci/pr-checks-pending.png` (checks pendientes) y `docs/assets/ci/pr-checks-green.png` (checks en verde) para ver el estado esperado.

**Checks pendientes (PR recien abierta)**  
![Checks pendientes](docs/assets/ci/pr-checks-pending.png)

**Checks en verde (listo para merge)**  
![Checks en verde](docs/assets/ci/pr-checks-green.png)

---

## 📋 Documentación

Puedes ver la documentación completa y las especificaciones funcionales aquí:

👉 [Documentación ShuttleBiz](docs/SPECS.md)

> Si colaboras en este proyecto, solicita acceso de edición en el mismo enlace.

- [Roadmap](docs/ROADMAP.md)
- [Dev log diario](docs/dev_log.md)
- [Modelo de datos](docs/DATABASE_SCHEMA.md)
- [Glosario de términos](docs/GLOSSARY.md)

---

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase (Authentication, Firestore, Cloud Functions, Messaging)
- **Servicios de ubicación**: Google Maps API
- **State Management**: Riverpod
- **Routing**: GoRouter
- **Control de versiones**: Git + GitHub Projects

---

## Qué estoy aprendiendo

- Integración de Firebase con Flutter
- Ubicación y mapas en tiempo real
- UI/UX para movilidad
- Estructura de proyecto y desarrollo modular
- Flujos colaborativos con GitHub Projects

---

## 📱 Capturas

| Autenticación                    | Consulta/edición de horarios                               | Lista de horarios                            |
| -------------------------------- | ---------------------------------------------------------- | -------------------------------------------- |
| ![Auth](assets/screens/auth.png) | ![Create](assets/screens/shuttle-schedule-lookup-edit.png) | ![List](assets/screens/shuttle-schedule.png) |

> Reflejan el estado actual (octubre 2025, Miro). Habrá más iteraciones y mejoras.

---

## Colaboración

Proyecto colaborativo con [Ezequiel Coeli](https://github.com/ezecoeli) en diseño y planificación.

Contribuciones y feedback son bienvenidos:

- Pull requests
- Issues
- Contacto directo

**Nota:** Todas las contribuciones se revisan antes de hacer merge.

---

## 🛡️ Licencia y términos de colaboración

Proyecto visible para portafolio y evaluación. Código bajo **Private Collaboration License – ShuttleBiz Team**.

- Las contribuciones requieren aprobación previa.
- Prohibida la copia, redistribución o uso derivado no autorizado.
- Contacto: **contact@marcdevelopez.com**

Más info: [marcdevelopez.com/shuttlebiz-license](https://marcdevelopez.com/shuttlebiz-license)

---

## Contacto

Para colaborar o consultas comerciales, abre un issue o escribe por email.

---

Creado por [Marcos García](https://github.com/marcdevelopez)  
Web personal: [marcdevelopez.com](https://marcdevelopez.com)
