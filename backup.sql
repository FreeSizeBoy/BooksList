--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Book" (
    id integer NOT NULL,
    title text NOT NULL,
    category text NOT NULL,
    publisher text NOT NULL,
    image text NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public."Book" OWNER TO postgres;

--
-- Name: Book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Book_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Book_id_seq" OWNER TO postgres;

--
-- Name: Book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Book_id_seq" OWNED BY public."Book".id;


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
-- Name: Book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book" ALTER COLUMN id SET DEFAULT nextval('public."Book_id_seq"'::regclass);


--
-- Data for Name: Book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Book" (id, title, category, publisher, image, quantity) FROM stdin;
19	รักว้าวุ่นในบ้านชิอุนจิ	มังงะ	Phonix Next	https://cdn-local.mebmarket.com/meb/server1/364617/Thumbnail/book_detail_large.gif?2	4
11	ลุ้นรักสุดละมุนของหนุ่มโอตาคุกับสาวแกล	มังงะ	SiamInterCommic	https://storage.naiin.com/system/application/bookstore/resource/product/202412/633391/1000278369_front_XXL.jpg?imgname=%E0%B8%A5%E0%B8%B8%E0%B9%89%E0%B8%99%E0%B8%A3%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B8%E0%B8%94%E0%B8%A5%E0%B8%B0%E0%B8%A1%E0%B8%B8%E0%B8%99%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%AB%E0%B8%99%E0%B8%B8%E0%B9%88%E0%B8%A1%E0%B9%82%E0%B8%AD%E0%B8%95%E0%B8%B2%E0%B8%84%E0%B8%B8%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%AA%E0%B8%B2%E0%B8%A7%E0%B9%81%E0%B8%81%E0%B8%A5-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1--3	3
10	เมื่อวีรบุรุษกับจอมปราชญ์กลับชาติมาครองรัก	มังงะ	SiamInterCommic	https://storage.naiin.com/system/application/bookstore/resource/product/202504/645278/1000281951_front_XXL.jpg?imgname=%E0%B9%80%E0%B8%A1%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%A7%E0%B8%B5%E0%B8%A3%E0%B8%9A%E0%B8%B8%E0%B8%A3%E0%B8%B8%E0%B8%A9%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%88%E0%B8%AD%E0%B8%A1%E0%B8%9B%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B8%8D%E0%B9%8C%E0%B8%81%E0%B8%A5%E0%B8%B1%E0%B8%9A%E0%B8%8A%E0%B8%B2%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B8%B2%E0%B8%84%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%A3%E0%B8%B1%E0%B8%81-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-3	3
12	เลี้ยงมีจังหน่อยน้า	มังงะ	LuckPim	https://storage.naiin.com/system/application/bookstore/resource/product/202503/640589/1000280358_front_XXL.jpg?imgname=%E0%B9%80%E0%B8%A5%E0%B8%B5%E0%B9%89%E0%B8%A2%E0%B8%87%E0%B8%A1%E0%B8%B5%E0%B9%88%E0%B8%88%E0%B8%B1%E0%B8%87%E0%B8%AB%E0%B8%99%E0%B9%88%E0%B8%AD%E0%B8%A2%E0%B8%99%E0%B9%89%E0%B8%B2-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1--1	1
17	บริษัทนี้มีความรัก                   (ล่าสุด เล่ม 13)	มังงะ	Zenshu	https://cdn-local.mebmarket.com/meb/server1/200813/Thumbnail/book_detail_large.gif?2	5
13	ขออยู่ด้วยได้ไหมครับ	มังงะ	LuckPim	https://storage.naiin.com/system/application/bookstore/resource/product/202411/631883/1000278024_front_XXL.jpg?imgname=%E0%B8%82%E0%B8%AD%E0%B8%AD%E0%B8%A2%E0%B8%B9%E0%B9%88%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%A2%E0%B9%84%E0%B8%94%E0%B9%89%E0%B9%84%E0%B8%AB%E0%B8%A1%E0%B8%84%E0%B8%A3%E0%B8%B1%E0%B8%9A-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-1	1
4	Dandadan	มังงะ	SiamInterCommic	https://preview.redd.it/volume-19-cover-lo-res-v0-7fbmmwz4knqe1.jpeg?width=640&crop=smart&auto=webp&s=eaaf1a74bcb373dcebdf5a6171cd1922f65ff630	19
14	คลาสยกตนข่มท่านของสาวปากแซ่บเกินต้าน เรียนวันนี้พรุ่งนี้เห็นผล	มังงะ	LuckPim	https://storage.naiin.com/system/application/bookstore/resource/product/202504/645005/1000281847_front_XXL.jpg?imgname=%E0%B8%84%E0%B8%A5%E0%B8%B2%E0%B8%AA%E0%B8%A2%E0%B8%81%E0%B8%95%E0%B8%99%E0%B8%82%E0%B9%88%E0%B8%A1%E0%B8%97%E0%B9%88%E0%B8%B2%E0%B8%99%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%AA%E0%B8%B2%E0%B8%A7%E0%B8%9B%E0%B8%B2%E0%B8%81%E0%B9%81%E0%B8%8B%E0%B9%88%E0%B8%9A%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%95%E0%B9%89%E0%B8%B2%E0%B8%99-%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%99%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%99%E0%B8%B5%E0%B9%89%E0%B8%9E%E0%B8%A3%E0%B8%B8%E0%B9%88%E0%B8%87%E0%B8%99%E0%B8%B5%E0%B9%89%E0%B9%80%E0%B8%AB%E0%B9%87%E0%B8%99%E0%B8%9C%E0%B8%A5-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-1	1
5	Kagurabachi	มังงะ	SiamInterCommic	https://preview.redd.it/kagurabachi-volume-6-cover-v0-3ahgos5bctje1.jpeg?auto=webp&s=ff1665815476d820c7bbf884ec6eccede4309051	6
6	ห้องเช่าสยองขวัญ	มังงะ	SiamInterCommic		2
15	เทคนี้ที่ผมถ่าย เป็นเรื่องน่าอายที่เธอไม่คัท	มังงะ	FirstPage	https://cdn-local.mebmarket.com/meb/server1/361716/Thumbnail/book_detail_large.gif?2	8
20	ดอกรักผลิบานที่กลางใจ	มังงะ	Phonix Next	https://cdn-local.mebmarket.com/meb/server1/359223/Thumbnail/book_detail_large.gif?2	12
16	แล้วไหงบอสสาวจอมเฮี้ยบถึงได้ย้อนเวลามาหวานกับผมสมัยเรียนขนาดนี้ (จบ --- The End)	มังงะ	FirstPage	https://cdn-local.mebmarket.com/meb/server1/336146/Thumbnail/book_detail_large.gif?3	3
7	สะดุดรักยัยแฟนเช่า                        (เลิกตาม)	มังงะ	LuckPim	https://cdn-local.mebmarket.com/meb/server1/126275/Thumbnail/book_detail_large.gif?2	13
18	ปิ๊งรักรุ่นพี่สายดุ (ล่าสุด เล่ม 7)	มังงะ	Zenshu	https://cdn-local.mebmarket.com/meb/server1/243374/Thumbnail/book_detail_large.gif?2	5
9	ความลับแสนซุกซนของคุณโกอินดะ	มังงะ	SiamInterCommic	https://du.lnwfile.com/zast29.png	2
21	คุโรอิวะ เมดากะ ไม่เข้าใจความน่ารักของฉันเลย	มังงะ	Phonix Next	https://storage.naiin.com/system/application/bookstore/resource/product/202504/643845/1000281559_front_XXL.jpg?imgname=%E0%B8%84%E0%B8%B8%E0%B9%82%E0%B8%A3%E0%B8%AD%E0%B8%B4%E0%B8%A7%E0%B8%B0-%E0%B9%80%E0%B8%A1%E0%B8%94%E0%B8%B2%E0%B8%81%E0%B8%B0-%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B9%80%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B9%83%E0%B8%88%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%99%E0%B9%88%E0%B8%B2%E0%B8%A3%E0%B8%B1%E0%B8%81%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%89%E0%B8%B1%E0%B8%99%E0%B9%80%E0%B8%A5%E0%B8%A2--%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-11-(Mg)	11
25	Solo Leveling (เล่มล่าสุด 16 ) (ปกพิเศษ 2 , 4)	มังงะ	Phonix Next	https://storage.naiin.com/system/application/bookstore/resource/product/202208/557940/1000253525_front_XXL.jpg?imgname=Solo-Leveling-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-4-(Mg)	4
27	เมื่อคู่กัดตัวร้ายกลายเป็นภรรยาหวานใจ (ขาดเล่ม 1-4)	มังงะ	Phonix Next	https://www.phoenixnext.com/media/nextgenimages/media/catalog/product/cache/0a2cd843897b8bcd4a0dda42cebedd04/m/g/mg0967-01.webp	5
8	กล่องรักวัยใส (ปกพิเศษ 8-13)	มังงะ	LuckPim	https://storage.naiin.com/system/application/bookstore/resource/product/202503/643099/1000281166_front_XXL.jpg?imgname=%E0%B8%81%E0%B8%A5%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B8%A3%E0%B8%B1%E0%B8%81%E0%B8%A7%E0%B8%B1%E0%B8%A2%E0%B9%83%E0%B8%AA--%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1--14	14
24	ขอต้อนรับสู่ห้องเรียนนิยม (เฉพาะ) ยอดคน (เลิกตาม)	มังงะ	Phonix Next	https://storage.naiin.com/system/application/bookstore/resource/product/202010/513069/1000236098_front_XXL.jpg?imgname=%E0%B8%82%E0%B8%AD%E0%B8%95%E0%B9%89%E0%B8%AD%E0%B8%99%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%AA%E0%B8%B9%E0%B9%88%E0%B8%AB%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%99%E0%B8%99%E0%B8%B4%E0%B8%A2%E0%B8%A1-(%E0%B9%80%E0%B8%89%E0%B8%9E%E0%B8%B2%E0%B8%B0)-%E0%B8%A2%E0%B8%AD%E0%B8%94%E0%B8%84%E0%B8%99-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-2-%E0%B8%89%E0%B8%9A%E0%B8%B1%E0%B8%9A%E0%B8%9B%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%9B%E0%B8%A3%E0%B8%B8%E0%B8%87-Mg	2
22	คุณอาเรียโต๊ะข้างๆพูดรัสเซียหวานใส่ซะหัวใจจะวาย	มังงะ	Phonix Next	https://storage.naiin.com/system/application/bookstore/resource/product/202505/647816/1000282274_front_XXL.jpg?imgname=%E0%B8%84%E0%B8%B8%E0%B8%93%E0%B8%AD%E0%B8%B2%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B9%82%E0%B8%95%E0%B9%8A%E0%B8%B0%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%87%E0%B9%86%E0%B8%9E%E0%B8%B9%E0%B8%94%E0%B8%A3%E0%B8%B1%E0%B8%AA%E0%B9%80%E0%B8%8B%E0%B8%B5%E0%B8%A2%E0%B8%AB%E0%B8%A7%E0%B8%B2%E0%B8%99%E0%B9%83%E0%B8%AA%E0%B9%88%E0%B8%8B%E0%B8%B0%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88%E0%B8%88%E0%B8%B0%E0%B8%A7%E0%B8%B2%E0%B8%A2-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-6-(Mg)	6
23	ปรมาจารย์ดาบชั้นเซียนมาตบเกรียนถึงเมืองกรุง	มังงะ	Phonix Next	https://storage.naiin.com/system/application/bookstore/resource/product/202505/647788/1000282282_front_XXL.jpg?imgname=%E0%B8%9B%E0%B8%A3%E0%B8%A1%E0%B8%B2%E0%B8%88%E0%B8%B2%E0%B8%A3%E0%B8%A2%E0%B9%8C%E0%B8%94%E0%B8%B2%E0%B8%9A%E0%B8%8A%E0%B8%B1%E0%B9%89%E0%B8%99%E0%B9%80%E0%B8%8B%E0%B8%B5%E0%B8%A2%E0%B8%99%E0%B8%A1%E0%B8%B2%E0%B8%95%E0%B8%9A%E0%B9%80%E0%B8%81%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%99%E0%B8%96%E0%B8%B6%E0%B8%87%E0%B9%80%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%87%E0%B8%81%E0%B8%A3%E0%B8%B8%E0%B8%87-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-6-(Mg)	6
28	เธอผู้อันตรายต่อใจผม (ขาดเล่ม 1-9)	มังงะ	LuckPim	https://www.luckpim.com/stocks/product/d284x400/er/fk/n1qferfkxdg/Cover_Boku_no_kokoro_no_yabai_yatsu_10.webp	10
29	แกล้งนัก รักนะรู้ยัง? (เลิกตาม)	มังงะ	Dex	https://storage.naiin.com/system/application/bookstore/resource/product/201804/232727/1000206418_front_XXL.jpg?imgname=%E0%B9%81%E0%B8%81%E0%B8%A5%E0%B9%89%E0%B8%87%E0%B8%99%E0%B8%B1%E0%B8%81-%E0%B8%A3%E0%B8%B1%E0%B8%81%E0%B8%99%E0%B8%B0%E0%B8%A3%E0%B8%B9%E0%B9%89%E0%B8%A2%E0%B8%B1%E0%B8%87?-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-1-%E0%B8%89%E0%B8%9A%E0%B8%B1%E0%B8%9A-%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%95%E0%B8%B9%E0%B8%99	1
30	แกล้งนักรัก (แล้ว) นะรู้ยัง? 2	มังงะ	Dex	https://storage.naiin.com/system/application/bookstore/resource/product/202110/534446/1000243894_front_XXL.jpg?imgname=%E0%B9%81%E0%B8%81%E0%B8%A5%E0%B9%89%E0%B8%87%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%A3%E0%B8%B1%E0%B8%81-(%E0%B9%81%E0%B8%A5%E0%B9%89%E0%B8%A7)-%E0%B8%99%E0%B8%B0%E0%B8%A3%E0%B8%B9%E0%B9%89%E0%B8%A2%E0%B8%B1%E0%B8%87?-2-(%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%95%E0%B8%B9%E0%B8%99)	2
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
1cf643b1-00ff-47ae-a460-22cdd2cfecde	2598e5f61d43dc14b40f19a7bac86df6d185266dfd4772def009b3c0f2ac68b5	2025-06-04 16:48:14.299911+07	20250604094813_init	\N	\N	2025-06-04 16:48:14.29252+07	1
\.


--
-- Name: Book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Book_id_seq"', 31, true);


--
-- Name: Book Book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

