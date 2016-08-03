DELIMITER $$

CREATE PROCEDURE update_old_golf_pages_permissions()
BEGIN
	DECLARE editor_group_id INTEGER;
	DECLARE viewer_group_id INTEGER;
	DECLARE page_id INTEGER;
   	DECLARE permission_id INTEGER DEFAULT 0;

	DECLARE done TINYINT DEFAULT 0;

	DECLARE pages_id_cursor CURSOR FOR 
		SELECT child_ib_page_id 
		FROM ib_page_tree 
		WHERE IB_PAGE_ID IN (
			SELECT child_IB_PAGE_ID 
			FROM ib_page_tree 
			WHERE ib_page_id = 1242
		) UNION 
		SELECT child_IB_PAGE_ID 
		FROM ib_page_tree 
		WHERE ib_page_id = 1242;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    SELECT IC_GROUP_ID INTO viewer_group_id FROM ic_group where NAME = 'content_author';
    SELECT IC_GROUP_ID INTO editor_group_id FROM ic_group where NAME = 'content_editor';
    SELECT MAX(IC_PERMISSION_ID) INTO permission_id FROM ic_permission;

	OPEN pages_id_cursor;

	insert_loop: LOOP
		FETCH pages_id_cursor INTO page_id;
		IF done THEN
			LEAVE insert_loop;
		END IF;

		SET permission_id = permission_id + 1;
		INSERT INTO `ic_permission` (`IC_PERMISSION_ID`, `PERMISSION_CONTEXT_TYPE`, `permission_context_value`, `PERMISSION_STRING`, `PERMISSION_VALUE`, `GROUP_ID`) VALUES (permission_id, 'page_id', page_id, 'view', 'Y', viewer_group_id);
		SET permission_id = permission_id + 1;
		INSERT INTO `ic_permission` (`IC_PERMISSION_ID`, `PERMISSION_CONTEXT_TYPE`, `permission_context_value`, `PERMISSION_STRING`, `PERMISSION_VALUE`, `GROUP_ID`) VALUES (permission_id, 'page_id', page_id, 'view', 'Y', editor_group_id);

	END LOOP;

	CLOSE pages_id_cursor;
END$$

DELIMITER ;