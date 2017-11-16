USE `railway`;
DROP procedure IF EXISTS `train_avail_procedure`;

DELIMITER $$
USE `railway`$$
CREATE PROCEDURE `train_avail_procedure` (IN scrId VARCHAR(10), IN destId VARCHAR(10), IN 	onDate Date)
BEGIN

SELECT *
FROM train as t 
INNER JOIN train_availability as ts ON t.train_id = ts.train_id
where t.scr_id=scrId and t.dest_id=destId and ts.ondate=onDate;

END$$

DELIMITER ;