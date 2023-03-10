CREATE TABLE `storage_group`
(
    `id`         int unsigned NOT NULL AUTO_INCREMENT,
    `storage_id` int unsigned NOT NULL,
    `group_id`   int unsigned NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `storage_id_group_id` (`storage_id`,`group_id`),
    KEY          `storage_id` (`storage_id`),
    KEY          `group_id` (`group_id`),
    CONSTRAINT `storage_group_ibfk_1` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
    CONSTRAINT `storage_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;