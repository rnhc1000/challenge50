
/**
 * SELECT GROUP_CONCAT(NUMBER SEPARATOR '&')
 * FROM (
 *     SELECT @number:=@number+1 as NUMBER FROM
 *     information_schema.tables t1,
 *     information_schema.tables t2,
 *     (SELECT @number:=1) tmp
 * ) TEMPNUMBER
 * WHERE NUMBER<=1000 AND NOT EXISTS(
 *         SELECT * FROM (
 *             SELECT @nu:=@nu+1 as NUMBERX FROM
 *                 information_schema.tables t1,
 *                 information_schema.tables t2,
 *                 (SELECT @nu:=1) tmp1
 *                 LIMIT 1000
 *             ) t
 *         WHERE FLOOR(NUMBER/NUMBERX)=(NUMBER/NUMBERX) AND NUMBERX<NUMBER AND NUMBERX>1
 *     )
 */