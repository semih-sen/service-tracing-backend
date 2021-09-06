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

