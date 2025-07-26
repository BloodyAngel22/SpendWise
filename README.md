<p align="right">
  🇷🇺 <a href="#русская-версия">Перейти к русской версии</a> • 🇬🇧 <a href="#english-version">Go to English version</a>
</p>


---


# 📘 SpendWise

**SpendWise** — простое Flutter-приложение для **локального учёта расходов**. Подходит как основа для личного бюджета и демонстрации навыков архитектуры, работы с BLoC, SQLite и автоматической маршрутизации.

---

## 🧠 Особенности

- 📂 Категории для структурирования трат  
- 📝 Добавление, удаление и редактирование трат  
- 🔍 Поиск по тратам и категориям  
- 📅 Фильтрация по дате, категории и сумме  
- 📱 Полностью оффлайн, без подключения к интернету  
- 🇷🇺 Русский язык по умолчанию  

---

## 🧱 Архитектура

Проект построен на **Feature-based + Clean Architecture** подходе:

- `features/*`: бизнес-логика и UI по функциональности (`category`, `spend`)
- `core/`: маршруты, DI, тема, логгирование
- `common/`: виджеты, утилиты, валидаторы

Используется `flutter_bloc` и `get_it` для управления состоянием и внедрения зависимостей.
Маршрутизация — на основе `auto_route`.
Логгирование — через `talker_flutter`.

---

## 📸 Функциональность

### 💸 Расходы
- Добавление, удаление, редактирование
- Детальный экран для отображения полной информации
- Фильтрация и поиск

### 📂 Категории
- CRUD-операции
- Заранее предзаполненные категории

### 🔎 Поиск и фильтры
- По ключевым словам
- По диапазону дат и сумм

---

## 🛠️ Технологии

```yaml
dependencies:
  flutter_bloc
  get_it
  sqflite (+ sqflite_common_ffi)
  auto_route
  intl
  talker_flutter
  flutter_debouncer
```

---

## 🚀 Как запустить

```bash
# 1. Перейти в директорию с проектом
cd app

# 2. Установить зависимости
flutter pub get

# 3. Запустить проект
flutter run
```
> ⚠️ Проект протестирован под Android и Linux. На iOS и Web может потребовать доработки.

---

## 🧭 TODO

- Поддержка тёмной темы
- Локализация на английский язык

---

## 📂 Структура проекта

```bash
lib/
├── common/         # Общие виджеты и утилиты
├── core/           # DI, тема, маршруты, логгирование
├── features/
│   ├── category/   # Фичи категорий
│   └── spend/      # Фичи трат
└── main.dart       # Точка входа
```

---

## 🤝 Автор

Проект создан в рамках личного изучения Flutter.
Если вам понравилось — не забудьте ⭐️ в репозитории.

---

# 📘 SpendWise

**SpendWise** is a simple Flutter app for **local expense tracking**. It serves as a solid foundation for personal budgeting and demonstrates skills in app architecture, BLoC pattern, SQLite integration, and automatic routing.

---

## 🧠 Features

- 📂 Categories to organize your expenses  
- 📝 Add, delete, and edit expenses  
- 🔍 Search by name in expenses and categories  
- 📅 Filter by date range, category, and amount  
- 📱 Fully offline — no internet connection required  
- 🇷🇺 Russian UI (default)

---

## 🧱 Architecture

The project follows a **Feature-based + Clean Architecture** approach:

- `features/*`: business logic and UI by domain (`category`, `spend`)
- `core/`: routing, dependency injection, theme, logging
- `common/`: shared widgets, validators, and utilities

State management is implemented via `flutter_bloc` and `get_it`.  
Routing is handled using `auto_route`.  
Logging is powered by `talker_flutter`.

---

## 📸 Functionality

### 💸 Expenses
- Create, update, delete
- Detailed screen for mobile-friendly display
- Filtering and search

### 📂 Categories
- Full CRUD support
- Pre-filled default categories

### 🔎 Search & Filtering
- By keywords
- By date range and amount range

---

## 🛠️ Technologies

```yaml
dependencies:
  flutter_bloc
  get_it
  sqflite (+ sqflite_common_ffi)
  auto_route
  intl
  talker_flutter
  flutter_debouncer
```

---

## 🚀 Getting Started

```bash
# 1. Navigate to the app directory
cd app

# 2. Get dependencies
flutter pub get

# 3. Run the project
flutter run
```
> ⚠️ The app was tested on Android + Linux. iOS and Web support may require adjustments.

---

## 🧭 TODO

- Add dark theme
- Add English localization

---

## 📂 Project Structure

```bash
lib/
├── common/         # Shared widgets and utilities
├── core/           # DI, theme, routes, logging
├── features/
│   ├── category/   # Category feature
│   └── spend/      # Spend feature
└── main.dart       # Entry point
```

---

## 🤝 Author

This app was built as a learning project for Flutter.
If you find it useful, consider giving it a ⭐️ on GitHub!

---

## Preview

![preview1.png](/assets/preview1.png)

![preview2.png](/assets/preview2.png)

![preview3.png](/assets/preview3.png)

![preview4.png](/assets/preview4.png)

![preview5.png](/assets/preview5.png)

![preview6.png](/assets/preview6.png)

![preview7.png](/assets/preview7.png)

![preview8.png](/assets/preview8.png)

![preview9.png](/assets/preview9.png)

![preview10.png](/assets/preview10.png)