--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

-- Started on 2022-01-28 15:22:32 WAT


*******JOINTURE*******


select affaires.description, clients.nom , personnel.grade from affaires
inner join clients on affaires.id = clients.id
inner join personnel on affaires.id = personnel.id


************************

********CREATION DE BASE DE DONNEES********

postgres=# create database avocats
postgres-# \c avocat

*********************************
********creation des clients**********

avocats=# CREATE TABLE Clients (id serial PRIMARY KEY not null, nom VARCHAR(100), prenom VARCHAR(100), adresse VARCHAR(100), profession VARCHAR(100), telephone VARCHAR(100));
CREATE TABLE
avocats=# CREATE TABLE Personnel (id serial PRIMARY KEY not null, nom VARCHAR(100), prenom VARCHAR(100), adresse VARCHAR(100), grade VARCHAR(100), specialite VARCHAR(100), telephone VARCHAR(100));
CREATE TABLE
avocats=# CREATE TABLE Affaires (id serial PRIMARY KEY not null, date_reception DATE, statut VARCHAR(100), categorie VARCHAR(100), description TEXT, client_id INT NOT NULL, personnel_id INT NOT NULL, FOREIGN KEY (client_id) REFERENCES Clients (id),FOREIGN KEY (personnel_id) REFERENCES Personnel (id));
CREATE TABLE
avocats=# \dt
            Liste des relations
 Schéma |    Nom    | Type  | Propriétaire 
--------+-----------+-------+--------------
 public | affaires  | table | postgres
 public | clients   | table | postgres
 public | personnel | table | postgres
(3 lignes)

******************postgresql****************

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
-- TOC entry 207 (class 1259 OID 33140)
-- Name: affaires; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.affaires (
    id integer NOT NULL,
    date_reception date,
    categorie character varying(100),
    description text,
    client_id integer NOT NULL,
    personnel_id integer NOT NULL
);


ALTER TABLE public.affaires OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 33138)
-- Name: affaires_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.affaires_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.affaires_id_seq OWNER TO postgres;

--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 206
-- Name: affaires_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.affaires_id_seq OWNED BY public.affaires.id;


--
-- TOC entry 203 (class 1259 OID 33113)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    nom character varying(100),
    prenom character varying(100),
    profession character varying(100),
    adresse character varying(100),
    telephone character varying(20)
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 33111)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 202
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 205 (class 1259 OID 33121)
-- Name: personnel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personnel (
    id integer NOT NULL,
    nom character varying(100),
    prenom character varying(100),
    grade character varying(100),
    specialite character varying(100),
    adresse character varying(100),
    telephone character varying(20)
);


ALTER TABLE public.personnel OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 33119)
-- Name: personnel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personnel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personnel_id_seq OWNER TO postgres;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 204
-- Name: personnel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personnel_id_seq OWNED BY public.personnel.id;


