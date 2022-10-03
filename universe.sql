--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    mass_solar_masses numeric,
    galaxy_type_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    symbol character varying(10)
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    description text,
    mean_radius_km numeric,
    mass_kg numeric,
    volume_km3 numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(40) NOT NULL,
    mass_kg numeric,
    radius_km numeric,
    has_life boolean,
    number_of_moons integer,
    is_dwarf_planet boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(40) NOT NULL,
    mass_solar_masses numeric,
    luminosity_solar_luminosity numeric,
    temp_kelvin integer,
    radius_solar_radii numeric,
    in_milky_way boolean NOT NULL
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 1150000000000, 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 1500000000000, 2);
INSERT INTO public.galaxy VALUES (3, 'Maffei 1', NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (4, 'NeVe 1', NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (6, 'Hercules A', NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (7, 'Spindle Galaxy', NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (8, 'Cartwheel Galaxy', NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (9, 'NGC 2787', NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (10, 'IC 4710', NULL, NULL, 4);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (2, 'Spiral', 'Sprial galaxies consist of a flattened disk, with stars forming a (usually two-armed) spiral structure, and a central concentration of stars known as the bulge, which is similar in appearance to an elliptical galaxy. The are given the symbol "S". Roughly half of all spirals are also observed to have a bar-like structure, extending from the central buldge. These barred spirals are given the symbol "SB".', 'S');
INSERT INTO public.galaxy_type VALUES (1, 'Elliptical', 'Elliptical galaxies have smooth, featureless light distributions and appear as ellipses in images. They are denoted by the letter "E", followed by an integer n representing their degree of ellipticity on the sky. The specific ellipticity rating depends on ratio of the major (a) to minor axes (b), as E = 10 x (1 - (b/a)).', 'E');
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular', 'Lenticular galaxies (designated S0) also consist of a bright central bulge surrounded by an extended, disk-like structure but, unlike spiral galaxies, the disks of lenticular galaxies have no visible spiral structure and are not actively forming stars in any significant quantity.', 'S0');
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', 'An irregular galaxy is a galaxy that does not have a distinct regular shape, unlike a spiral or elliptical galaxy. Irregular galaxies do not fall into any of the regular classes of the Hubble sequence, and they are often chaotic in appearance, with neither an nuclear buge nor any trace of spiral arm structure.', 'Irr');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Europa', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Himalia', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Amalthea', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Thebe', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Elara', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Titan', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Dione', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Thethys', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Enceladus', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Mimas', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Phoebe', 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Titania', 7, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Oberon', 7, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Umbriel', 7, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Ariel', 7, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Miranda', 7, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Triton', 8, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Proteus', 8, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Nereid', 8, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Charon', 10, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Styx', 10, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 5972000000000000000000000, 6371, true, 1, false);
INSERT INTO public.planet VALUES (2, 1, 'Mercury', 330000000000000000000000, 2439.7, false, 0, false);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 4868000000000000000000000, 6051.8, false, 0, false);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 642000000000000000000000, 3389.5, false, 2, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 1898000000000000000000000000, 69911, false, 80, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 568340000000000000000000000, 58232, false, 83, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 86810000000000000000000000, 25362, false, 27, false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 102400000000000000000000000, 24622, false, 14, false);
INSERT INTO public.planet VALUES (9, 1, 'Ceres', 938350000000000000000, 469.74, false, 0, true);
INSERT INTO public.planet VALUES (10, 1, 'Pluto', 13030000000000000000000, 1188.3, false, 5, true);
INSERT INTO public.planet VALUES (11, 1, 'Eris', 16466000000000000000000, 1163, false, 1, true);
INSERT INTO public.planet VALUES (12, 1, 'Haumea', 4006000000000000000000, 780, false, 2, true);
INSERT INTO public.planet VALUES (13, 5, 'Proxima Centauri d', 1552772000000000000000000, 5166, false, NULL, false);
INSERT INTO public.planet VALUES (14, 5, 'Proxima Centauri b', 6390254000000000000000000, 8291, false, NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1, 1, 5772, 1, true);
INSERT INTO public.star VALUES (2, 1, 'Betelgeuse', 16.5, 126000, 3600, 764, true);
INSERT INTO public.star VALUES (3, 1, 'VY Canis Majoris', 17, 270000, 3490, 1420, true);
INSERT INTO public.star VALUES (4, 1, 'Mu Cephei', 19.2, 269000, 3551, 972, true);
INSERT INTO public.star VALUES (5, 1, 'Proxima Centauri', 0.1221, 0.0017, 3042, 0.1542, true);
INSERT INTO public.star VALUES (6, 1, 'Alpha Centauri A', 1.0788, 1.5059, 5790, 1.2175, true);
INSERT INTO public.star VALUES (7, 1, 'Alpha Centauri B', 0.9092, 0.4981, 5260, 0.8591, true);
INSERT INTO public.star VALUES (8, 1, 'AH Scorpii', 10, 330000, 3450, 1411, true);
INSERT INTO public.star VALUES (9, 1, 'UY Scuti', 7, 340000, 3365, 1708, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_unique UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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