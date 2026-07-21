# Universal Low-Code B2B AI Platform Infrastructure
> **Универсальная Low-Code Архитектура B2B-Платформ с Интеграцией ИИ**

---

## 🌍 English Description

### Overview
This repository contains a modular, high-performance, and secure infrastructure blueprint designed for deploying B2B automation ecosystems. Built on a Shared Core philosophy, the architecture minimizes computational overhead by hosting multi-tenant AI capabilities, analytical frameworks, and automated operational workflows within a centralized, containerized environment. It is engineered specifically for fast-paced MVP verification and immediate market entry (Time-to-Market optimization) without preliminary infrastructure investments.

### Key Architectural Principles
* **Low-Code Core**: Workflow design, API composition, and CORS policies are orchestrated via n8n on a dedicated port matrix, eliminating the need for monolithic backend architectures.
* **Network Isolation**: Strict dual-contour network design completely shields the persistent data layer from external edge ingestion points.
* **Port-Based Routing**: Clean separation between the static customer-facing interface (Port 443) and the automation engine (Port 8443) prevents asset loading conflicts.
* **LLM Integration**: Built-in compatibility with enterprise-grade large language models (Meta Llama 3.3 70B via Groq API) featuring persistent contextual session memory.
* **Efficient Storage Strategy**: PostgreSQL utilizing `JSONB` formats to seamlessly blend strict relational logic with dynamic, schema-less operational logs.
* **Fault Tolerance & Data Safety**: Automated lifecycle logging limits disk consumption while an autonomous hot-backup subsystem guarantees data persistence.

---

## 🇷🇺 Описание на русском языке

### Обзор системы
Данный репозиторий представляет собой модульную, высокопроизводительную и защищенную инфраструктурную модель, разработанную для развертывания B2B-экосистем автоматизации. Построенная на принципах общего ядра (Shared Core), архитектура минимизирует вычислительные издержки, объединяя многопользовательские функции искусственного интеллекта, аналитики данных и операционных сценариев в изолированном контейнерном контуре. Решение оптимизировано для оперативной проверки гипотез (MVP) и минимизации времени выхода продукта на рынок (Time-to-Market) без предварительных вложений в инфраструктуру.

### Ключевые архитектурные принципы
* **Low-Code Ядро**: Визуальное проектирование сценариев, оркестрация API и управление политиками CORS выполняются внутри среды n8n на выделенном сетевом порту, исключая необходимость разработки сложного бэкенда.
* **Сетевая изоляция**: Строгая двухконтурная топология сети изолирует внешние точки приема трафика от критически важных слоев хранения данных.
* **Портовая маршрутизация**: Четкое разделение между статическим интерфейсом для клиентов (Порт 443) и движком автоматизации (Порт 8443) исключает конфликты при загрузке статических JS/CSS файлов приложений.
* **Интеграция с LLM**: Нативная поддержка языковых моделей корпоративного класса (Meta Llama 3.3 70B через Groq API) с долгосрочным контекстным сохранением истории сессий.
* **Эффективное хранение**: Использование СУБД PostgreSQL с форматами данных `JSONB` для бесшовного сочетания строгой реляционной логики и динамических неструктурированных операционных логов.
* **Отказоустойчивость и безопасность**: Автоматическое ограничение жизненного цикла логов предотвращает переполнение дискового пространства, а автономная подсистема горячего резервного копирования гарантирует сохранность данных.

## 📐 Interaction Map / Схема взаимодействия компонентов

```text
===================================================================================================
                                      B2B PLATFORM ARCHITECTURE
===================================================================================================

 [ ВНЕШНИЙ МИР / PUBLIC INTERNET ]
        │
        ├──► HTTPS (Трафик клиентов) ─────────────► Порт 443 ──┐
        ├──► HTTPS (Админка автоматизации) ──────► Порт 8443 ─┼─► [ NGINX REVERSE PROXY ]
        └──► HTTPS (Метрики и дашборды) ──────────► Порт 3000 ──┘          │
                                                                           │
                                           Внутреннее безопасное проксирование
                                                                           │
                                                                           ▼
 ┌───────────────────────────────────────────────────────────────────────────────────────────────┐
 │ 🔒 public_net (ВНЕШНИЙ КОНТУР / DMZ ZONE)                                                     │
 │                                                                                               │
 │   ┌──────────────────────────────┐                                                            │
 │   │     🌐 STATIC FRONTEND       │◄───────────────────────────────────────────────────────────┤
 │   │  - Чат-виджет "Студия"       │ (Прямая раздача index.html без использования Python)       │
 │   └──────────────────────────────┘                                                            │
 └───────────────────────────────────────────────────────────────────────────────────────────────┘
                                                                           │
                                            Изолированный интерконнект     │
                                                                           ▼
 ┌───────────────────────────────────────────────────────────────────────────────────────────────┐
 │ 🛡️ private_net (ИЗОЛИРОВАННЫЙ ВНУТРЕННИЙ БУНКЕР)                                               │
 │                                                                                               │
 │   ┌───────────────────────────────────┐               ┌───────────────────────────────────┐   │
 │   │      ⚙️ n8n AUTOMATION ENGINE     │                │        📊 GRAFANA ANALYTICS       │   │
 │   │   - Доступ через Порт 8443        │               │   - Доступ через Порт 3000        │   │
 │   │   - Интеграция с Llama 3.3 (Groq) │               │   - Визуализация метрик бизнеса   │   │
 │   └─────────────────┬─────────────────┘               └─────────────────┬─────────────────┘   │
 │                     │                                                   │                     │
 │                     │ Запись чатов (JSONB)                              │ SQL-запросы метрик  │
 │                     └─────────────────────────┬─────────────────────────┘                     │
 │                                               ▼                                               │
 │   ┌───────────────────────────────────────────────────────────────────────────────────────┐   │
 │   │                              🗄️ POSTGRESQL 15 DATABASE                                 │   │
 │   │   - Главное хранилище (Полностью изолировано, внешние порты закрыты)                  │   │
 │   │   - Хранение истории сессий ИИ-ассистента и аналитики Wildberries                     │   │
 │   └───────────────────────────────────────────▲───────────────────────────────────────────┘   │
 │                                               │                                               │
 └───────────────────────────────────────────────┼───────────────────────────────────────────    ┘
                                                 │
                                                 │ Локальный "горячий" бэкап данных
                                                 │
                                 ┌───────────────┴───────────────     ┐
                                 │       💾 backup.sh SCRIPT          │
                                 │  Автономное резервное копирование  │
                                 └───────────────────────────────     ┘
```