--
-- TOC entry 2856 (class 2604 OID 33143)
-- Name: affaires id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affaires ALTER COLUMN id SET DEFAULT nextval('public.affaires_id_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 33116)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 2855 (class 2604 OID 33124)
-- Name: personnel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnel ALTER COLUMN id SET DEFAULT nextval('public.personnel_id_seq'::regclass);


--
-- TOC entry 2996 (class 0 OID 33140)
-- Dependencies: 207
-- Data for Name: affaires; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.affaires (id, date_reception, categorie, description, client_id, personnel_id) FROM stdin;
1	2021-12-19	Helyn	ac lobortis	1	1
2	2021-01-28	Jandy	vestibulum sed magna at	2	2
3	2021-06-04	Clem	luctus et ultrices	3	3
4	2021-11-11	Dulce	habitasse platea dictumst	4	4
5	2021-03-29	Janeen	odio curabitur convallis	5	5
6	2021-07-22	Jolee	et eros vestibulum ac	6	6
7	2021-05-22	Miltie	sagittis	7	7
8	2021-06-16	Millicent	in porttitor pede	8	8
9	2021-12-04	Aldrich	nibh in quis justo maecenas	9	9
10	2021-03-18	Brittni	libero ut massa	10	10
11	2021-07-25	Dottie	pretium quis lectus	11	11
12	2021-02-12	Trula	mauris enim leo rhoncus sed	12	12
13	2021-05-10	Christie	ipsum primis	13	13
14	2021-06-13	Evangelin	est risus	14	14
15	2021-04-04	Sigmund	vel ipsum praesent blandit lacinia	15	15
16	2021-11-29	Catlaina	ultrices posuere cubilia curae	16	16
17	2021-02-10	Orelle	dapibus duis at velit	17	17
18	2021-11-25	Avictor	tellus semper interdum	18	18
19	2021-04-13	Sarita	venenatis turpis enim blandit mi	19	19
20	2021-03-26	Kermie	odio odio elementum eu	20	20
21	2021-02-27	Christophe	erat volutpat	21	21
22	2021-06-12	Brennan	tempor	22	22
23	2021-11-16	Tonia	gravida sem praesent id	23	23
24	2021-02-15	Gerhardine	velit nec nisi vulputate nonummy	24	24
25	2021-08-27	Eduardo	at ipsum ac	25	25
26	2021-12-17	Honey	aliquam convallis nunc	26	26
27	2021-02-22	Jaquelin	dui proin leo odio	27	27
28	2021-05-16	Pietro	enim sit	28	28
29	2021-02-12	Moyra	id	29	29
30	2021-05-09	Nessa	erat quisque	30	30
31	2021-12-04	Isidora	convallis duis consequat dui	31	31
32	2021-03-24	Justine	elementum	32	32
33	2021-01-30	Francoise	quisque	33	33
34	2021-03-26	Darin	volutpat convallis morbi odio odio	34	34
35	2022-01-04	Cymbre	euismod scelerisque quam turpis adipiscing	35	35
36	2021-11-13	Joice	nam nulla integer pede	36	36
37	2021-10-17	Ansley	aenean	37	37
38	2021-05-11	Pamelina	dolor sit	38	38
39	2021-09-01	Cirilo	vitae ipsum aliquam non mauris	39	39
40	2021-02-22	Sloane	at ipsum ac tellus semper	40	40
41	2021-11-30	Lorna	eros vestibulum ac est	41	41
42	2021-06-25	Roma	justo	42	42
43	2021-03-02	Daron	fusce	43	43
44	2021-08-01	Silva	dapibus nulla suscipit	44	44
45	2021-03-10	Ronnica	ac	45	45
46	2021-08-15	Lockwood	mauris sit amet eros suspendisse	46	46
47	2021-09-25	Nadya	nec nisi volutpat eleifend	47	47
48	2021-04-07	Marion	sapien quis libero nullam	48	48
49	2021-02-01	Marylynne	morbi	49	49
50	2021-12-19	Essy	erat curabitur gravida nisi at	50	50
51	2021-03-18	Trescha	mi integer ac neque	51	51
52	2021-05-03	Cyndy	leo	52	52
53	2021-05-24	Nonnah	hac	53	53
54	2021-09-07	Brigida	lorem quisque	54	54
55	2021-08-21	Kendall	vulputate justo in blandit	55	55
56	2021-10-10	Waiter	quis turpis sed ante vivamus	56	56
57	2021-06-19	Stormy	eget orci	57	57
58	2021-11-22	Emmy	nunc proin at turpis a	58	58
59	2021-06-03	Mano	et eros vestibulum ac	59	59
60	2021-02-01	Tymon	nulla	60	60
61	2021-06-07	Auberta	amet	61	61
62	2021-11-30	Ethyl	tellus nulla ut	62	62
63	2022-01-14	Ermengarde	interdum venenatis	63	63
64	2021-06-07	Malvin	justo eu massa	64	64
65	2021-07-28	Miller	quis	65	65
66	2021-07-26	Sutherlan	volutpat dui	66	66
67	2021-07-17	Ross	amet eleifend pede libero quis	67	67
68	2021-03-15	Shalna	iaculis diam erat fermentum	68	68
69	2021-05-30	Jordanna	parturient montes nascetur ridiculus mus	69	69
70	2021-04-03	Irvin	felis fusce posuere felis	70	70
71	2021-01-31	Maryl	id turpis integer aliquet massa	71	71
72	2021-06-05	Maible	tortor sollicitudin mi sit	72	72
73	2022-01-05	Ase	sit amet sem	73	73
74	2021-10-02	Sheila-kathryn	nascetur	74	74
75	2021-09-06	Cly	id	75	75
76	2021-02-14	Flemming	metus aenean fermentum	76	76
77	2021-05-19	Leicester	sociis natoque penatibus	77	77
78	2021-02-23	Zaccaria	duis bibendum felis	78	78
79	2021-12-21	Milicent	nisi	79	79
80	2021-04-30	Karlotta	eros suspendisse accumsan tortor quis	80	80
81	2021-07-17	Anitra	luctus tincidunt nulla mollis molestie	81	81
82	2021-07-23	Saleem	eget rutrum at	82	82
83	2021-12-24	Issi	posuere cubilia curae	83	83
84	2021-04-23	Christos	sit amet turpis elementum ligula	84	84
85	2021-10-19	Jessika	bibendum	85	85
86	2021-10-13	Fredrika	mauris ullamcorper	86	86
87	2021-08-20	Victoir	nisi volutpat	87	87
88	2021-12-17	Cathryn	phasellus in felis donec semper	88	88
89	2021-04-26	Lorain	eget eleifend luctus	89	89
90	2022-01-23	Bessy	elit proin risus praesent lectus	90	90
91	2021-03-28	Ibbie	non interdum	91	91
92	2021-12-23	Milka	dapibus dolor vel	92	92
93	2021-07-06	Doria	quisque erat eros	93	93
94	2021-06-19	Sherwood	congue eget semper rutrum nulla	94	94
95	2021-06-06	Alexa	in hac	95	95
96	2021-12-12	Sharl	ut nulla sed accumsan felis	96	96
97	2021-03-06	Tedmund	amet consectetuer	97	97
98	2021-08-17	Sterne	maecenas rhoncus	98	98
99	2021-11-29	Cathi	pulvinar sed	99	99
100	2021-09-15	Carny	quam nec	100	100
\.


--
-- TOC entry 2992 (class 0 OID 33113)
-- Dependencies: 203
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, nom, prenom, profession, adresse, telephone) FROM stdin;
1	2021-05-29	Tannie	Felice	Zhishan	+86 (673) 668-5878
2	2022-01-14	Desi	Patton	Ravānsar	+98 (130) 477-6596
3	2021-02-13	Daryle	Tallie	Pandangan Kulon	+62 (477) 849-3134
4	2021-03-16	Packston	Heidie	Jianghai	+86 (474) 901-5590
5	2021-03-12	Lucille	Corrie	Brčko	+387 (215) 723-4686
6	2021-11-23	Logan	Ulrikaumeko	Kraljevica	+385 (500) 109-4601
7	2022-01-03	Bathsheba	Theodosia	Czerniejewo	+48 (196) 210-6996
8	2021-11-10	Tully	Ninnette	Dongyuan	+86 (781) 882-5307
9	2021-03-11	Roi	Lindi	Pak Thong Chai	+66 (135) 436-8573
10	2022-01-05	Jameson	Tull	Liuzhi	+86 (739) 712-4082
11	2021-04-06	Minor	Simona	Le Pontet	+33 (171) 343-3528
12	2021-04-01	Jan	Edgard	Chimtāl	+93 (826) 759-0305
13	2021-12-13	Lorne	Biddy	Kabaty	+48 (530) 798-5259
14	2022-01-14	Merridie	Leilah	Aix-en-Provence	+33 (742) 168-4942
15	2021-12-14	Frank	Jerrine	Lincha	+51 (210) 376-0387
16	2021-07-30	Demetris	Margalit	Hønefoss	+47 (830) 211-9375
17	2021-08-21	Yevette	Mayne	Bagong Barrio	+63 (905) 778-9872
18	2022-01-13	Brook	Haywood	Pruzhany	+375 (168) 263-7160
19	2021-04-12	Stoddard	Gene	Zhourui	+86 (906) 648-0479
20	2021-05-23	Cary	Duke	Tríkala	+30 (131) 372-0863
21	2021-05-22	Belvia	Maxie	Newton	+1 (617) 259-6335
22	2021-02-10	Cookie	Denys	Pak Phayun	+66 (341) 344-1831
23	2021-02-06	Zorah	Yetta	Shentong	+86 (593) 740-3397
24	2021-10-07	Elizabet	Idalina	Giồng Trôm	+84 (841) 489-6295
25	2021-02-02	Zsazsa	Donica	Nové Město pod Smrkem	+420 (103) 885-4048
26	2021-02-01	Jennee	Josie	Francisco Villa	+52 (506) 508-9412
27	2021-04-23	Arnaldo	Lowrance	Mungyeong	+82 (778) 391-9630
28	2021-10-28	Gabbey	Flori	Nandong	+86 (708) 176-1920
29	2021-12-28	Gui	Jan	Poitiers	+33 (568) 577-7620
30	2021-11-15	Felicdad	Merlina	Jinjiang	+86 (382) 704-7549
31	2021-08-01	Nanny	Alexandre	Triandría	+30 (225) 246-8449
32	2021-12-19	Milissent	Roobbie	Sarukhan	+374 (856) 350-4349
33	2021-08-27	Vidovic	Blinni	Irkutsk	+7 (273) 896-6692
34	2021-07-02	Kizzee	Koralle	Santo Anastácio	+55 (185) 882-5564
35	2022-01-23	Hercules	Merrill	Wang Yang	+66 (779) 688-2509
36	2021-04-05	Daveta	Joana	Paterson	+1 (973) 125-2122
37	2021-08-15	Georgianna	Elfrieda	Izyaslav	+380 (483) 432-8163
38	2021-10-20	Stinky	Ephrem	Luhačovice	+420 (795) 186-4250
39	2021-09-06	Alex	Anson	Bastia	+33 (128) 923-0866
40	2021-12-30	Roobbie	Nikki	Prince Rupert	+1 (760) 761-4906
41	2021-09-11	Darsie	Florinda	Liaonan	+86 (698) 176-1513
42	2021-09-28	Nelle	Joelly	Huangtu	+86 (736) 872-4020
43	2021-09-28	Cosetta	Carlo	Aleksandrovka	+380 (442) 399-9590
44	2022-01-16	Wash	Charlotta	Nzérékoré	+224 (992) 138-4487
45	2021-03-31	Virge	Blake	Wenfu	+86 (822) 781-6896
46	2021-03-12	Kathrine	Weider	Madrid	+34 (168) 504-1850
47	2021-05-31	Valentijn	Lennard	União	+55 (222) 215-0838
48	2021-07-31	Mirna	Patrica	Molave	+63 (113) 904-4141
49	2021-07-26	Valencia	Carmelita	Cleveland	+1 (216) 549-3769
50	2022-01-05	Faydra	Joanne	Wangong	+86 (389) 876-1075
51	2021-03-28	Corie	Lavinie	Songping	+86 (963) 695-9534
52	2021-05-11	Scott	Anitra	Paris 17	+33 (851) 821-3166
53	2021-02-28	Maxy	Leonerd	Jermuk	+374 (335) 993-6695
54	2021-07-07	Arliene	Prinz	Yujing	+86 (947) 397-5972
55	2021-02-11	Sharlene	Berenice	Leyuan	+86 (833) 643-3744
56	2021-07-20	Delbert	Aime	Dankalwa	+234 (860) 370-5008
57	2021-08-12	Wylie	Dinah	Majiadu	+86 (133) 647-3439
58	2021-06-24	Robinia	Olivier	Iyo	+81 (341) 697-8425
59	2021-11-29	Rozalin	Keefer	Viana	+55 (180) 339-5154
60	2021-05-03	Michele	Ephrem	Créteil	+33 (818) 140-5062
61	2021-07-02	Alejandro	Myrlene	Lameiras	+351 (141) 498-8855
62	2021-04-05	Halie	Maggi	Cikaung	+62 (149) 450-1851
63	2021-05-28	Gena	Fonsie	Al Qurayshīyah	+967 (482) 310-4436
64	2021-07-14	Nev	Jerry	Pontang Tengah	+62 (656) 675-8150
65	2021-12-29	Fonz	Germain	Anjani Barat	+62 (251) 530-0314
66	2021-12-13	Aveline	Cathy	Ambovombe	+261 (235) 367-2840
67	2021-11-11	Heidi	Netty	Omišalj	+385 (804) 300-9165
68	2021-03-02	Carroll	Cicily	Wanfang	+86 (563) 556-8473
69	2021-02-20	Dulcia	Benson	Żarki	+48 (184) 132-5893
70	2021-11-25	Denna	Maia	Maco	+63 (251) 118-0453
71	2021-12-28	Jose	Barry	Yidu	+86 (294) 794-2248
72	2022-01-02	Burnaby	Cissy	Silvares	+351 (162) 179-1542
73	2021-08-16	Lisabeth	Derrick	Brikcha	+212 (179) 563-9206
74	2021-07-07	Titos	Shermy	Ōnojō	+81 (564) 269-5263
75	2021-10-16	Claiborne	Baily	Lhakangtang	+86 (522) 791-5952
76	2022-01-04	Julian	Eada	Gujba	+234 (167) 855-7271
77	2021-07-07	Theressa	Maxwell	Baisha	+86 (260) 706-8744
78	2021-07-21	Kath	Jeane	Manalad	+63 (429) 813-3538
79	2021-02-28	Lorinda	Tuesday	Khānaqāh	+93 (762) 281-8913
80	2021-02-08	Genvieve	Yuri	Leye	+86 (308) 401-5341
81	2021-03-02	Merry	Lyon	Val-de-Reuil	+33 (214) 459-9243
82	2021-12-01	Duffie	Euell	Puutura	+62 (591) 890-2451
83	2021-11-16	Corby	Brett	Suzuka	+81 (358) 221-7976
84	2021-09-23	Grover	Charlene	Karang Kulon	+62 (160) 338-0533
85	2021-06-14	Venus	Kelwin	Pujiang	+86 (902) 924-3760
86	2021-11-29	Xenos	Constantine	Bulubrangsi	+62 (732) 882-3267
87	2021-06-19	Octavius	Johann	Juripiranga	+55 (488) 285-4977
88	2021-12-08	Gabbi	Karylin	Xindeng	+86 (437) 448-3215
89	2022-01-23	Lainey	Kipp	Huangbao	+86 (835) 447-7251
90	2021-10-01	Tony	Bobby	Celso Ramos	+55 (928) 346-5859
91	2021-10-06	Corrina	Dorena	Lyon	+33 (738) 529-7019
92	2021-09-02	Dorelle	Asa	Kuanda	+7 (728) 658-4947
93	2021-06-29	Luke	Wells	La Jagua de Ibirico	+57 (165) 537-4082
94	2021-03-27	Mag	Merrill	San Juan de Dios	+506 (271) 546-2782
95	2021-03-23	Jim	Borg	Hejia	+86 (755) 622-3853
96	2022-01-02	Adriana	Jenda	Hénin-Beaumont	+33 (854) 408-7708
97	2021-05-20	Isabel	Darsie	Makariv	+380 (888) 758-9780
98	2021-05-01	Lonnard	Rosanne	Iset’	+7 (911) 442-9951
99	2021-03-13	Micheil	Jaye	Granada	+34 (795) 231-0425
100	2021-06-10	Courtnay	Mariellen	Gegu	+86 (540) 507-5161
\.


