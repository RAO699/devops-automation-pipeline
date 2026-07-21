# 📊 Модуль сквозной аналитики и сбора данных маркетплейса Wildberries

[English](#english-version) | [Русская Версия](#русская-версия)

---

## English Version

### 🎯 Module Purpose
This sub-module functions as an automated ETL (Extract, Transform, Load) data pipeline specifically engineered for monitoring financial performance, tracking product dynamic positions, and analyzing sales metrics on the Wildberries e-commerce marketplace. 

### ⚙️ Technical Component Architecture
* **Data Ingestion Interface (`html/`):** A client-facing analytical dashboard written in vanilla web technologies, serving as the frontend reporting view for marketplace store managers.
* **Orchestration Workflow (`workflow.json`):** An integration blueprint for the n8n core server, executing scheduled cron-jobs to request supplier API endpoints, parse heavy JSON payloads, and transform raw financial indicators.
* **Relational Database Schema (`init.sql`):** Dedicated structured tables hosted within the central PostgreSQL instance, optimized for time-series marketplace log tracking and order velocity calculations.

### 💾 Data Source Backup Configuration
* `demo-20250901-3m.sql.gz` — Compressed binary database snapshot containing historical three-month production records of transactional data and product positioning arrays used for forecasting model validation.

---

## Русская Версия

### 🎯 Назначение Модуля
Данный изолированный программный модуль функционирует в качестве автоматизированного ETL-конвейера данных (Extract, Transform, Load). Модуль разработан для сквозного финансового мониторинга, отслеживания позиций номенклатуры в поисковой выдаче и комплексного анализа операционных показателей торговых аккаунтов на электронной торговой площадке Wildberries.

### ⚙️ Компоненты и Структура Модуля
* **Интерфейс Визуализации (`html/`):** Пользовательский аналитический кабинет поставщика, отображающий обработанные метрики продаж, маржинальности и остатков на складах.
* **Сценарий Автоматизации (`workflow.json`):** Конфигурационная схема для сервера n8n, реализующая цикличный опрос API маркетплейса по расписанию (Cron), валидацию ответов и декомпозицию массивов данных.
* **Структура Данных (`init.sql`):** Инициализационный SQL-скрипт, разворачивающий целевые таблицы в СУБД PostgreSQL, оптимизированные под хранение транзакционных логов и расчет скорости оборачиваемости товаров.

### 💾 Резервное Копирование Данных
* `demo-20250901-3m.sql.gz` — Локальный сжатый дамп базы данных, содержащий верифицированный трехмесячный массив исторических операционных данных, используемый для тестирования аналитических алгоритмов и построения предиктивных моделей.
