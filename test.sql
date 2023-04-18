--本來要寫社區二代試寫的sql檔--

SELECT Bill.id '客戶編號'
    , Bill.name AS '客戶姓名'
    , GROUP_CONCAT(distinct m.m_name SEPARATOR ',') AS '機車'
    , GROUP_CONCAT(distinct c.c_name SEPARATOR ',') AS '汽車'
    , GROUP_CONCAT(distinct h.h_name SEPARATOR ',') AS '房子'
    , COUNT(distinct m.m_id) AS '機車數'
    , COUNT(distinct c.c_id) AS '汽車數'
    , COUNT(distinct h.h_id) AS '戶數'
    , GROUP_CONCAT(distinct pm.p_money SEPARATOR ',') AS '機車清潔費'
    , GROUP_CONCAT(distinct pc.p_money SEPARATOR ',') AS '汽車清潔費'
    , GROUP_CONCAT(distinct ph.p_money SEPARATOR ',') AS '房屋管理費'
    FROM Bill, moto m, car c, house h,pay pm, pay pc, pay ph
    where m.b_id=Bill.id
    AND c.b_id=Bill.id
    AND h.b_id=Bill.id
    AND pm.p_id=m.p_id
    AND pc.p_id=c.p_id
    AND ph.p_id=h.p_id
    GROUP BY Bill.id
    ,Bill.name

-- 備份資料庫的內容 --


CREATE TABLE IF NOT EXISTS `Bill` (
  `id` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mp_id` int DEFAULT NULL,
  `cp_id` int DEFAULT NULL,
  `hp_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
INSERT INTO `Bill` (`id`, `name`, `mp_id`, `cp_id`, `hp_id`) VALUES
	(1, 'Bill', 1, 2, 3),
	(2, 'Peter', 1, 2, 3),
	(3, 'Merry', 1, 2, 3);
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `car` (
  `c_id` int DEFAULT NULL,
  `c_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `b_id` int DEFAULT NULL,
  `p_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` (`c_id`, `c_name`, `b_id`, `p_id`) VALUES
	(1, 'A01', 2, 1),
	(2, 'A02', 1, 1),
	(3, 'A03', 3, 1),
	(4, 'A04', 1, 1);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `house` (
  `h_id` int DEFAULT NULL,
  `h_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `b_id` int DEFAULT NULL,
  `p_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` (`h_id`, `h_name`, `b_id`, `p_id`) VALUES
	(1, '30號', 1, 3),
	(2, '31號', 3, 3),
	(3, '32號', 2, 3),
	(4, '34號', 3, 3);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pay` (
  `p_id` int DEFAULT NULL,
  `p_money` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` (`p_id`, `p_money`) VALUES
	(1, 500),
	(2, 200),
	(3, 2500),
	(4, 300);
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;


