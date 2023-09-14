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
1d9e77ff-4f92-4af1-a2d3-c159998d4567	Todo App	897ae744-ce13-4211-adfc-7c07d0fc73bc
71cc762f-76c1-405b-af0f-0071b8209374	Final Exam WEB	897ae744-ce13-4211-adfc-7c07d0fc73bc
95d15abe-292a-4a4f-bf2f-0565ace0faad	Buy daily needs	897ae744-ce13-4211-adfc-7c07d0fc73bc
ff0bf561-3856-439b-a631-f95c3a6c8083	Learn Data Science and ML	897ae744-ce13-4211-adfc-7c07d0fc73bc
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (task_id, description, status, project_id, user_id) FROM stdin;
55937296-5657-47d1-b5dc-64f8108a9395	Define API contract with backend team	todo	1d9e77ff-4f92-4af1-a2d3-c159998d4567	897ae744-ce13-4211-adfc-7c07d0fc73bc
b22616cf-51e4-4b3b-8135-6686b9b09cae	Design wireframe	todo	1d9e77ff-4f92-4af1-a2d3-c159998d4567	897ae744-ce13-4211-adfc-7c07d0fc73bc
681072bd-cbba-44c3-b077-16d93bccd41a	Design mockup	todo	1d9e77ff-4f92-4af1-a2d3-c159998d4567	897ae744-ce13-4211-adfc-7c07d0fc73bc
c8054f11-c96b-48c5-9478-753d036e4077	Develop design system	todo	1d9e77ff-4f92-4af1-a2d3-c159998d4567	897ae744-ce13-4211-adfc-7c07d0fc73bc
ac047d96-9ace-439a-bb5a-12147e5da657	Understanding problem definition	todo	71cc762f-76c1-405b-af0f-0071b8209374	897ae744-ce13-4211-adfc-7c07d0fc73bc
03ea9bd9-a6e7-467e-9dd2-787d4234302d	Python for Data Science	todo	ff0bf561-3856-439b-a631-f95c3a6c8083	897ae744-ce13-4211-adfc-7c07d0fc73bc
c05213fb-5068-4f8a-be51-e05ef622af79	Learn SciKit	todo	ff0bf561-3856-439b-a631-f95c3a6c8083	897ae744-ce13-4211-adfc-7c07d0fc73bc
ff73c9ca-ba88-44a5-a319-f041d603b333	Learn ML	todo	ff0bf561-3856-439b-a631-f95c3a6c8083	897ae744-ce13-4211-adfc-7c07d0fc73bc
70e9f9f5-d287-4ed7-bd63-68cab4495dac	ChatGPT	todo	ff0bf561-3856-439b-a631-f95c3a6c8083	897ae744-ce13-4211-adfc-7c07d0fc73bc
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

