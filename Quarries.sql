SELECT c.comment_text, u.username, v.video_name
FROM public."Comment" c
JOIN public."User" u ON c.user_id = u.user_id
JOIN public."Video" v ON c.video_id = v.video_id;

SELECT u.username
FROM public."User" u
LEFT JOIN public."Comment" c ON u.user_id = c.user_id
WHERE c.commnet_id IS NULL;

SELECT *
FROM public."Comment"
WHERE comment_text LIKE '%important%';

SELECT u.username
FROM public."User" u
WHERE u.user_id = ALL (
    SELECT c.user_id
    FROM public."Comment" c
    JOIN public."Video" v ON c.video_id = v.video_id
);

SELECT c.comment_text, u.username, v.video_name
FROM public."Comment" c
JOIN public."User" u ON c.user_id = u.user_id
JOIN public."Video" v ON c.video_id = v.video_id;

SELECT *
FROM public."User"
JOIN public."Comment" USING (user_id);

SELECT *
FROM public."User"
CROSS JOIN public."Video";

SELECT u.username, v.video_name
FROM public."User" u
CROSS JOIN public."Video" v;

SELECT *
FROM public."User" u
LEFT JOIN public."Comment" c ON u.user_id = c.user_id;

SELECT *
FROM table1
FULL OUTER JOIN table2 ON table1.column = table2.column;

SELECT *
FROM public."User" u
WHERE EXISTS (
    SELECT 1
    FROM public."Comment" c
    WHERE c.user_id = u.user_id
);
