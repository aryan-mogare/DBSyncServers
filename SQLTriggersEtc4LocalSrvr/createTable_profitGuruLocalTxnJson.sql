--
-- Table structure for table `profitGuruLocalTxnJson`
--

CREATE TABLE `profitGuruLocalTxnJson` (
  `local_txn_id` int(11) NOT NULL AUTO_INCREMENT,
  `local_txn_json` varchar(700) NOT NULL,
  `local_txn_table` varchar(255) NOT NULL,
  `local_txn_action` varchar(255) NOT NULL,
  `local_txn_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`local_txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  ;
