CREATE TABLE IF NOT EXISTS public."Comment"
(
    commnet_id serial NOT NULL ,
    video_id integer,
    short_id integer,
    user_id integer NOT NULL,
    likes integer,
    dislikes integer,
    comment_text text 
    CONSTRAINT "Comment_pkey" PRIMARY KEY (commnet_id)
);

CREATE TABLE IF NOT EXISTS public."User"
(
    user_id serial NOT NULL ,
    username character varying(255),
    email character varying(255) ,
    password character varying(255), 
    premium_id integer,
    creation_date date,
    subscribers integer,
    CONSTRAINT "User_pkey" PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public."Premium"
(
    premium_id serial NOT NULL ,
    enabled boolean NOT NULL,
    payment_date date,
    CONSTRAINT "Premium_pkey" PRIMARY KEY (premium_id)
);

CREATE TABLE IF NOT EXISTS public."Video"
(
    video_id serial NOT NULL ,
    description_id integer,
    user_id integer NOT NULL,
    video_name character varying(255),
    upload_date date,
    views integer,
    likes integer,
    CONSTRAINT "Video_pkey" PRIMARY KEY (video_id)
);

CREATE TABLE IF NOT EXISTS public."Description"
(
    description_id serial NOT NULL ,
    description_text text 
    CONSTRAINT "Description_pkey" PRIMARY KEY (description_id)
);

CREATE TABLE IF NOT EXISTS public."Short"
(
    short_id serial NOT NULL ,
    description_id integer,
    user_id integer,
    comment_id integer,
    short_name character varying(255) 
    short_upload_date date,
    views integer,
    likes integer,
    CONSTRAINT "Short_pkey" PRIMARY KEY (short_id)
);

CREATE TABLE IF NOT EXISTS public."View"
(
    view_id serial NOT NULL ,
    user_id integer,
    video_id integer,
    short_id integer,
    length integer,
    CONSTRAINT "View_pkey" PRIMARY KEY (view_id)
);

COMMENT ON COLUMN public."View".length
    IS 'time in seconds';

CREATE TABLE IF NOT EXISTS public."Playlist"
(
    playlist_id serial NOT NULL ,
    user_id integer,
    name character varying(255) 
    video_id integer,
    short_id integer,
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

ALTER TABLE IF EXISTS public."Comment"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."User" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;



ALTER TABLE IF EXISTS public."Comment"
    ADD CONSTRAINT video_id FOREIGN KEY (video_id)
    REFERENCES public."Video" (video_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;



ALTER TABLE IF EXISTS public."Comment"
    ADD FOREIGN KEY (short_id)
    REFERENCES public."Short" (short_id) MATCH SIMPLE
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
    ADD CONSTRAINT description_id FOREIGN KEY (description_id)
    REFERENCES public."Description" (description_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;



ALTER TABLE IF EXISTS public."Video"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."User" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;




ALTER TABLE IF EXISTS public."Short"
    ADD CONSTRAINT comment_id FOREIGN KEY (comment_id)
    REFERENCES public."Comment" (comment_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Short"
    ADD CONSTRAINT description_id FOREIGN KEY (description_id)
    REFERENCES public."Description" (description_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Short"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."User" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;




ALTER TABLE IF EXISTS public."View"
    ADD CONSTRAINT short_id FOREIGN KEY (short_id)
    REFERENCES public."Short" (short_id) MATCH SIMPLE
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


ALTER TABLE IF EXISTS public."Playlist"
    ADD FOREIGN KEY (short_id)
    REFERENCES public."Short" (short_id) MATCH SIMPLE
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

END;