CREATE TABLE IF NOT EXISTS public."Comment"
(
    comment_id serial NOT NULL,
    video_id integer,
    user_id integer NOT NULL,
    likes integer,
    dislikes integer,
    comment_text text,
    CONSTRAINT "Comment_pkey" PRIMARY KEY (comment_id)
);

CREATE TABLE IF NOT EXISTS public."User"
(
    user_id serial NOT NULL ,
    username character varying(255),
    email character varying(255) ,
    password character varying(255), 
    premium_id integer,
    notification_id integer,
    creation_date date,
    subscribers integer,
    CONSTRAINT "User_pkey" PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public."Premium"
(
    premium_id serial NOT NULL ,
    enabled boolean NOT NULL,
    payment_date date,
    starting_date date,
    end_date date,
    CONSTRAINT "Premium_pkey" PRIMARY KEY (premium_id)
);

CREATE TABLE IF NOT EXISTS public."Video"
(
    video_id serial NOT NULL ,
    user_id integer NOT NULL,
    video_name character varying(255),
    upload_date date,
    views integer,
    likes integer,
    video_type character varying(10),
    description text,
    CONSTRAINT "Video_pkey" PRIMARY KEY (video_id)
);

CREATE TABLE IF NOT EXISTS public."View"
(
    view_id serial NOT NULL ,
    user_id integer,
    video_id integer,
    length integer,
    CONSTRAINT "View_pkey" PRIMARY KEY (view_id)
);


CREATE TABLE IF NOT EXISTS public."Playlist"
(
    playlist_id serial NOT NULL ,
    user_id integer,
    name character varying(255),
    video_id integer,
    CONSTRAINT "Playlist_pkey" PRIMARY KEY (playlist_id)
);


CREATE TABLE IF NOT EXISTS public."Subscription "
(
    subscription_id serial NOT NULL ,
    subscriber_id integer,
    subscribed_id integer,
    subscription_date date,
    CONSTRAINT "Subscription _pkey" PRIMARY KEY (subscription_id)
);

CREATE TABLE IF NOT EXISTS public."Notification"
(
    notification_id serial NOT NULL ,
    notification_type character varying(255),
    notification_content character varying(255),
    CONSTRAINT "Notification _pkey" PRIMARY KEY (notification_id)
);


CREATE TABLE IF NOT EXISTS public."Playlist_video"
(
    playlist_id integer Not NULL,
    video_id integer not NULL,
    date_added date
)   

Alter table if EXISTS public."Playlist_video"
    add CONSTRAINT video_id foreign key (video_id)
    REFERENCES public."Video" (video_id) MATCH SIMPLE
    ON update no ACTION
    on DELETE no ACTION
    not valid;


Alter table if EXISTS public."Playlist_video"
    add CONSTRAINT playlist_id foreign key (playlist_id)
    REFERENCES public."Playlist" (playlist_id) MATCH SIMPLE
    ON update no ACTION
    on DELETE no ACTION
    not valid;


ALTER TABLE IF EXISTS public."Comment"
    ADD CONSTRAINT video_id FOREIGN KEY (video_id)
    REFERENCES public."Video" (video_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


--not workin
ALTER TABLE IF EXISTS public."User"
    ADD CONSTRAINT notification_id FOREIGN KEY (notification_id)
    REFERENCES public."Notification" (notification_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."User"
    ADD CONSTRAINT premium_id FOREIGN KEY (premium_id)
    REFERENCES public."Premium" (premium_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;



ALTER TABLE IF EXISTS public."Video"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."User" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;



ALTER TABLE IF EXISTS public."View"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."User" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."View"
    ADD CONSTRAINT video_id FOREIGN KEY (video_id)
    REFERENCES public."Video" (video_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Playlist"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."User" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Playlist"
    ADD CONSTRAINT video_id FOREIGN KEY (video_id)
    REFERENCES public."Video" (video_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;




ALTER TABLE IF EXISTS public."Subscription "
    ADD CONSTRAINT subscribed_id FOREIGN KEY (subscribed_id)
    REFERENCES public."User" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Subscription "
    ADD CONSTRAINT subscriber_id FOREIGN KEY (subscriber_id)
    REFERENCES public."User" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
