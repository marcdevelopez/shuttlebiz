# 📝 Git Workflow - ShuttleBiz

## 🌿 Tipos de Ramas

Se usa una estrategia basada en ramas principales y subramas especializadas:

```bash
main                          # Rama principal, contiene el código listo para producción
develop                       # Rama de integración del desarrollo diario

feature/nombre-funcionalidad  # Nueva funcionalidad (parte de develop)
fix/descripcion-bug           # Corrección de errores
docs/tipo-documentacion       # Documentación
refactor/componente           # Refactoring
test/descripcion-test         # Tests
````

**Ejemplos:**

* `feature/user-authentication`
* `fix/login-validation`
* `docs/database-schema`

> 🧠 **Nota:** Todas las ramas de desarrollo (`feature/`, `fix/`, `refactor/`, etc.) deben crearse a partir de `develop` y luego integrarse nuevamente a `develop`. La rama `main` solo recibe cambios desde `develop` una vez que el código está probado y listo para producción.

---

## 💡 Tipos de Commits

### **Palabras clave:**

| Tipo        | Uso                  | Ejemplo                               |
| ----------- | -------------------- | ------------------------------------- |
| `feat:`     | Nueva funcionalidad  | `feat: add user login system`         |
| `fix:`      | Corrección de bug    | `fix: resolve booking conflict error` |
| `docs:`     | Documentación        | `docs: update API documentation`      |
| `style:`    | Formato (sin lógica) | `style: fix code indentation`         |
| `refactor:` | Refactoring          | `refactor: simplify booking logic`    |
| `test:`     | Tests                | `test: add unit tests for auth`       |
| `chore:`    | Tareas mantenimiento | `chore: update dependencies`          |

### **Scopes opcionales:**

- `auth`, `groups`, `shuttles`, `bookings`, `vehicles`, `chat`, `ui`, `db`

---

## ✅ Ejemplos Buenos vs Malos

### **✅ Buenos:**

```bash
feat(auth): add phone verification with SMS
fix(bookings): resolve seat calculation error
docs: add database schema reference
refactor(ui): simplify navigation flow
```

### **❌ Malos:**

```bash
fix: bug
feat: new stuff
update: changes
```

---

## 🔄 Flujo Básico

```bash
# 1. Asegurarse de tener la rama develop actualizada
git checkout develop && git pull

# 2. Crear rama de desarrollo desde develop
git checkout -b feature/mi-funcionalidad

# 3. Hacer commits durante desarrollo
git add .
git commit -m "feat: add user profile validation"

# 4. Push de la rama al remoto
git push origin feature/mi-funcionalidad

# 5. Crear Pull Request hacia develop en GitHub

# 6. Después del merge, limpiar rama local
git checkout develop && git pull
git branch -d feature/mi-funcionalidad
```

> 📦 Para releases: se puede hacer un merge de `develop` a `main` cuando esté estable y listo para producción.

---

## 🧾 Reglas Simples

* ✅ **Siempre** usar ramas, nunca commit directo a `main` ni `develop`
* ✅ **Mensajes claros** que expliquen QUÉ cambias
* ✅ **Un cambio lógico** por commit
* ✅ **Código que funciona** - no commitear código roto
* ❌ **No** usar mensajes genéricos como "fix" o "update"

---

## 🔍 Buscar Commits

```bash
# Por tipo
git log --grep="feat:"
git log --grep="fix:"

# Por scope
git log --grep="auth"
git log --grep="bookings"

# Por fecha
git log --since="2025-10-01"
```

---

_Guía rápida - Para más detalles, preguntar al equipo_

