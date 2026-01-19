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

## Señales de alerta

- Listeners globales o indefinidos.
- Polling para detectar mensajes.
- Escrituras derivadas de estados visuales.
- Cambios no reflejados en SPECS o ROADMAP.
