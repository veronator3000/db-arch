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
1	Qui repudiandae molestiae dolore repellat perferendis commodi.	12	23	2024-05-20 08:46:24.947045
2	Culpa et et est expedita accusamus.	17	26	2024-05-20 08:46:24.948592
3	Aut voluptatem eos dolorum sapiente.	20	25	2024-05-20 08:46:24.949634
4	Ut ullam qui consequuntur dolores voluptates.	15	30	2024-05-20 08:46:24.950805
5	Molestias fugit accusantium quidem est provident illo.	24	1	2024-05-20 08:46:24.951804
6	Sed officiis voluptatibus ut.	12	14	2024-05-20 08:46:24.95319
7	Velit debitis aut voluptatem exercitationem quidem officiis.	34	4	2024-05-20 08:46:24.954135
8	Expedita minus nihil dolores molestiae id nostrum molestiae omnis.	7	9	2024-05-20 08:46:24.955274
9	Voluptas autem laboriosam.	36	28	2024-05-20 08:46:24.956317
10	Totam enim et maiores fugit rem.	20	32	2024-05-20 08:46:24.957436
11	Ducimus in veniam velit neque ut et.	16	27	2024-05-20 08:46:24.958612
12	Aut autem assumenda.	18	9	2024-05-20 08:46:24.959604
13	Aliquid excepturi in libero laborum consequuntur rerum iure minus et.	24	5	2024-05-20 08:46:24.960919
14	Qui quod dolorum quia exercitationem qui aperiam pariatur.	15	37	2024-05-20 08:46:24.961965
15	Error et architecto et et debitis veniam at quasi nihil.	35	36	2024-05-20 08:46:24.963381
16	Necessitatibus necessitatibus culpa animi ab ut debitis veritatis ab qui.	9	24	2024-05-20 08:46:24.964539
17	Veritatis molestiae qui deserunt.	31	11	2024-05-20 08:46:24.965698
18	Eum ipsam est aut tempora occaecati enim voluptates.	39	25	2024-05-20 08:46:24.966753
19	Quae non vitae quas mollitia dicta at saepe.	27	16	2024-05-20 08:46:24.967605
20	Aperiam blanditiis sunt.	37	22	2024-05-20 08:46:24.968564
21	Voluptatum et alias.	24	12	2024-05-20 08:46:24.969402
22	Aspernatur ut ut architecto.	10	34	2024-05-20 08:46:24.970572
23	Sunt ut nobis ratione sed voluptates vero.	11	40	2024-05-20 08:46:24.97168
24	Sit accusantium nisi.	1	6	2024-05-20 08:46:24.97242
25	Expedita eum rerum deserunt molestiae amet excepturi et aut.	24	36	2024-05-20 08:46:24.973114
26	Hic enim itaque ut odio rerum tempore dolor voluptatem cum.	33	6	2024-05-20 08:46:24.973915
27	Quo praesentium iusto delectus omnis veniam veritatis culpa.	20	17	2024-05-20 08:46:24.974712
28	Nisi consequatur debitis pariatur culpa.	39	7	2024-05-20 08:46:24.97585
29	Dolorem pariatur nisi natus voluptatum dolores.	8	11	2024-05-20 08:46:24.976636
30	Dolor cupiditate quis quae molestias dolorem.	7	25	2024-05-20 08:46:24.977793
31	Voluptatum sed sint aut est ipsum quod.	11	5	2024-05-20 08:46:24.978935
32	Quisquam tenetur dolorum mollitia vero enim sint id veniam.	37	2	2024-05-20 08:46:24.979723
33	Quas mollitia labore tempore quae quo fugiat non labore.	6	29	2024-05-20 08:46:24.980463
34	Ut aut illum rem et corporis aut quia.	22	2	2024-05-20 08:46:24.98122
35	Excepturi qui labore.	32	27	2024-05-20 08:46:24.982351
36	Incidunt eveniet similique placeat beatae voluptate et quaerat et dolores.	24	7	2024-05-20 08:46:24.983155
37	Rem rerum distinctio voluptatem quam.	17	22	2024-05-20 08:46:24.984273
38	Magni explicabo et qui deleniti.	8	1	2024-05-20 08:46:24.984969
39	Minima voluptatem et quasi officia.	1	1	2024-05-20 08:46:24.985776
40	Sit corrupti rerum dolores.	9	15	2024-05-20 08:46:24.986577
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.notifications (id, user_id, type, message, created_at) FROM stdin;
1	30	capacitor	Consequuntur vel natus.	2024-05-20 08:46:25.062767
2	4	Lilangeni	Cupiditate fugiat eligendi numquam natus in quasi eligendi ipsum.	2024-05-20 08:46:25.063949
3	19	Bedfordshire	Sit quasi velit veniam.	2024-05-20 08:46:25.065053
4	3	instruction set	Perferendis beatae qui sit et corporis officia.	2024-05-20 08:46:25.066322
5	17	Holy See (Vatican City State)	Fugit libero officiis libero.	2024-05-20 08:46:25.067319
6	27	green	Voluptates qui sit.	2024-05-20 08:46:25.0684
7	25	Hawaii	Et sunt quis soluta esse.	2024-05-20 08:46:25.069503
8	25	value-added	Ut eius enim id et sunt.	2024-05-20 08:46:25.070687
9	4	indexing	Dolorum doloremque magnam sed minus totam.	2024-05-20 08:46:25.071768
10	26	CFA Franc BEAC	Omnis reprehenderit voluptatem illum.	2024-05-20 08:46:25.072906
11	19	primary	Inventore in autem minus ea delectus similique.	2024-05-20 08:46:25.074038
12	27	utilisation	Maxime dolor expedita soluta.	2024-05-20 08:46:25.075186
13	17	Way	Molestiae quia iste necessitatibus et.	2024-05-20 08:46:25.075885
14	26	Multi-lateral	Ut veritatis dolores qui laborum explicabo aut.	2024-05-20 08:46:25.076669
15	29	AGP	Ut molestiae asperiores numquam aut vel quibusdam.	2024-05-20 08:46:25.077585
16	21	rich	Qui consectetur earum voluptatibus aut dolorem consequatur.	2024-05-20 08:46:25.078359
17	35	zero administration	Et officia aut est est nostrum possimus.	2024-05-20 08:46:25.079476
18	34	Gorgeous Frozen Chips	Modi aliquam aut officia in voluptas voluptas aut itaque.	2024-05-20 08:46:25.08024
19	10	Health & Tools	Aperiam quasi optio dolores.	2024-05-20 08:46:25.080933
20	38	Club	Non voluptatem autem rerum eaque ab ut.	2024-05-20 08:46:25.081839
21	16	Michigan	Sed expedita vel perferendis.	2024-05-20 08:46:25.082886
22	22	Won	Et fugit aut alias nesciunt rerum.	2024-05-20 08:46:25.083976
23	19	Intelligent Frozen Cheese	Amet laboriosam quam aut recusandae.	2024-05-20 08:46:25.084855
24	5	orchestrate	Aliquam aut quo exercitationem pariatur molestiae dolores quod.	2024-05-20 08:46:25.08596
25	16	Ethiopian Birr	Voluptatem est voluptas esse ipsam laborum.	2024-05-20 08:46:25.087097
26	19	back-end	Id libero sapiente cum quis libero quasi tempora animi.	2024-05-20 08:46:25.087867
27	2	Auto Loan Account	Neque laborum et expedita.	2024-05-20 08:46:25.08908
28	33	Buckinghamshire	Qui distinctio optio incidunt mollitia at aut.	2024-05-20 08:46:25.090192
29	10	Colorado	Et nihil nihil nulla architecto atque qui excepturi.	2024-05-20 08:46:25.0913
30	12	Metal	Porro omnis neque velit facere ut maxime et quae.	2024-05-20 08:46:25.092631
31	30	Nebraska	Perspiciatis omnis corporis exercitationem.	2024-05-20 08:46:25.093958
32	18	Serbian Dinar	Et et dolores in.	2024-05-20 08:46:25.095024
33	10	Ergonomic Frozen Soap	Provident veniam non facere est.	2024-05-20 08:46:25.096142
34	6	markets	Quia dolores deserunt tempore dolor aut et.	2024-05-20 08:46:25.097029
35	34	visionary	Omnis suscipit dolorum nulla et.	2024-05-20 08:46:25.097804
36	14	Row	Est accusantium quia.	2024-05-20 08:46:25.098565
37	18	Sleek	Necessitatibus sed animi corporis deserunt illum dolorem.	2024-05-20 08:46:25.099332
38	11	Intelligent Plastic Soap	Sint fugiat perferendis saepe quis et laborum corporis libero.	2024-05-20 08:46:25.100124
39	17	Facilitator	Repellendus voluptatibus dolore quo officiis quo.	2024-05-20 08:46:25.101339
40	9	strategize	Iste inventore voluptatum ex.	2024-05-20 08:46:25.102428
\.


