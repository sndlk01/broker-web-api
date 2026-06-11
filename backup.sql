--
-- PostgreSQL database dump
--

\restrict pxVmYAUaclgTnABbg3XBSVTNU5AX7XG4EQESOxtdXNNjaZLgbEcEai69WbOAMIG

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.4 (Debian 18.4-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: brokerType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."brokerType" AS ENUM (
    'cfd',
    'bond',
    'stock',
    'crypto'
);


ALTER TYPE public."brokerType" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: brokers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brokers (
    id integer NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    description text NOT NULL,
    logo_url text NOT NULL,
    website text NOT NULL,
    broker_type public."brokerType" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.brokers OWNER TO postgres;

--
-- Name: brokers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brokers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brokers_id_seq OWNER TO postgres;

--
-- Name: brokers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brokers_id_seq OWNED BY public.brokers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    full_name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: brokers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers ALTER COLUMN id SET DEFAULT nextval('public.brokers_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
6c460f41-70df-4459-b5d4-e647b21b4380	b85a13ff4c8fe451f72e2d138f6bda97ca91f9f0044fede2ab55553e04825dfb	2026-06-10 13:45:32.428364+00	20260610134532_init	\N	\N	2026-06-10 13:45:32.418477+00	1
\.


--
-- Data for Name: brokers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brokers (id, name, slug, description, logo_url, website, broker_type, "createdAt", "updatedAt") FROM stdin;
1	FXCM	fxcm	Global forex and CFD broker founded in 1999.	https://www.fxcm.com/favicon.ico	https://www.fxcm.com	cfd	2026-06-11 06:33:45.979	2026-06-11 06:33:45.979
2	IG	ig	Leading CFD broker with access to thousands of markets.	https://www.ig.com/favicon.ico	https://www.ig.com	cfd	2026-06-11 06:33:53.199	2026-06-11 06:33:53.199
3	Capital.com	capital-com	Online trading platform offering CFDs across global markets.	https://capital.com/favicon.ico	https://capital.com	cfd	2026-06-11 06:34:00.201	2026-06-11 06:34:00.201
4	Pepperstone	pepperstone	Global forex broker offering CFD trading across multiple asset classes.	https://pepperstone.com/favicon.ico	https://pepperstone.com	cfd	2026-06-11 06:34:09.984	2026-06-11 06:34:09.984
5	Plus500	plus500	Online CFD broker for forex, shares, commodities, indices, ETFs and options.	https://www.plus500.com/favicon.ico	https://www.plus500.com	cfd	2026-06-11 06:34:33.798	2026-06-11 06:34:33.798
6	IG Markets	ig-markets	CFD trading provider with access to global markets and trading platforms.	https://www.ig.com/favicon.ico	https://www.ig.com	cfd	2026-06-11 06:34:42.301	2026-06-11 06:34:42.301
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, full_name, email, password, "createdAt", "updatedAt", "deletedAt") FROM stdin;
d625c196-47c9-41b3-9332-a3e4701543f5	test user	test@gmail.com	$2b$10$k3R0wZzaJTKjt32PTUsubuko0tscqkMM9MKAJjTA0OS4K2g6491be	2026-06-11 06:31:31.941	2026-06-11 06:31:31.941	\N
\.


--
-- Name: brokers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brokers_id_seq', 6, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: brokers brokers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers
    ADD CONSTRAINT brokers_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: brokers_slug_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX brokers_slug_key ON public.brokers USING btree (slug);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- PostgreSQL database dump complete
--

\unrestrict pxVmYAUaclgTnABbg3XBSVTNU5AX7XG4EQESOxtdXNNjaZLgbEcEai69WbOAMIG

