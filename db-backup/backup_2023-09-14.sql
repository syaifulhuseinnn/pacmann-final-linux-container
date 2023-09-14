--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:VstmSAE+LjdENOHzq7G/rQ==$FAohCU+wzXAx/k1Q1Gx1SytxZDSup/UCBX3hG7LlHhM=:JpFswEDmyKnTZHG8nk3nYWZG4y3zf6g7182/4xH/zbM=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "todo-app" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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

--
-- Name: todo-app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "todo-app" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "todo-app" OWNER TO postgres;

\connect -reuse-previous=on "dbname='todo-app'"

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status AS ENUM (
    'todo',
    'doing',
    'done'
);


ALTER TYPE public.status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying(255) NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    task_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    description text NOT NULL,
    status public.status DEFAULT 'todo'::public.status NOT NULL,
    project_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accounts (
    user_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.user_accounts OWNER TO postgres;

--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, title, user_id) FROM stdin;
30dc20ad-b61c-4593-b27e-ddd00b68603b	New Project 1	897ae744-ce13-4211-adfc-7c07d0fc73bc
b19722eb-3a32-42ae-9286-6dc3aaab9405	Wayne Paul	897ae744-ce13-4211-adfc-7c07d0fc73bc
2855f1f7-57a5-4f86-ba60-80780d4fbebf	Mia Cain	897ae744-ce13-4211-adfc-7c07d0fc73bc
bcbd89b2-a520-4072-86fb-77eb2016906d	Gil Whitfield	897ae744-ce13-4211-adfc-7c07d0fc73bc
603eae7c-a45f-4b6c-96af-0f906f924933	Edan Cannon	897ae744-ce13-4211-adfc-7c07d0fc73bc
0e90e052-eb25-430b-af42-64249b8361f5	Wyatt Delaney	897ae744-ce13-4211-adfc-7c07d0fc73bc
88dd76b4-e4fd-4ff1-a349-ec7c791e2a9b	Lesley Stephenson	897ae744-ce13-4211-adfc-7c07d0fc73bc
583b664c-9d44-4bf5-913e-c60c9ce86651	Kasimir Dominguez	897ae744-ce13-4211-adfc-7c07d0fc73bc
07c7fd07-b5b2-4c4f-97ac-6e4cde131f22	Keane Meadows	897ae744-ce13-4211-adfc-7c07d0fc73bc
cfae45bf-9fd4-47bb-b9ec-2995f5c89f68	MacKenzie Lawson	897ae744-ce13-4211-adfc-7c07d0fc73bc
53d123e7-d39c-4b35-b877-a65e076f8057	Rowan Landry	d93e5120-1f63-4bc4-b947-51fea2d390a2
4640ac0c-ff15-4a4d-bc73-74f9d8a6cef9	Courtney Small	d93e5120-1f63-4bc4-b947-51fea2d390a2
bc42f64c-cc4e-4818-9207-0bd3527d1887	Hadassah Ramirez	3e92378d-0fd8-410e-9853-0be101f54bb9
99c66d1b-e1b3-46bc-94d2-4cc2111a2be5	Whilemina Keith	3e92378d-0fd8-410e-9853-0be101f54bb9
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (task_id, description, status, project_id, user_id) FROM stdin;
743d9a0d-5d71-4f95-a240-e4172e213fa2	Illum sint tempor p	todo	53d123e7-d39c-4b35-b877-a65e076f8057	d93e5120-1f63-4bc4-b947-51fea2d390a2
e3fdee08-5d62-4cf1-b114-d882f0683263	Ad iusto illum labo	done	53d123e7-d39c-4b35-b877-a65e076f8057	d93e5120-1f63-4bc4-b947-51fea2d390a2
26d141bf-d60a-4a3f-9b46-1593205f2021	Quam odit reprehende	done	4640ac0c-ff15-4a4d-bc73-74f9d8a6cef9	d93e5120-1f63-4bc4-b947-51fea2d390a2
df8ff4d2-9e45-447c-b344-4717e607f847	Repellendus Facilis	todo	4640ac0c-ff15-4a4d-bc73-74f9d8a6cef9	d93e5120-1f63-4bc4-b947-51fea2d390a2
6df82eb2-9575-4db4-b9c8-c03061151e0d	Adipisci quisquam vi	todo	bc42f64c-cc4e-4818-9207-0bd3527d1887	3e92378d-0fd8-410e-9853-0be101f54bb9
d631780b-7369-447b-a308-26a1716f7470	Nesciunt iusto beat	done	bc42f64c-cc4e-4818-9207-0bd3527d1887	3e92378d-0fd8-410e-9853-0be101f54bb9
6f01b81d-9161-48d7-8081-35ffef1fbc77	Update New Task 11	doing	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
06322382-a21d-4825-b54e-64f658746fac	Task ini diupdate	todo	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
a9b3c597-6dbc-401a-829b-17138f8db676	Update Todo	todo	b19722eb-3a32-42ae-9286-6dc3aaab9405	897ae744-ce13-4211-adfc-7c07d0fc73bc
2b581eb2-f2ac-4224-b223-e32327e45bef	Accusantium nulla di	doing	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
3c6ec7c6-b8a3-41a1-a44d-5053c3c6a5a6	Consequat Doloremqu	todo	2855f1f7-57a5-4f86-ba60-80780d4fbebf	897ae744-ce13-4211-adfc-7c07d0fc73bc
9fbb12f2-34f6-4cee-b257-147e672ce068	Asperiores ut dicta 	todo	2855f1f7-57a5-4f86-ba60-80780d4fbebf	897ae744-ce13-4211-adfc-7c07d0fc73bc
e9a8416f-0900-4b5f-bb5c-368f06e40eb9	Quia dolore modi vel	doing	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
8e008905-dd82-47d6-811a-fa1693664add	Omnis ad similique n	todo	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
95cdbbb5-44b6-4380-8026-82d436f69f0b	Assumenda ratione no	doing	53d123e7-d39c-4b35-b877-a65e076f8057	d93e5120-1f63-4bc4-b947-51fea2d390a2
73e8adbb-0011-451b-9277-647522cbd15c	Esse recusandae Eli	done	4640ac0c-ff15-4a4d-bc73-74f9d8a6cef9	d93e5120-1f63-4bc4-b947-51fea2d390a2
35047937-8798-4518-8537-2d835ec2f8cf	Quaerat quo maxime e	doing	4640ac0c-ff15-4a4d-bc73-74f9d8a6cef9	d93e5120-1f63-4bc4-b947-51fea2d390a2
b88ab25e-618c-40f6-a341-84f022354924	Facilis dolores cons	doing	bc42f64c-cc4e-4818-9207-0bd3527d1887	3e92378d-0fd8-410e-9853-0be101f54bb9
67fb04b7-0047-4642-a177-953119eb2695	Amet voluptatibus n	done	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
e41e3173-6a1a-4ea7-a26e-e62485ad3bcc	Update Doing	doing	b19722eb-3a32-42ae-9286-6dc3aaab9405	897ae744-ce13-4211-adfc-7c07d0fc73bc
0cab7393-1fbb-47dc-af01-b0e03112e4c0	Update Done	done	b19722eb-3a32-42ae-9286-6dc3aaab9405	897ae744-ce13-4211-adfc-7c07d0fc73bc
990a5d2f-58ff-4f8a-bbb8-dd4ace1b275f	Eum ut quibusdam qui	todo	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
6bfde73c-e613-4926-aa59-9e122531699f	Ipsum in itaque plac	todo	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
016244d6-afdf-4c4f-811a-15c3125b10ea	Nobis perferendis au	todo	2855f1f7-57a5-4f86-ba60-80780d4fbebf	897ae744-ce13-4211-adfc-7c07d0fc73bc
47ce8f5b-b6fb-4ec4-939d-4fd3b4fd6301	Sequi excepturi non 	todo	2855f1f7-57a5-4f86-ba60-80780d4fbebf	897ae744-ce13-4211-adfc-7c07d0fc73bc
6a3d7f00-038e-4ae8-9b17-98d33f75cf43	Magni velit commodi	doing	30dc20ad-b61c-4593-b27e-ddd00b68603b	897ae744-ce13-4211-adfc-7c07d0fc73bc
\.


