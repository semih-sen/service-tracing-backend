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
-- Name: Companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Companies" (
    id integer NOT NULL,
    "schoolId" integer,
    "companyName" character varying(300),
    "managerName" character varying(250),
    "phoneNumber" character varying(10),
    mail character varying(300),
    address character varying(700),
    "serviceCount" integer
);


ALTER TABLE public."Companies" OWNER TO postgres;

--
-- Name: Companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Companies" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Companies_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Employees" (
    id integer NOT NULL,
    "serviceId" integer,
    "companyId" integer,
    "schoolId" integer,
    name character varying(250),
    "phoneNumber" character varying(10),
    mail character varying(300)
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
    mail character varying(150),
    address character varying(700),
    note character varying(700)
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
    "schoolId" integer,
    "companyId" integer,
    name character varying(100),
    plate character varying(30)
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
    "orderNumber" integer,
    "orderNumber2" integer,
    "phoneNumber" character varying(10),
    note character varying(700)
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
-- Name: Transportations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transportations" (
    id integer NOT NULL,
    "studentId" integer,
    "serviceId" integer,
    "employeeId" integer,
    type character varying(50),
    datetime timestamp(2) without time zone,
    "isOutOfAddress" boolean
);


ALTER TABLE public."Transportations" OWNER TO postgres;

--
-- Name: Transportations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Transportations" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Transportations_id_seq"
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
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    "parentId" integer,
    "studentId" integer,
    title character varying(100),
    content character varying(500)
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: rollcalls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rollcalls (
    id integer NOT NULL,
    studentid integer,
    serviceid integer,
    employeeid integer,
    status character varying(100),
    datetime timestamp(2) without time zone,
    type character varying(50)
);


ALTER TABLE public.rollcalls OWNER TO postgres;

--
-- Name: rollcalls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rollcalls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rollcalls_id_seq OWNER TO postgres;

--
-- Name: rollcalls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rollcalls_id_seq OWNED BY public.rollcalls.id;


--
-- Name: rollcallsview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.rollcallsview AS
 SELECT rollcalls.id,
    "Students".id AS "studentId",
    "Students"."schoolId",
    "Students".name AS "studentName",
    "Services".name AS "serviceName",
    "Employees".name AS "employeeName",
    "Parents".id AS "parentId",
    rollcalls.status,
    rollcalls.datetime
   FROM ((((public.rollcalls
     LEFT JOIN public."Students" ON ((rollcalls.studentid = "Students".id)))
     LEFT JOIN public."Services" ON ((rollcalls.serviceid = "Services".id)))
     LEFT JOIN public."Employees" ON ((rollcalls.employeeid = "Employees".id)))
     LEFT JOIN public."Parents" ON (("Students"."parentId" = "Parents".id)));


ALTER TABLE public.rollcallsview OWNER TO postgres;

--
-- Name: studentsView; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."studentsView" AS
 SELECT "Students".id,
    "Students"."parentId",
    "Students"."serviceId",
    "Students"."schoolId",
    "Parents".name AS "parentName",
    "Services".name AS "serviceName",
    "Parents"."phoneNumber" AS "pPhoneNumber",
    "Parents".mail AS "pMail",
    "Parents".address AS "pAddress",
    "Students".name,
    "Students".number,
    "Students"."className",
    "Students".address,
    "Students"."phoneNumber",
    "Students".note
   FROM ((public."Students"
     JOIN public."Parents" ON (("Students"."parentId" = "Parents".id)))
     JOIN public."Services" ON (("Students"."serviceId" = "Services".id)))
  ORDER BY "Students".id;


ALTER TABLE public."studentsView" OWNER TO postgres;

