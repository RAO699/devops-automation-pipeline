#!/bin/bash
# Жестко фиксируем рабочую директорию, чтобы Cron всегда находил .env
cd "$(dirname "$0")"

# Включаем режим strict-режима: скрипт упадет, если упадет любая команда в пайпе
set -o pipefail

if [ -f .env ]; then
    source .env
else
    echo "Ошибка: Файл .env не найден!" && exit 1
fi

mkdir -p ./backups

# Создаем бэкап с проверкой успешности
BACKUP_NAME="./backups/backup_$(date +%Y%m%d_%H%M%S).sql.gz"

if docker exec -t pipeline_postgres pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" | gzip > "$BACKUP_NAME"; then
    echo "Бэкап успешно создан: $BACKUP_NAME"
else
    echo "КРИТИЧЕСКАЯ ОШИБКА: Не удалось создать бэкап!"
    rm -f "$BACKUP_NAME" # Удаляем поврежденный файл
    exit 1
fi

# Ротация: удаляем старые бэкапы (старше 7 дней)
find ./backups -type f -mtime +7 -name "*.gz" -delete
