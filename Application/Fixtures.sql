

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.tweets DISABLE TRIGGER ALL;

INSERT INTO public.tweets (id, title, body) VALUES ('3822d194-b86f-4d59-ac85-96e55c6747b2', '', '');
INSERT INTO public.tweets (id, title, body) VALUES ('d8e1fdfe-28e8-4d3c-ba66-a0649ab3bf32', '', '');
INSERT INTO public.tweets (id, title, body) VALUES ('6bf52ddf-a802-44ad-93ab-ec4b40a8c974', '', '');


ALTER TABLE public.tweets ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('3aa5be6d-9828-422d-8cca-32498941be97', 'other@test.com', 'test1234', NULL, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('9cd91064-c849-415f-86a6-309ea662ac85', 'test@test.com', 'test1234', NULL, 3);


ALTER TABLE public.users ENABLE TRIGGER ALL;