--
-- Name: transportationview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.transportationview AS
 SELECT tr.id,
    "Students".id AS "studentId",
    "Students"."schoolId",
    "Students".name AS "studentName",
    "Services".name AS "serviceName",
    "Employees".name AS "employeeName",
    "Parents".id AS "parentId",
    tr.datetime,
    tr."isOutOfAddress"
   FROM ((((public."Transportations" tr
     LEFT JOIN public."Students" ON ((tr."studentId" = "Students".id)))
     LEFT JOIN public."Services" ON ((tr."serviceId" = "Services".id)))
     LEFT JOIN public."Employees" ON ((tr."employeeId" = "Employees".id)))
     LEFT JOIN public."Parents" ON (("Students"."parentId" = "Parents".id)));


ALTER TABLE public.transportationview OWNER TO postgres;

--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: rollcalls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rollcalls ALTER COLUMN id SET DEFAULT nextval('public.rollcalls_id_seq'::regclass);


--
-- Data for Name: Companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Companies" (id, "schoolId", "companyName", "managerName", "phoneNumber", mail, address, "serviceCount") FROM stdin;
36	2	Onur Taşımacılık	Mert Onur	1111111111	mert.onur@onur.com	Simav	\N
37	2	Muştu Nakliye	Ferit Muştu	1231231231	ferit.mustu@gmail.com	Simav	\N
1	4	Hyundai	a	sds	fdfd	fdf	12
32	4	Peugeot	\N	\N	\N	\N	\N
33	4	aaaaa		aaaaa	aaaaa	aaaaa	\N
34	4	Eğitim Kırtasiye	Arif Pala	123	132	Simav	\N
35	4	SELKOP	Mehmet	123	123	123	\N
2	4	Volkswagen	Kerem Zengin	123	dgdsgdgd	Prolar Diyarı	\N
38	2	Arslan Nakliye	RECEP ARSLAN	1212	bla@bla.com	Simav	\N
\.


--
-- Data for Name: Employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Employees" (id, "serviceId", "companyId", "schoolId", name, "phoneNumber", mail) FROM stdin;
13	27	36	2	Burak Muştu	1231231231	barak.mata@gmail.com
14	28	37	2	Mehmet Korkmaz	1231231231	mehmet@korkmaz.com
4	4	1	4	Remzi	123	123
5	4	1	4	Remzi	123	123
6	4	1	4	İbrahim	123	123
7	4	1	4	İbrahim Aydeniz	123	132
8	4	1	4	bla	bla	bla
9	4	1	4	aa	aa	aa
10	4	1	4	aa	aa	aa
3	5	1	4	ismail Şen	\N	ismail@gmail.com
11	4	2	4	aa	aa	aa
2	2	34	4	Kerem Arslan	bbbbb	kerem@kerem.com
12	26	32	4	Ali Kamil	123	123
15	9	1	4	Kerem	12	afasd
\.


--
-- Data for Name: Managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Managers" (id, "schoolId", name, "phoneNumber", mail) FROM stdin;
2	2	Güniz Şen	5510566754	guniz@gmail.com
3	1	Yağız Arslanoğlu	\N	\N
1	4	Burak Muştu	5550552222	burak.mustu@gmail.com
\.


