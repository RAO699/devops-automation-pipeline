# 🚀 Universal Low-Code B2B Platform Infrastructure

[English](#english-version) | [Русская Версия](#русская-версия)

---

## English Version

### 📊 System Architecture Overview
This repository contains a high-performance, containerized multi-tenant infrastructure managed via a centralized Docker environment. The platform functions as a unified web-core and data-core engine designed to host, orchestrate, monitor, and scale independent business applications, including artificial intelligence tools and automated data processing modules.

### 🌐 Infrastructure & System Interaction Map
The following topology illustrates network traffic routing, reverse-proxy forwarding, and database storage segregation across the unified containerized environment:

```text
[ Global Internet Clients ]            [ Local Developer Space ]
            │                                      │
     (Ngrok Tunnel)                        (Python Web Server)
    (HTTPS Port 443)                        (HTTP Port 8080)
            │                                      │
            ▼                                      ▼
    [ Public Webhook ]                    [ File index.html ]
            │                                      │
            └──────────────────┬───────────────────┘
                               │
                               ▼
        ┌──────────────────────────────────────────────┐
        │        Nginx Container (Reverse Proxy)       │
        │ ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── │
        │  SSL: Encryption Gate (Directory ./certs)    │
        │  Limits: proxy_read_timeout 600s             │
        └──────────────┬───────────────┬───────────────┘
                       │               │
            (Port 443) │               │ (Port 3000)
                       ▼               ▼
        ┌──────────────────────┐┌──────────────────────┐
        │    n8n Container     ││  Grafana Container   │
        │ ──────────────────── ││ ──────────────────── │
        │   Low-Code Engine    ││  Operational Metric  │
        │   Orchestration Core ││   KPI Dashboards     │
        └──────────┬───────────┘└──────────┬───────────┘
                   │                       │
     (Groq API) ◄──┤                       │ (SQL Queries)
  (Llama 3.3 70B)  │                       │
                   ▼                       ▼
        ┌──────────────────────────────────────────────┐
        │         PostgreSQL 15 Cluster Container      │
        │ ──────────────────────────────────────────── │
        │          Database: b2b_platform_core         │
        │                                              │
        │  📂 [Schema: Module 1]                       │
        │  Table: ai_chat_history (JSONB Context)      │
        │                                              │
        │  📂 [Schema: Module 2]                       │
        │  Table: wb_orders_velocity (ETL Logs)        │
        └──────────────────────────────────────────────┘
```

### 🛠️ Shared Core Components
* **Process Orchestration (Low-Code Engine):** An n8n workflow server designed for rapid API deployment, strict CORS policy enforcement, and node-based visual data flow integration without massive backend code generation.
* **Reverse Proxy & SSL Gateway:** Nginx server configured with optimized upstream limits (`proxy_read_timeout 600s`) to ensure connection stability during prolonged Large Language Model (LLM) processing loops.
* **Database Management System:** A centralized PostgreSQL 15 instance managing the `b2b_platform_core` relational database cluster. Implements isolated schema architecture and structured JSONB formatting for high-speed user session state tracking.
* **Analytics & Observability Platform:** Grafana operational monitoring suite connected via native SQL interfaces to provide enterprise KPI dashboards and conversion tracking metrics.

### 📂 Repository Directory Structure
* `📂 ai-assistant/` — Autonomous AI integration module containing the frontend communication interface, contextual memory tracking scripts, and Meta Llama 3.3 orchestration files.
* `📂 ecommerce-analytics/` — Automated data pipeline module designed for commercial market platform analysis and ETL data transformations.
* `📄 docker-compose.yml` — Central orchestration manifest executing the complete shared core ecosystem.

---

## Русская Версия

### 📊 Архитектура и Назначение Системы
Данный репозиторий содержит распределенную контейнеризированную B2B-платформу, функционирующую в едином изолированном Docker-контуре. Архитектура построена по принципу общего ядра (Shared Core), что позволяет развертывать, интегрировать и масштабировать независимые бизнес-приложения и сервисы автоматизации на базе единых вычислительных мощностей.

### 🌐 Схема Архитектуры и Системного Взаимодействия
Ниже представлена топология распределения сетевого трафика, логика проксирования запросов и структура хранения данных в рамках единого контура платформы:

```text
[ Global Internet Clients ]            [ Local Developer Space ]
            │                                      │
     (Ngrok Tunnel)                        (Python Web Server)
    (HTTPS Port 443)                        (HTTP Port 8080)
            │                                      │
            ▼                                      ▼
    [ Public Webhook ]                    [ File index.html ]
            │                                      │
            └──────────────────┬───────────────────┘
                               │
                               ▼
        ┌──────────────────────────────────────────────┐
        │        Nginx Container (Reverse Proxy)       │
        │ ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── │
        │  SSL: Encryption Gate (Directory ./certs)    │
        │  Limits: proxy_read_timeout 600s             │
        └──────────────┬───────────────┬───────────────┘
                       │               │
            (Port 443) │               │ (Port 3000)
                       ▼               ▼
        ┌──────────────────────┐┌──────────────────────┐
        │    n8n Container     ││  Grafana Container   │
        │ ──────────────────── ││ ──────────────────── │
        │   Low-Code Engine    ││  Operational Metric  │
        │   Orchestration Core ││   KPI Dashboards     │
        └──────────┬───────────┘└──────────┬───────────┘
                   │                       │
     (Groq API) ◄──┤                       │ (SQL Queries)
  (Llama 3.3 70B)  │                       │
                   ▼                       ▼
        ┌──────────────────────────────────────────────┐
        │         PostgreSQL 15 Cluster Container      │
        │ ──────────────────────────────────────────── │
        │          Database: b2b_platform_core         │
        │                                              │
        │  📂 [Schema: Module 1]                       │
        │  Table: ai_chat_history (JSONB Context)      │
        │                                              │
        │  📂 [Schema: Module 2]                       │
        │  Table: wb_orders_velocity (ETL Logs)        │
        └──────────────────────────────────────────────┘
```

### 🛠️ Центральные Компоненты Инфраструктуры
* **Оркестрация процессов (Low-Code Движок):** Интегрированный сервер n8n, обеспечивающий автоматизацию межсервисного взаимодействия, централизованный контроль политик CORS и визуальное проектирование интеграционных маршрутов без необходимости написания низкоуровневого программного кода.
* **Проксирование и Безопасность (Nginx):** Отказоустойчивый реверс-прокси сервер с расширенными лимитами таймаутов (`proxy_read_timeout 600s`), предотвращающими разрывы соединений при длительной генерации ответов большими языковыми моделями (LLM).
* **Система Управления Базами Данных:** СУБД PostgreSQL 15, обслуживающая центральный кластер `b2b_platform_core`. Изоляция данных бизнес-модулей реализована на уровне независимых таблиц с применением оптимизированных инвертированных индексов для высокоскоростной обработки бинарных логов сессий (JSONB).
* **Бизнес-Мониторинг и Аналитика:** Аналитическая платформа Grafana, подключенная к СУБД посредством нативных SQL-интерфейсов для визуализации ключевых показателей эффективности (KPI) и фиксации целевых действий пользователей.

### 🚀 Методология Масштабирования
Применение Low-Code архитектуры минимизирует временные затраты на вывод новых бизнес-решений на рынок (Time-to-Market). Подключение дополнительных изолированных модулей автоматизации осуществляется регламентированным путем инициализации целевых таблиц данных в PostgreSQL, импорта конфигурационных схем в n8n и внедрения унифицированного асинхронного JS-компонента в веб-интерфейсы.
