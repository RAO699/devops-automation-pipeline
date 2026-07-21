# 🏗️ Распределенная Low-Code Платформа B2B-Автоматизации (Multi-Tenant Infrastructure)

[English](#english-version) | [Русский](#русская-версия)

---

## English Version

### 📊 System Architecture Overview
This repository contains a high-performance, containerized multi-tenant infrastructure managed via a centralized Docker environment. The platform functions as a unified web-core and data-core engine designed to host, orchestrate, monitor, and scale independent business applications, including artificial intelligence tools and automated data processing modules.

### 🛠️ Shared Core Infrastructure
* **Process Orchestration (Low-Code Engine):** An n8n workflow server designed for rapid API deployment, strict CORS policy enforcement, and node-based visual data flow integration.
* **Reverse Proxy & SSL Gateway:** Nginx server configured with optimized upstream limits (`proxy_read_timeout 600s`) to ensure connection stability during prolonged Large Language Model (LLM) processing loops.
* **Database Management System:** A centralized PostgreSQL instance managing the `b2b_platform_core` relational database cluster. Implements isolated schema architecture and structured JSONB formatting for high-speed user session state tracking.
* **Analytics & Observability Platform:** Grafana operational monitoring suite connected via native SQL interfaces to provide enterprise KPI dashboards and conversion tracking metrics.

### 📂 Repository Directory Structure
* `📂 ai-assistant/` — Autonomous AI integration module containing the frontend communication interface, contextual memory tracking scripts, and Meta Llama 3.3 orchestration files.
* `📂 ecommerce-analytics/` — Automated data pipeline module designed for commercial market platform analysis and ETL data transformations.
* `📄 docker-compose.yml` — Central orchestration manifest executing the complete shared core ecosystem.

---

## Русская Версия

### 📊 Архитектура и Назначение Системы
Данный репозиторий содержит распределенную контейнеризированную B2B-платформу, функционирующую в едином изолированном Docker-контуре. Архитектура построена по принципу общего ядра (Shared Core), что позволяет развертывать, интегрировать и масштабировать независимые бизнес-приложения и сервисы автоматизации на базе единых вычислительных мощностей.

### 🛠️ Центральные Компоненты Инфраструктуры
* **Оркестрация процессов (Low-Code Движок):** Интегрированный сервер n8n, обеспечивающий автоматизацию межсервисного взаимодействия, централизованный контроль политик CORS и визуальное проектирование интеграционных маршрутов без необходимости написания низкоуровневого программного кода.
* **Проксирование и Безопасность (Nginx):** Отказоустойчивый реверс-прокси сервер с расширенными лимитами таймаутов, предотвращающими разрывы соединений при длительной генерации ответов большими языковыми моделями (LLM).
* **Система Управления Базами Данных:** СУБД PostgreSQL, обслуживающая центральный кластер `b2b_platform_core`. Изоляция данных бизнес-модулей реализована на уровне независимых таблиц с применением оптимизированных инвертированных индексов для высокоскоростной обработки бинарных логов сессий (JSONB).
* **Бизнес-Мониторинг и Аналитика:** Аналитическая платформа Grafana, подключенная к СУБД посредством нативных SQL-интерфейсов для визуализации ключевых показателей эффективности (KPI) и фиксации целевых действий пользователей.

### 🚀 Методология Масштабирования
Применение Low-Code архитектуры минимизирует временные затраты на вывод новых бизнес-решений на рынок (Time-to-Market). Подключение дополнительных изолированных модулей автоматизации осуществляется регламентированным путем инициализации целевых таблиц данных в PostgreSQL, импорта конфигурационных схем в n8n и внедрения унифицированного асинхронного JS-компонента в веб-интерфейсы.