## 🔒 Network Topology & Security / Сетевая топология и безопасность

### English
To guarantee enterprise-grade data protection, the infrastructure introduces automated dual-contour network segmentation utilizing Docker Bridge drivers:
1. **`public_net` (Public Perimeter)**: Contains the `Nginx` reverse proxy and points directly to the static assets mount. It serves as the single point of entry, handles SSL termination, and features optimized execution limits (`proxy_read_timeout 600s`) explicitly tailored for prolonged LLM response generation windows.
2. **`private_net` (Isolated Vault)**: Encloses `n8n`, `PostgreSQL`, and `Grafana`. The DBMS (`PostgreSQL`) is physically stripped of any external network mappings and does not expose its native `5432` port to the internet. Inter-container data exchange occurs entirely at the Docker daemon kernel level.

### Русский
Для обеспечения безопасности корпоративных данных в инфраструктуре реализовано автоматическое сегментирование сети на базе двух изолированных контуров Docker Bridge:
1. **`public_net` (Внешний периметр)**: Включает в себя реверс-прокси `Nginx` и подключенную папку статического фронтенда. Служит единой точкой входа, обеспечивает инкапсуляцию трафика и содержит расширенные таймауты (`proxy_read_timeout 600s`), настроенные под специфику длительной генерации ответов нейросетями.
2. **`private_net` (Изолированный бункер)**: Контур объединяет ядра `n8n`, `PostgreSQL` и `Grafana`. СУБД полностью лишена внешних сетевых мостов; нативный порт `5432` закрыт от внешней сети. Обмен данными происходит исключительно внутри виртуальной сети на уровне ядра Docker.

---

## 💾 Disaster Recovery & Backups / Резервное копирование

### English
Data retention is enforced via the autonomous automation script `backup.sh`. 
* **Hot-Backup Strategy**: Utilizes `pg_dump` internally within the containerized infrastructure, allowing complete database dumps without system downtime or service interruptions.
* **Storage Protection**: Dump files are timestamped and structural integrity checks are automatically logged.
* **Automation**: Ready to be mounted as a recurring cron job for continuous recovery assurance.

### Русский
Сохранность бизнес-данных обеспечивается автономным скриптом автоматизации `backup.sh`.
* **Стратегия горячего бэкапа**: Использует утилиту `pg_dump` непосредственно внутри контейнера, что позволяет создавать полные слепки базы данных без остановки платформы и прерывания обслуживания пользователей.
* **Защита архивов**: Файлы резервных копий маркируются временными метками (timestamp), а результаты проверки целостности автоматически логируются.
* **Автоматизация**: Скрипт полностью подготовлен для добавления в планировщик задач cron для регулярного создания резервных копий по расписанию.

---

## 📂 Repository Structure / Структура репозитория

```text
├── 📂 ai-assistant/          # Autonomous AI chat frontend (served directly via Nginx)
├── 📂 ecommerce-analytics/   # Marketplace data ingestion & ETL transformation layer
├── 📄 nginx.conf             # Ingress port routing matrix & security policies
├── 📄 docker-compose.yml     # Multi-container orchestration manifest (Network isolated)
├── 📄 backup.sh              # Automated database hot-backup automation script
└── 📄 README.md              # Architectural documentation
```

---

## 🚀 Deployment / Развертывание

### English
1. Clone the repository and configure your environment variables based on `.env.example`.
2. Launch the fully isolated port-separated stack in detached mode:
```bash
docker compose up -d
```
3. Run manual backup test to verify database accessibility:
```bash
chmod +x backup.sh && ./backup.sh
```

### Русский
1. Клонируйте репозиторий и настройте переменные окружения на основе шаблона `.env.example`.
2. Запустите изолированный стек с разделением портов в фоновом режиме:
```bash
docker compose up -d
```
3. Проведите тестовое резервное копирование для проверки доступности СУБД:
```bash
chmod +x backup.sh && ./backup.sh
```
