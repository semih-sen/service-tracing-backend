--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: Employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Employees" (
    id integer NOT NULL,
    "serviceId" integer,
    name character varying(100),
    "dateOfUpload" date,
    "phoneNumber" character varying(10),
    mail character varying(100)
);


ALTER TABLE public."Employees" OWNER TO postgres;

--
-- Name: Employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Employees" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Employees_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Managers" (
    id integer NOT NULL,
    "schoolId" integer,
    name character varying,
    "phoneNumber" character varying(10),
    mail character varying
);


ALTER TABLE public."Managers" OWNER TO postgres;

--
-- Name: Managers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Managers" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Managers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Parents" (
    id integer NOT NULL,
    name character varying(150),
    "phoneNumber" character varying(10),
    mail character varying(150)
);


ALTER TABLE public."Parents" OWNER TO postgres;

--
-- Name: Parents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Parents" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Parents_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Schools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Schools" (
    id integer NOT NULL,
    name character varying,
    address character varying,
    "phoneNumber" character varying(10),
    mail character varying(150)
);


ALTER TABLE public."Schools" OWNER TO postgres;

--
-- Name: Schools_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Schools" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Schools_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Services" (
    id integer NOT NULL,
    name character varying(50),
    plate character varying(20),
    "dateOfUpload" date
);


ALTER TABLE public."Services" OWNER TO postgres;

--
-- Name: Services_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Services" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Services_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Students" (
    id integer NOT NULL,
    "parentId" integer,
    "schoolId" integer,
    "serviceId" integer,
    name character varying(150),
    number character varying(10),
    "className" character varying(15),
    address character varying(700),
    "orderNumber" integer
);


ALTER TABLE public."Students" OWNER TO postgres;

--
-- Name: Students_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Students" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Students_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(100),
    mail character varying(100),
    "phoneNumber" character varying(10),
    password character varying,
    role character varying(50)
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Users" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: Employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Employees" (id, "serviceId", name, "dateOfUpload", "phoneNumber", mail) FROM stdin;
2	5	Burak Muştu	2021-05-27	5519403036	burakmustu@outlook.com.tr
3	5	Kerem Arslan	2021-05-27	1234567890	kerem_arslan@domain.com.tr
\.


--
-- Data for Name: Managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Managers" (id, "schoolId", name, "phoneNumber", mail) FROM stdin;
1	1	Burak Muştu	5550552222	burak.mustu@gmail.com
\.


--
-- Data for Name: Parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Parents" (id, name, "phoneNumber", mail) FROM stdin;
1	Recep Arslan	5550005500	recep@recep.com
2	Ahmet Arslanoğlu	6660006600	ahmet@ahmet.com
3	Ferit Muştu	7770007700	ferit@ferit.com
\.


--
-- Data for Name: Schools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Schools" (id, name, address, "phoneNumber", mail) FROM stdin;
1	Bursa Anadolu Lisesi	Dikkaldırım	1234567890	bal@bal.com
3	EML	Karabağlar	2321111111	keml@keml.com
\.


--
-- Data for Name: Services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Services" (id, name, plate, "dateOfUpload") FROM stdin;
2	Kona	43 ABH 807	2021-05-25
3	Kona	43ABH807	2021-05-27
\.


--
-- Data for Name: Students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Students" (id, "parentId", "schoolId", "serviceId", name, number, "className", address, "orderNumber") FROM stdin;
6	3	1	1	Elif Muştu	50	1/A	Emin Efendi Cad. No:21 Simav/Kütahya	1
5	2	1	1	Yağız Arslanoğlu	23	4/A	Mavera Villaları I-2 Beylikdüzü/İstanbul	3
7	1	1	1	Beren Arslan	100	1/A	Prestij Hayat V-35 Demirtaş/Osmangazi/Bursa	4
4	3	1	1	Burak Muştu	21	4/C	Emin Efendi Cad. No:21 Simav/Kütahya	2
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, name, mail, "phoneNumber", password, role) FROM stdin;
1	Yağız Arslanoğlu	yagiz.arslanoglu@domain.com.tr	5550555555	911a929b0632184249bfccaa6005ebdcc8f1cdb62d7fbdfb4686d5070ddeba2d48909c0c0c3d466efee15b0e89d2d314034f51ed1de170dd80771f6c7e2e0af7	Manager
14	Kerem Arslan	kerem.arslan@gmail.com	5550555555	40fdbeac6419ed317988fbf7f4b48bf96595cf96f899430db83f6f5a456b07a7d81ae0c5e2a5fa0e251eb0368b301f634d9e61fb0eb088db85e8aba860024a23	Employee
15	Burak Muştu	burak.mustu@gmail.com	5550555555	40fdbeac6419ed317988fbf7f4b48bf96595cf96f899430db83f6f5a456b07a7d81ae0c5e2a5fa0e251eb0368b301f634d9e61fb0eb088db85e8aba860024a23	Manager
16	Yağız Arslanoğlu	kaymak@gmail.com	5550555555	40fdbeac6419ed317988fbf7f4b48bf96595cf96f899430db83f6f5a456b07a7d81ae0c5e2a5fa0e251eb0368b301f634d9e61fb0eb088db85e8aba860024a23	SuperAdmin
\.


--
-- Name: Employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Employees_id_seq"', 3, true);


--
-- Name: Managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Managers_id_seq"', 1, true);


--
-- Name: Parents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Parents_id_seq"', 3, true);


--
-- Name: Schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Schools_id_seq"', 3, true);


--
-- Name: Services_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Services_Id_seq"', 3, true);


--
-- Name: Students_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Students_Id_seq"', 7, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 16, true);


--
-- Name: Employees Employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_pkey" PRIMARY KEY (id);


--
-- Name: Managers Managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Managers"
    ADD CONSTRAINT "Managers_pkey" PRIMARY KEY (id);


--
-- Name: Parents Parents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parents"
    ADD CONSTRAINT "Parents_pkey" PRIMARY KEY (id);


--
-- Name: Schools Schools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Schools"
    ADD CONSTRAINT "Schools_pkey" PRIMARY KEY (id);


--
-- Name: Services Services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_pkey" PRIMARY KEY (id);


--
-- Name: Students Students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_mail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_mail_key" UNIQUE (mail);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

