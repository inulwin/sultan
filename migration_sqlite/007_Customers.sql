CREATE TABLE customers (
	`id` INTEGER PRIMARY KEY,
    `created_at` DATETIME DEFAULT (datetime('now', 'localtime')),
    `updated_at` DATETIME DEFAULT (datetime('now', 'localtime')),
    `deleted_at` DATETIME NULL,
    `number` VARCHAR(64) NOT NULL,
    `name` VARCHAR(64) NOT NULL DEFAULT '',
    `address` VARCHAR(255) NOT NULL DEFAULT '',
    `phone` VARCHAR(64) NOT NULL DEFAULT '',
    `reward` INT NOT NULL DEFAULT 0,
    `credit` DECIMAL(15, 2) NOT NULL DEFAULT 0
);
-- separator
CREATE TABLE customer_points (
	`id` INTEGER PRIMARY KEY,
    `created_at` DATETIME DEFAULT (datetime('now', 'localtime')),
    `updated_at` DATETIME DEFAULT (datetime('now', 'localtime')),
    `deleted_at` DATETIME NULL,
    `number` VARCHAR(64) NOT NULL,
    `customer_id` INT NOT NULL,
    `link_id` INT NOT NULL DEFAULT 0,
    `detail` VARCHAR(255) NOT NULL DEFAULT '',
    `reward` INT NOT NULL DEFAULT 0, 
    `total_shop` DECIMAL(15, 2) NOT NULL DEFAULT 0
);
-- separator
CREATE TABLE customer_credits (
    `id` INTEGER PRIMARY KEY,
    `created_at` DATETIME DEFAULT (datetime('now', 'localtime')),
    `updated_at` DATETIME DEFAULT (datetime('now', 'localtime')),
    `deleted_at` DATETIME NULL,
    `customer_id` INT NOT NULL,
    `number` VARCHAR(64) NOT NULL,
    `link_id` INT NOT NULL DEFAULT 0,
    `detail` VARCHAR(255) NOT NULL DEFAULT '',
    `credit` DECIMAL(15, 2) NOT NULL DEFAULT 0
)
-- separator
ALTER TABLE solds ADD COLUMN customer_id INT NOT NULL DEFAULT 0;
-- separator
CREATE UNIQUE INDEX CUSTOMER_NUMBER ON customers (number);
-- separator
CREATE INDEX CUSTOMER_POINT_CUSTOMER_ID ON customer_points (customer_id);
-- separator
CREATE INDEX CUSTOMER_CREDIT_CUSTOMER_ID ON customer_credits (customer_id);