--
-- Data for Name: user_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_accounts (user_id, email, password) FROM stdin;
897ae744-ce13-4211-adfc-7c07d0fc73bc	john@mail.com	12345
93aadb84-296a-4e7e-8087-611ed68cf281	roy@mail.com	$2b$12$iqtsMDcVHQSN55.oT3N7rOS0rjmWGxCEnlz5zrIAjITwWz161F3FC
d93e5120-1f63-4bc4-b947-51fea2d390a2	alex@mail.com	$2b$12$hnU6QaBTc0LkQ82Tp5MvDuPxCxKBlQkm/AOSL3sauLMgWQBr2fpWi
16e0c096-b8fa-4f21-904d-897a2843ab46	indry@mail.com	$2b$12$ChP46jMkaxqPIX0uwVaYAuCFbmwxBLaHAdqVXYho1li/0GbqHMwjS
c9c87bf4-23f9-4950-9a0d-136797fbccac	zuqe@mailinator.com	$2b$12$ijN/3H.li9ZSZvoR70Ept.JJKU6Paq1HX.I95J7.rq6XRfMLfKSZi
446fd7b5-8289-4bd2-8af2-2b9caf8ae282	bofyniv@mailinator.com	$2b$12$/r3WvuQZQyxtpiKpq3iC7OVfdwMRfxfw/PTk.FcxXTdHDiboARSPC
7a502296-6a2f-426f-aefc-6bd3637e9e74	hezamym@mailinator.com	$2b$12$CD3zZzJWGjL5JtFt4DMVg.D6dNLVpn9hcF0y86JVyXJv6hY8sGZae
3e92378d-0fd8-410e-9853-0be101f54bb9	tiqycy@mailinator.com	$2b$12$.gS.UUfcBMosTGr0mzs5Oer7vDuDr53mouVOzTdFs.Z41mUOSTeT.
\.


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (task_id);


--
-- Name: user_accounts user_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_pkey PRIMARY KEY (user_id);


--
-- Name: projects projects_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_accounts(user_id) ON DELETE CASCADE;


--
-- Name: tasks tasks_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id) ON DELETE CASCADE;


--
-- Name: tasks tasks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_accounts(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

