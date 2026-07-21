-- Таблица продуктов
CREATE TABLE IF NOT EXISTS marketplace_products (
    id SERIAL PRIMARY KEY,
    marketplace VARCHAR(20) NOT NULL,
    nm_id VARCHAR(50) NOT NULL UNIQUE,
    product_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица отзывов и ответов ИИ
CREATE TABLE IF NOT EXISTS marketplace_reviews (
    id SERIAL PRIMARY KEY,
    review_id VARCHAR(100) NOT NULL UNIQUE,
    nm_id VARCHAR(50) NOT NULL REFERENCES marketplace_products(nm_id),
    rating INT NOT NULL,
    review_text TEXT,
    review_created_at TIMESTAMP NOT NULL,
    ai_status VARCHAR(20) DEFAULT 'pending',
    ai_response_text TEXT,
    processed_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_reviews_rating_time ON marketplace_reviews (review_created_at, rating);
