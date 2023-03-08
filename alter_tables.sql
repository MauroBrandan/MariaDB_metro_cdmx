USE metro_cdmx;

ALTER TABLE `stations`
MODIFY COLUMN `updated_at`
    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE `lines`
MODIFY COLUMN `updated_at`
	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE `trains`
MODIFY COLUMN `updated_at`
	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;