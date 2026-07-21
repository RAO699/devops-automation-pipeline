# 🤖 B2B AI Assistant Widget & Postgres Core

[English](#english-version) | [Русская Версия](#русская-версия)

---

## English Version

An enterprise-grade, ultra-lightweight B2B AI Assistant Widget designed for seamless embedding into any commercial website or CMS. The frontend communicates directly with the n8n orchestration core via secure production webhooks, processes customer requests using Meta's Llama 3.3 model, and logs complete chat histories into PostgreSQL.

### 🛠 Core Stack & Integration
* **Frontend:** Vanilla HTML5 / CSS3 / Modern JS (Fetch API with dynamic session isolation via custom UUIDv4).
* **LLM Engine:** Llama 3.3 70B (via Groq API) with deep business-context prompting.
* **Database & Memory:** PostgreSQL (Optimized JSONB schema with custom inverted indexes for high-speed session tracking).
* **Analytics Platform:** Grafana Dashboard visualizing total unique dialogues, message distribution, and active user metrics.

### 📦 Web Widget Integration Code
To embed this assistant into any website, insert the following non-blocking lightweight script right before the closing `</body>` tag:
```html
<script>
  // Dynamic script deployment for high-load optimization
  document.addEventListener('DOMContentLoaded', () => {
    const sessionId = 'session_' + Math.random().toString(36).substr(2, 9);
    // Secure Production Webhook Tunnel
    const webhookUrl = 'https://YOUR_DOMAIN_OR_NGROK/webhook/1c57232e-74f2-406a-b283-f0cf209383a9/chat';
    
    // ... custom widget initialization logic ...
  });
</script>
```

---

## Русская Версия

Высокопроизводительный, легковесный B2B виджет ИИ-консультанта, разработанный для бесшовной интеграции в любые коммерческие веб-сайты и CRM-системы. Фронтенд-модуль взаимодействует напрямую с ядром оркестрации n8n через боевые вебхуки, обрабатывает запросы клиентов на базе модели Meta Llama 3.3 и сохраняет полную историю диалогов в отказоустойчивую базу данных PostgreSQL.

### ⚡ Технические Особенности
* **Zero-Dependency Фронтенд:** Чистый HTML5/CSS3/JS без тяжелых внешних библиотек и CDN, обеспечивающий мгновенную загрузку виджета за 0.01 сек.
* **Контроль CORS-Политики:** Полная совместимость с жесткими политиками безопасности современных браузеров при работе на реальных хостингах.
* **JSONB Память Контекста:** Использование СУБД Postgres для хранения бинарных логов переписки, что позволяет ИИ помнить контекст разговора на протяжении всей сессии пользователя.

### 📁 Структура Модуля
* `index.html` — Оптимизированный адаптивный интерфейс чата с кастомной анимацией кнопки.
* `README.md` — Техническое руководство разработчика.
