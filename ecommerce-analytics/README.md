# Enterprise DevOps Pipeline: AI Market Agent & Analytics Platform

[English Version](#english-version) | [Русская Версия](#русская-версия)

---

## English Version

A high-yield, production-ready B2B platform designed for e-commerce marketplaces (Wildberries, Ozon). The system automatically fetches customer feedback, routes data to an Advanced AI Agent powered by Meta's 70B Llama 3.3 model to generate contextual, brand-safe, and SEO-optimized public replies, logs records into a secure PostgreSQL time-series storage, and visualizes business metrics in Grafana.

### 🏗️ Infrastructure & Data Architecture

The architecture runs inside an isolated virtual network (`app_network`). External access to technical databases and services is restricted. Nginx stands as a secure reverse proxy with end-to-end TLS encryption.

```text
                  [ Client Browser ]
                           │
             ┌─────────────┴─────────────┐
             │                           │
  (HTTPS Port 443)               (HTTPS Port 3000)
             ▼                           ▼
      ┌───────────── Directory ./certs ─────────────┐
      │              Nginx Container                │
      └──────────────┬───────────┬──────────────────┘
                     │           │
                     ▼           ▼
             ┌───────────┐   ┌───────────┐
             │    n8n    │   │  Grafana  │
             └─────┬─────┘   └─────┬─────┘
                   │               │
      (Groq API) ◄─┤               ├─► (Analytics Queries)
   (Llama 3.3 70B) │               │
                   ▼               ▼
             ┌───────────────────────────┐
             │    PostgreSQL 15 DB       │
             └───────────────────────────┘
```

### ⚡ Technical Highlights (Production-Ready)
1. **Advanced AI Integration (Groq & Llama 3.3):** Leverages direct high-speed HTTP streaming to process bulk user messages, avoiding token/WebSocket drops.
2. **Strict CSRF & CORS Security:** Patched Nginx routing with upstream `proxy_set_header Origin` mapping to prevent WebSocket detachment errors (`Origin header does not match`).
3. **Resource Isolation (Tuning):** Defined rigid Docker resource boundaries (`cpus: '1.50'`, `memory: 1G`) ensuring service isolation and host safety from OOM spikes.
4. **Automated Logs Rotation:** Integrated global `json-file` configurations limiting server disk consumption.

### 🚀 Setup Guide
```bash
git clone https://github.com
cd devops-automation-pipeline
cp .env.example .env && nano .env
mkdir certs && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./certs/live.key -out ./certs/live.crt -subj "/CN=localhost"
docker compose up -d
```
* **n8n Panel (AI Logic):** `https://<SERVER_IP>` (Import `workflow.json`)
* **Grafana Dashboard:** `https://<SERVER_IP>:3000` (`admin` / `admin`)

---

## Русская Версия

Высокодоходная, готовая к эксплуатации B2B SaaS-платформа для автоматизации и бизнес-аналитики маркетплейсов (Wildberries, Ozon). Конвейер автоматически собирает отзывы клиентов, передает их продвинутому ИИ-Агенту на базе 70-миллиардной модели Meta Llama 3.3 для генерации контекстных ответов, сохраняет логи в защищенную СУБД PostgreSQL и выводит сочную аналитику репутации бренда на интерактивный дашборд Grafana.

### ⚡ Технические Оптимизации (Уровень Продакшена)
1. **Интеграция Продвинутого ИИ (Llama 3.3 70B via Groq):** Прямые оптимизированные HTTP-запросы обеспечивают обработку отзывов за доли секунды без зависаний NodeJS-потока.
2. **Исправление Заголовков Безопасности:** В конфигурации Nginx настроена сквозная подмена заголовков `Origin` и `X-Forwarded-Host`. Это полностью решает проблему вебсокетов в n8n (`Origin header does NOT match`), предотвращая дисконнекты панели.
3. **Выделение Ресурсов и Таймауты:** Контейнер n8n расширен до `1.50` ядер CPU. В Nginx прописаны расширенные таймауты ожидания ответов от нейросети (`proxy_read_timeout 600s`), что гарантирует стабильность конвейера.
4. **Ротация Логов и Изоляция данных:** Хранилище Postgres изолировано внутри Docker Bridge сети, а ротация файлов (`max-size: 10m`) защищает сервер от переполнения диска.

### 🔗 Структура Репозитория
* `docker-compose.yml` / `nginx.conf` — Архитектурный каркас продакшена.
* `workflow.json` — Готовый ИИ-воркфлоу для импорта в панель n8n.
* `init.sql` — Схема инициализации таблиц базы данных PostgreSQL.
* `backup.sh` — Скрипт автоматического резервного копирования базы по расписанию Cron.
