# 📊 E-Commerce Marketplace Analytics & ETL Pipeline Module

[English](#english-version) | [Русская Версия](#русская-версия)

---

## English Version

### 🎯 Module Purpose
This sub-module functions as an automated ETL (Extract, Transform, Load) data pipeline specifically engineered for monitoring financial performance, tracking product dynamic positions, and analyzing sales metrics across global e-commerce marketplaces.

### 🛠 Tech Stack
* **Orchestration:** n8n Workflow Automation
* **Database:** PostgreSQL (Time-series optimization)
* **Frontend:** Vanilla HTML5 / CSS3 / Modern JavaScript (ES6+)
* **Data Format:** JSON API Payloads, SQL Dumps

### ⚙️ Technical Component Architecture
* **Data Ingestion Interface (`html/`):** A lightweight, client-facing analytical dashboard written in vanilla web technologies. It serves as the frontend reporting view for store managers and stakeholders.
* **Orchestration Workflow (`workflow.json`):** An integration blueprint for the n8n core server. It executes scheduled cron-jobs to request supplier API endpoints, validates response tokens, parses heavy JSON payloads, and transforms raw financial indicators.
* **Relational Database Schema (`init.sql`):** Dedicated structured tables hosted within the central PostgreSQL instance, optimized for time-series marketplace log tracking, stock balancing, and order velocity calculations.


### 🚀 Quick Start & Deployment
1. **Database Setup:** Import `init.sql` into your PostgreSQL instance.
2. **Workflow Import:** Import `workflow.json` into your n8n instance and configure your marketplace API credentials.
3. **Frontend Deployment:** Serve the `html/` directory using any lightweight web server (e.g., Nginx or Live Server).

---

## Русская Версия

### 🎯 Назначение Модуля
Данный изолированный программный модуль функционирует в качестве автоматизированного ETL-конвейера данных (Extract, Transform, Load). Модуль разработан для сквозного финансового мониторинга, отслеживания позиций номенклатуры в поисковой выдаче и комплексного анализа операционных показателей торговых аккаунтов на электронных торговых площадках (маркетплейсах).

### 🛠 Технологический Стек
* **Оркестрация:** n8n Workflow Automation
* **База данных:** PostgreSQL (оптимизация под временные ряды)
* **Фронтенд:** Vanilla HTML5 / CSS3 / Modern JavaScript (ES6+)
* **Формат данных:** JSON API Payloads, SQL Dumps

### ⚙️ Компоненты и Структура Модуля
* **Интерфейс Визуализации (`html/`):** Легковесный пользовательский аналитический кабинет поставщика, написанный на чистых веб-технологиях. Отображает обработанные метрики продаж, маржинальности и остатков на складах.
* **Сценарий Автоматизации (`workflow.json`):** Конфигурационная схема для сервера n8n, реализующая цикличный опрос API маркетплейсов по расписанию (Cron), валидацию токенов, декомпозицию тяжелых массивов JSON и расчет финансовых показателей.
* **Структура Данных (`init.sql`):** Инициализационный SQL-скрипт, разворачивающий целевые таблицы в СУБД PostgreSQL, оптимизированные под хранение транзакционных логов, учет товарных остатков и расчет скорости оборачиваемости.


### 🚀 Быстрый Запуск и Развертывание
1. **Инициализация БД:** Импортируйте файл `init.sql` в вашу СУБД PostgreSQL.
2. **Настройка n8n:** Импортируйте `workflow.json` в интерфейс n8n и укажите ваши ключи доступа (API Credentials) от маркетплейса.
3. **Запуск Интерфейса:** Разверните директорию `html/` на любом веб-сервере (например, Nginx или Live Server).
