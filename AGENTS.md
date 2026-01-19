# AGENTS — Guía de decisiones y prioridades

Este documento guía decisiones técnicas y de producto para mantener coherencia, foco en costes y estabilidad del MVP.

## Principios de decisión

- **Primero el MVP**: priorizar entregables que desbloqueen flujo end-to-end (grupo → lanzadera → reserva → notificaciones → chat básico).
- **No romper specs**: cualquier cambio debe respetar SPECS y el roadmap; si hay dudas, documentar en `docs/ROADMAP.md`.
- **Coste controlado**: minimizar listeners, escrituras y operaciones en Firestore/FCM; evitar streams no acotados.
- **Simplicidad antes que complejidad**: resolver con la solución más simple que cumpla requisitos.
- **Evolución segura**: cambios grandes deben ser incrementales y con feature flags si aplica.

## Prioridades de desarrollo

1. **Fase 0 (Specs cerradas y guía visual)**
2. **Fase 1 (Fundaciones y Auth)**
3. **Fase 2 (Grupos y lanzaderas básicas)**
4. **Fase 3 (Reservas y conducción manual)**
5. **Fase 4 (Chat y mapas MVP)**
6. **Fase 5 (Pulido y prerelase)**

## Reglas de trabajo

- **No tocar reglas de negocio** sin actualización explícita en `docs/SPECS.md`.
- **Documentar decisiones**: cambios de alcance o nuevas secciones futuras deben quedar en `docs/ROADMAP.md`.
- **Validar coste**: antes de añadir nuevas lecturas/escrituras en Firestore, justificar necesidad.
- **Evitar deuda**: no introducir atajos que comprometan seguridad o consistencia de datos.

## Procedimientos y recordatorios operativos (guía única)

> Esta sección centraliza lo esencial para cambios de código/estructura y forma de trabajo. Para el detalle completo, consultar los documentos referenciados.

### Git, ramas y commits (obligatorio)

- **Siempre** trabajar en ramas creadas desde `develop` y mergear de vuelta a `develop`.
- **Nunca** hacer commits directos a `main` ni `develop`.
- **Commits** con formato `tipo(scope): resumen` y mensajes claros (ver reglas y ejemplos en `docs/GIT_GUIDE.md`).

### PR y CI (obligatorio)

- **No** mergear si los checks de CI están pendientes o fallidos.
- **Siempre** abrir PR y esperar CI en verde antes de mergear.

### Cambios de producto y alcance

- **Si cambias reglas de negocio**, primero actualiza `docs/SPECS.md`.
- **Si cambias alcance o añades secciones futuras**, reflejarlo en `docs/ROADMAP.md`.
- **Si introduces términos nuevos**, actualiza primero el glosario en `docs/GLOSSARY.md`.

### Arquitectura y estructura (no negociable)

- **Feature-first + Clean + Riverpod**; no acoplar UI directa a Firestore.
- **No** usar `setState` en pantallas complejas; gestionar estado con Riverpod.
- **No** crear colecciones/campos arbitrarios en Firestore sin actualizar `docs/DATABASE_SCHEMA.md`.

### Coste y rendimiento (Firebase/Firestore)

- **Evitar listeners no acotados**, streams infinitos y escrituras derivadas de estados visuales.
- **Justificar** nuevas lecturas/escrituras cuando afecten costes.

### Calidad mínima

- Incluir tests básicos por feature; objetivo ≥80% antes de producción (ver `docs/ARCHITECTURE_GUIDELINES.md`).

### Registro y continuidad

- **Registrar decisiones y avances** en `docs/dev_log.md` para mantener trazabilidad.

## Señales de alerta

- Listeners globales o indefinidos.
- Polling para detectar mensajes.
- Escrituras derivadas de estados visuales.
- Cambios no reflejados en SPECS o ROADMAP.
