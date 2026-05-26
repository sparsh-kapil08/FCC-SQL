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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth (
    name character varying(50),
    earth_id integer NOT NULL,
    id2 integer NOT NULL,
    id3 integer NOT NULL
);


ALTER TABLE public.earth OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer,
    distance integer,
    hydrogen numeric(10,2),
    altname text,
    radioactive boolean,
    alien boolean,
    id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer,
    distance integer,
    hydrogen numeric(10,2),
    altname text,
    radioactive boolean,
    alien boolean,
    planet_id integer,
    id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer,
    distance integer,
    hydrogen numeric(10,2),
    altname text,
    radioactive boolean,
    alien boolean,
    id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50) NOT NULL,
    size integer,
    distance integer,
    hydrogen numeric(10,2),
    altname text,
    radioactive boolean,
    alien boolean,
    star_id integer NOT NULL,
    galaxy_id integer,
    id3 integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth VALUES ('Halley', 482, 91, 603);
INSERT INTO public.earth VALUES ('Encke', 115, 342, 88);
INSERT INTO public.earth VALUES ('Hale-Bopp', 709, 55, 914);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'pluto', 45, 4, 4.20, 'plut', true, false, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 2537000, 71.50, 'M31', false, false, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 3000000, 75.10, 'M33', true, false, 3);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, 28000000, 68.30, 'M104', false, true, 4);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 76000, 23000000, 73.00, 'M51a', true, true, 5);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 60000, 11000000, 70.00, 'NGC 5128', false, false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'pluto', 45, 4, 4.20, 'plut', true, false, 1, NULL);
INSERT INTO public.moon VALUES (42, 'Luna', 3474, 384400, 0.00, 'The Moon', false, false, 2, 712);
INSERT INTO public.moon VALUES (43, 'Phobos', 22, 9377, 0.00, 'Mars I', true, false, 2, 45);
INSERT INTO public.moon VALUES (44, 'Deimos', 12, 23460, 0.00, 'Mars II', false, false, 2, 839);
INSERT INTO public.moon VALUES (45, 'Io', 3643, 421700, 12.50, 'Jupiter I', true, false, 3, 102);
INSERT INTO public.moon VALUES (46, 'Europa', 3121, 670900, 85.00, 'Jupiter II', false, true, 3, 554);
INSERT INTO public.moon VALUES (47, 'Ganymede', 5268, 1070400, 45.10, 'Jupiter III', false, false, 3, 23);
INSERT INTO public.moon VALUES (48, 'Callisto', 4821, 1882700, 10.20, 'Jupiter IV', false, false, 3, 918);
INSERT INTO public.moon VALUES (49, 'Titan', 5149, 1221870, 95.30, 'Saturn VI', false, true, 4, 611);
INSERT INTO public.moon VALUES (50, 'Rhea', 1527, 527108, 0.50, 'Saturn V', false, false, 4, 37);
INSERT INTO public.moon VALUES (51, 'Lapetus', 1468, 3560820, 0.00, 'Saturn VIII', true, false, 5, 442);
INSERT INTO public.moon VALUES (52, 'Dione', 1122, 377396, 0.00, 'Saturn IV', false, false, 5, 88);
INSERT INTO public.moon VALUES (53, 'Tethys', 1062, 294619, 0.00, 'Saturn III', false, false, 6, 701);
INSERT INTO public.moon VALUES (54, 'Enceladus', 504, 237948, 99.00, 'Saturn II', false, true, 6, 19);
INSERT INTO public.moon VALUES (55, 'Mimas', 396, 185539, 0.00, 'Saturn I', false, false, 6, 315);
INSERT INTO public.moon VALUES (56, 'Miranda', 471, 129390, 0.00, 'Uranus V', false, false, 6, 93);
INSERT INTO public.moon VALUES (57, 'Ariel', 1157, 191020, 15.00, 'Uranus I', false, false, 6, 520);
INSERT INTO public.moon VALUES (58, 'Umbriel', 1169, 265970, 0.00, 'Uranus II', false, false, 6, 144);
INSERT INTO public.moon VALUES (59, 'Titania', 1577, 435910, 5.50, 'Uranus III', false, false, 6, 802);
INSERT INTO public.moon VALUES (60, 'Oberon', 1522, 583520, 2.10, 'Uranus IV', false, false, 6, 61);
INSERT INTO public.moon VALUES (61, 'Triton', 2706, 354759, 70.00, 'Neptune I', true, true, 6, 277);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'pluto', 45, 4, 4.20, 'plut', true, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'Sirius b1', 12000, 150, 70.50, 'Alpha Sirius', false, false, 342, 2);
INSERT INTO public.planet VALUES (3, 'Sirius b2', 8000, 280, 45.00, 'Beta Sirius', true, false, 89, 2);
INSERT INTO public.planet VALUES (4, 'Kepler-452b', 20000, 1400, 12.30, 'Earth 2.0', false, true, 501, 3);
INSERT INTO public.planet VALUES (5, 'Kepler-452c', 15000, 2100, 0.00, 'Super Earth', false, false, 12, 3);
INSERT INTO public.planet VALUES (6, 'Vega Prime', 45000, 90, 88.10, 'Vega 1', true, true, 765, 4);
INSERT INTO public.planet VALUES (7, 'Vega Secundus', 32000, 180, 65.00, 'Vega 2', false, false, 43, 4);
INSERT INTO public.planet VALUES (8, 'Vega Tertius', 11000, 310, 5.20, 'Vega 3', false, false, 911, 4);
INSERT INTO public.planet VALUES (9, 'Arrakis', 13000, 450, 0.00, 'Dune', false, true, 204, 5);
INSERT INTO public.planet VALUES (10, 'Caladan', 12500, 520, 90.00, 'Ocean World', false, false, 57, 5);
INSERT INTO public.planet VALUES (11, 'Proxima b', 7500, 4, 33.40, 'Closest Exoplanet', false, true, 831, 6);
INSERT INTO public.planet VALUES (12, 'Proxima c', 22000, 7, 15.00, 'Super Neptune', true, false, 118, 6);
INSERT INTO public.planet VALUES (13, 'Proxima d', 4000, 2, 0.00, 'Sub-Earth', false, false, 66, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('pluto', 45, 4, 4.20, 'plut', true, false, 1, 1, NULL);
INSERT INTO public.star VALUES ('Sirius', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL);
INSERT INTO public.star VALUES ('Kepler-452', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, NULL);
INSERT INTO public.star VALUES ('Vega', NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, NULL);
INSERT INTO public.star VALUES ('Betelgeuse', NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL);
INSERT INTO public.star VALUES ('Proxima Centauri', NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 61, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: earth earth_id3_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_id3_key UNIQUE (id3);


--
-- Name: earth earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_pkey PRIMARY KEY (earth_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id3_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id3_key UNIQUE (id3);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

