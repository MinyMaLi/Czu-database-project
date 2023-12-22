-- Get's comments made on videos
SELECT c.comment_text, u.username, v.video_name
FROM public."Comment" c
JOIN public."User" u ON c.user_id = u.user_id
JOIN public."Video" v ON c.video_id = v.video_id;

--Users who have not commented on anything
SELECT u.username
FROM public."User" u
LEFT JOIN public."Comment" c ON u.user_id = c.user_id
WHERE c.commnet_id IS NULL;

--Gets video with "random" in it's name
SELECT *
FROM public."Video"
WHERE video_name LIKE '%Random%';

--Videos that ware viewed by every user
SELECT v.*
FROM public."Video" v
WHERE v.video_id = ALL (
    SELECT v2.video_id
    FROM public."User" u
    JOIN public."View" v2 ON u.user_id = v2.user_id
    WHERE v2.video_id = v.video_id
);

-- Gets Comment with the user who made it and also the video it was made on
SELECT c.comment_text, u.username, v.video_name
FROM public."Comment" c
JOIN public."User" u ON c.user_id = u.user_id
JOIN public."Video" v ON c.video_id = v.video_id;

-- Gets all the comments with the user data 
SELECT *
FROM public."User"
JOIN public."Comment" USING (user_id);

-- Gets the comments based on users who made them
SELECT *
FROM public."User" u
RIGHT JOIN public."Comment" c ON u.user_id = c.user_id;

--List of videos uploaded by a specific user
SELECT v.*, u.username
FROM public."Video" v
JOIN public."User" u ON v.user_id = u.user_id
WHERE v.user_id = 3;

--Comments on a specific Video
SELECT c.*, u.username
FROM public."Comment" c
JOIN public."User" u ON c.user_id = u.user_id
WHERE c.video_id = 5;

--
