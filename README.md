# Universal Low-Code B2B AI Platform Infrastructure
> **Универсальная Low-Code Архитектура B2B-Платформ с Интеграцией ИИ**

---

## 🌍 English Description

### Overview
This repository contains a modular, high-performance, and secure infrastructure blueprint designed for deploying B2B automation ecosystems. Built on a Shared Core philosophy, the architecture minimizes computational overhead by hosting multi-tenant AI capabilities, analytical frameworks, and automated operational workflows within a centralized, containerized environment. It is engineered specifically for fast-paced MVP verification and immediate market entry (Time-to-Market optimization) without preliminary infrastructure investments.

### Key Architectural Principles
* **Low-Code Core**: Workflow design, API composition, and CORS policies are orchestrated visually via n8n, eliminating the need for complex, monolithic backend architectures.
* **Network Isolation**: Strict dual-contour network design separates edge ingestion points from sensitive persistent layers.
* **LLM Integration**: Built-in compatibility with enterprise-grade large language models (Meta Llama 3.3 70B via Groq API) featuring persistent contextual session memory.
* **Efficient Storage Strategy**: PostgreSQL utilizing `JSONB` formats to seamlessly blend strict relational logic with dynamic, schema-less operational logs.
* **Fault Tolerance & Data Safety**: Automated lifecycle logging limits disk consumption while an autonomous hot-backup subsystem guarantees data persistence.

---

## 🇷🇺 Описание на русском языке

### Обзор системы
Данный репозиторий представляет собой модульную, высокопроизводительную и защищенную инфраструктурную модель, разработанную для развертывания B2B-экосистем автоматизации. Построенная на принципах общего ядра (Shared Core), архитектура минимизирует вычислительные издержки, объединяя многопользовательские функции искусственного интеллекта, аналитики данных и операционных сценариев в изолированном контейнерном контуре. Решение оптимизировано для оперативной проверки гипотез (MVP) и минимизации времени выхода продукта на рынок (Time-to-Market) без предварительных вложений в инфраструктуру.

### Ключевые архитектурные принципы
* **Low-Code Ядро**: Визуальное проектирование сценариев, оркестрация API и управление политиками CORS выполняются внутри среды n8n, исключая необходимость разработки сложного монолитного бэкенда.
* **Сетевая изоляция**: Строгая двухконтурная топология сети изолирует внешние точки приема трафика от критически важных слоев хранения данных.
* **Интеграция с LLM**: Нативная поддержка языковых моделей корпоративного класса (Meta Llama 3.3 70B через Groq API) с долгосрочным контекстным сохранением истории сессий.
* **Эффективное хранение**: Использование СУБД PostgreSQL с форматами данных `JSONB` для бесшовного сочетания строгой реляционной логики и динамических неструктурированных операционных логов.
* **Отказоустойчивость и безопасность**: Автоматическое ограничение жизненного цикла логов предотвращает переполнение дискового пространства, а автономная подсистема горячего резервного копирования гарантирует сохранность данных.

---

## 📐 Interaction Map / Схема взаимодействия компонентов

```text
===================================================================================================
                                      B2B PLATFORM ARCHITECTURE
===================================================================================================

 [ ВНЕШНИЙ МИР / PUBLIC INTERNET ]
        │
        │ HTTPS (Трафик клиентов / Туннель Ngrok / Порты: 443, 3000)
        ▼
 ┌───────────────────────────────────────────────────────────────────────────────────────────────┐
 │ 🔒 public_net (ВНЕШНИЙ КОНТУР / DMZ ZONE)                                                     │
 │                                                                                               │
 │   ┌───────────────────────────────────────────────────────────────────────────────────────┐   │
 │   │                             🛡️ NGINX REVERSE PROXY                                    │   │
 │   │   - Единственная точка входа в систему наружу                                         │   │
 │   │   - Таймаут ожидания увеличен до 600 секунд (оптимизация под генерацию ответов LLM)   │   │
 │   └───────────────────────────────────────────┬───────────────────────────────────────────┘   │
 └───────────────────────────────────────────────┼───────────────────────────────────────────┘
                                                 │
                                                 │ Внутреннее безопасное проксирование
                                                 ▼
 ┌───────────────────────────────────────────────────────────────────────────────────────────────┐
 │ 🛡️ private_net (ИЗОЛИРОВАННЫЙ ВНУТРЕННИЙ БУНКЕР)                                              │
 │                                                                                               │
 │   ┌───────────────────────────────────┐               ┌───────────────────────────────────┐   │
 │   │      ⚙️ n8n AUTOMATION ENGINE     │               │        📊 GRAFANA ANALYTICS       │   │
 │   │   - Визуальное Low-Code ядро     │               │   - Операционные KPI-дашборды     │   │
 │   │   - Интеграция с Llama 3.3 (Groq) │               │   - Визуализация метрик бизнеса   │   │
 │   └─────────────────┬─────────────────┘               └─────────────────┬─────────────────┘   │
 │                     │                                                   │                     │
 │                     │ Запись чатов (JSONB)                              │ SQL-запросы метрик  │
 │                     └─────────────────────────┬─────────────────────────┘                     │
 │                                               ▼                                               │
 │   ┌───────────────────────────────────────────────────────────────────────────────────────┐   │
 │   │                              🗄️ POSTGRESQL 15 DATABASE                                │   │
 │   │   - Главное хранилище (Полностью изолировано, внешние порты закрыты)                  │   │
 │   │   - Хранение истории сессий ИИ-ассистента и аналитики Wildberries                     │   │
 │   └───────────────────────────────────────────▲───────────────────────────────────────────┘   │
 │                                               │                                               │
 └───────────────────────────────────────────────┼───────────────────────────────────────────────┘
                                                 │
                                                 │ Локальный "горячий" бэкап данных
                                                 │
                                 ┌───────────────┴───────────────┐
                                 │       💾 backup.sh SCRIPT     │
                                 │  Автономное резервное копирование  │
                                 └───────────────────────────────┘
```

---

## 🔒 Network Topology & Security / Сетевая топология и безопасность

### English
To guarantee enterprise-grade data protection, the infrastructure introduces automated dual-contour network segmentation utilizing Docker Bridge drivers:
1. **`public_net` (Public Perimeter)**: Contains exclusively the `Nginx` reverse proxy. It serves as the single point of entry, handles SSL termination, and features optimized execution limits (`proxy_read_timeout 600s`) explicitly tailored for prolonged LLM response generation windows.
2. **`private_net` (Isolated Vault)**: Encloses `n8n`, `PostgreSQL`, and `Grafana`. The DBMS (`PostgreSQL`) is physically stripped of any external network mappings and does not expose its native `5432` port to the internet. Inter-container data exchange occurs entirely at the Docker daemon kernel level.

### Русский
Для обеспечения безопасности корпоративных данных в инфраструктуре реализовано автоматическое сегментирование сети на базе двух изолированных контуров Docker Bridge:
1. **`public_net` (Внешний периметр)**: Включает в себя исключительно реверс-прокси `Nginx`. Служит единой точкой входа, обеспечивает инкапсуляцию трафика и содержит расширенные таймауты (`proxy_read_timeout 600s`), настроенные под специфику длительной генерации ответов нейросетями.
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
