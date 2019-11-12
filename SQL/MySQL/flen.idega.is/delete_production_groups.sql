DELETE FROM ic_group_relation 
WHERE related_group_type 
LIKE '%org%';

DELETE FROM ic_login_rec WHERE ic_login_id IN (
	SELECT ic_login_id 
	FROM ic_login 
	WHERE ic_user_id IN ( 
		SELECT ic_user_id 
		FROM ic_user 
		WHERE primary_group IN ( 
			SELECT ic_group_id 
			FROM ic_group 
			WHERE '2019-02-08:00:00:01' < created 
			AND created < '2019-02-08:23:59:59' 
		)
	)
);

DELETE FROM ic_login 
WHERE ic_user_id IN ( 
	SELECT ic_user_id 
	FROM ic_user 
	WHERE primary_group IN ( 
		SELECT ic_group_id 
		FROM ic_group 
		WHERE '2019-02-08:00:00:01' < created 
		AND created < '2019-02-08:23:59:59' 
	)
);

DELETE FROM comm_case 
WHERE handler IN (
	SELECT ic_user_id 
	FROM ic_user 
	WHERE primary_group IN (
		SELECT ic_group_id 
		FROM ic_group 
		WHERE '2019-02-08:00:00:01' < created 
		AND created < '2019-02-08:23:59:59'
	)
);

DELETE FROM proc_case_log
WHERE PERFORMER_USER_ID IN ( 
	SELECT ic_user_id 
	FROM ic_user 
	WHERE primary_group IN ( 
		SELECT ic_group_id 
		FROM ic_group 
		WHERE '2019-02-08:00:00:01' < created 
		AND created < '2019-02-08:23:59:59' 
	) 
);

DELETE FROM fam_family_member
WHERE ic_user_id IN ( 
	SELECT ic_user_id 
	FROM ic_user 
	WHERE primary_group IN ( 
		SELECT ic_group_id 
		FROM ic_group 
		WHERE '2019-02-08:00:00:01' < created 
		AND created < '2019-02-08:23:59:59' 
	) 
);

DELETE FROM ic_user_phone
WHERE ic_user_id IN ( 
	SELECT ic_user_id 
	FROM ic_user 
	WHERE primary_group IN ( 
		SELECT ic_group_id 
		FROM ic_group 
		WHERE '2019-02-08:00:00:01' < created 
		AND created < '2019-02-08:23:59:59' 
	) 
);

DELETE FROM ic_user_email 
WHERE ic_user_id IN ( 
	SELECT ic_user_id 
	FROM ic_user 
	WHERE primary_group IN ( 
		SELECT ic_group_id 
		FROM ic_group 
		WHERE '2019-02-08:00:00:01' < created 
		AND created < '2019-02-08:23:59:59' 
	) 
);

DELETE FROM ic_user_address 
WHERE ic_user_id IN ( 
	SELECT ic_user_id 
	FROM ic_user 
	WHERE primary_group IN ( 
		SELECT ic_group_id 
		FROM ic_group 
		WHERE '2019-02-08:00:00:01' < created 
		AND created < '2019-02-08:23:59:59' 
	) 
);

DELETE FROM ic_user 
WHERE primary_group IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM EGOV_APPLICATION_ACCESS 
WHERE ic_group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM ic_company
WHERE IC_COMPANY_ID IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM ic_permission
WHERE group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM ic_group_domain_relation 
WHERE related_ic_group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM ic_group_relation 
WHERE related_ic_group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM ic_group_relation 
WHERE ic_group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM ic_group_ic_metadata 
WHERE ic_group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM ic_group_tree 
WHERE ic_group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59'
) OR child_ic_group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59' 
);

DELETE FROM ic_group_email
WHERE ic_group_id IN ( 
	SELECT ic_group_id 
	FROM ic_group 
	WHERE '2019-02-08:00:00:01' < created 
	AND created < '2019-02-08:23:59:59'
);

DELETE FROM ic_group 
WHERE '2019-02-08:00:00:01' < created 
AND created < '2019-02-08:23:59:59';
