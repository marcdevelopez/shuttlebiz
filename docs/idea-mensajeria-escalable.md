## Nota para añadir a las specs — Arquitectura de mensajería y desacoplamiento del backend

### **Arquitectura obligatoria para el sistema de mensajería**

Para evitar bloqueos técnicos, sobrecostes innecesarios y migraciones traumáticas en el futuro, **la mensajería de ShuttleBiz debe implementarse desde el inicio de forma desacoplada del proveedor de backend**. Aunque en una primera fase se use Firebase/Firestore u otro servicio gestionado para acelerar el desarrollo, **la app no debe depender directamente de ese proveedor en la UI ni en la lógica principal de dominio**. Esto encaja con el carácter central del chat dentro del MVP ya definido en estas especificaciones.

#### **Reglas obligatorias de implementación**

1. **La UI nunca debe leer ni escribir directamente contra Firestore u otro backend específico.**
   Toda la mensajería debe pasar por una capa de abstracción propia, por ejemplo:
   - `ChatRepository`
   - `ConversationRepository`
   - `MessageSyncService`

2. **La fuente de lectura de la UI debe ser siempre una base de datos local del dispositivo**, no el backend remoto.
   El backend remoto debe utilizarse para:
   - envío de mensajes,
   - recepción de mensajes nuevos,
   - sincronización de estados,
   - restauración o recuperación cuando proceda.

3. **El historial de chat debe persistirse localmente** en una base de datos propia del dispositivo (por ejemplo Isar o SQLite), de forma que:
   - abrir un chat lea desde local,
   - el scroll histórico no dependa de lecturas remotas continuas,
   - la app pueda funcionar correctamente con conectividad limitada,
   - una futura migración de backend no obligue a rehacer la UI.

4. **Los modelos de dominio no deben diseñarse como reflejo directo de documentos Firestore.**
   Deben existir entidades propias del dominio, por ejemplo:
   - `Conversation`
   - `Message`
   - `MessageReceipt`
   - `Participant`
   - `Attachment`

5. **Cada mensaje debe tener identificadores estables y propios**, incluyendo:
   - `messageId`
   - `conversationId`
   - `senderId`
   - `clientGeneratedId` para deduplicación y reintentos
   - timestamps claros de creación, envío, recepción y lectura

6. **La arquitectura debe permitir sustituir el backend remoto sin reescribir la app.**
   Debe ser posible cambiar en el futuro:
   - de Firestore a API propia,
   - de listeners gestionados a WebSocket,
   - de almacenamiento gestionado a infraestructura propia o S3-compatible,
     sin afectar a pantallas, widgets ni lógica de presentación.

7. **No se debe acoplar la mensajería a un único proveedor de almacenamiento o sincronización.**
   Google Drive/iCloud podrán usarse como respaldo o restauración cuando aplique, pero **no deben tratarse como motor principal de sincronización de mensajes en tiempo real**.

8. **El sistema debe estar preparado para una futura estrategia híbrida**, donde:
   - el dispositivo conserva el historial local,
   - el backend remoto sincroniza solo eventos nuevos o deltas,
   - los adjuntos/media se almacenen aparte del canal principal de mensajería.

#### **Objetivo arquitectónico**

La mensajería debe quedar preparada desde el primer día para evolucionar hacia una arquitectura más escalable sin deuda crítica. El objetivo no es decidir ahora toda la infraestructura final, sino **evitar que el chat quede pegado a Firestore o a cualquier backend concreto**, ya que eso encarecería el crecimiento y complicaría mucho una futura migración.

---

## Versión corta para decir al agente

Te dejo también una versión breve, por si quieres dársela tal cual al agente:

> La mensajería debe implementarse desacoplada del backend desde el inicio. La UI no puede leer ni escribir directamente contra Firestore. Debe existir una capa propia de repositorios/servicios, y la UI debe leer siempre desde base local del dispositivo. Los modelos de chat deben ser entidades propias del dominio y no reflejos directos de documentos Firestore. La arquitectura debe permitir sustituir en el futuro Firestore por backend propio, WebSocket, API o almacenamiento alternativo sin reescribir la app. Google Drive/iCloud solo podrán considerarse respaldo o restauración, no motor principal del chat en tiempo real.