--
-- Data for Name: Parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Parents" (id, name, "phoneNumber", mail, address, note) FROM stdin;
44	Burak Muştu	5519403036	burak.mustu@outlook.com.tr	Aynısı	
24	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
25	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
26	kAMİKG	JB	NJFJ	Aynı	
27	veli	BVJS	NSV	Aynı	NJBV
28	Kaymak	123	k@a.com	Aynı	gfgf
29	Kaymak	123	k@a.com	Aynı	gfgf
30	Kaymak	123	k@a.com	Aynı	gfgf
31	Kaymak	123	k@a.com	Aynı	gfgf
32	Kaymak	123	k@a.com	Aynı	gfgf
33	Kaymak	123	k@a.com	Aynı	gfgf
34	Kaymak	123	k@a.com	Aynı	gfgf
1	Recep Arslan	5550005500	recep@recep.com	Aynı	\N
2	Ahmet Arslanoğlu	6660006600	ahmet@ahmet.com	Aynı	\N
3	Ferit Muştu	7770007700	ferit@ferit.com	Aynı	\N
4	Selin Onur	8880008080	selin@selin.com	Aynı	\N
14	Ali Yener	1111111112	ali@ali.com	Aynı	BLABLABLA
15	Kemal Korkmaz	7777777777	kemal@kemal.com	Aynı	blablabla
16	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
17	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
18	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
19	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
20	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
21	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
22	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
23	bjfnhbjk	bjbj	BJBJJB	Aynı	BDJBJ
35	VELİ GÖÇER	GDG	GD	Aynı	GD
36	fd	fd	fd	Aynı	df
37	hf	hfd	hfd	Aynı	fhd
38	jk	kj	jk	Aynı	kj
39	CEngiz	gf	gf	Aynı	gf
40	Ali Cengiz	hg	hg	Aynı	hg
41	Cengiz Kocabaş			Aynı	
42	Cengiz Kocabaş			Aynı	
43	Veli Göçer	123	123	Aynı	123
\.


--
-- Data for Name: Schools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Schools" (id, name, address, "phoneNumber", mail) FROM stdin;
1	Bursa Anadolu Lisesi	Dikkaldırım	1234567890	bal@bal.com
3	EML	Karabağlar	2321111111	keml@keml.com
4	Mustafa Çağlar Özel Eğitim Uygulama Okulu	Demirataş	1231231231	ccmtal@ccmtal.com
\.


--
-- Data for Name: Services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Services" (id, "schoolId", "companyId", name, plate) FROM stdin;
2	4	1	1 Nolu Minibüs	45 AAC 000
5	4	32	3 Nolu Servis	16 ALY 555
9	4	1	4 Nolu Servis	43 ABH 952
26	4	1	5 Nolu Servis	45 AAC 279
27	4	36	1 Nolu Servis	43 KB 454
28	4	36	2 Nolu Servis	34 ABH 952
29	4	36	3 Nolu Servis	34 AAA 111
30	4	34	Pro Televizyonlu Gri Mercedes Servis	43 PRO 111
31	2	38	1 Nolu Servis	43 AAC 279
4	4	2	2 Nolu Minibüs	43 KB 454
\.


--
-- Data for Name: Students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Students" (id, "parentId", "schoolId", "serviceId", name, number, "className", address, "orderNumber", "orderNumber2", "phoneNumber", note) FROM stdin;
33	1	1	\N	Kerem Arslan	241	1/A	prestij hayat evleri	\N	\N	Yok	-
34	1	1	\N	Kerem Arslan	241	1/A	prestij hayat evleri	\N	\N	Yok	-
10	1	4	4	Şule Şen Arslan	101	5/B	Prestij Hayat V-35 Demirtaş/Osmangazi/Bursa	2	3	7777777777	\N
9	1	4	2	Kerem Arslan	61	5/A	Prestij Hayat V-35 Demirtaş/Osmangazi/Bursa	1	5	6666666666	\N
4	3	4	4	Burak Muştu	21	5/C	Emin Efendi Cad. No:21 Simav/Kütahya	5	2	2222222222	Burak çok uslu bir çocuktur
7	1	4	9	Beren Arslan	100	1/A	Prestij Hayat V-35 Demirtaş/Osmangazi/Bursa	3	6	4444444444	Beren çok akıllı bir çocuktur.
12	3	4	9	İpek Muştu	103	6/B	Emin Efendi Cad. No:21 Simav/Kütahya 	4	1	9999999999	Çok akıll bir tacirdir
22	44	4	2	Lokum Müdür Muştu	1	1/A	Şıhoplu Emin Efenfi Caddesi No:23 Simav/Kütahya	11	11	aaa	Bu bir kedidir
15	15	4	26	Mehmet Korkmaz	123	10/A	13	9	9	123	132
5	2	4	4	Yağız Arslanoğlu	23	4/A	Mavera Villaları I-2 Beylikdüzü/İstanbul	7	8	2222222222	AAAAAAAAAAAAAAAAAAAAAA
11	2	4	5	Sevde Arslanoğlu	102	6/A	Mavera Villaları I-2 Beylikdüzü/İstanbul	8	7	8888888888	gfgf
6	3	4	5	Elif Muştu	50	1/A	Emin Efendi Cad. No:21 Simav/Kütahya	6	4	111111	Elif çok uysal bir çocuktur
23	41	4	2	Safa Kocabaş	12	1/A	Simav	12	12	111111111	Kafasından ameliyat oldu
21	43	4	4	Bal Badem Süt	666	6/A	Beylikdüzü	10	11	999	BlaBlaBla
\.