--
-- TOC entry 2994 (class 0 OID 33121)
-- Dependencies: 205
-- Data for Name: personnel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personnel (id, nom, prenom, grade, specialite, adresse, telephone) FROM stdin;
1	Yénora	Annotés	Joelle	Ximenez	Jalal-Abad	+996 (923) 466-8038
2	Maïwenn	Cécile	Aldous	Nickolas	Piątnica	+48 (282) 543-1249
3	Marie-noël	Pélagie	Garrik	Cthrine	Same	+670 (155) 930-8336
4	Aloïs	Jú	Scot	Barnabe	Tha Yang	+66 (950) 337-1792
5	Aurélie	Desirée	Barb	Erika	Linköping	+46 (454) 782-0377
6	Yú	Anaé	Cordy	Hastings	Umeå	+46 (836) 609-3511
7	Yú	Maëlann	Antonella	Maible	Havířov	+420 (240) 840-2018
8	Maëlle	Thérèsa	Eberhard	Windham	Stockholm	+46 (540) 111-2568
9	Görel	Yú	Martita	Cecilius	Söderhamn	+46 (654) 450-9515
10	Camélia	Bérengère	Ricki	Evelyn	Cortinhas	+351 (607) 547-0110
11	Aurélie	Clémence	Mead	Faythe	Zürich	+41 (464) 819-6231
12	Naëlle	Östen	Dino	Sibel	Naryn	+996 (110) 443-3657
13	Irène	Andrée	Nataline	Lindsey	Emiliano Zapata	+52 (260) 985-0766
14	Torbjörn	Simplifiés	Marni	Jorey	Tegalagung	+62 (477) 504-3992
15	Angèle	Médiamass	Elias	Kat	Lojigawaran	+62 (343) 581-6557
16	Måns	Rébecca	Marleah	Devon	Valcheta	+54 (879) 400-5249
17	Aloïs	Mén	Conway	Bernita	Manggekompo	+62 (538) 384-4182
18	Aimée	Valérie	Adelaide	Emelita	Centenary	+263 (888) 776-7928
19	Eugénie	Méghane	Leonerd	Ian	Bei’an	+86 (182) 358-5475
20	Néhémie	Anaé	Ogdan	Alfred	Banda Layung	+62 (842) 894-7196
21	Annotés	André	Guenevere	Car	Bolhrad	+380 (790) 891-3605
22	Zhì	Mén	Consolata	Georges	Palmas de Monte Alto	+55 (953) 474-1014
23	Personnalisée	Mélissandre	Stefania	Rebe	Obeliai	+370 (890) 552-0122
24	Alizée	Adélie	Agosto	Cristionna	Brodósqui	+55 (648) 697-4560
25	Lén	Gaétane	Marin	Lotte	Antrukan	+62 (707) 285-9756
26	Océanne	Yú	Kinsley	Staffard	Vila Velha de Ródão	+351 (497) 582-4997
27	Gisèle	Athéna	Collete	Kevin	Gaopu	+86 (374) 858-1508
28	Béatrice	Loïc	Cammi	Olympie	Mombasa	+254 (609) 547-3506
29	Dù	Aimée	Carolee	Emery	San Vicente	+63 (604) 583-9696
30	Michèle	Örjan	Clarita	Thedric	Kuala Pilah	+60 (552) 789-1796
31	Lèi	Rébecca	Corine	Warde	Bangluo	+86 (235) 833-7387
32	Rachèle	Zoé	Iggie	Margaux	Guararé	+507 (449) 730-3759
33	Angèle	Rébecca	Edi	Noella	Jinshandian	+86 (380) 468-5731
34	Lyséa	Irène	Rory	Julieta	Tarikolot	+62 (258) 756-9924
35	Dafnée	Anaé	Ella	Tibold	Hexi	+86 (378) 389-6515
36	Sòng	Anaël	Brooks	Maye	Qujiang	+86 (853) 755-7914
37	Anaïs	Cloé	Hollyanne	Reinwald	Mosteirô	+351 (244) 657-5939
38	Cécilia	Ruò	Kimmie	Obediah	Lelkowo	+48 (414) 246-7705
39	Marie-hélène	Almérinda	Jasun	Freida	Kisesa	+255 (503) 818-8746
40	Pò	Marie-josée	Jeannie	Axe	Myrnyy	+380 (399) 533-1457
41	Géraldine	Dorothée	Bert	Barbara	Vale de Touros	+351 (461) 847-0285
42	Kévina	Andréa	Fifine	Valene	Santa Cruz	+56 (216) 992-8837
43	Solène	Pélagie	Josee	Valentine	Itapipoca	+55 (481) 122-4189
44	Estève	Pélagie	Ailey	Maurits	Bamako	+223 (903) 916-3690
45	Alizée	Bérangère	Waylen	Daveen	Tibro	+46 (367) 401-9887
46	Ophélie	Marie-noël	Almeria	Avery	Boketu	+86 (867) 957-0353
47	Mélissandre	Méthode	Brittne	Adrianne	Phetchabun	+66 (734) 471-8182
48	Agnès	Océanne	Laurie	Hewett	Zhuangbu	+86 (210) 700-7133
49	Ruì	Séréna	Johan	Grange	Taoxi	+86 (637) 105-7919
50	Vénus	Kévina	Cornie	Rafaello	San Miguel	+52 (660) 297-5794
51	Françoise	Rachèle	Kristien	Aurel	Reda	+48 (347) 787-7323
52	Maïlys	Eliès	Willetta	Forrester	Nyimba	+260 (563) 515-3437
53	Faîtes	Thérèse	Gualterio	Idell	Xinfeng	+86 (152) 557-3947
54	Ráo	Maïwenn	Malory	Jerrie	Keroak	+62 (134) 885-9679
55	Bérengère	Maëlann	Denny	Margeaux	Altares	+351 (812) 771-2868
56	Måns	Tán	Karola	Cortie	Dmytrivka	+380 (783) 689-0250
57	Amélie	Clélia	Estevan	Michale	Qiaoshi	+86 (426) 697-1888
58	Loïc	Estève	Sorcha	Donovan	Huddinge	+46 (742) 468-8954
59	Yú	Garçon	Emeline	Egon	Bagacay	+63 (937) 901-9483
60	Maëly	Salomé	Thibaut	Chickie	General Luna	+63 (909) 274-5698
61	Görel	Gisèle	Betsey	Kellina	Portarlington	+353 (897) 581-1384
62	Adélaïde	Faîtes	Sadie	Carmen	Herne	+49 (609) 317-1374
63	Adèle	Gaïa	Emlen	Cullin	Kotaagung	+62 (667) 217-2433
64	Yú	Gösta	Kalila	Tanney	Suwaluh	+62 (954) 858-6057
65	Régine	Geneviève	Kaye	Mayor	Suruhan	+62 (537) 402-8889
66	Tán	Stéphanie	Amos	Harlen	Dahe	+86 (710) 874-3288
67	Joséphine	Personnalisée	Papageno	Barnabas	Bakung	+63 (574) 168-1236
68	Gaëlle	Daphnée	Jammie	Cathryn	Rukunlima Bawah	+62 (421) 427-3230
69	Cécile	Aloïs	Tann	Becca	Guilhabreu	+351 (977) 375-9517
70	Judicaël	Andréa	Sean	Hubie	Sanquan	+86 (920) 196-2601
71	Zhì	Maïlys	Karisa	Dorolice	Pedreira	+55 (656) 191-7974
72	Kù	Anaëlle	Rodger	Farrah	Erdao	+86 (648) 607-9419
73	Esbjörn	Naéva	Ford	Coralyn	Lyakhovtsy	+380 (418) 583-6308
74	Stéphanie	Laurène	Teddie	Lyndsay	Nikolayevsk	+7 (594) 626-5348
75	Annotés	Méryl	Alonzo	Ivor	Aktsyabrski	+375 (367) 456-5826
76	Adèle	Régine	Briant	Erik	Bridgetown	+1 (901) 206-9802
77	Geneviève	Desirée	Cirstoforo	Christoforo	Baliton	+63 (630) 499-2222
78	Audréanne	Amélie	Nadeen	Gabie	Srunikrajan	+62 (449) 883-6958
79	Andréa	Ruì	Torrence	Marisa	Mina Clavero	+54 (274) 189-1339
80	Illustrée	Lóng	Hastie	Crystie	Huangbu	+86 (616) 577-0498
81	Liè	Uò	Margaret	Nichole	Zuolan	+86 (446) 343-1930
82	Salomé	Publicité	Dagmar	Noelani	Gisiliba	+62 (576) 258-3899
83	Gérald	Åke	Issi	Artus	Geshan	+86 (169) 865-7781
84	Ruò	Kuí	Lanny	Stefanie	Nyima	+86 (574) 563-7681
85	Gaëlle	Naëlle	Peta	Levon	Baiyin	+86 (650) 288-2138
86	Åslög	Lóng	Stearne	Lefty	Zaprudnya	+7 (408) 381-3382
87	Daphnée	Inès	Alexandrina	Theodore	Gangnan	+86 (604) 911-6065
88	Bérengère	Clémence	Hastie	Roscoe	Yangiqo‘rg‘on	+998 (281) 329-2637
89	Michèle	Desirée	Griz	Rochette	Créteil	+33 (580) 550-3885
90	Stévina	Mylène	Sydney	Stace	Zoumaling	+86 (119) 535-1665
91	Célestine	Loïs	Caldwell	Joshua	Haz-Zebbug	+356 (504) 663-3629
92	Méghane	Nélie	Selle	Dara	Los Lotes	+507 (837) 860-5715
93	Gwenaëlle	Sòng	Tristan	Madelle	San Roque	+63 (673) 518-1752
94	Gaïa	Kù	Lou	Lusa	Madruga	+53 (883) 585-3513
95	Angèle	Mà	Robinett	Robby	Takatsuki	+81 (661) 929-5589
96	Bérengère	Cunégonde	Kelsey	Curtice	Frederiksberg	+45 (326) 620-5322
97	Pò	Gaïa	Sax	Rose	Boyany	+380 (692) 800-4204
98	Almérinda	Maéna	Hashim	Bryon	Mekon	+62 (328) 186-4844
99	Torbjörn	Cléopatre	Gabriellia	Forster	Stamford	+1 (203) 710-8297
100	Daphnée	Lài	Margaux	Evania	Kabukarudi	+62 (339) 102-4930
\.


--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 206
-- Name: affaires_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.affaires_id_seq', 1, false);


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 202
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 204
-- Name: personnel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personnel_id_seq', 1, false);


--
-- TOC entry 2862 (class 2606 OID 33148)
-- Name: affaires affaires_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affaires
    ADD CONSTRAINT affaires_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 33118)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 33129)
-- Name: personnel personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 33149)
-- Name: affaires affaires_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affaires
    ADD CONSTRAINT affaires_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 2864 (class 2606 OID 33154)
-- Name: affaires affaires_personnel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affaires
    ADD CONSTRAINT affaires_personnel_id_fkey FOREIGN KEY (personnel_id) REFERENCES public.personnel(id);


-- Completed on 2022-01-28 15:22:32 WAT

--
-- PostgreSQL database dump complete
--