--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.recommendations (id, user_id, recommended_stream_id, recommended_category, created_at) FROM stdin;
1	37	17	withdrawal	2024-05-20 08:46:25.103631
2	15	39	User-centric	2024-05-20 08:46:25.104873
3	11	6	Forges	2024-05-20 08:46:25.106133
4	16	11	SMTP	2024-05-20 08:46:25.107146
5	24	19	SAS	2024-05-20 08:46:25.108276
6	9	19	Namibia Dollar	2024-05-20 08:46:25.109445
7	36	5	software	2024-05-20 08:46:25.110285
8	40	17	Som	2024-05-20 08:46:25.111022
9	21	19	system	2024-05-20 08:46:25.112241
10	32	19	Markets	2024-05-20 08:46:25.113469
11	1	1	Producer	2024-05-20 08:46:25.114295
12	2	32	Borders	2024-05-20 08:46:25.115065
13	27	33	Small	2024-05-20 08:46:25.115797
14	11	14	optimize	2024-05-20 08:46:25.116876
15	27	29	bypass	2024-05-20 08:46:25.118061
16	39	25	South Africa	2024-05-20 08:46:25.118801
17	23	13	Creek	2024-05-20 08:46:25.119933
18	10	36	Product	2024-05-20 08:46:25.120646
19	35	36	Automotive, Grocery & Electronics	2024-05-20 08:46:25.121459
20	30	22	FTP	2024-05-20 08:46:25.122605
21	3	20	port	2024-05-20 08:46:25.123346
22	3	19	payment	2024-05-20 08:46:25.124076
23	25	32	rich	2024-05-20 08:46:25.124863
24	21	10	Handmade Steel Table	2024-05-20 08:46:25.125656
25	17	3	Avon	2024-05-20 08:46:25.126365
26	11	38	pixel	2024-05-20 08:46:25.127133
27	26	3	Beauty & Jewelery	2024-05-20 08:46:25.128241
28	40	18	overriding	2024-05-20 08:46:25.128908
29	35	10	invoice	2024-05-20 08:46:25.129737
30	18	29	Outdoors & Books	2024-05-20 08:46:25.13049
31	8	22	extend	2024-05-20 08:46:25.13128
32	5	31	Walk	2024-05-20 08:46:25.132034
33	39	3	teal	2024-05-20 08:46:25.132828
34	10	7	engineer	2024-05-20 08:46:25.133875
35	36	34	visionary	2024-05-20 08:46:25.134653
36	9	11	Refined	2024-05-20 08:46:25.135368
37	14	7	mobile	2024-05-20 08:46:25.13642
38	33	38	override	2024-05-20 08:46:25.137442
39	33	36	Handmade Granite Cheese	2024-05-20 08:46:25.13891
40	26	12	invoice	2024-05-20 08:46:25.140158
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.roles (id, role_name, weight) FROM stdin;
1	Berkshire	16
2	New Mexico	19
3	Games & Music	8
4	plum	18
5	Fresh	24
6	24 hour	27
7	Cayman Islands	50
8	Human	77
9	Gorgeous	6
10	plum	3
11	Compatible	57
12	Azerbaijanian Manat	92
13	Refined Concrete Chair	24
14	24/365	12
15	cross-platform	16
16	Unbranded Cotton Towels	3
17	New York	43
18	copying	9
19	Clothing & Industrial	32
20	compress	1
21	Swaziland	30
22	virtual	64
23	client-driven	80
24	Handcrafted Concrete Fish	69
25	Walks	34
26	reinvent	10
27	impactful	61
28	Alaska	29
29	Jewelery, Books & Kids	43
30	Dominican Peso	100
31	program	11
32	dynamic	49
33	revolutionize	77
34	Bedfordshire	95
35	silver	78
36	azure	51
37	sexy	80
38	Intelligent Plastic Car	45
39	generating	12
40	Jewelery, Industrial & Clothing	6
\.


