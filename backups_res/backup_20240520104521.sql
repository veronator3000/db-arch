--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3

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
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.chat_messages (
    id integer NOT NULL,
    message text NOT NULL,
    user_id integer,
    stream_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.chat_messages OWNER TO "user";

--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.chat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_messages_id_seq OWNER TO "user";

--
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer,
    type character varying NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.notifications OWNER TO "user";

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO "user";

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.recommendations (
    id integer NOT NULL,
    user_id integer,
    recommended_stream_id integer,
    recommended_category character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.recommendations OWNER TO "user";

--
-- Name: recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recommendations_id_seq OWNER TO "user";

--
-- Name: recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.recommendations_id_seq OWNED BY public.recommendations.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role_name character varying,
    weight integer
);


ALTER TABLE public.roles OWNER TO "user";

--
-- Name: roles_functionalities; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.roles_functionalities (
    role_id integer,
    functionality_id integer NOT NULL,
    min_weight_required integer NOT NULL
);


ALTER TABLE public.roles_functionalities OWNER TO "user";

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO "user";

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: stream_viewers; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.stream_viewers (
    stream_id integer NOT NULL,
    viewer_id integer NOT NULL
);


ALTER TABLE public.stream_viewers OWNER TO "user";

--
-- Name: streams; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.streams (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying,
    category character varying,
    duration interval,
    viewers_count integer,
    user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.streams OWNER TO "user";

--
-- Name: streams_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.streams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.streams_id_seq OWNER TO "user";

--
-- Name: streams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.streams_id_seq OWNED BY public.streams.id;


--
-- Name: subscribed_users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.subscribed_users (
    id integer NOT NULL,
    subscribing_user_id integer,
    subscribed_user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.subscribed_users OWNER TO "user";

--
-- Name: subscribed_users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.subscribed_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscribed_users_id_seq OWNER TO "user";

--
-- Name: subscribed_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.subscribed_users_id_seq OWNED BY public.subscribed_users.id;


--
-- Name: subscribers; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.subscribers (
    id integer NOT NULL,
    subscribing_user_id integer,
    subscribed_user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.subscribers OWNER TO "user";

--
-- Name: subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.subscribers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscribers_id_seq OWNER TO "user";

--
-- Name: subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.subscribers_id_seq OWNED BY public.subscribers.id;


--
-- Name: transactions_money; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transactions_money (
    id integer NOT NULL,
    amount numeric NOT NULL,
    sender_user_id integer,
    receiver_user_id integer,
    transaction_type character varying NOT NULL,
    status character varying NOT NULL,
    stream_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.transactions_money OWNER TO "user";

--
-- Name: transactions_money_after_2020; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transactions_money_after_2020 (
    CONSTRAINT transactions_money_after_2020_created_at_check CHECK ((created_at >= '2020-01-01'::date))
)
INHERITS (public.transactions_money);


ALTER TABLE public.transactions_money_after_2020 OWNER TO "user";

--
-- Name: transactions_money_before_2020; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transactions_money_before_2020 (
    CONSTRAINT transactions_money_before_2020_created_at_check CHECK ((created_at < '2020-01-01'::date))
)
INHERITS (public.transactions_money);


ALTER TABLE public.transactions_money_before_2020 OWNER TO "user";

--
-- Name: transactions_money_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.transactions_money_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_money_id_seq OWNER TO "user";

--
-- Name: transactions_money_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.transactions_money_id_seq OWNED BY public.transactions_money.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    role_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: recommendations id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recommendations ALTER COLUMN id SET DEFAULT nextval('public.recommendations_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: streams id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.streams ALTER COLUMN id SET DEFAULT nextval('public.streams_id_seq'::regclass);


--
-- Name: subscribed_users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.subscribed_users ALTER COLUMN id SET DEFAULT nextval('public.subscribed_users_id_seq'::regclass);


--
-- Name: subscribers id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.subscribers ALTER COLUMN id SET DEFAULT nextval('public.subscribers_id_seq'::regclass);


--
-- Name: transactions_money id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money ALTER COLUMN id SET DEFAULT nextval('public.transactions_money_id_seq'::regclass);


--
-- Name: transactions_money_after_2020 id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money_after_2020 ALTER COLUMN id SET DEFAULT nextval('public.transactions_money_id_seq'::regclass);


--
-- Name: transactions_money_after_2020 created_at; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money_after_2020 ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: transactions_money_before_2020 id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money_before_2020 ALTER COLUMN id SET DEFAULT nextval('public.transactions_money_id_seq'::regclass);


--
-- Name: transactions_money_before_2020 created_at; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money_before_2020 ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.chat_messages (id, message, user_id, stream_id, created_at) FROM stdin;
1	Facere fugit sunt quia.	37	27	2024-05-20 10:21:38.836197
2	Aliquam aut tempora eius porro vel omnis sequi at odit.	25	3	2024-05-20 10:21:38.837714
3	Sapiente adipisci sed.	18	37	2024-05-20 10:21:38.839369
4	Cum sed alias veritatis aut incidunt nobis consequatur.	21	35	2024-05-20 10:21:38.842277
5	Perferendis dolorem voluptatem est corrupti minima velit nemo.	28	11	2024-05-20 10:21:38.845659
6	Alias maiores quia molestiae et distinctio debitis officiis.	22	4	2024-05-20 10:21:38.847078
7	Rerum veniam fuga eos inventore qui ratione similique molestiae.	20	37	2024-05-20 10:21:38.848735
8	Quia ut ducimus est facere quas.	24	29	2024-05-20 10:21:38.850223
9	Est sed culpa mollitia ad et in assumenda.	6	2	2024-05-20 10:21:38.852367
10	Ad ut amet adipisci provident cumque unde ut amet soluta.	1	27	2024-05-20 10:21:38.853895
11	Consequatur quo quia.	17	14	2024-05-20 10:21:38.855438
12	Sequi doloremque autem repellat.	28	13	2024-05-20 10:21:38.857841
13	Reiciendis cum quaerat tenetur exercitationem ut laborum ea reiciendis.	29	24	2024-05-20 10:21:38.859634
14	Ex aut tenetur quasi quis.	1	19	2024-05-20 10:21:38.861402
15	Qui error qui itaque id in fugiat alias eos.	28	19	2024-05-20 10:21:38.862678
16	Vel vel fuga sint consectetur adipisci dolores.	21	39	2024-05-20 10:21:38.863746
17	Aut nostrum quaerat sapiente dolor vitae.	31	23	2024-05-20 10:21:38.86476
18	Quidem occaecati corrupti distinctio ea sed quam dicta quos.	40	40	2024-05-20 10:21:38.865607
19	Voluptatibus modi commodi libero aut ut.	7	15	2024-05-20 10:21:38.866754
20	In itaque possimus deserunt ipsam magni sunt.	21	33	2024-05-20 10:21:38.867915
21	Exercitationem dolore porro.	32	23	2024-05-20 10:21:38.869018
22	Eos voluptatem aut sint soluta eum odit officia iusto eos.	7	6	2024-05-20 10:21:38.870139
23	Nisi sit est.	26	25	2024-05-20 10:21:38.870986
24	Rerum mollitia enim inventore repudiandae eveniet omnis aut.	39	8	2024-05-20 10:21:38.872037
25	Eius velit voluptas ullam officia amet rerum.	29	29	2024-05-20 10:21:38.87309
26	Deserunt a et voluptas voluptates consequatur.	2	39	2024-05-20 10:21:38.873858
27	Blanditiis pariatur ipsa soluta est sequi qui a in.	35	21	2024-05-20 10:21:38.874599
28	Molestiae ullam culpa culpa ut et atque velit.	21	28	2024-05-20 10:21:38.875382
29	Eligendi quos in.	17	15	2024-05-20 10:21:38.876178
30	Aut minus id temporibus sunt quasi fuga amet.	38	13	2024-05-20 10:21:38.877113
31	Molestias esse non.	36	22	2024-05-20 10:21:38.878179
32	Tenetur impedit blanditiis iste voluptate ipsum quas vero soluta quis.	26	9	2024-05-20 10:21:38.879221
33	Dolor dolorem dolor.	38	2	2024-05-20 10:21:38.879986
34	Sapiente at enim sit suscipit non.	24	23	2024-05-20 10:21:38.880759
35	Impedit debitis nobis deleniti id quidem.	38	38	2024-05-20 10:21:38.881567
36	Cum est modi eum officiis quam itaque.	15	37	2024-05-20 10:21:38.882663
37	Repellendus ut fugit.	16	30	2024-05-20 10:21:38.884015
38	Molestiae adipisci quo minus autem placeat porro aut odit.	28	33	2024-05-20 10:21:38.885077
39	Quam id aut quam veniam dolorem magni repudiandae sed sit.	2	14	2024-05-20 10:21:38.886473
40	Sint amet voluptas odio aperiam recusandae reprehenderit.	34	35	2024-05-20 10:21:38.887615
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.notifications (id, user_id, type, message, created_at) FROM stdin;
1	15	SQL	Labore iste ipsum qui quia.	2024-05-20 10:21:38.974877
2	18	Tools	Voluptas aut omnis harum sit omnis aut incidunt ratione nesciunt.	2024-05-20 10:21:38.976383
3	5	Nauru	Ipsam sint beatae.	2024-05-20 10:21:38.977231
4	20	array	Qui sint consequatur eum non doloribus.	2024-05-20 10:21:38.978377
5	18	Assimilated	Architecto corrupti sunt perferendis labore in doloremque voluptates quae.	2024-05-20 10:21:38.979124
6	14	Florida	Rem qui ut deleniti odio asperiores.	2024-05-20 10:21:38.979994
7	18	hack	Reiciendis aut libero atque beatae et.	2024-05-20 10:21:38.981042
8	31	efficient	Quis tempore esse tempora dolor consectetur.	2024-05-20 10:21:38.982192
9	11	Ergonomic	Odit voluptas et recusandae.	2024-05-20 10:21:38.983428
10	36	Principal	Nihil earum omnis.	2024-05-20 10:21:38.984234
11	24	Stravenue	Facere aspernatur quia odit.	2024-05-20 10:21:38.985328
12	40	Vision-oriented	Non reprehenderit exercitationem fugit nobis consequuntur nihil corrupti.	2024-05-20 10:21:38.986714
13	29	monitor	Id beatae suscipit nobis.	2024-05-20 10:21:38.988054
14	16	systemic	Laborum eum pariatur quas nesciunt.	2024-05-20 10:21:38.989436
15	22	RSS	Aut distinctio aut est eaque non.	2024-05-20 10:21:38.990457
16	31	HTTP	Blanditiis soluta ab sit sed nobis.	2024-05-20 10:21:38.991553
17	37	bypass	Culpa odio inventore.	2024-05-20 10:21:38.992246
18	19	IB	Consectetur non ut ducimus consequatur et odio natus.	2024-05-20 10:21:38.992926
19	19	Faroe Islands	Et accusamus animi.	2024-05-20 10:21:38.99384
20	23	Incredible	Quidem nihil voluptatem cupiditate.	2024-05-20 10:21:38.994659
21	4	Dynamic	Aut vitae qui minus impedit sapiente.	2024-05-20 10:21:38.995806
22	29	Uzbekistan	Praesentium fugit illum aperiam ipsa voluptatum laborum.	2024-05-20 10:21:38.996792
23	15	overriding	Eveniet ducimus quam quos aliquid quia et rerum reprehenderit magnam.	2024-05-20 10:21:38.998017
24	13	Creative	Quisquam quis culpa ut aut hic.	2024-05-20 10:21:38.99873
25	39	Music, Tools & Music	Aut consectetur dolor eveniet reprehenderit at nihil ea aut occaecati.	2024-05-20 10:21:39.000007
26	23	Yemen	Soluta quasi nihil ut ut ut neque.	2024-05-20 10:21:39.000784
27	23	User-friendly	Enim facere quia.	2024-05-20 10:21:39.001555
28	36	Personal Loan Account	Aut et repellat nulla aut repellendus.	2024-05-20 10:21:39.002472
29	16	upward-trending	Autem sint quae aut sed dolor aperiam dicta fugit.	2024-05-20 10:21:39.003207
30	20	hack	Consequatur voluptas fugit eum numquam facere.	2024-05-20 10:21:39.004352
31	22	Springs	Totam odio in sit.	2024-05-20 10:21:39.005087
32	3	Specialist	Vero totam sit harum ratione quidem.	2024-05-20 10:21:39.005817
33	22	Integration	Possimus quisquam voluptate tempora architecto.	2024-05-20 10:21:39.006564
34	30	Chief	Voluptatem magnam culpa hic neque architecto eum earum.	2024-05-20 10:21:39.007305
35	20	South Carolina	Consectetur alias et quo laborum.	2024-05-20 10:21:39.008005
36	22	Representative	Vero nihil sequi autem nihil.	2024-05-20 10:21:39.008738
37	31	deliver	Minima earum ipsa.	2024-05-20 10:21:39.009557
38	35	Practical	Rem dolore neque quo libero hic illo quasi.	2024-05-20 10:21:39.010274
39	13	Handcrafted Fresh Shoes	Alias sunt animi quisquam nemo eos autem beatae minima.	2024-05-20 10:21:39.011027
40	11	Secured	Consequatur quibusdam sint expedita nobis.	2024-05-20 10:21:39.012145
\.


--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.recommendations (id, user_id, recommended_stream_id, recommended_category, created_at) FROM stdin;
1	20	21	Dalasi	2024-05-20 10:21:39.013252
2	17	35	Mountains	2024-05-20 10:21:39.01442
3	6	21	asymmetric	2024-05-20 10:21:39.015476
4	2	17	Generic	2024-05-20 10:21:39.016207
5	36	24	silver	2024-05-20 10:21:39.016911
6	7	37	input	2024-05-20 10:21:39.017708
7	13	29	Alley	2024-05-20 10:21:39.018865
8	18	33	Movies	2024-05-20 10:21:39.019587
9	10	34	Research	2024-05-20 10:21:39.020314
10	13	8	Home Loan Account	2024-05-20 10:21:39.021078
11	29	29	navigating	2024-05-20 10:21:39.021805
12	12	34	high-level	2024-05-20 10:21:39.022503
13	14	4	Lock	2024-05-20 10:21:39.023198
14	24	21	Pennsylvania	2024-05-20 10:21:39.023986
15	36	27	user-centric	2024-05-20 10:21:39.024702
16	37	22	Oklahoma	2024-05-20 10:21:39.025468
17	15	32	deposit	2024-05-20 10:21:39.026195
18	34	27	incentivize	2024-05-20 10:21:39.026951
19	37	10	Unbranded Fresh Fish	2024-05-20 10:21:39.027702
20	25	10	maroon	2024-05-20 10:21:39.028679
21	2	30	Small	2024-05-20 10:21:39.029684
22	36	20	e-tailers	2024-05-20 10:21:39.030643
23	17	36	wireless	2024-05-20 10:21:39.031697
24	6	5	Radial	2024-05-20 10:21:39.032744
25	22	3	Estonia	2024-05-20 10:21:39.03356
26	19	22	Avenue	2024-05-20 10:21:39.034265
27	16	25	next-generation	2024-05-20 10:21:39.035033
28	2	21	ability	2024-05-20 10:21:39.035745
29	36	16	mindshare	2024-05-20 10:21:39.036494
30	18	2	Frozen	2024-05-20 10:21:39.037354
31	25	23	Wooden	2024-05-20 10:21:39.038358
32	8	25	Berkshire	2024-05-20 10:21:39.039037
33	15	20	user-centric	2024-05-20 10:21:39.039868
34	21	12	digital	2024-05-20 10:21:39.040569
35	26	2	Awesome	2024-05-20 10:21:39.041304
36	37	14	Tasty	2024-05-20 10:21:39.042052
37	28	40	Human	2024-05-20 10:21:39.042793
38	33	8	International	2024-05-20 10:21:39.043534
39	24	16	generate	2024-05-20 10:21:39.044224
40	30	25	productize	2024-05-20 10:21:39.044964
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.roles (id, role_name, weight) FROM stdin;
1	grey	16
2	back-end	2
3	harness	67
4	Ports	65
5	cyan	28
6	Dynamic	7
7	Shoal	13
8	24/365	7
9	maroon	11
10	Division	50
11	Applications	81
12	Right-sized	61
13	Gardens	5
14	generating	24
15	turquoise	100
16	compelling	13
17	sensor	71
18	Mongolia	60
19	archive	79
20	info-mediaries	11
21	Intranet	78
22	context-sensitive	97
23	EXE	59
24	monetize	58
25	Bedfordshire	91
26	partnerships	62
27	Berkshire	46
28	Handmade Soft Chips	55
29	withdrawal	32
30	Director	76
31	Fantastic Cotton Keyboard	16
32	driver	5
33	action-items	65
34	IB	66
35	Human	70
36	out-of-the-box	23
37	optimal	52
38	protocol	19
39	backing up	26
40	Engineer	56
\.


--
-- Data for Name: roles_functionalities; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.roles_functionalities (role_id, functionality_id, min_weight_required) FROM stdin;
33	132	73
14	313	50
19	127	20
1	550	92
16	765	76
19	752	45
28	343	8
13	916	32
13	546	28
12	298	18
11	101	13
16	221	54
15	517	71
20	715	2
15	470	41
26	616	63
8	40	83
16	107	44
23	43	75
6	558	75
9	397	87
14	613	96
4	407	72
29	808	63
18	537	38
5	500	6
20	224	84
15	715	86
7	780	74
15	503	77
3	560	24
19	194	57
5	501	75
26	975	1
40	847	64
31	250	22
40	200	3
25	486	67
17	796	78
26	795	23
\.


--
-- Data for Name: stream_viewers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.stream_viewers (stream_id, viewer_id) FROM stdin;
1	18
2	29
3	32
4	10
5	33
6	33
7	22
8	31
9	37
10	35
11	35
12	15
13	31
14	23
15	22
16	6
17	12
18	15
19	39
20	21
21	9
22	36
23	17
24	20
25	30
26	37
27	39
28	4
29	14
30	31
31	18
32	38
33	12
34	21
35	16
36	5
37	3
38	16
39	31
40	18
\.


--
-- Data for Name: streams; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.streams (id, title, description, category, duration, viewers_count, user_id, created_at) FROM stdin;
1	Quod blanditiis quam officiis consequatur illum omnis.	Voluptates quasi quasi perspiciatis fugiat soluta quia itaque minima quidem. Illum esse ullam sed. Consequatur recusandae saepe ipsa nulla occaecati totam.	lol	03:01:00	8028	13	2024-05-20 10:21:38.731871
2	Est nemo eaque.	Accusamus voluptas officiis veritatis expedita et a molestiae aut. Totam repudiandae sed deserunt officiis consequatur dignissimos. Inventore ut pariatur.	lol	02:40:00	3693	26	2024-05-20 10:21:38.733408
3	Quam voluptatem laboriosam aliquid doloribus ducimus.	Fuga occaecati itaque molestias quia et quia. Facilis veritatis debitis nostrum et laboriosam optio libero. Eos libero nisi pariatur. Et cum quod modi labore provident. Nostrum odit ut est eius soluta.	lol	03:18:00	1302	3	2024-05-20 10:21:38.734418
4	Et dolores inventore consequuntur nam sed aut doloribus.	Mollitia praesentium omnis ut magni doloremque ullam. Et vero unde error voluptatum omnis temporibus in libero. Nulla dolorum vel nihil vel.	lol	00:45:00	6649	19	2024-05-20 10:21:38.736042
5	Ut magni facilis quasi ipsam.	Rerum alias accusamus sit amet dolore cumque velit id natus. Ea dolores numquam. In in illo et nobis et voluptate rerum blanditiis.	lol	02:01:00	5761	30	2024-05-20 10:21:38.737286
6	Pariatur velit sapiente blanditiis.	Qui eum et quis omnis. Nostrum ut et. Nemo rerum error dolor qui est qui quia ducimus accusantium. Suscipit asperiores iure aperiam velit incidunt cum magnam. Non ad magni voluptatum labore libero at dolore aut quia.	lol	03:17:00	6292	18	2024-05-20 10:21:38.738381
7	Vero eligendi quaerat in commodi hic nisi repudiandae.	Dolores molestiae nobis modi cumque. Eum vel amet sunt. Doloremque aliquid sint dolor minus sed consequatur.	lol	00:20:00	8150	2	2024-05-20 10:21:38.739418
8	Omnis aspernatur dolores cum repellendus.	Ea in quis suscipit ut corporis ea eum dignissimos error. Consequatur voluptas qui aut eligendi esse. Omnis non quia dignissimos iste nesciunt soluta dolorum voluptatem quis. Omnis voluptatem iste harum. Molestiae laboriosam dolor neque odio laudantium.	lol	02:26:00	7673	27	2024-05-20 10:21:38.740143
9	Fuga numquam incidunt dolores dolores qui fuga est voluptatibus.	Ea iste architecto consequatur. Est distinctio ullam quibusdam quo ducimus debitis eum. Aliquid vero dolor voluptatem ipsum. Voluptas facere aliquam consequatur doloribus vel excepturi. Est distinctio blanditiis reprehenderit expedita eos aut placeat eos in.	lol	02:28:00	8707	38	2024-05-20 10:21:38.740896
10	Veniam numquam architecto voluptatum.	Cum aut eius non laudantium laboriosam maxime. Dignissimos placeat reiciendis voluptate nulla omnis. Natus quia ratione quia assumenda doloribus occaecati. Omnis est accusantium saepe esse ut ut amet consequatur culpa. Itaque sed enim aspernatur enim numquam a blanditiis dolores consectetur.	lol	02:47:00	9415	9	2024-05-20 10:21:38.741964
11	Voluptatibus odio adipisci eos doloremque.	Distinctio enim sit suscipit tempora natus quasi hic necessitatibus placeat. Sit expedita sunt alias. Omnis dignissimos explicabo vero ut qui ut. Dolorum deleniti qui optio. Est quam ad qui sed neque cupiditate. Quaerat et atque sed vel pariatur autem voluptatum.	lol	01:41:00	528	2	2024-05-20 10:21:38.742969
12	Ducimus repudiandae asperiores accusamus.	Exercitationem aut perferendis. Nihil modi saepe odit voluptatum laboriosam iusto ratione. Animi libero incidunt sit.	lol	01:38:00	6968	9	2024-05-20 10:21:38.74398
13	Officia perferendis ex vel sunt ex optio aperiam.	Est iusto temporibus ducimus tempora sint beatae ea quis quo. Rerum quasi accusamus voluptatum ut recusandae nobis. Amet at quam quis ut id perspiciatis. Alias provident magni occaecati porro alias. Dolores non voluptatem.	lol	03:40:00	2707	14	2024-05-20 10:21:38.745417
14	Similique ullam molestiae asperiores voluptatem cumque ratione.	Ipsum et necessitatibus officiis ducimus. Qui nihil deleniti voluptatem dolorem tenetur cum. Autem dolores est similique. Quia a debitis suscipit. Qui praesentium commodi fugit architecto molestiae vitae qui suscipit. Corrupti placeat doloremque culpa perferendis.	lol	00:24:00	9426	16	2024-05-20 10:21:38.746121
15	Nihil dicta ut explicabo id aut.	Eum rerum asperiores nam officiis illum quis. Aperiam voluptatibus impedit. Dolor qui qui.	lol	02:45:00	5061	17	2024-05-20 10:21:38.746924
16	Sapiente commodi error.	Hic molestiae quae laudantium laborum dicta. Voluptas animi aliquid sit officia distinctio. Dicta iure reiciendis totam consequatur sint consequatur qui. Velit accusamus maiores doloribus quia. Porro beatae fugit velit officiis et omnis aut.	lol	03:54:00	4423	20	2024-05-20 10:21:38.748013
17	Quas sint dolor nemo sit animi.	Quia voluptatem est dignissimos. Ut blanditiis et explicabo numquam. Consectetur eum facere rerum perspiciatis et eos perferendis et cum. Qui consequuntur excepturi dolor sequi mollitia. Ad dolores vitae voluptates eligendi. Nobis ea consectetur eum laborum incidunt architecto consectetur quo provident.	lol	02:46:00	7074	25	2024-05-20 10:21:38.749348
18	Expedita sed omnis aut.	Fugiat nesciunt quis ab laboriosam esse eos officia occaecati. Libero debitis nam possimus sit sit. Impedit eum saepe impedit fuga eaque dolor consequatur aspernatur et. Dolores incidunt nulla velit reiciendis et atque.	lol	01:42:00	7498	28	2024-05-20 10:21:38.750296
19	Reiciendis consequatur expedita fuga velit velit facere magnam velit officiis.	Hic quisquam ab voluptatem et aut illo dolor. Quam sed quos accusantium provident consequatur. Quidem aliquam voluptatem nisi sed hic incidunt dolores. Nostrum voluptas quasi amet voluptas possimus neque et laudantium ducimus. Quia consectetur ut explicabo et.	lol	01:50:00	82	4	2024-05-20 10:21:38.751622
20	Voluptas voluptates aut officiis voluptatum cupiditate expedita qui veniam voluptatem.	Aut et amet. Voluptate quia voluptatum sapiente dolores. Praesentium ut mollitia quo libero quia. Totam sapiente aliquam odit perferendis repudiandae.	lol	01:10:00	1853	17	2024-05-20 10:21:38.752598
21	Est officia modi aliquid.	Dolorem aut praesentium voluptatem quisquam. Mollitia culpa enim veritatis. Ea esse illo qui. Architecto consequatur veritatis facere exercitationem sit.	lol	00:47:00	9863	13	2024-05-20 10:21:38.753678
22	Eligendi voluptas distinctio eum nisi omnis assumenda ullam.	Praesentium numquam beatae animi et tenetur. Ducimus minima voluptas eum nihil vel explicabo sint illo atque. Ex ducimus alias quia totam non in sit. Iure quae nostrum aut quis ipsa quia libero. Qui optio ipsum deserunt. Ad dolorem velit qui.	lol	02:23:00	2733	29	2024-05-20 10:21:38.754562
23	Accusamus magni ipsam impedit quae quam quis.	Odio facilis et voluptatem temporibus odit. Et tempora placeat cum delectus at accusantium hic. Reiciendis et reiciendis enim quisquam dolor eligendi rerum est.	lol	02:24:00	6769	4	2024-05-20 10:21:38.755748
24	Iusto velit facere pariatur placeat ea ullam blanditiis.	Et est et ab et adipisci consectetur rerum et. Corrupti veniam dolore reprehenderit dicta. Illo ea cum dolor repellendus.	lol	02:28:00	4053	26	2024-05-20 10:21:38.756885
25	Impedit in eos.	Aliquid nisi molestiae quis. Architecto maxime ab sit. Quam molestiae reiciendis provident ut expedita tempore. Ut dicta nostrum voluptatem sed ipsa odit dolore velit earum. Est libero ab praesentium. Omnis saepe omnis praesentium facilis similique quidem nam.	lol	01:05:00	1479	36	2024-05-20 10:21:38.75798
26	Assumenda qui similique aut qui aut.	Voluptatem in voluptas ad veniam dolores nulla dolorem recusandae. Quasi maxime consequatur mollitia. Hic molestiae est molestias exercitationem.	lol	02:09:00	9891	36	2024-05-20 10:21:38.759515
27	Sed voluptate veritatis consequatur molestias.	Vitae eaque magnam cum exercitationem. Aliquid itaque quas id. Laboriosam sunt ipsa nihil et et quaerat repudiandae eum alias. Numquam nam voluptatem tenetur voluptatem corporis facere maxime consequatur. Eligendi velit repudiandae error et.	lol	01:03:00	8126	6	2024-05-20 10:21:38.760584
28	Reiciendis magni ducimus unde amet magnam pariatur.	Dolore repudiandae mollitia ut voluptatem nihil ab. Accusamus consequatur voluptas et quaerat autem non molestiae ipsum. Autem sunt fugit aut voluptas deleniti id est. Sunt inventore sed earum explicabo autem sed. Aspernatur eaque neque.	lol	02:38:00	5885	19	2024-05-20 10:21:38.761731
29	Ullam error saepe placeat consequatur.	Ut optio atque inventore corporis quos cupiditate et. Accusamus vero odit et ea. Quibusdam iure rerum suscipit similique porro soluta omnis et. Nisi quis sapiente nulla iure qui molestiae iusto earum ea. Aut occaecati voluptas accusantium.	lol	00:36:00	2581	31	2024-05-20 10:21:38.76261
30	Iste ullam neque et.	Officia aut quia asperiores velit. Aut occaecati quo quisquam nam exercitationem veritatis. Ab omnis minus inventore quo reprehenderit.	lol	03:45:00	3019	31	2024-05-20 10:21:38.763718
31	Voluptatem voluptate ut.	Consequuntur eos debitis distinctio nulla quisquam corrupti iusto quibusdam aspernatur. Ut eos exercitationem quas. Maiores itaque qui ipsa rem sunt est quasi non vel.	lol	00:19:00	9420	40	2024-05-20 10:21:38.764892
32	Repellat voluptatum natus aut aut.	At similique sunt consequatur ea ratione id et iste. Nesciunt ut hic aut aspernatur qui adipisci excepturi et ut. Nam beatae qui. Consequatur hic quas molestias voluptas occaecati voluptatum. Et id dolorum minus quia.	lol	00:08:00	4583	21	2024-05-20 10:21:38.76632
33	Incidunt odit eos eius ut.	Minus quam eligendi minus ipsa repellendus autem qui. Et et omnis rerum enim pariatur ullam. Similique voluptas expedita nihil iste quos. Ut laborum laboriosam repudiandae illum quis est fugit quam non. Nobis animi reiciendis voluptatem. Earum molestiae earum aliquam voluptatem.	lol	01:15:00	6466	29	2024-05-20 10:21:38.767509
34	Labore molestias possimus omnis odio quasi sequi.	Ut necessitatibus dolores. Non totam facilis pariatur aperiam vel. Quibusdam fugiat consequatur. Autem recusandae architecto occaecati repudiandae voluptas. Voluptatem sint a ipsum eaque architecto quia.	lol	00:58:00	2537	23	2024-05-20 10:21:38.769095
35	Porro sed sunt ut hic nihil.	Assumenda quae saepe culpa dolor laudantium perferendis quia. Aut omnis quia nesciunt. Necessitatibus consectetur numquam optio aut dolor quae pariatur accusantium consequuntur. Natus sed harum qui. Reprehenderit eos eos et perferendis in eius. Quae architecto ex veritatis officiis corporis quos qui sunt.	lol	00:43:00	8250	20	2024-05-20 10:21:38.770068
36	Et eaque qui.	Praesentium accusantium enim corporis laborum eveniet est quod expedita. Iusto officiis rem qui. Doloribus at voluptatem sint architecto optio provident perferendis esse. Sit beatae voluptatem nisi voluptatem totam facilis eveniet corrupti. Dolor corporis delectus quis laboriosam.	lol	01:07:00	8112	17	2024-05-20 10:21:38.7709
37	Eaque autem ut voluptas quia tempora.	Qui nostrum et dolor excepturi voluptas rerum blanditiis porro. Sed laboriosam at ea quasi. Alias aliquid repudiandae non. Est veniam et. Delectus voluptatem totam labore similique. Perferendis aut odio natus.	lol	02:17:00	4037	22	2024-05-20 10:21:38.771712
38	Consequatur ut voluptatem tempore id natus reiciendis.	Quaerat aut deleniti inventore earum numquam temporibus omnis. Sed voluptas maiores atque aperiam ut ea qui qui. Tempore rerum est voluptas aut quod modi iusto. Corporis at natus. Ut aliquid qui magnam odio ipsa commodi qui dolor dolor.	lol	01:25:00	7427	19	2024-05-20 10:21:38.772872
39	Aut et labore sed atque nostrum voluptatem.	Veritatis corrupti odit. Nesciunt itaque voluptas accusantium iure. Quae sequi quo quas voluptatem.	lol	03:17:00	8797	32	2024-05-20 10:21:38.773956
40	Sunt rerum eligendi libero praesentium et recusandae quaerat.	Voluptatum vitae voluptatem et vel incidunt a. Sed iure nostrum rerum sint neque aut nesciunt fuga. Vitae et et cupiditate.	lol	01:12:00	6677	21	2024-05-20 10:21:38.775079
\.


--
-- Data for Name: subscribed_users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.subscribed_users (id, subscribing_user_id, subscribed_user_id, created_at) FROM stdin;
1	16	7	2024-05-20 10:21:38.933416
2	14	40	2024-05-20 10:21:38.934749
3	13	11	2024-05-20 10:21:38.935855
4	13	37	2024-05-20 10:21:38.937211
5	17	1	2024-05-20 10:21:38.938599
6	14	1	2024-05-20 10:21:38.939999
7	13	25	2024-05-20 10:21:38.941276
8	14	30	2024-05-20 10:21:38.942365
9	17	19	2024-05-20 10:21:38.943492
10	14	28	2024-05-20 10:21:38.944353
11	16	1	2024-05-20 10:21:38.945188
12	14	14	2024-05-20 10:21:38.946366
13	14	26	2024-05-20 10:21:38.947481
14	15	7	2024-05-20 10:21:38.948658
15	14	4	2024-05-20 10:21:38.949735
16	15	17	2024-05-20 10:21:38.950538
17	13	4	2024-05-20 10:21:38.951676
18	14	36	2024-05-20 10:21:38.952766
19	17	11	2024-05-20 10:21:38.953954
20	14	20	2024-05-20 10:21:38.954777
21	13	29	2024-05-20 10:21:38.955903
22	15	23	2024-05-20 10:21:38.957043
23	17	1	2024-05-20 10:21:38.959375
24	17	25	2024-05-20 10:21:38.960672
25	16	2	2024-05-20 10:21:38.961899
26	16	15	2024-05-20 10:21:38.962905
27	14	8	2024-05-20 10:21:38.963975
28	16	33	2024-05-20 10:21:38.964715
29	15	13	2024-05-20 10:21:38.965587
30	15	34	2024-05-20 10:21:38.966504
31	15	28	2024-05-20 10:21:38.967311
32	16	38	2024-05-20 10:21:38.96802
33	16	13	2024-05-20 10:21:38.968729
34	14	34	2024-05-20 10:21:38.969531
35	13	9	2024-05-20 10:21:38.970285
36	14	12	2024-05-20 10:21:38.971033
37	16	7	2024-05-20 10:21:38.971737
38	13	2	2024-05-20 10:21:38.972523
39	13	20	2024-05-20 10:21:38.973276
40	15	29	2024-05-20 10:21:38.974034
\.


--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.subscribers (id, subscribing_user_id, subscribed_user_id, created_at) FROM stdin;
1	39	33	2024-05-20 10:21:38.888747
2	3	39	2024-05-20 10:21:38.889962
3	20	3	2024-05-20 10:21:38.891015
4	2	3	2024-05-20 10:21:38.892923
5	33	1	2024-05-20 10:21:38.894045
6	27	18	2024-05-20 10:21:38.895004
7	26	11	2024-05-20 10:21:38.896219
8	24	32	2024-05-20 10:21:38.897155
9	16	20	2024-05-20 10:21:38.898414
10	4	21	2024-05-20 10:21:38.899473
11	6	8	2024-05-20 10:21:38.900595
12	20	7	2024-05-20 10:21:38.901653
13	17	25	2024-05-20 10:21:38.902482
14	33	15	2024-05-20 10:21:38.90355
15	28	23	2024-05-20 10:21:38.904693
16	33	15	2024-05-20 10:21:38.905881
17	10	17	2024-05-20 10:21:38.906694
18	35	6	2024-05-20 10:21:38.907807
19	39	13	2024-05-20 10:21:38.908568
20	20	37	2024-05-20 10:21:38.909742
21	18	11	2024-05-20 10:21:38.910706
22	10	39	2024-05-20 10:21:38.911743
23	16	13	2024-05-20 10:21:38.912868
24	3	38	2024-05-20 10:21:38.91402
25	9	29	2024-05-20 10:21:38.915224
26	12	18	2024-05-20 10:21:38.916351
27	3	7	2024-05-20 10:21:38.917235
28	40	10	2024-05-20 10:21:38.918365
29	17	30	2024-05-20 10:21:38.919459
30	36	36	2024-05-20 10:21:38.920598
31	14	16	2024-05-20 10:21:38.921713
32	40	29	2024-05-20 10:21:38.922541
33	26	22	2024-05-20 10:21:38.923312
34	29	2	2024-05-20 10:21:38.924454
35	23	27	2024-05-20 10:21:38.926542
36	24	18	2024-05-20 10:21:38.927766
37	9	1	2024-05-20 10:21:38.928879
38	21	23	2024-05-20 10:21:38.929729
39	24	23	2024-05-20 10:21:38.930882
40	21	18	2024-05-20 10:21:38.932271
\.


--
-- Data for Name: transactions_money; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_money (id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at) FROM stdin;
1	295.868820122181712	18	13	withdrawal	completed	13	2019-03-20 13:56:10.492897
2	457.321960301907052	12	5	invoice	completed	17	2014-01-07 08:21:29.313098
3	569.997139060882351	30	21	withdrawal	pending	2	2009-09-01 14:44:16.348125
4	574.775384681176408	36	16	payment	completed	19	2009-01-17 15:58:50.307678
5	280.662654291179932	21	1	deposit	completed	19	2021-09-05 01:01:10.035597
6	129.783575249495767	25	36	withdrawal	failed	20	2014-10-18 11:27:43.437613
7	203.276961624299635	21	2	deposit	completed	33	2008-12-12 15:46:20.216468
8	402.546972329245504	40	35	withdrawal	pending	21	2016-07-15 07:08:22.5537
9	813.239551469157769	29	6	invoice	pending	9	2010-03-06 20:16:12.659862
10	674.65928574355708	10	12	payment	pending	26	2023-09-04 17:41:06.193373
11	157.390541822802286	11	2	payment	completed	8	2017-03-24 10:56:45.440271
12	84.2946457873232656	2	30	deposit	pending	12	2022-10-24 17:15:52.393547
13	779.023295830675396	1	33	deposit	pending	14	2019-09-10 21:09:30.001317
14	960.267322825523101	34	20	invoice	completed	32	2023-04-18 16:58:20.351474
15	680.035791850468174	27	9	payment	completed	35	2013-11-24 16:01:35.22271
16	308.861864265082618	7	35	deposit	failed	38	2024-12-09 23:31:35.981772
17	557.75122256201689	29	2	withdrawal	completed	24	2021-12-21 08:39:14.986054
18	836.744774067018559	7	11	deposit	pending	4	2012-02-05 04:43:25.739362
19	610.884160261688395	35	36	deposit	completed	25	2013-11-29 01:20:43.71187
20	42.2807697242021818	14	24	withdrawal	pending	29	2021-02-09 07:57:46.098948
21	965.039570667192565	32	10	invoice	pending	5	2017-06-03 12:27:31.785946
22	749.999704923684937	9	15	deposit	failed	23	2011-03-23 14:58:20.694338
23	574.012054156954249	21	12	invoice	failed	15	2010-10-09 17:27:39.444504
24	352.109952384994207	29	18	payment	failed	1	2014-07-11 19:33:58.936512
25	782.076945780231184	20	6	withdrawal	completed	19	2022-11-14 22:21:32.399754
26	325.202782593073024	29	5	deposit	completed	5	2010-06-01 16:22:00.847505
27	41.7241763260680646	1	28	payment	failed	30	2024-09-19 20:41:36.218758
28	434.856437052382837	27	35	withdrawal	failed	37	2015-10-20 10:19:51.251805
29	624.630902318511013	12	22	deposit	pending	28	2019-03-27 07:23:11.666309
30	616.549915525126267	15	35	payment	failed	7	2024-10-31 21:22:17.490746
31	991.565646247180369	39	1	payment	pending	24	2015-02-25 15:42:15.66899
32	280.167559082508403	40	10	invoice	pending	6	2015-08-26 03:25:05.091968
33	244.749529863579034	26	30	invoice	pending	40	2014-05-01 23:50:31.453953
34	507.892908337786567	14	39	withdrawal	pending	29	2011-12-30 19:15:50.793114
35	105.278012630128846	28	2	invoice	failed	2	2009-10-06 20:32:56.420488
36	456.758796758115115	27	25	deposit	failed	30	2023-11-14 05:44:33.166408
37	762.004436834750212	2	11	withdrawal	completed	6	2016-08-13 19:38:43.346178
38	236.610031685727709	37	40	withdrawal	completed	15	2021-09-09 21:04:23.06869
39	471.931437464453242	40	30	invoice	pending	17	2021-10-01 12:39:35.459841
40	535.489724144020087	30	14	invoice	completed	20	2015-01-08 22:36:20.275843
\.


--
-- Data for Name: transactions_money_after_2020; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_money_after_2020 (id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at) FROM stdin;
5	280.662654291179932	21	1	deposit	completed	19	2021-09-05 01:01:10.035597
10	674.65928574355708	10	12	payment	pending	26	2023-09-04 17:41:06.193373
12	84.2946457873232656	2	30	deposit	pending	12	2022-10-24 17:15:52.393547
14	960.267322825523101	34	20	invoice	completed	32	2023-04-18 16:58:20.351474
16	308.861864265082618	7	35	deposit	failed	38	2024-12-09 23:31:35.981772
17	557.75122256201689	29	2	withdrawal	completed	24	2021-12-21 08:39:14.986054
20	42.2807697242021818	14	24	withdrawal	pending	29	2021-02-09 07:57:46.098948
25	782.076945780231184	20	6	withdrawal	completed	19	2022-11-14 22:21:32.399754
27	41.7241763260680646	1	28	payment	failed	30	2024-09-19 20:41:36.218758
30	616.549915525126267	15	35	payment	failed	7	2024-10-31 21:22:17.490746
36	456.758796758115115	27	25	deposit	failed	30	2023-11-14 05:44:33.166408
38	236.610031685727709	37	40	withdrawal	completed	15	2021-09-09 21:04:23.06869
39	471.931437464453242	40	30	invoice	pending	17	2021-10-01 12:39:35.459841
\.


--
-- Data for Name: transactions_money_before_2020; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_money_before_2020 (id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at) FROM stdin;
1	295.868820122181712	18	13	withdrawal	completed	13	2019-03-20 13:56:10.492897
2	457.321960301907052	12	5	invoice	completed	17	2014-01-07 08:21:29.313098
3	569.997139060882351	30	21	withdrawal	pending	2	2009-09-01 14:44:16.348125
4	574.775384681176408	36	16	payment	completed	19	2009-01-17 15:58:50.307678
6	129.783575249495767	25	36	withdrawal	failed	20	2014-10-18 11:27:43.437613
7	203.276961624299635	21	2	deposit	completed	33	2008-12-12 15:46:20.216468
8	402.546972329245504	40	35	withdrawal	pending	21	2016-07-15 07:08:22.5537
9	813.239551469157769	29	6	invoice	pending	9	2010-03-06 20:16:12.659862
11	157.390541822802286	11	2	payment	completed	8	2017-03-24 10:56:45.440271
13	779.023295830675396	1	33	deposit	pending	14	2019-09-10 21:09:30.001317
15	680.035791850468174	27	9	payment	completed	35	2013-11-24 16:01:35.22271
18	836.744774067018559	7	11	deposit	pending	4	2012-02-05 04:43:25.739362
19	610.884160261688395	35	36	deposit	completed	25	2013-11-29 01:20:43.71187
21	965.039570667192565	32	10	invoice	pending	5	2017-06-03 12:27:31.785946
22	749.999704923684937	9	15	deposit	failed	23	2011-03-23 14:58:20.694338
23	574.012054156954249	21	12	invoice	failed	15	2010-10-09 17:27:39.444504
24	352.109952384994207	29	18	payment	failed	1	2014-07-11 19:33:58.936512
26	325.202782593073024	29	5	deposit	completed	5	2010-06-01 16:22:00.847505
28	434.856437052382837	27	35	withdrawal	failed	37	2015-10-20 10:19:51.251805
29	624.630902318511013	12	22	deposit	pending	28	2019-03-27 07:23:11.666309
31	991.565646247180369	39	1	payment	pending	24	2015-02-25 15:42:15.66899
32	280.167559082508403	40	10	invoice	pending	6	2015-08-26 03:25:05.091968
33	244.749529863579034	26	30	invoice	pending	40	2014-05-01 23:50:31.453953
34	507.892908337786567	14	39	withdrawal	pending	29	2011-12-30 19:15:50.793114
35	105.278012630128846	28	2	invoice	failed	2	2009-10-06 20:32:56.420488
37	762.004436834750212	2	11	withdrawal	completed	6	2016-08-13 19:38:43.346178
40	535.489724144020087	30	14	invoice	completed	20	2015-01-08 22:36:20.275843
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, username, role_id, created_at) FROM stdin;
1	Donna91	17	2024-05-20 09:28:22.784185
2	Kattie_McDermott50	32	2024-05-19 12:12:04.85497
3	Oren.Lind	38	2024-05-19 21:57:48.299607
4	Celestino73	11	2024-05-20 05:16:33.54815
5	Ila80	22	2024-05-20 10:10:37.568249
6	Tito48	29	2024-05-19 23:46:13.186147
7	Jane_Larson47	25	2024-05-20 04:46:33.616259
8	Zoe69	20	2024-05-20 05:52:15.381331
9	Evie71	28	2024-05-19 19:50:27.689728
10	Delilah_Towne16	25	2024-05-19 15:52:34.574216
11	Barrett.Armstrong	3	2024-05-19 11:14:16.427639
12	Meda68	36	2024-05-20 02:11:06.192594
13	Dolores51	39	2024-05-19 21:19:42.543738
14	Ricardo_Ruecker	17	2024-05-19 23:16:55.726536
15	Clyde.Gerhold	40	2024-05-19 14:50:18.624696
16	Muriel.Collier75	10	2024-05-19 19:22:50.223014
17	Jordon30	27	2024-05-19 14:45:53.727269
18	Peggie.Howell40	28	2024-05-19 18:10:09.431634
19	Felicita9	40	2024-05-20 04:33:13.279275
20	Bethel_Kautzer16	12	2024-05-20 08:15:23.419624
21	Yessenia.Legros	2	2024-05-20 04:54:25.001045
22	Barbara_Fisher38	33	2024-05-19 14:49:22.874702
23	Pansy_Sawayn	32	2024-05-20 03:57:23.389055
24	Shanon.Streich	11	2024-05-19 20:41:09.327769
25	Deja28	16	2024-05-20 08:54:42.699645
26	Lisette44	9	2024-05-19 11:08:01.329879
27	Tyra.Kilback	22	2024-05-20 07:32:34.198294
28	Tracey_Rempel74	15	2024-05-19 13:16:30.625071
29	Margaret_Jerde	25	2024-05-20 10:03:09.091722
30	Colt31	17	2024-05-20 06:18:22.707552
31	Jamaal37	23	2024-05-20 02:51:30.463042
32	Lilly_Gottlieb10	32	2024-05-20 08:14:44.004448
33	Myra61	5	2024-05-20 05:52:18.056106
34	Daija.Glover	37	2024-05-20 00:33:47.109919
35	Rupert61	7	2024-05-20 08:27:02.407485
36	Efrain68	15	2024-05-20 07:09:39.210829
37	Rebeca_Douglas	38	2024-05-19 19:48:42.039877
38	Sofia.Waters	21	2024-05-19 17:08:53.185603
39	Darryl13	1	2024-05-19 21:43:52.373036
40	Elton_Cruickshank55	14	2024-05-19 13:03:06.437258
\.


--
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.chat_messages_id_seq', 40, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.notifications_id_seq', 40, true);


--
-- Name: recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.recommendations_id_seq', 40, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.roles_id_seq', 40, true);


--
-- Name: streams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.streams_id_seq', 40, true);


--
-- Name: subscribed_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.subscribed_users_id_seq', 40, true);


--
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.subscribers_id_seq', 40, true);


--
-- Name: transactions_money_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.transactions_money_id_seq', 40, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 40, true);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: recommendations recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: stream_viewers stream_viewers_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.stream_viewers
    ADD CONSTRAINT stream_viewers_pkey PRIMARY KEY (stream_id, viewer_id);


--
-- Name: streams streams_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.streams
    ADD CONSTRAINT streams_pkey PRIMARY KEY (id);


--
-- Name: subscribed_users subscribed_users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.subscribed_users
    ADD CONSTRAINT subscribed_users_pkey PRIMARY KEY (id);


--
-- Name: subscribers subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


--
-- Name: transactions_money transactions_money_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money
    ADD CONSTRAINT transactions_money_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_chat_messages_stream_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_chat_messages_stream_id ON public.chat_messages USING btree (stream_id);


--
-- Name: idx_streams_category; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_streams_category ON public.streams USING btree (category);


--
-- Name: idx_subscribed_users_subscribing_user_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_subscribed_users_subscribing_user_id ON public.subscribed_users USING btree (subscribing_user_id);


--
-- Name: idx_transactions_money_after_2020_created_at; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_transactions_money_after_2020_created_at ON public.transactions_money_after_2020 USING btree (created_at);


--
-- Name: idx_transactions_money_before_2020_created_at; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_transactions_money_before_2020_created_at ON public.transactions_money_before_2020 USING btree (created_at);


--
-- Name: idx_transactions_money_created_at; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_transactions_money_created_at ON public.transactions_money USING btree (created_at);


--
-- Name: chat_messages chat_messages_stream_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_stream_id_fkey FOREIGN KEY (stream_id) REFERENCES public.streams(id);


--
-- Name: chat_messages chat_messages_stream_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_stream_id_fkey1 FOREIGN KEY (stream_id) REFERENCES public.streams(id);


--
-- Name: chat_messages chat_messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: chat_messages chat_messages_user_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_user_id_fkey1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: recommendations recommendations_recommended_stream_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_recommended_stream_id_fkey FOREIGN KEY (recommended_stream_id) REFERENCES public.streams(id);


--
-- Name: recommendations recommendations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: roles_functionalities roles_functionalities_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.roles_functionalities
    ADD CONSTRAINT roles_functionalities_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: stream_viewers stream_viewers_stream_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.stream_viewers
    ADD CONSTRAINT stream_viewers_stream_id_fkey FOREIGN KEY (stream_id) REFERENCES public.streams(id);


--
-- Name: stream_viewers stream_viewers_viewer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.stream_viewers
    ADD CONSTRAINT stream_viewers_viewer_id_fkey FOREIGN KEY (viewer_id) REFERENCES public.users(id);


--
-- Name: streams streams_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.streams
    ADD CONSTRAINT streams_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: subscribed_users subscribed_users_subscribed_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.subscribed_users
    ADD CONSTRAINT subscribed_users_subscribed_user_id_fkey FOREIGN KEY (subscribed_user_id) REFERENCES public.users(id);


--
-- Name: subscribed_users subscribed_users_subscribing_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.subscribed_users
    ADD CONSTRAINT subscribed_users_subscribing_user_id_fkey FOREIGN KEY (subscribing_user_id) REFERENCES public.users(id);


--
-- Name: subscribers subscribers_subscribed_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_subscribed_user_id_fkey FOREIGN KEY (subscribed_user_id) REFERENCES public.users(id);


--
-- Name: subscribers subscribers_subscribing_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_subscribing_user_id_fkey FOREIGN KEY (subscribing_user_id) REFERENCES public.users(id);


--
-- Name: transactions_money transactions_money_receiver_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money
    ADD CONSTRAINT transactions_money_receiver_user_id_fkey FOREIGN KEY (receiver_user_id) REFERENCES public.users(id);


--
-- Name: transactions_money transactions_money_sender_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money
    ADD CONSTRAINT transactions_money_sender_user_id_fkey FOREIGN KEY (sender_user_id) REFERENCES public.users(id);


--
-- Name: transactions_money transactions_money_stream_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transactions_money
    ADD CONSTRAINT transactions_money_stream_id_fkey FOREIGN KEY (stream_id) REFERENCES public.streams(id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: TABLE chat_messages; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.chat_messages TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.chat_messages TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.chat_messages TO no_login_group;


--
-- Name: TABLE notifications; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.notifications TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.notifications TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.notifications TO no_login_group;


--
-- Name: TABLE recommendations; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.recommendations TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.recommendations TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.recommendations TO no_login_group;


--
-- Name: TABLE roles; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.roles TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.roles TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.roles TO no_login_group;


--
-- Name: TABLE roles_functionalities; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.roles_functionalities TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.roles_functionalities TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.roles_functionalities TO no_login_group;


--
-- Name: TABLE stream_viewers; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.stream_viewers TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.stream_viewers TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.stream_viewers TO no_login_group;


--
-- Name: TABLE streams; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.streams TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.streams TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.streams TO no_login_group;


--
-- Name: TABLE subscribed_users; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.subscribed_users TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.subscribed_users TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.subscribed_users TO no_login_group;


--
-- Name: TABLE subscribers; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.subscribers TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.subscribers TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.subscribers TO no_login_group;


--
-- Name: TABLE transactions_money; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.transactions_money TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.transactions_money TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.transactions_money TO no_login_group;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.users TO reader;
GRANT SELECT,INSERT,UPDATE ON TABLE public.users TO writer;
GRANT SELECT,INSERT,DELETE ON TABLE public.users TO no_login_group;


--
-- PostgreSQL database dump complete
--