--
-- Data for Name: Transportations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transportations" (id, "studentId", "serviceId", "employeeId", type, datetime, "isOutOfAddress") FROM stdin;
230	12	9	3	Evden Okula	2021-08-10 21:18:44.61	f
231	10	4	3	Evden Okula	2021-08-10 21:18:44.61	f
232	6	5	3	Evden Okula	2021-08-10 21:18:44.61	f
233	4	2	3	Evden Okula	2021-08-10 21:18:44.68	f
234	5	4	3	Evden Okula	2021-08-10 21:18:44.61	f
235	11	5	3	Evden Okula	2021-08-10 21:18:44.62	f
236	10	4	3	Okuldan Eve	2021-08-10 21:20:44.98	f
237	9	2	3	Okuldan Eve	2021-08-10 21:20:54.47	t
238	7	9	3	Okuldan Eve	2021-08-10 21:20:56.82	t
239	6	5	3	Okuldan Eve	2021-08-10 21:21:00.97	f
240	5	4	3	Okuldan Eve	2021-08-10 21:21:07.58	t
241	11	5	3	Okuldan Eve	2021-08-10 21:21:09.46	f
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, name, mail, "phoneNumber", password, role) FROM stdin;
1	Yağız Arslanoğlu	yagiz.arslanoglu@domain.com.tr	5550555555	911a929b0632184249bfccaa6005ebdcc8f1cdb62d7fbdfb4686d5070ddeba2d48909c0c0c3d466efee15b0e89d2d314034f51ed1de170dd80771f6c7e2e0af7	Manager
14	Kerem Arslan	kerem.arslan@gmail.com	5550555555	40fdbeac6419ed317988fbf7f4b48bf96595cf96f899430db83f6f5a456b07a7d81ae0c5e2a5fa0e251eb0368b301f634d9e61fb0eb088db85e8aba860024a23	Employee
15	Burak Muştu	burak.mustu@gmail.com	5550555555	40fdbeac6419ed317988fbf7f4b48bf96595cf96f899430db83f6f5a456b07a7d81ae0c5e2a5fa0e251eb0368b301f634d9e61fb0eb088db85e8aba860024a23	Manager
17	Güniz Şen	guniz@gmail.com	5309213426	40fdbeac6419ed317988fbf7f4b48bf96595cf96f899430db83f6f5a456b07a7d81ae0c5e2a5fa0e251eb0368b301f634d9e61fb0eb088db85e8aba860024a23	Manager
18	İsmail Şen	ismail@gmail.com	5325717239	c6001d5b2ac3df314204a8f9d7a00e1503c9aba0fd4538645de4bf4cc7e2555cfe9ff9d0236bf327ed3e907849a98df4d330c4bea551017d465b4c1d9b80bcb0	Employee
16	Yağız Arslanoğlu	kaymak@gmail.com	5550555555	40fdbeac6419ed317988fbf7f4b48bf96595cf96f899430db83f6f5a456b07a7d81ae0c5e2a5fa0e251eb0368b301f634d9e61fb0eb088db85e8aba860024a23	Admin
19	Ferit Muştu	ferit@ferit.com	7770007700	53b74be8b295b733fdfafbd7d2a22b1686733740de7fdc592b26cf3e1874cfce158170ce9230e24696331a61829244e5d9f48abdacc9ffa8c4cb498724844cf8	Parent
20	Recep Arslan	recep@recep.com	7770007700	53b74be8b295b733fdfafbd7d2a22b1686733740de7fdc592b26cf3e1874cfce158170ce9230e24696331a61829244e5d9f48abdacc9ffa8c4cb498724844cf8	Parent
21	Ahmet Arslanoğlu	ahmet@ahmet.com	7770007700	53b74be8b295b733fdfafbd7d2a22b1686733740de7fdc592b26cf3e1874cfce158170ce9230e24696331a61829244e5d9f48abdacc9ffa8c4cb498724844cf8	Parent
22	Kemal Korkmaz	kemal@kemal.com	7770007700	4dff4ea340f0a823f15d3f4f01ab62eae0e5da579ccb851f8db9dfe84c58b2b37b89903a740e1ee172da793a6e79d560e5f7f9bd058a12a280433ed6fa46510a	Parent
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, "parentId", "studentId", title, content) FROM stdin;
925	3	12	Öğrenciniz servise bindi	Öğrenciniz İpek Muştu servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:17
926	3	4	Öğrenciniz servise bindi	Öğrenciniz Burak Muştu servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:17
927	1	10	Öğrenciniz servise bindi	Öğrenciniz Şule Şen Arslan servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:17
928	3	6	Öğrenciniz servise bindi	Öğrenciniz Elif Muştu servise binmiştir\nİşlem tarihi: Salı, 10 Ağustos 2021 18:17
929	1	9	Öğrenciniz servise binmedi	Öğrenciniz Kerem Arslan servise binmemiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
930	1	7	Öğrenciniz servise binmedi	Öğrenciniz Beren Arslan servise binmemiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
931	2	11	Öğrenciniz servise bindi	Öğrenciniz Sevde Arslanoğlu servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
932	2	5	Öğrenciniz servise bindi	Öğrenciniz Yağız Arslanoğlu servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
933	2	5	Öğrenciniz servisten indi	Öğrenciniz Yağız Arslanoğlu okulda iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
934	1	10	Öğrenciniz servisten indi	Öğrenciniz Şule Şen Arslan okulda iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
935	2	11	Öğrenciniz servisten indi	Öğrenciniz Sevde Arslanoğlu okulda iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
936	3	12	Öğrenciniz servisten indi	Öğrenciniz İpek Muştu okulda iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
937	3	4	Öğrenciniz servisten indi	Öğrenciniz Burak Muştu okulda iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
938	3	6	Öğrenciniz servisten indi	Öğrenciniz Elif Muştu okulda iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:18
939	3	4	Öğrenciniz servise binmedi	Öğrenciniz Burak Muştu servise binmemiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
940	3	6	Öğrenciniz servise bindi	Öğrenciniz Elif Muştu servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
941	2	5	Öğrenciniz servise bindi	Öğrenciniz Yağız Arslanoğlu servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
942	2	11	Öğrenciniz servise bindi	Öğrenciniz Sevde Arslanoğlu servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
943	1	10	Öğrenciniz servise bindi	Öğrenciniz Şule Şen Arslan servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
944	41	23	Öğrenciniz servise binmedi	Öğrenciniz Safa Kocabaş servise binmemiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
945	43	21	Öğrenciniz servise binmedi	Öğrenciniz Bal Badem Süt servise binmemiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
946	44	22	Öğrenciniz servise binmedi	Öğrenciniz Lokum Müdür Muştu servise binmemiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
947	1	9	Öğrenciniz servise bindi	Öğrenciniz Kerem Arslan servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
949	1	7	Öğrenciniz servise bindi	Öğrenciniz Beren Arslan servise binmiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
948	3	12	Öğrenciniz servise binmedi	Öğrenciniz İpek Muştu servise binmemiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
950	15	15	Öğrenciniz servise binmedi	Öğrenciniz Mehmet Korkmaz servise binmemiştir.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
951	1	10	Öğrenciniz servisten indi	Öğrenciniz Şule Şen Arslan evinde iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
952	1	9	Öğrenciniz servisten indi	Öğrenciniz Kerem Arslan adres dışı iniş yapmıştır.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
953	1	7	Öğrenciniz servisten indi	Öğrenciniz Beren Arslan adres dışı iniş yapmıştır.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:20
954	3	6	Öğrenciniz servisten indi	Öğrenciniz Elif Muştu evinde iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:21
955	2	5	Öğrenciniz servisten indi	Öğrenciniz Yağız Arslanoğlu adres dışı iniş yapmıştır.\nİşlem tarihi: Salı, 10 Ağustos 2021 18:21
956	2	11	Öğrenciniz servisten indi	Öğrenciniz Sevde Arslanoğlu evinde iniş yapmıştır\nİşlem tarihi: Salı, 10 Ağustos 2021 18:21
\.