--
-- Data for Name: roles_functionalities; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.roles_functionalities (role_id, functionality_id, min_weight_required) FROM stdin;
39	743	16
32	989	68
2	521	1
31	369	3
21	642	29
31	913	96
17	307	97
2	439	9
32	800	19
3	786	56
26	625	31
28	282	37
5	926	15
25	690	71
36	441	13
13	46	32
26	550	93
6	805	25
34	570	32
21	106	87
23	402	4
10	463	32
10	237	97
12	410	17
5	72	4
24	752	14
21	629	78
18	366	74
9	422	63
35	53	80
16	841	15
20	521	4
21	993	88
8	6	99
24	239	81
14	531	69
34	240	99
32	142	22
20	992	74
37	579	90
\.


--
-- Data for Name: stream_viewers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.stream_viewers (stream_id, viewer_id) FROM stdin;
1	26
2	29
3	19
4	2
5	36
6	21
7	3
8	40
9	9
10	23
11	12
12	18
13	29
14	33
15	4
16	17
17	35
18	13
19	18
20	22
21	8
22	29
23	13
24	10
25	11
26	33
27	20
28	1
29	10
30	35
31	1
32	39
33	7
34	36
35	36
36	16
37	17
38	18
39	9
40	28
\.


--
-- Data for Name: streams; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.streams (id, title, description, category, duration, viewers_count, user_id, created_at) FROM stdin;
1	Quis tempore qui iste vel iure quasi aut.	Ex natus dignissimos itaque non culpa quia consequatur voluptatibus. Dolor ut provident sed. Tenetur mollitia ut id enim sunt. Incidunt vitae cum exercitationem.	lol	02:34:00	3637	34	2024-05-20 08:46:24.849812
2	Commodi in corporis hic est occaecati aliquid quam.	Consequatur temporibus sapiente repellat. Veniam et ut tempora quos. Ea dignissimos officia nihil expedita hic optio sed dicta.	lol	02:08:00	3320	1	2024-05-20 08:46:24.851632
3	Sed fugit aliquid recusandae tempora id impedit.	Qui facere tenetur rerum est aut doloremque et provident adipisci. Vel beatae placeat eum vel. Voluptatem minima et vitae. Quis dicta iure et ut et accusantium atque accusantium. Ratione et reiciendis et ab saepe aut blanditiis unde.	lol	03:33:00	650	19	2024-05-20 08:46:24.853058
4	Placeat quas repudiandae rem voluptatem pariatur officia ut dicta mollitia.	Vel corrupti eius repellat rerum voluptatem. Rerum quia dolorem omnis vitae eos et modi. In blanditiis est soluta qui sit unde possimus omnis.	lol	03:28:00	1498	39	2024-05-20 08:46:24.854148
5	Voluptates et ullam.	Quibusdam repellendus placeat. Labore ullam non nisi. Enim atque quasi perferendis aut consequuntur provident. Quis sed modi voluptatibus neque voluptate quas ab.	lol	01:02:00	9490	34	2024-05-20 08:46:24.855218
6	Quis commodi dolorem voluptatum omnis.	Eaque consequuntur id. Rerum aut iusto et porro velit illum libero. Qui aliquam beatae totam. Veritatis consectetur distinctio aliquid qui voluptates quo dignissimos.	lol	03:47:00	4156	9	2024-05-20 08:46:24.857586
7	Qui facilis eum tenetur et.	Et consequatur et odit nam. Dolor autem qui tempora rerum ut voluptatem. Fugit nostrum veritatis voluptate atque. Quos tempora quia deserunt reprehenderit tenetur. Autem autem sed. Quibusdam qui voluptate.	lol	01:25:00	1961	8	2024-05-20 08:46:24.859128
8	Vel corporis quidem consequatur omnis consequatur rem qui.	Et cum qui. Aut ex accusamus aut rerum iusto nihil et. Magni repudiandae tenetur sunt ad fugit debitis. Consequatur et vitae unde inventore voluptatem. Aliquid adipisci sit autem.	lol	00:47:00	3875	23	2024-05-20 08:46:24.860346
9	Nihil placeat consequuntur aspernatur omnis qui quos voluptatem aut.	Nulla laboriosam distinctio qui explicabo a dolores eaque id. Cum rerum ipsum eum voluptate est animi. Culpa dolores provident distinctio atque incidunt illo perferendis odio. Dolorum et et unde vel molestias est qui reiciendis. Vel eum autem consectetur qui. Earum sed vero ut laborum a sint et saepe.	lol	01:59:00	9004	25	2024-05-20 08:46:24.861553
10	Suscipit enim voluptatem tempore.	Aut dolores non nulla ex ratione. Similique ut debitis quo eum. Deserunt quia est. Neque nam sed magnam minima quasi similique est omnis delectus.	lol	03:21:00	7754	2	2024-05-20 08:46:24.862962
11	Nihil magnam sed sed et in explicabo omnis similique.	Ipsum dolor molestias. Est architecto dolorum vel corrupti libero tenetur rerum quae. Sit est voluptatem.	lol	00:28:00	9138	39	2024-05-20 08:46:24.864386
12	Quia voluptatum culpa possimus aut quasi.	Excepturi eos sunt non qui eveniet. Sunt inventore rerum cum provident mollitia et eos. Dolorem tenetur voluptatem. Placeat quia quas qui et similique. Laboriosam sed aspernatur corrupti. Sapiente doloremque doloribus.	lol	03:13:00	6256	39	2024-05-20 08:46:24.865636
13	Eum culpa alias cupiditate aut aperiam nesciunt incidunt.	Perspiciatis magnam aliquid. Nulla possimus qui pariatur dolorem aut distinctio officiis aut. Omnis et ipsa eum.	lol	00:58:00	1517	27	2024-05-20 08:46:24.866681
14	Enim eius sint.	Quia est laudantium odio ut quo et. Numquam ipsam eos. Dolore enim ipsam itaque qui qui rem qui. Qui ipsum et quia illo. Sit quae nulla delectus ipsam tenetur delectus atque iure. Reprehenderit error reprehenderit autem quidem aperiam.	lol	01:54:00	7440	39	2024-05-20 08:46:24.867862
15	Et velit molestias est.	Vel voluptatibus qui ad earum dignissimos quasi autem. Vitae omnis aliquam quia qui voluptatum sit nihil tempora neque. Aut dicta sit tenetur pariatur dolor eligendi. Ut optio velit doloribus laborum id officia.	lol	03:14:00	5933	22	2024-05-20 08:46:24.868794
16	Aut repellendus culpa veniam voluptatibus.	Dolorum ad nemo eos nobis et eligendi et neque. Laudantium sit sint nihil. Quas voluptatem commodi ut mollitia repellat et in rerum. Sit reiciendis omnis omnis magni ut. Repellat dolores dignissimos. Nemo nihil facilis expedita.	lol	01:04:00	3981	36	2024-05-20 08:46:24.869873
17	Velit non ut reprehenderit maiores ut.	Dolores consequatur illum optio iusto et a laudantium. Quaerat quia totam magnam alias molestiae. Voluptatem quia et. Placeat autem repudiandae eveniet et blanditiis.	lol	02:43:00	5206	12	2024-05-20 08:46:24.871111
18	Sed hic dolor eum cupiditate.	Alias repellendus qui. Nobis sed corrupti maiores hic quaerat quo. Et quidem quasi porro voluptatem consequatur est ut.	lol	01:28:00	2624	34	2024-05-20 08:46:24.872143
19	At debitis et beatae quam beatae.	Error voluptas quas possimus deserunt sapiente necessitatibus consequuntur nostrum. Veritatis suscipit consequatur. Vel culpa necessitatibus ex quos.	lol	00:16:00	1354	28	2024-05-20 08:46:24.873289
20	Velit consequatur alias quo ut est corrupti.	Dolor est deserunt dolor dolores aut dolor nihil eaque fuga. Nobis quia eius quibusdam in id ex quo quia deleniti. Ipsa vero delectus nesciunt in sapiente dolor dolorem. Molestias reprehenderit reprehenderit et ipsa qui perferendis. Aut a commodi ut dolor sapiente. Iure ut et officiis esse nisi ab.	lol	03:25:00	6980	29	2024-05-20 08:46:24.874673
21	Libero voluptas animi ut labore et.	Odio est eaque. Voluptates animi doloribus fugiat et ut blanditiis. Omnis qui ex suscipit dolores tempora temporibus culpa. Debitis voluptatem repellat cumque veniam praesentium. Sapiente officia nam. Omnis itaque ratione aut dicta.	lol	02:19:00	8539	27	2024-05-20 08:46:24.875735
22	Eum consequatur nemo dolorem.	Quo aut id ea molestias tempora alias. Natus facilis aliquam ad consectetur. Dolore sequi voluptatem ipsam. Voluptas laborum est sint deserunt aut. At iste eveniet molestias et quaerat suscipit magni. Quis recusandae et quia commodi error autem velit fugiat consequatur.	lol	01:07:00	8077	7	2024-05-20 08:46:24.87691
23	Atque ut asperiores laborum aut rerum deleniti.	Labore quam aliquid et et ea voluptas. Quo enim ut et eaque sed odit nisi eos. Dolores ratione dolorem placeat placeat omnis illum reprehenderit cum. Delectus perferendis voluptas voluptatem quia est et et. Voluptatem exercitationem voluptas non.	lol	02:39:00	1823	23	2024-05-20 08:46:24.877977
24	Et quam quidem quaerat.	Fuga est sed veritatis beatae nemo magnam eligendi. Ducimus occaecati sed quia. Quos omnis laudantium consequatur dolorum. Consectetur debitis voluptas nostrum laboriosam.	lol	00:47:00	2796	19	2024-05-20 08:46:24.878952
25	Dolorem et voluptatem quidem ex aut ratione quis vel.	Consequatur autem saepe inventore. Dolore voluptatem quam veniam et eaque sunt quidem quia. Veritatis dolore asperiores officiis sed modi in odio consectetur molestiae. Quidem minus impedit quidem esse saepe ab porro quo. Ea eaque rerum sint nihil. Qui ea accusantium suscipit rerum.	lol	00:39:00	8916	7	2024-05-20 08:46:24.880077
26	Sed est nulla magnam doloribus voluptatem et repudiandae temporibus.	Voluptatem harum sunt quo. Non est et. Numquam culpa nihil necessitatibus doloribus harum quae rerum quas impedit. Iure nulla delectus soluta qui odit at. Porro ratione dolores.	lol	02:14:00	9255	37	2024-05-20 08:46:24.881248
27	Minima perferendis quae fugit et dolorem vel similique vero.	Aut omnis quaerat nam eum atque autem ipsam quae occaecati. Sunt accusantium esse unde fuga. Aut repellat ut quia omnis et possimus id mollitia. Sint sint ut necessitatibus eum est est nihil. Accusamus occaecati necessitatibus accusantium dolores.	lol	01:46:00	7844	1	2024-05-20 08:46:24.8824
28	Ut quis praesentium eveniet sequi ut ipsam.	Voluptas in ex delectus. Omnis tenetur totam. Sunt ratione ut.	lol	01:02:00	6574	5	2024-05-20 08:46:24.883621
29	Blanditiis est dolorum ut rerum.	A vero eius mollitia odit optio magnam enim excepturi omnis. Vel qui quia excepturi minima sed nobis nostrum. Non odit et dolorum fugit nobis vel voluptatum et. Laudantium et voluptatem earum non magnam incidunt.	lol	01:06:00	5428	4	2024-05-20 08:46:24.88474
30	Velit doloremque non harum necessitatibus officiis pariatur.	Laborum ut corrupti voluptas dolorum totam aut aut. Amet iusto totam atque. Omnis suscipit odio. Et est esse possimus enim officiis.	lol	03:51:00	7060	23	2024-05-20 08:46:24.885885
31	Aut quisquam sapiente.	Autem ut ut et impedit voluptas fugiat officia illo. Nostrum sint quis enim tempora sit autem pariatur. Impedit ut voluptatem et veniam ex omnis minus aliquam.	lol	02:06:00	3242	5	2024-05-20 08:46:24.886987
32	Earum vel iusto dolores quae autem possimus consequatur dolor.	Rem perferendis omnis dicta totam vitae non. Nostrum nam blanditiis. Officia nostrum omnis eligendi ipsam vel quidem laboriosam. Numquam hic aperiam neque ullam.	lol	00:57:00	9738	37	2024-05-20 08:46:24.888152
33	Et consectetur dolorum qui est.	Vel eum earum sed veniam eligendi. Soluta beatae error nostrum nobis magnam officiis non omnis qui. Nesciunt voluptas rem. Aspernatur ut ea placeat libero.	lol	03:57:00	975	36	2024-05-20 08:46:24.889105
34	Facilis in recusandae quibusdam at earum voluptatem ad repudiandae aut.	Laboriosam et doloribus ullam odit reprehenderit maiores quia. Quis assumenda at consectetur magni repellendus. Rerum voluptas rerum. Ut nihil repudiandae facere ipsa et ipsum.	lol	02:47:00	2270	40	2024-05-20 08:46:24.89022
35	Vel molestiae nihil velit porro.	Ea molestiae labore nulla illum ea eveniet mollitia quia rerum. Quia dolor dolores inventore voluptas itaque possimus quia sequi. Qui qui eum voluptate voluptatem itaque ad laboriosam. Qui architecto quibusdam aspernatur. Voluptatem blanditiis reprehenderit cumque. Quidem dolores aut quia aut aut est.	lol	02:36:00	8652	22	2024-05-20 08:46:24.891161
36	Porro qui ab non eos assumenda et.	Et rem odit labore ut nemo at repudiandae. Dolore numquam debitis nam est voluptatem. Nesciunt voluptas quas placeat dolorem quibusdam labore repellat.	lol	02:14:00	5810	21	2024-05-20 08:46:24.892135
37	Veniam iusto vitae eaque est totam ad magnam et facere.	Suscipit tempora dolores eos. Dolorem tempora rerum ab reiciendis explicabo. Quasi nesciunt enim voluptas aut architecto iste fugit eos.	lol	03:49:00	3839	34	2024-05-20 08:46:24.893251
38	Odit dolore fugiat aut voluptatem quo esse molestiae ad voluptates.	Tempora et officiis repellat asperiores molestiae est. Adipisci ducimus amet nemo aut repellat voluptate iste ipsam numquam. Est autem libero consequuntur sed perspiciatis et impedit. Et doloremque consectetur.	lol	02:20:00	8644	1	2024-05-20 08:46:24.894216
39	Voluptatem vel et incidunt.	Quia quis sunt id autem ea ratione consequatur. Animi deserunt beatae. Maxime aut dolores iste eos mollitia provident nihil error excepturi. Eius provident cum enim non sunt. Libero corporis id. Adipisci iusto quia sunt quae consequuntur.	lol	01:21:00	7264	19	2024-05-20 08:46:24.895147
40	Natus error facere aut.	Omnis ea ea quos ut dolores nihil dolorum. Numquam dolorem facere accusantium ratione molestiae fugit atque eos aperiam. Et rerum voluptas quia et dignissimos. Et dolores aperiam sit fugiat doloremque illo repellat sunt. Fugit libero odit dolore atque quam voluptatem sit. Adipisci dolor numquam enim libero quo nobis mollitia.	lol	01:15:00	1138	12	2024-05-20 08:46:24.896261
\.


