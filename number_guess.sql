--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE game;
--
-- Name: game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE game OWNER TO freecodecamp;

\connect game

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    games_played integer,
    best_game integer,
    username character varying(22)
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (NULL, NULL, 'Lajawab');
INSERT INTO public.game VALUES (NULL, NULL, 'user_1780312408665');
INSERT INTO public.game VALUES (NULL, NULL, 'user_1780312408664');
INSERT INTO public.game VALUES (NULL, NULL, 'user_1780313002766');
INSERT INTO public.game VALUES (NULL, NULL, 'user_1780313002765');
INSERT INTO public.game VALUES (NULL, NULL, 'user_1780313248510');
INSERT INTO public.game VALUES (NULL, NULL, 'user_1780313248509');
INSERT INTO public.game VALUES (NULL, NULL, 'user_1780313311822');
INSERT INTO public.game VALUES (NULL, NULL, 'user_1780313311821');
INSERT INTO public.game VALUES (3, NULL, 'w');
INSERT INTO public.game VALUES (NULL, NULL, '1');
INSERT INTO public.game VALUES (409, NULL, 'user_1780313623899');
INSERT INTO public.game VALUES (5, NULL, 'user_1780313623900');
INSERT INTO public.game VALUES (995, NULL, 'user_1780313659142');
INSERT INTO public.game VALUES (997, NULL, 'user_1780313659143');
INSERT INTO public.game VALUES (2, 370, 'user_1780313732738');
INSERT INTO public.game VALUES (5, 383, 'user_1780313732739');
INSERT INTO public.game VALUES (2, 237, 'user_1780313747477');
INSERT INTO public.game VALUES (5, 173, 'user_1780313747478');


--
-- Name: game game_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