--
-- Data for Name: rollcalls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rollcalls (id, studentid, serviceid, employeeid, status, datetime, type) FROM stdin;
1361	12	9	3	true	2021-08-10 21:17:44.71	Okuldan Eve
1362	4	2	3	true	2021-08-10 21:17:47.45	Okuldan Eve
1363	10	4	3	true	2021-08-10 21:17:49.9	Okuldan Eve
1364	6	5	3	true	2021-08-10 21:17:52.74	Okuldan Eve
1365	9	2	3	false	2021-08-10 21:18:03.83	Okuldan Eve
1366	7	9	3	false	2021-08-10 21:18:07.59	Okuldan Eve
1367	11	5	3	true	2021-08-10 21:18:14.58	Okuldan Eve
1368	5	4	3	true	2021-08-10 21:18:15.7	Okuldan Eve
1369	22	2	3	false	2021-08-10 21:20:35.57	Evden Okula
1370	15	26	3	false	2021-08-10 21:20:35.57	Evden Okula
1371	4	2	3	false	2021-08-10 21:20:35.58	Evden Okula
1372	23	2	3	false	2021-08-10 21:20:35.58	Evden Okula
1373	21	4	3	false	2021-08-10 21:20:35.58	Evden Okula
1374	6	5	3	true	2021-08-10 21:20:35.58	Evden Okula
1375	5	4	3	true	2021-08-10 21:20:35.58	Evden Okula
1376	12	9	3	false	2021-08-10 21:20:35.58	Evden Okula
1377	11	5	3	true	2021-08-10 21:20:35.58	Evden Okula
1378	10	4	3	true	2021-08-10 21:20:35.58	Evden Okula
1379	7	9	3	true	2021-08-10 21:20:35.58	Evden Okula
1380	9	2	3	true	2021-08-10 21:20:35.58	Evden Okula
\.


--
-- Name: Companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Companies_id_seq"', 38, true);


--
-- Name: Employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Employees_id_seq"', 15, true);


--
-- Name: Managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Managers_id_seq"', 3, true);


--
-- Name: Parents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Parents_id_seq"', 44, true);


--
-- Name: Schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Schools_id_seq"', 7, true);


--
-- Name: Services_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Services_Id_seq"', 31, true);


--
-- Name: Students_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Students_Id_seq"', 34, true);


--
-- Name: Transportations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Transportations_id_seq"', 241, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 22, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 956, true);


--
-- Name: rollcalls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rollcalls_id_seq', 1380, true);


--
-- Name: Companies Companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Companies"
    ADD CONSTRAINT "Companies_pkey" PRIMARY KEY (id);


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
-- Name: Transportations Transportations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transportations"
    ADD CONSTRAINT "Transportations_pkey" PRIMARY KEY (id);


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
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: rollcalls rollcalls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rollcalls
    ADD CONSTRAINT rollcalls_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