--
-- Data for Name: subscribed_users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.subscribed_users (id, subscribing_user_id, subscribed_user_id, created_at) FROM stdin;
1	17	35	2024-05-20 08:46:25.025571
2	17	8	2024-05-20 08:46:25.026711
3	17	10	2024-05-20 08:46:25.027532
4	6	10	2024-05-20 08:46:25.028617
5	17	28	2024-05-20 08:46:25.029414
6	21	5	2024-05-20 08:46:25.030568
7	17	2	2024-05-20 08:46:25.031279
8	2	16	2024-05-20 08:46:25.032043
9	21	13	2024-05-20 08:46:25.033075
10	22	29	2024-05-20 08:46:25.033863
11	6	12	2024-05-20 08:46:25.03467
12	6	25	2024-05-20 08:46:25.035789
13	17	32	2024-05-20 08:46:25.036916
14	2	31	2024-05-20 08:46:25.037678
15	2	11	2024-05-20 08:46:25.038414
16	2	39	2024-05-20 08:46:25.039159
17	2	29	2024-05-20 08:46:25.039851
18	2	16	2024-05-20 08:46:25.040617
19	22	1	2024-05-20 08:46:25.041386
20	21	28	2024-05-20 08:46:25.042116
21	2	4	2024-05-20 08:46:25.042912
22	17	4	2024-05-20 08:46:25.043652
23	21	12	2024-05-20 08:46:25.044422
24	17	9	2024-05-20 08:46:25.04508
25	17	17	2024-05-20 08:46:25.045905
26	6	34	2024-05-20 08:46:25.046694
27	17	7	2024-05-20 08:46:25.047723
28	21	30	2024-05-20 08:46:25.048667
29	17	6	2024-05-20 08:46:25.04971
30	17	13	2024-05-20 08:46:25.050679
31	22	33	2024-05-20 08:46:25.051707
32	22	28	2024-05-20 08:46:25.052971
33	21	4	2024-05-20 08:46:25.054104
34	6	29	2024-05-20 08:46:25.055238
35	22	40	2024-05-20 08:46:25.056093
36	22	15	2024-05-20 08:46:25.057323
37	21	5	2024-05-20 08:46:25.058447
38	21	35	2024-05-20 08:46:25.059537
39	17	12	2024-05-20 08:46:25.060611
40	21	32	2024-05-20 08:46:25.061698
\.


