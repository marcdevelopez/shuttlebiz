# 📝 Git Workflow - ShuttleBiz

## 🌿 Tipos de Ramas

```bash
feature/nombre-funcionalidad    # Nueva funcionalidad
fix/descripcion-bug            # Corrección de errores
docs/tipo-documentacion        # Documentación
refactor/componente            # Refactoring
test/descripcion-test          # Tests
```

**Ejemplos:**

- `feature/user-authentication`
- `fix/login-validation`
- `docs/database-schema`

---

## � Tipos de Commits

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
commit
```

---

## 🔄 Flujo Básico

```bash
# 1. Crear rama desde main actualizado
git checkout main && git pull
git checkout -b feature/mi-funcionalidad

# 2. Hacer commits durante desarrollo
git add .
git commit -m "feat: add user profile validation"

# 3. Push de la rama
git push origin feature/mi-funcionalidad

# 4. Crear Pull Request en GitHub
# 5. Después del merge, limpiar
git checkout main && git pull
git branch -d feature/mi-funcionalidad
```

---

## � Reglas Simples

- ✅ **Siempre** usar ramas, nunca commit directo a `main`
- ✅ **Mensajes claros** que expliquen QUÉ cambias
- ✅ **Un cambio lógico** por commit
- ✅ **Código que funciona** - no commitear código roto
- ❌ **No** usar mensajes genéricos como "fix" o "update"

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