--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.subscribers (id, subscribing_user_id, subscribed_user_id, created_at) FROM stdin;
1	2	22	2024-05-20 08:46:24.987706
2	6	22	2024-05-20 08:46:24.988848
3	31	10	2024-05-20 08:46:24.989634
4	39	7	2024-05-20 08:46:24.990848
5	12	33	2024-05-20 08:46:24.991983
6	28	28	2024-05-20 08:46:24.993106
7	9	40	2024-05-20 08:46:24.993958
8	33	8	2024-05-20 08:46:24.99515
9	24	29	2024-05-20 08:46:24.996291
10	5	23	2024-05-20 08:46:24.997396
11	6	26	2024-05-20 08:46:24.998506
12	23	14	2024-05-20 08:46:24.999237
13	14	11	2024-05-20 08:46:25
14	21	16	2024-05-20 08:46:25.001042
15	7	35	2024-05-20 08:46:25.001866
16	14	16	2024-05-20 08:46:25.003304
17	21	9	2024-05-20 08:46:25.004247
18	34	9	2024-05-20 08:46:25.005362
19	23	15	2024-05-20 08:46:25.006494
20	24	5	2024-05-20 08:46:25.007863
21	15	32	2024-05-20 08:46:25.008914
22	8	31	2024-05-20 08:46:25.009899
23	37	37	2024-05-20 08:46:25.01093
24	28	22	2024-05-20 08:46:25.012063
25	29	10	2024-05-20 08:46:25.012945
26	12	25	2024-05-20 08:46:25.013936
27	23	18	2024-05-20 08:46:25.014712
28	9	34	2024-05-20 08:46:25.015408
29	11	37	2024-05-20 08:46:25.016215
30	35	18	2024-05-20 08:46:25.016942
31	40	17	2024-05-20 08:46:25.01768
32	13	38	2024-05-20 08:46:25.018435
33	30	34	2024-05-20 08:46:25.019189
34	17	5	2024-05-20 08:46:25.020288
35	21	1	2024-05-20 08:46:25.021004
36	15	3	2024-05-20 08:46:25.021735
37	5	37	2024-05-20 08:46:25.022557
38	9	4	2024-05-20 08:46:25.023267
39	16	18	2024-05-20 08:46:25.02404
40	21	35	2024-05-20 08:46:25.024785
\.


--
-- Data for Name: transactions_money; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_money (id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at) FROM stdin;
1	960.141888350797861	17	33	invoice	completed	25	2012-10-06 15:51:49.830113
2	961.95114847148698	6	34	payment	completed	10	2022-03-30 02:39:33.664783
3	551.538599780786743	7	10	deposit	failed	40	2018-01-10 22:55:16.359087
4	21.6183266520605218	25	19	deposit	pending	2	2013-08-16 23:35:26.928998
5	509.846384266671322	26	12	withdrawal	pending	22	2015-12-14 21:46:53.520378
6	858.849544247921578	30	35	withdrawal	pending	2	2013-01-10 06:04:38.411844
7	57.354299637161491	17	14	deposit	failed	1	2019-02-15 07:51:47.651738
8	640.083444259709863	39	37	payment	completed	27	2013-04-07 16:06:16.474744
9	809.996694634335529	7	28	deposit	pending	29	2023-02-24 02:33:56.898856
10	345.524596183936414	20	27	deposit	completed	27	2013-04-26 17:20:45.26155
11	460.239860931125383	29	11	withdrawal	completed	4	2023-11-11 12:52:31.374281
12	21.5951000806542493	16	18	invoice	failed	33	2023-02-02 02:28:40.063278
13	275.210821212396085	8	7	deposit	failed	14	2013-05-20 16:58:47.734104
14	514.296663250242034	11	16	invoice	completed	9	2024-09-23 23:01:09.855362
15	189.902277004384243	20	20	deposit	pending	27	2008-07-09 07:48:39.880971
16	2.92528839215822401	40	13	payment	pending	35	2011-05-04 07:04:46.718498
17	915.37165154525626	27	13	payment	pending	39	2016-03-09 08:41:11.941057
18	523.132835806391311	2	25	withdrawal	pending	14	2011-06-30 08:10:18.438871
19	477.284879344249765	10	27	withdrawal	failed	27	2023-10-18 19:01:41.620138
20	380.282393564683696	34	30	withdrawal	completed	24	2018-10-23 21:32:42.006476
21	169.010457852170341	9	35	payment	failed	23	2017-06-25 03:54:44.658474
22	567.75912170959225	39	32	invoice	completed	25	2009-06-07 13:01:35.828357
23	336.530812230908182	27	15	invoice	completed	37	2019-08-19 23:20:15.068305
24	797.169368385094186	11	34	withdrawal	failed	26	2024-03-16 10:50:38.369859
25	135.149156282140138	9	12	withdrawal	completed	35	2010-12-20 22:19:52.071102
26	35.7596754151297852	14	37	withdrawal	failed	5	2022-01-29 23:34:02.248685
27	282.325210275101806	30	3	invoice	failed	39	2023-11-23 21:50:17.46597
28	732.783837266131249	34	36	deposit	failed	20	2010-12-02 08:36:58.982116
29	6.62567073681490624	21	23	invoice	completed	27	2023-10-06 12:33:50.563757
30	136.630393315299226	6	29	withdrawal	completed	27	2019-01-14 11:54:22.988623
31	92.2005585613307575	7	25	deposit	completed	33	2023-11-01 03:11:36.18763
32	979.676872152121198	27	40	withdrawal	failed	1	2015-09-14 05:51:34.479342
33	925.028121326423176	13	8	invoice	pending	29	2014-08-25 07:40:11.346674
34	928.857393041252527	17	18	invoice	completed	40	2017-05-28 17:16:55.81163
35	164.445085223906176	32	34	payment	completed	32	2016-03-13 02:32:31.149991
36	749.27209755547585	18	9	invoice	failed	39	2024-04-28 11:42:30.589844
37	979.161197165540956	10	11	withdrawal	failed	22	2018-08-12 21:34:34.740512
38	445.451844205331722	35	16	deposit	completed	4	2010-04-28 17:11:48.770883
39	163.571839407281737	23	14	invoice	failed	23	2011-07-11 09:36:54.476026
40	281.174360891197096	37	39	payment	pending	4	2023-10-15 20:07:10.08006
\.


--
-- Data for Name: transactions_money_after_2020; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_money_after_2020 (id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at) FROM stdin;
2	961.95114847148698	6	34	payment	completed	10	2022-03-30 02:39:33.664783
9	809.996694634335529	7	28	deposit	pending	29	2023-02-24 02:33:56.898856
11	460.239860931125383	29	11	withdrawal	completed	4	2023-11-11 12:52:31.374281
12	21.5951000806542493	16	18	invoice	failed	33	2023-02-02 02:28:40.063278
14	514.296663250242034	11	16	invoice	completed	9	2024-09-23 23:01:09.855362
19	477.284879344249765	10	27	withdrawal	failed	27	2023-10-18 19:01:41.620138
24	797.169368385094186	11	34	withdrawal	failed	26	2024-03-16 10:50:38.369859
26	35.7596754151297852	14	37	withdrawal	failed	5	2022-01-29 23:34:02.248685
27	282.325210275101806	30	3	invoice	failed	39	2023-11-23 21:50:17.46597
29	6.62567073681490624	21	23	invoice	completed	27	2023-10-06 12:33:50.563757
31	92.2005585613307575	7	25	deposit	completed	33	2023-11-01 03:11:36.18763
36	749.27209755547585	18	9	invoice	failed	39	2024-04-28 11:42:30.589844
40	281.174360891197096	37	39	payment	pending	4	2023-10-15 20:07:10.08006
\.


--
-- Data for Name: transactions_money_before_2020; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transactions_money_before_2020 (id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at) FROM stdin;
1	960.141888350797861	17	33	invoice	completed	25	2012-10-06 15:51:49.830113
3	551.538599780786743	7	10	deposit	failed	40	2018-01-10 22:55:16.359087
4	21.6183266520605218	25	19	deposit	pending	2	2013-08-16 23:35:26.928998
5	509.846384266671322	26	12	withdrawal	pending	22	2015-12-14 21:46:53.520378
6	858.849544247921578	30	35	withdrawal	pending	2	2013-01-10 06:04:38.411844
7	57.354299637161491	17	14	deposit	failed	1	2019-02-15 07:51:47.651738
8	640.083444259709863	39	37	payment	completed	27	2013-04-07 16:06:16.474744
10	345.524596183936414	20	27	deposit	completed	27	2013-04-26 17:20:45.26155
13	275.210821212396085	8	7	deposit	failed	14	2013-05-20 16:58:47.734104
15	189.902277004384243	20	20	deposit	pending	27	2008-07-09 07:48:39.880971
16	2.92528839215822401	40	13	payment	pending	35	2011-05-04 07:04:46.718498
17	915.37165154525626	27	13	payment	pending	39	2016-03-09 08:41:11.941057
18	523.132835806391311	2	25	withdrawal	pending	14	2011-06-30 08:10:18.438871
20	380.282393564683696	34	30	withdrawal	completed	24	2018-10-23 21:32:42.006476
21	169.010457852170341	9	35	payment	failed	23	2017-06-25 03:54:44.658474
22	567.75912170959225	39	32	invoice	completed	25	2009-06-07 13:01:35.828357
23	336.530812230908182	27	15	invoice	completed	37	2019-08-19 23:20:15.068305
25	135.149156282140138	9	12	withdrawal	completed	35	2010-12-20 22:19:52.071102
28	732.783837266131249	34	36	deposit	failed	20	2010-12-02 08:36:58.982116
30	136.630393315299226	6	29	withdrawal	completed	27	2019-01-14 11:54:22.988623
32	979.676872152121198	27	40	withdrawal	failed	1	2015-09-14 05:51:34.479342
33	925.028121326423176	13	8	invoice	pending	29	2014-08-25 07:40:11.346674
34	928.857393041252527	17	18	invoice	completed	40	2017-05-28 17:16:55.81163
35	164.445085223906176	32	34	payment	completed	32	2016-03-13 02:32:31.149991
37	979.161197165540956	10	11	withdrawal	failed	22	2018-08-12 21:34:34.740512
38	445.451844205331722	35	16	deposit	completed	4	2010-04-28 17:11:48.770883
39	163.571839407281737	23	14	invoice	failed	23	2011-07-11 09:36:54.476026
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, username, role_id, created_at) FROM stdin;
1	Dorris_Blanda5	20	2024-05-19 17:32:27.593057
2	Xander.Schroeder6	34	2024-05-19 18:03:24.757522
3	Abdullah.Beier54	37	2024-05-19 08:48:06.033178
4	Mason.Hettinger	5	2024-05-20 02:05:41.916297
5	Lila_Legros	3	2024-05-19 10:47:38.809357
6	Abelardo_Price	37	2024-05-20 08:45:48.326476
7	Grant.Nader	21	2024-05-19 22:36:34.947338
8	Federico_Shanahan	38	2024-05-19 16:14:15.893498
9	Marjorie_McGlynn	28	2024-05-20 02:00:52.943368
10	Myrl94	4	2024-05-19 20:44:23.465885
11	Coleman95	23	2024-05-19 18:44:44.383637
12	Devonte.Rath61	6	2024-05-19 22:38:16.688438
13	Ludwig.Keebler	31	2024-05-19 09:18:59.573708
14	Kevin67	27	2024-05-20 03:46:50.481492
15	Marisa_Thompson	16	2024-05-19 11:50:49.876578
16	Mariane.DuBuque6	2	2024-05-20 07:05:35.523691
17	Nickolas17	11	2024-05-19 23:05:27.289794
18	Jettie_Parisian	7	2024-05-19 15:59:16.861429
19	Dawson88	14	2024-05-19 12:04:43.469164
20	Kade.Dach60	27	2024-05-19 17:13:03.916055
21	Joyce.Berge	25	2024-05-20 07:21:29.973015
22	Rocky_Runolfsdottir38	29	2024-05-20 02:04:07.733564
23	Georgette.Schulist56	6	2024-05-19 13:32:06.14758
24	Nathanial5	12	2024-05-20 00:11:40.295415
25	Rafael_Baumbach	37	2024-05-19 22:49:22.091865
26	Octavia.Medhurst86	25	2024-05-19 21:39:41.422086
27	Leone.Swift84	34	2024-05-19 23:47:02.010211
28	Wallace.Becker	20	2024-05-19 20:04:25.057118
29	Dillan.Morissette69	7	2024-05-19 16:58:29.547391
30	Evert73	23	2024-05-20 06:49:51.513836
31	Gabriella80	13	2024-05-19 10:33:11.681021
32	Roselyn10	34	2024-05-19 23:45:59.457951
33	Keyshawn.Torp	5	2024-05-19 12:54:12.748898
34	Serenity_Paucek	7	2024-05-19 20:02:08.700481
35	Shana.Langworth75	20	2024-05-19 17:38:14.195658
36	Sandra.Hilll72	22	2024-05-20 07:58:01.026635
37	Arthur.Mraz	35	2024-05-19 17:11:46.038706
38	Erik.Grimes90	22	2024-05-20 03:04:44.137589
39	Immanuel_Mraz47	33	2024-05-19 22:26:18.751089
40	Rosina54	2	2024-05-19 13:22:16.055556
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

