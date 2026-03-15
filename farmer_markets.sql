--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;



CREATE TABLE public.locations (
    zip character varying(10) NOT NULL,
    city text NOT NULL,
    county text,
    state text NOT NULL
);



CREATE TABLE public.market_media (
    fmid integer NOT NULL,
    website text,
    facebook text,
    twitter text,
    youtube text,
    other_media text
);



CREATE TABLE public.market_payments (
    fmid integer NOT NULL,
    payment_method_id integer NOT NULL
);




CREATE TABLE public.market_products (
    fmid integer NOT NULL,
    product_id integer NOT NULL
);



CREATE TABLE public.market_schedules (
    schedule_id integer NOT NULL,
    season_number integer,
    season_date text,
    season_time text,
    fmid integer
);




CREATE SEQUENCE public.market_schedules_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE public.market_schedules_schedule_id_seq OWNED BY public.market_schedules.schedule_id;




CREATE TABLE public.markets (
    fmid integer NOT NULL,
    name text NOT NULL,
    street text,
    lat numeric,
    long numeric,
    zip character varying(10),
    updatetime text
);



CREATE TABLE public.payment_methods (
    payment_method_id integer NOT NULL,
    payment_method text
);




CREATE SEQUENCE public.payment_methods_payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.payment_methods_payment_method_id_seq OWNED BY public.payment_methods.payment_method_id;



CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name text
);


CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    fmid integer,
    rating integer,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer NOT NULL,
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);




CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;




CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password text NOT NULL,
    email character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    rol text
);



CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;




ALTER TABLE ONLY public.market_schedules ALTER COLUMN schedule_id SET DEFAULT nextval('public.market_schedules_schedule_id_seq'::regclass);



ALTER TABLE ONLY public.payment_methods ALTER COLUMN payment_method_id SET DEFAULT nextval('public.payment_methods_payment_method_id_seq'::regclass);



ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);



ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);




ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);




COPY public.locations (zip, city, county, state) FROM stdin;
05828	Danville	Caledonia	Vermont
69361	Scottsbluff	Scotts Bluff	Nebraska
07732	Highlands	Monmouth	New Jersey
92277	Twentynine Palms	San Bernardino	California
45402	Dayton	Montgomery	Ohio
60450	Morris	Grundy	Illinois
49651	Lake City	Missaukee	Michigan
60621	Chicago	Cook	Illinois
60637	Chicago	Cook	Illinois
32303	Tallahassee	Leon	Florida
98520	Aberdeen	Grays Harbor	Washington
24212	Abingdon	Washington	Virginia
70420	Abita Springs	St. Tammany	Louisiana
45693	West Union	Adams	Ohio
17325	Gettysburg	Adams	Pennsylvania
17025	Enola	Cumberland	Pennsylvania
96750	Kealakekua	Hawaii	Hawaii
08753	Toms River	Ocean	New Jersey
38120	Memphis	Shelby	Tennessee
96822	Honolulu	Honolulu	Hawaii
34604	Brooksville	Hernando	Florida
32653	Gainesville	Alachua	Florida
78209	San Antonio	Bexar	Texas
81101	Alamosa	Alamosa	Colorado
97321	Albany	Benton	Oregon
47320	Albany	Delaware	Indiana
64402	Albany	Gentry	Missouri
13607	Alexandria Bay	Jefferson	New York
56308	Alexandria	Douglas	Minnesota
71301	Alexandria	Rapides	Louisiana
54201	Algoma	Kewaunee	Wisconsin
66749	Iola	Allen	Kansas
97007	Aloha	Washington	Oregon
96101	Alturas	Modoc	California
19002	Ambler	Montgomery	Pennsylvania
50010	Ames, IA	Story	Iowa
30534	Dawsonville	Dawson	Georgia
37115	Madison	Davidson	Tennessee
59711	Anaconda	Deer Lodge	Montana
98221	Anacortes	Skagit	Washington
29621	Anderson	Anderson	South Carolina
40342	Lawrenceburg	Anderson	Kentucky
60640	Chicago	Cook	Illinois
01810	Andover	Essex	Massachusetts
55302	Annandale	Wright	Minnesota
54409	Antigo	Langlade	Wisconsin
60002	Antioch	Lake	Illinois
54911	Appleton	Outagamie	Wisconsin
02840	Newport	Newport	Rhode Island
05250	Arlington	Bennington	Vermont
02909	Providence	Providence	Rhode Island
63010	Arnold	Jefferson	Missouri
32720	DeLand	Volusia	Florida
30904	Augusta-Richmond County consolidated government (balance)	Richmond	Georgia
01721	Ashland	Middlesex	Massachusetts
97103	Astoria	Clatsop	Oregon
72401	Jonesboro	Craighead	Arkansas
66002	Atchison	Atchison	Kansas
45701	Athens	Athens	Ohio
30601	Athens	Clarke	Georgia
30606	Athens	Clarke	Georgia
83801	Athol	Kootenai	Idaho
02703	Attleboro	Bristol	Massachusetts
90039	Los Angeles	Los Angeles	California
98002	Auburn	King	Washington
13026	Aurora	Cayuga	New York
65605	Aurora	Lawrence	Missouri
78759	AUSTIN	Travis	Texas
06001	AVON	Hartford	Connecticut
80908	Colorado Springs	El Paso	Colorado
46105	bainbridge	Putnam	Indiana
54002	Baldwin	St. Croix	Wisconsin
98107	Seattle	King	Washington
29003	Bamberg	Bamberg	South Carolina
04401	Bangor	Penobscot	Maine
95633	Garden Valley	El Dorado	California
08005	Barnegat	Ocean	New Jersey
30680	Winder	Barrow	Georgia
81621	Basalt	Eagle	Colorado
68714	Bassett	Rock	Nebraska
78602	Bastrop	Bastrop	Texas
60510	Batavia	Kane	Illinois
47006	Batesville	Ripley	Indiana
49017	Battle Creek	Calhoun	Michigan
77546	Friendswood	Galveston	Texas
68310	Beatrice	Gage	Nebraska
41311	Beattyville	Lee	Kentucky
77707	Beaumont,	Jefferson	Texas
42320	Beaver Dam	Ohio	Kentucky
50310	Des Moines	Polk	Iowa
03110	Bedford	Hillsborough	New Hampshire
07921	Bedminster	Somerset	New Jersey
21014	Bel Air	Harford	Maryland
66935	Belleville	Republic	Kansas
48111	Belleville	Wayne	Michigan
98226	Bellingham	Whatcom	Washington
14813	Belmont	Allegany	New York
64012	Belton	Cass	Missouri
56601	Bemidji	Beltrami	Minnesota
94510	Benicia	Solano	California
68317	Bennet	Lancaster	Nebraska
72712	Bentonville	Benton	Arkansas
25411	Berkeley Springs	Morgan	West Virginia
43504	Berkey	Lucas	Ohio
03901	Berwick	York	Maine
35020	Bessemer	Jefferson	Alabama
35022	Bessemer	Jefferson	Alabama
62010	Bethalto	Madison	Illinois
19930	Bethany Beach	Sussex	Delaware
20814	Bethesda	Montgomery	Maryland
18015	Bethlehem	Lehigh	Pennsylvania
90210	Beverly Hills	Los Angeles	California
43209	Bexley	Franklin	Ohio
92315	City of Big Bear Lake	San Bernardino	California
55309	Big Lake	Sherburne	Minnesota
01821	Billerica	Middlesex	Massachusetts
19508	Birdsboro	Berks	Pennsylvania
58501	Bismarck	Burleigh	North Dakota
07825	Blairstown	Warren	New Jersey
15224	Pittsburgh	Allegheny	Pennsylvania
47404	Bloomington	Monroe	Indiana
47403	Bloomington	Monroe	Indiana
45242	Blue Ash	Butler	Ohio
40509	Lexington	Fayette	Kentucky
45817	Bluffton	Allen	Ohio
46714	Bluffton	Wells	Indiana
21230	Baltimore	Baltimore City	Maryland
83702	Boise City	Ada	Idaho
41005	Burlington	Boone	Kentucky
50036	Boone	Boone	Iowa
65233	Boonville	Cooper	Missouri
24083	Daleville	Botetourt	Virginia
58318	Bottineau	Bottineau	North Dakota
59632	Boulder	Jefferson	Montana
20715	Bowie	Prince George's	Maryland
41129	Catlettsburg	Boyd	Kentucky
41102	Ashland	Boyd	Kentucky
49712	Boyne City	Charlevoix	Michigan
77096	Houston	Harris	Texas
02184	Braintree	Norfolk	Massachusetts
05301	Brattleboro	Windham	Vermont
41339	Jackson	Breathitt	Kentucky
98337	Bremerton	Kitsap	Washington
08807	Bridgewater	Somerset	New Jersey
84302	Brigham City	Box Elder	Utah
01010	Brimfield	Hampden	Massachusetts
02907	Providence	Providence	Rhode Island
22815	Broadway	Rockingham	Virginia
02301	Brockton	Plymouth	Massachusetts
43203	Columbus	Franklin	Ohio
97415	Brookings	Curry	Oregon
02446	Brookline	Norfolk	Massachusetts
64113	Kansas City	Jackson	Missouri
34614	Brooksville	Hernando	Florida
47012	BROOKVILLE	Franklin	Indiana
13905	Binghamton	Broome	New York
02906	Providence	Providence	Rhode Island
46112	Brownsburg	Hendricks	Indiana
54819	Bruce	Rusk	Wisconsin
04011	Brunswick	Cumberland	Maine
19010	Bryn Mawr	Montgomery	Pennsylvania
23664	Hampton	Hampton	Virginia
04416	Bucksport	Hancock	Maine
91502	Burbank	Los Angeles	California
22015	Burke	Fairfax	Virginia
57523	Burke	Gregory	South Dakota
05401	Burlington	Chittenden	Vermont
02830	Harrisville	Providence	Rhode Island
36037	Greenville	Butler	Alabama
59701	Butte	Silver Bow	Montana
77396	Humble	Harris	Texas
46613	South Bend	St. Joseph	Indiana
42211	Cadiz, KY	Trigg	Kentucky
34714	Clermont	Lake	Florida
95249	San Andreas	Calaveras	California
95247	Murphys	Calaveras	California
05819	St. Johnsbury	Caledonia	Vermont
53404	Caledonia	Racine	Wisconsin
94306	Palo Alto	Santa Clara	California
20619	California	St. Mary's	Maryland
93010	Camarillo	Ventura	California
93428	Cambria	San Luis Obispo	California
95124	San Jose	Santa Clara	California
70458	Olde Towne Slidell	St. Tammany	Louisiana
95672	Cameron Park	El Dorado	California
41001	Alexandria	Campbell	Kentucky
41075	Ft. Thomas	Campbell	Kentucky
41071	Newport	Campbell	Kentucky
95008	Campbell	Santa Clara	California
01604	Worcester	Worcester	Massachusetts
43055	Newark	Licking	Ohio
14103	Medina	Orleans	New York
91303	canoga park	Los Angeles	California
48188	Canton	Wayne	Michigan
44702	Canton	Stark	Ohio
33904	Cape Coral	Lee	Florida
63703	Cape Girardeau	Cape Girardeau	Missouri
19904	Dover	Kent	Delaware
20004	DC	District of Columbia	District of Columbia
93923	Carmel	Monterey	California
98014	Carnation	King	Washington
29669	Pelzer	Anderson	South Carolina
27510	Carrboro	Orange	North Carolina
64633	Carrollton	Carroll	Missouri
89703	Carson City	Carson City	Nevada
41143	GRAYSON	Carter	Kentucky
41164	Olive Hill	Carter	Kentucky
02330	Carver	Plymouth	Massachusetts
02874	Saunderstown	Washington	Rhode Island
28602	Hickory	Catawba	North Carolina
24070	Catawba	Roanoke	Virginia
30124	CAVE SPRING	Floyd	Georgia
97229	Portland	Washington	Oregon
28584	Cedar Point	Carteret	North Carolina
45822	Celina	Mercer	Ohio
75009	Celina	Collin	Texas
90011	Los Angeles	Los Angeles	California
02863	Central Falls	Providence	Rhode Island
98383	Silverdale	Kitsap	Washington
92262	Palm Springs	Riverside	California
93730	Fresno	Fresno	California
93720	Fresno	Fresno	California
83226	Challis	Custer	Idaho
05486	South Hero	Grand Isle	Vermont
05458	Grand Isle	Grand Isle	Vermont
25414	Charles Town	Jefferson	West Virginia
72933	Charleston	Franklin	Arkansas
02813	Charlestown	Washington	Rhode Island
28217	Charlotte	Mecklenburg	North Carolina
02633	Chatham	Barnstable	Massachusetts
05038	Chelsea	Orange	Vermont
23832	Chesterfield	Chesterfield	Virginia
19118	Philadelphia	Philadelphia	Pennsylvania
95927	Chico	Butte	California
95926	Chico	Butte	California
95969	Paradise	Butte	California
24319	Chilhowie	Smyth	Virginia
28023	China Grove	Rowan	North Carolina
54729	Chippewa Falls	Chippewa	Wisconsin
30134	Douglasville	Douglas	Georgia
23824	Blackstone	Nottoway	Virginia
34481	Ocala	Marion	Florida
29501	Florence	Florence	South Carolina
96813	Honolulu	Honolulu	Hawaii
92104	San Diego	San Diego	California
36830	Auburn	Lee	Alabama
80537	Loveland	Larimer	Colorado
01247	North Adams	Berkshire	Massachusetts
15210	Pittsburgh	Allegheny	Pennsylvania
55447	Plymouth	Hennepin	Minnesota
44131	Seven Hills	Cuyahoga	Ohio
48080	St. Clair Shores, Mi	Macomb	Michigan
55110	White Bear Lake	Ramsey	Minnesota
06515	New Haven	New Haven	Connecticut
06513	New Haven	New Haven	Connecticut
06511	New Haven	New Haven	Connecticut
91711	Claremont	Los Angeles	California
03743	Claremont	Sullivan	New Hampshire
14031	Clarence	Erie	New York
99403	Clarkston	Asotin	Washington
67432	Clay Center	Clay	Kansas
76033	Cleburne	Johnson	Texas
27012	Clemmons	Forsyth	North Carolina
20008	Washington	District of Columbia	District of Columbia
12065	Clifton Park	Saratoga	New York
13323	Clinton	Oneida	New York
43214	Columbus	Franklin	Ohio
36311	Ariton	Barbour	Alabama
21244	Woodlawn	Baltimore	Maryland
18508	Scranton	Lackawanna	Pennsylvania
02852	North Kingstown	Washington	Rhode Island
94019	Half Moon Bay	San Mateo	California
94044	Pacifica	San Mateo	California
99324	College Place	Walla Walla	Washington
06019	Collinsville	Hartford	Connecticut
80919	Colorado Springs	El Paso	Colorado
80903	Colorado Springs	El Paso	Colorado
38401	Columbia	Maury	Tennessee
65203	Columbia	Boone	Missouri
95310	Columbia	Tuolumne	California
68601	Columbus	Platte	Nebraska
66725	Columbus	Cherokee	Kansas
95932	Colusa	Colusa	California
76240	Collinsville	Cooke	Texas
97214	Portland	Multnomah	Oregon
38619	Como	Panola	Mississippi
06103	Hartford	Hartford	Connecticut
29526	Conway	Horry	South Carolina
72032	Conway	Faulkner	Arkansas
97420	Coos Bay	Coos	Oregon
52241	Coralville	Johnson	Iowa
97113	Cornelius	Washington	Oregon
78401	Corpus Christi	Nueces	Texas
81321	Cortez	Montezuma	Colorado
97330	Corvallis	Benton	Oregon
94931	cotati	Sonoma	California
66044	Lawrence	Douglas	Kansas
30117	Carrollton	Carroll	Georgia
54812	Barron	Barron	Wisconsin
44302	Akron	Summit	Ohio
44264	Peninsula	Summit	Ohio
44308	Akron	Summit	Ohio
44333	Akron	Summit	Ohio
06238	Coventry	Tolland	Connecticut
41011	Covington	Kenton	Kentucky
69130	Cozad	Dawson	Nebraska
70105	Wellington	Park	Wyoming
47933	Crawfordsville	Montgomery	Indiana
90008	Los Angeles	Los Angeles	California
70118	New Orleans	Orleans	Louisiana
70116	New Orleans	Orleans	Louisiana
43420	Fremont	Sandusky	Ohio
72396	Wynne	Cross	Arkansas
20912	Takoma Park	Montgomery	Maryland
60014	Crystal Lake	McHenry	Illinois
90232	Culver City	Los Angeles	California
46511	Culver	Marshall	Indiana
42717	Burkesville	Cumberland	Kentucky
46229	Cumberland	Marion	Indiana
44222	Cuyahoga Falls	Summit	Ohio
71742	Fordyce	Dallas	Arkansas
06810	Danbury	Fairfield	Connecticut
53530	Darlington	Lafayette	Wisconsin
52804	Davenport	Scott	Iowa
68632	David City	Butler	Nebraska
56232	Dawson	Lac qui Parle	Minnesota
84009	South Jordan	Salt Lake	Utah
63020	DeSoto	Jefferson	Missouri
48124	Dearborn	Wayne	Michigan
30030	Decatur	DeKalb	Georgia
52101	Decorah	Winneshiek	Iowa
53532	DeForest	Dane	Wisconsin
60115	DeKalb	DeKalb	Illinois
93940	Monterey	Monterey	California
67213	Wichita	Sedgwick	Kansas
70528	Delcambre	Iberia	Louisiana
12054	Delmar	Albany	New York
33444	Delray Beach	Palm Beach	Florida
98106	Seattle	King	Washington
76201	Denton	Denton	Texas
98198	Des Moines	King	Washington
48130	Dexter	Washtenaw	Michigan
19148	Philadelphia	Philadelphia	Pennsylvania
47018	Dillsboro	Dearborn	Indiana
17019	Dillsburg	York	Pennsylvania
48821	Dimondale	Eaton	Michigan
31023	Eastman	Dodge	Georgia
53533	Dodgeville	Iowa	Wisconsin
81324	Dove Creek	Dolores	Colorado
83615	donnelly	Valley	Idaho
02122	Dorchester	Suffolk	Massachusetts
23231	Henrico	Henrico	Virginia
53118	Dousman	Waukesha	Wisconsin
03820	Dover	Rockingham	New Hampshire
10011	New York	New York	New York
11366	Queens	Queens	New York
10538	Larchmont	Westchester	New York
10543	Mamaroneck	Westchester	New York
11222	Brooklyn	Kings	New York
10026	Manhattan	New York	New York
10804	New Rochelle	Westchester	New York
10562	Ossining	Westchester	New York
11215	Park Slope	Kings	New York
11355	Queens	Queens	New York
10580	Rye	Westchester	New York
19335	Downingtown	Chester	Pennsylvania
32615	Alachua	Alachua	Florida
48101	Allen Park	Wayne	Michigan
53511	Beloit	Rock	Wisconsin
94704	Berkeley	Alameda	California
61701	Bloomington	McLean	Illinois
75103	Canton	Van Zandt	Texas
95928	Chico	Butte	California
75020	Denison	Grayson	Texas
60120	Elgin	Kane	Illinois
60201	Evanston	Cook	Illinois
47708	Evansville,IN	Vanderburgh	Indiana
42071	Murray	Calloway	Kentucky
29720	Lancaster	Lancaster	South Carolina
42071-0002	Murray	Calloway	Kentucky
34950	Fort Pierce	St. Lucie	Florida
54935	Fond du Lac	Fond du Lac	Wisconsin
54301	Green Bay, WI	Brown	Wisconsin
47025	Lawrenceburg	Dearborn	Indiana
45801	Lima	Allen	Ohio
39110	Madison	Madison	Mississippi
49855	Marquette	Marquette	Michigan
72112	Newport	Jackson	Arkansas
94947	Novato	Marin	California
94301	Palo Alto	Santa Clara	California
85004	Phoenix	Maricopa	Arizona
72756	ROGERS	Benton	Arkansas
98901	Yakima	Yakima	Washington
38225	Dresden	Weakley	Tennessee
21217	Baltimore	Baltimore City	Maryland
94568	Dublin	Alameda	California
52001	Dubuque	Dubuque	Iowa
55802	Duluth	St. Louis	Minnesota
81301	Durango	La Plata	Colorado
27701	Durham	Durham	North Carolina
98019	Duvall	King	Washington
89406	Fallon	Churchill	Nevada
68347	eagle	Cass	Nebraska
77346	Humble	Harris	Texas
30316	Atlanta	Fulton	Georgia
02128	East Boston	Suffolk	Massachusetts
77003	Houston	Harris	Texas
12061	East Greenbush	Rensselaer	New York
90028	Los Angeles	Los Angeles	California
000TN	Nashville	Davidson	Tennessee
07018	East Orange	Essex	New Jersey
94303	East Palo Alto	San Mateo	California
30344	East Point	Fulton	Georgia
14901	Elmira	Chemung	New York
98683	Vancouver	Clark	Washington
14221	Buffalo	Erie	New York
01027	Easthampton	Hampshire	Massachusetts
18042	Easton	Northampton	Pennsylvania
37915	Knoxville	Knox	Tennessee
02917	Smithfield	Providence	Rhode Island
90026	Los Angeles	Los Angeles	California
27932	Edenton	Chowan	North Carolina
98020	Edmonds	Snohomish	Washington
54209	Egg Harbor	Door	Wisconsin
92021	El cajon	San Diego	California
95762	El Dorado Hills	El Dorado	California
91731	El Monte	Los Angeles	California
50627	Eldora	Hardin	Iowa
78621	Elgin	Bastrop	Texas
46516	Elkhart	Elkhart	Indiana
06029	Ellington	Tolland	Connecticut
41171	Sandy Hook	Elliott	Kentucky
02465	West Newton	Middlesex	Massachusetts
18049	Emmaus	Lehigh	Pennsylvania
49630	Empire	Leelanau	Michigan
64801	Joplin	Newton	Missouri
91406	Van Nuys	Los Angeles	California
28715	Candler	Buncombe	North Carolina
75119	Ennis	Ellis	Texas
98022	Enumclaw	King	Washington
87532	Espanola	Rio Arriba	New Mexico
97023	Estacada	Clackamas	Oregon
96027	Etna	Siskiyou	California
72632	Eureka Springs	Carroll	Arkansas
49631	Evart	Osceola	Michigan
96706	Ewa Beach	Honolulu	Hawaii
05777	Fair Haven	Rutland	Vermont
94930	Fairfax	Marin	California
22030	Fairfax	Fairfax	Virginia
74343	Fairland	Ottawa	Oklahoma
99218	Spokane	Spokane	Washington
68522	Lincoln	Lancaster	Nebraska
57101	Sioux Falls	Minnehaha	South Dakota
46278	Indianapolis	Marion	Indiana
83605	Caldwell	Canyon	Idaho
12206	Albany	Albany	New York
88001	Las Cruces	Dona Ana	New Mexico
75234	Farmers Branch	Dallas	Texas
99669	Soldotna	Kenai Peninsula	Alaska
47932	Covington	Fountain	Indiana
60540	Naperville	DuPage	Illinois
40069	Springfield	Washington	Kentucky
46140	Greenfield	Hancock	Indiana
85252	Scottsdale	Maricopa	Arizona
29910	Bluffton	Beaufort	South Carolina
72736	Gravette	Benton	Arkansas
47250	Madison	Jefferson	Indiana
65804	Springfield	Greene	Missouri
84401	Ogden	Weber	Utah
77494	Katy	Harris	Texas
42743	Greensburg	Green	Kentucky
42728	Columbia	Adair	Kentucky
77459	Missorui City	Fort Bend	Texas
17013	Carlisle	Cumberland	Pennsylvania
43952	Steubenville	Jefferson	Ohio
96727	Kamuela	Hawaii	Hawaii
43160	Washington Court House	Fayette	Ohio
47331	Connersville	Fayette	Indiana
27312	Fearrington Village	Chatham	North Carolina
95018	Felton	Santa Cruz	California
63135	Ferguson	St. Louis	Missouri
72223	Little Rock	Pulaski	Arkansas
89408	Fernley	Lyon	Nevada
94111	San Francisco	San Francisco	California
12043	Cobleskill	Schoharie	New York
45231	Cincinnati	Hamilton	Ohio
44882	Sycamore	Wyandot	Ohio
70501	Lafayette	Lafayette	Louisiana
67230	Wichita	Sedgwick	Kansas
54212	Fish Creek	Door	Wisconsin
02882	Narragansett	Washington	Rhode Island
41041	Flemingsburg	Fleming	Kentucky
41653	Prestonsburg	Floyd	Kentucky
47119	floyds knobs	Floyd	Indiana
53206	Milwaukee	Milwaukee	Wisconsin
82601	Casper	Natrona	Wyoming
24551	Forest	Bedford	Virginia
97116	Forest Grove	Washington	Oregon
15221	Wilkinsburg	Allegheny	Pennsylvania
22911	Charlottesville	Albemarle	Virginia
72901	Fort Smith	Sebastian	Arkansas
88119	Fort Sumner	De Baca	New Mexico
60020	Fox Lake	Lake	Illinois
48734	Frankenmuth	Saginaw	Michigan
40601	Frankfort	Franklin	Kentucky
46131	Franklin	Johnson	Indiana
42134	Franklin	Simpson	Kentucky
47710	Evansville	Vanderburgh	Indiana
46044	Frankton	Madison	Indiana
30307	Atlanta	Fulton	Georgia
52801	Davenport	Scott	Iowa
78130	New Braunfels	Bexar	Texas
94509	Antioch	Contra Costa	California
20009	Washington	District of Columbia	District of Columbia
46802	FORT WAYNE	Allen	Indiana
77406	Fulshear	Fort Bend	Texas
46975	Rochester	Fulton	Indiana
10038	New York	New York	New York
49503	Grand Rapids	Kent	Michigan
27526	Fuquay-Varina	Wake	North Carolina
66739	Galena	Cherokee	Kansas
37066	Gallatin	Sumner	Tennessee
92503	Riverside	Riverside	California
67846	Garden City	Finney	Kansas
66030	Gardner	Johnson	Kansas
46225	Indianapolis	Marion	Indiana
60612	Chicago	Cook	Illinois
40444	Lancaster	Garrard	Kentucky
46933	Gas City	Grant	Indiana
71854	Texarkana	Miller	Arkansas
29440	Georgetown	Georgetown	South Carolina
77091	Houston	Houston	Texas
77020	Houston	Houston	Texas
77045	Houston	Houston	Texas
77011	Houston	Houston	Texas
77016	Houston	Houston	Texas
77074	Houston	Houston	Texas
77051	Houston	Houston	Texas
85234	Gilbert	Maricopa	Arizona
03237	Gilmanton	Belknap	New Hampshire
64118	Gladstone	Clay	Missouri
49636	Glen Arbor	Leelanau	Michigan
35905	GLENCOE	Etowah	Alabama
12801	Glens Falls	Warren	New York
60626	Chicago	Cook	Illinois
02818	Warwick	Kent	Rhode Island
75218	Dallas	Dallas	Texas
55027	Goodhue	Goodhue	Minnesota
83330	Gooding	Gooding	Idaho
19128	Philadelphia	Philadelphia	Pennsylvania
10924	Goshen	Orange	New York
72160	Stuttgart	Arkansas	Arkansas
55744	Grand Rapids	Itasca	Minnesota
24015	Roanoke	Roanoke City	Virginia
30315	Atlanta	Fulton	Georgia
10031	New York	New York	New York
01376	Turners Falls	Franklin	Massachusetts
15417	Brownsville	Washington	Pennsylvania
13601	Watertown	Jefferson	New York
80631	Greeley	Weld	Colorado
60614	Chicago	Cook	Illinois
60607	Chicago	Cook	Illinois
30309	Atlanta	Fulton	Georgia
56484	Walker	Cass	Minnesota
20770	Greenbelt	Prince George's	Maryland
22968	Ruckersville	Greene	Virginia
70053	Gretna	Jefferson	Louisiana
50112	Grinnell	Poweshiek	Iowa
96766	Lihue	Kauai	Hawaii
70802	baton rouge	East Baton Rouge	Louisiana
30815	Hephzibah	Richmond	Georgia
52052	Guttenberg	Clayton	Iowa
96701	Aiea	Honolulu	Hawaii
24558	Halifax	Halifax	Virginia
07302	Jersey City	Hudson	New Jersey
45011	Hamilton	Butler	Ohio
28310	Fayetteville	Cumberland	North Carolina
04444	Hampden	Penobscot	Maine
23505	Norfolk	Norfolk	Virginia
50441	Hampton	Franklin	Iowa
96713	Hana	Maui	Hawaii
96714	Hanalei	Kauai	Hawaii
45840	Findlay	Hancock	Ohio
17331	Hanover	York	Pennsylvania
44304	Akron	Summit	Ohio
44310	Akron	Summit	Ohio
46809	Fort Wayne	Allen	Indiana
76548	Harker Heights	Bell	Texas
78550	Harlingen	Cameron	Texas
48625	Harrison	Clare	Michigan
42765	Munfordville	Hart	Kentucky
57033	Hartford	Minnehaha	South Dakota
44240	Kent	Portage	Ohio
46163	New Palestine	Hancock	Indiana
43054	New Albany	Franklin	Ohio
22473	Heathsville	Northumberland	Virginia
84032	Heber City	Wasatch	Utah
90046	West Hollywood	Los Angeles	California
28739	Hendersonville	Henderson	North Carolina
56136	Hendricks	Lincoln	Minnesota
69001	McCook	Red Willow	Nebraska
40741	London	Laurel	Kentucky
91739	Rancho Cucamonga	San Bernardino	California
85938	Springerville	Apache	Arizona
38632	Hernando	DeSoto	Mississippi
20170	Herndon	Fairfax	Virginia
84096	Herriman	Salt Lake	Utah
37043	Clarksville	Montgomery	Tennessee
92395	Victorville	San Bernardino	California
27262	High Point	Guilford	North Carolina
32643	High Springs	Alachua	Florida
24465	Monterey	Highland	Virginia
80129	Highlands Ranch	Douglas	Colorado
50563	Manson	Calhoun	Iowa
63050	Hillsboro	Jefferson	Missouri
97124	Hillsboro	Washington	Oregon
97219	Portland	Multnomah	Oregon
31313	Hinesville	Liberty	Georgia
02043	Hingham	Plymouth	Massachusetts
60521	Hinsdale	DuPage	Illinois
71901	Hot Springs	Garland	Arkansas
48446	Lapeer	Lapeer	Michigan
47901	Lafayette	Tippecanoe	Indiana
19958	Lewes	Sussex	Delaware
28752	Marion	McDowell	North Carolina
47630	Newburgh	Warrick	Indiana
64040	Holden	Johnson	Missouri
16648	Hollidaysburg	Blair	Pennsylvania
48442	Holly	Oakland	Michigan
27540	Holly Springs	Wake	North Carolina
20653	Lexington Park	St. Mary's	Maryland
99603	Homer	Kenai Peninsula	Alaska
60430	Homewood	Cook	Illinois
97067	Welches	Clackamas	Oregon
02885	Warren	Bristol	Rhode Island
55343	Hopkins	Hennepin	Minnesota
42240	HOPKINSVILLE	Christian	Kentucky
01748	Hopkinton	Middlesex	Massachusetts
57747	Hot Springs	Fall River	South Dakota
29303	Spartanburg	Spartanburg	South Carolina
12534	Hudson	Columbia	New York
23236	Richmond	Chesterfield	Virginia
23235	Richmond	Chesterfield	Virginia
62901	Carbondale	Jackson	Illinois
08822	Flemington	Hunterdon	New Jersey
16652	Huntingdon	Huntingdon	Pennsylvania
60142	Huntley	McHenry	Illinois
78634	Hutto	Williamson	Texas
75693	Clarksville City	Gregg	Texas
20781	Hyattsville	Prince George's	Maryland
45208	Cincinnati	Hamilton	Ohio
51445	Ida Grove	Ida	Iowa
83402	Idaho Falls	Bonneville	Idaho
48444	Imlay City	Lapeer	Michigan
42064	Marion	Crittenden	Kentucky
50644	Independence	Buchanan	Iowa
64050	Independence	Jackson	Missouri
12842	INDIAN LAKE	Hamilton	New York
15701	Indiana	Indiana	Pennsylvania
48846	Ionia	Ionia	Michigan
50126	Iowa Falls	Hardin	Iowa
11212	Brooklyn, NY	Kings	New York
98027	Issaquah	King	Washington
48847	Ithaca	Gratiot	Michigan
56142	Ivanhoe	Lincoln	Minnesota
82633	Douglas	Converse	Wyoming
63755	Jackson	Cape Girardeau	Missouri
54615	Black River Falls	Jackson	Wisconsin
40447	Mckee	Jackson	Kentucky
40486	Tyner	Jackson	Kentucky
28779	Sylva	Jackson	North Carolina
53037	Jackson	Washington	Wisconsin
53545	Janesville	Rock	Wisconsin
30143	Jasper	Pickens	Georgia
19107	Philadelphia	Philadelphia	Pennsylvania
40299	Jeffersontown	Jefferson	Kentucky
41240	Paintsville	Johnson	Kentucky
92252	Joshua Tree	San Bernardino	California
99801	Juneau	Juneau	Alaska
96734	Kailua	Honolulu	Hawaii
49001	Kalamazoo	Kalamazoo	Michigan
96819	Honolulu	Honolulu	Hawaii
96788	Kaneohe	Honolulu	Hawaii
96707	Kapolei	Honolulu	Hawaii
76248	Keller	Tarrant	Texas
53140	Kenosha	Kenosha	Wisconsin
20895	Kensington	Montgomery	Maryland
49512	Kentwood	Kent	Michigan
29020	Camden	Kershaw	South Carolina
27021	King	Stokes	North Carolina
22485	King George	King George	Virginia
12402	Kingston	Ulster	New York
22315	Alexandrida	Fairfax	Virginia
77339	Kingwood	Harris	Texas
63501	Kirksville	Adair	Missouri
87417	Kirtland	San Juan	New Mexico
03904	Kittery	York	Maine
63537	Edina	Knox	Missouri
40906	Barbourville	Knox	Kentucky
33928	Estero	Lee	Florida
19348	Kennett Square	Chester	Pennsylvania
00979	Carolina	Carolina	Puerto Rico
90035	Los Angele	Los Angeles	California
10460	Bronx	Bronx	New York
10457	Bronx	Bronx	New York
40031	La Grange	Oldham	Kentucky
20646	La Plata	Charles	Maryland
06883	Weston	Fairfield	Connecticut
71845	Lewisville	Lafayette	Arkansas
60010	Lake Barrington	Lake	Illinois
97034	Lake Oswego	Clackamas	Oregon
12946	Lake Placid	Essex	New York
56401	Brainerd	Crow Wing	Minnesota
56425	Baxter	Crow Wing	Minnesota
23228	henrico	Henrico	Virginia
44107	Lakewood	Cuyahoga	Ohio
14750	Lakewood	Chautauqua	New York
50140	Lamoni	Decatur	Iowa
61046	Lanark	Carroll	Illinois
43130	Lancaster	Fairfield	Ohio
82801	Sheridan	Sheridan	Wyoming
97401	Eugene	Lane	Oregon
19446	Lansdale	Montgomery	Pennsylvania
80521	Fort Collins	Larimer	Colorado
83871	Troy, ID	Latah	Idaho
35803	Huntsville	Madison	Alabama
39440	Laurel	Jones	Mississippi
49064	Lawrence	Van Buren	Michigan
15201	Pittsburgh	Allegheny	Pennsylvania
62920	Cobden	Union	Illinois
46052	Lebanon	Boone	Indiana
06249	Lebanon	New London	Connecticut
78259	San Antonio	Bexar	Texas
33138	Miami	Miami-Dade	Florida
49654	Leland	Leelanau	Michigan
66219	Lenexa	Johnson	Kansas
02804	Kinston	Lenoir	North Carolina
45211	Cincinnati	Hamilton	Ohio
13367	Lowville	Lewis	New York
55952	Lewiston	Winona	Minnesota
04240	Lewiston	Androscoggin	Maine
02421	Lexington	Middlesex	Massachusetts
02420	LEXINGTON	Middlesex	Massachusetts
84105	Salt Lake City	Salt Lake	Utah
15658	Ligonier	Westmoreland	Pennsylvania
30047	Lilburn	Gwinnett	Georgia
89008	Caliente	Lincoln	Nevada
90031	Los Angeles	Los Angeles	California
48146	Lincoln Park	Wayne	Michigan
92111	San Diego	San Diego	California
47441	Linton	Greene	Indiana
06759	Litchfield	Litchfield	Connecticut
65746	Seymour	Wright	Missouri
16502	Erie	Erie	Pennsylvania
92101	San Diego	San Diego	California
71822	Ashdown	Little River	Arkansas
29566	Little River	Horry	South Carolina
59047	Livingston	Park	Montana
48150	Livonia	Wayne	Michigan
24522	Appomattox	Appomattox	Virginia
42276	Russellville	Logan	Kentucky
22079	Lorton	Fairfax	Virginia
87107	Los Ranchos	Bernalillo	New Mexico
63353	Louisiana	Pike	Missouri
45140	Loveland	Clermont	Ohio
60657	Chicago	Cook	Illinois
49331	Lowell	Kent	Michigan
97885	Wallowa	Wallowa	Oregon
50311	Des Moines	Polk	Iowa
49431	LUDINGTON	Mason	Michigan
20135	Bluemont	Loudoun	Virginia
20165	Sterling	Loudoun	Virginia
20175	Leesburg	Loudoun	Virginia
20147	Ashburn	Loudoun	Virginia
24504	Lynchburg	Lynchburg	Virginia
98264	Lynden	Whatcom	Washington
30126	Mableton	Cobb	Georgia
50273	Winterset	Madison	Iowa
56256	Madison	Lac qui Parle	Minnesota
07940	Madison	Morris	New Jersey
97741	Madras	Jefferson	Oregon
98122	Seattle	King	Washington
53717	Madison	Dane	Wisconsin
32435	DeFuniak Springs	Walton	Florida
38024	Dyersburg	Dyer	Tennessee
15301	Washington	Washington	Pennsylvania
95667	Placerville	El Dorado	California
66720	Chanute	Neosho	Kansas
18431	Honesdale	Wayne	Pennsylvania
37130	Murfreesboro	Rutherford	Tennessee
44281	Wadsworth	Medina	Ohio
60048	Liberytville	Lake	Illinois
06040	Manchester	Hartford	Connecticut
59741	Manhattan	Gallatin	Montana
49660	Manistee	Manistee	Michigan
49854	Manistique	Schoolcraft	Michigan
96826	Honolulu	Honolulu	Hawaii
76063	Mansfield	Tarrant	Texas
98831	Manson	Chelan	Washington
97131	Nehalem	Tillamook	Oregon
98038	Maple Valley	King	Washington
30060	MARIETTA	Cobb	Georgia
54143	Marinette	Marinette	Wisconsin
52302	Marion	Linn	Iowa
43302	Marion	Marion	Ohio
60462	Orland Park	Cook	Illinois
29577	Myrtle Beach	Horry	South Carolina
36602	Mobile	Mobile	Alabama
54901	Oshkosh	Winnebago	Wisconsin
36606	Mobile	Mobile	Alabama
33132	Miami	Miami-Dade	Florida
46404	Gary	Lake	Indiana
47715	Evansville	Vanderburgh	Indiana
54303	Green Bay	Brown	Wisconsin
43213	Whitehall	Franklin	Ohio
71351	Marksville	Avoyelles	Louisiana
48453	Marlette	Sanilac	Michigan
42025	Benton	Marshall	Kentucky
02050	Marshfield	Plymouth	Massachusetts
27892	Williamston	Martin	North Carolina
62062	Maryville	Madison	Illinois
37801	Maryville	Blount	Tennessee
41056	Maysville	Mason	Kentucky
48854	Mason	Ingham	Michigan
02126	Mattapan	Suffolk	Massachusetts
46619	South Bend	St. Joseph	Indiana
29662	Mauldin	Greenville	South Carolina
53948	mauston	Juneau	Wisconsin
42647	Stearns	McCreary	Kentucky
22306	Alexandria	Fairfax	Virginia
95519	McKinleyville	Humboldt	California
22101	McLean	Fairfax	Virginia
40108	Brandenburg	Meade	Kentucky
02155	Medford	Middlesex	Massachusetts
19063	Media	Delaware	Pennsylvania
57752	Kyle	Shannon	South Dakota
44256	medina	Medina	Ohio
45769	Pomeroy	Meigs	Ohio
38103	Memphis	Shelby	Tennessee
40322	Frenchburg	Menifee	Kentucky
94025	Menlo Park	San Mateo	California
49858	Menominee	Menominee	Michigan
08109	Merchantville	Camden	New Jersey
83642	Meridian	Ada	Idaho
08840	METUCHEN	Middlesex	New Jersey
46970	Peru	Miami	Indiana
38655	Oxford	Lafayette	Mississippi
05753	Middlebury	Addison	Vermont
40243	Middletown	Jefferson	Kentucky
21769	Middletown	Frederick	Maryland
48640	Midland	Midland	Michigan
63130	University City	St. Louis	Missouri
06460	Milford	New Haven	Connecticut
96789	Mililani	Honolulu	Hawaii
20855	Rockville	Montgomery	Maryland
20850	Rockville	Montgomery	Maryland
55401	Minneapolis	Hennepin	Minnesota
30442	Millen	Jenkins	Georgia
19968	Milton	Sussex	Delaware
53215	Milwaukee	Milwaukee	Wisconsin
75773	Mineola	Wood	Texas
47303	Muncie	Delaware	Indiana
81645	Minturn	Eagle	Colorado
66202	Mission	Johnson	Kansas
78214	San Antonio	Bexar	Texas
90059	Los Angeles	Los Angeles	California
66604	Topeka	Shawnee	Kansas
48162	Monroe	Monroe	Michigan
53566	Monroe	Green	Wisconsin
97215	Portland	Multnomah	Oregon
94611	Oakland	Alameda	California
35115	MONTEVALLO	Shelby	Alabama
40353	Mt. Sterling	Montgomery	Kentucky
31064	Monticello	Jasper	Georgia
14865	Montour Falls	Schuyler	New York
81401	Montrose	Montrose	Colorado
66203	Shawnee	Johnson	Kansas
97202	Portland	Multnomah	Oregon
43756	McConnelsville	Morgan	Ohio
46151	Martinsville	Morgan	Indiana
46158	Mooresville	Morgan	Indiana
28655	Morganton	Burke	North Carolina
30306	Atlanta	Fulton	Georgia
07960	Morristown	Morris	New Jersey
93442	Morro Bay	San Luis Obispo	California
83843	Moscow	Latah	Idaho
54455	City	Marathon	Wisconsin
61053	Mount Carroll	Carroll	Illinois
02809	Bristol	Bristol	Rhode Island
29464	Mount Pleasant	Charleston	South Carolina
20010	Washington	District of Columbia	District of Columbia
21550	Oakland	Garrett	Maryland
19119	Philadelphia	Philadelphia	Pennsylvania
48858	Mount Pleasant	Isabella	Michigan
40047	Mt.Washington	Bullitt	Kentucky
31201	Macon	Bibb	Georgia
99504	Anchorage	Anchorage	Alaska
49862	Munising	Alger	Michigan
15668	Murrysville	Westmoreland	Pennsylvania
99645	Palmer	Matanuska-Susitna	Alaska
21773	Myersville	Frederick	Maryland
94559	Napa	Napa	California
12764	Narrowsburg	Sullivan	New York
27804	Rocky Mount	Nash	North Carolina
01760	Natick	Middlesex	Massachusetts
60423	Frankfort	Will	Illinois
80466	Nederland	Boulder	Colorado
02492	Needham	Norfolk	Massachusetts
64850	Downtown Neosho	Newton	Missouri
07857	Netcong	Morris	New Jersey
48047	New Baltimore	Macomb	Michigan
02745	New Bedford	Bristol	Massachusetts
02740	New Bedford	Bristol	Massachusetts
02744	New Bedford	Bristol	Massachusetts
49446	New Era	Oceana	Michigan
53574	New Glarus	Green	Wisconsin
47631	New Harmony	Posey	Indiana
37918	Knoxville	Knox	Tennessee
06510	New Haven	New Haven	Connecticut
23116	Mechanicsville	Hanover	Virginia
70127	New Orleans	Orleans	Louisiana
12550	Newburgh	Orange	New York
82701	Newcastle	Weston	Wyoming
03875	Newmarket	Rockingham	New Hampshire
92663	Newport Beach	Orange	California
40356	Nicholasville	Jessamine	Kentucky
06058	Norfolk	Litchfield	Connecticut
94702	Berkeley	Alameda	California
55056	North Branch	Chisago	Minnesota
44720	North Canton	Stark	Ohio
12843	North Creek	Warren	New York
44903	Mansfield	Richland	Ohio
50401	Mason City	Cerro Gordo	Iowa
43215	Columbus	Franklin	Ohio
29582	North Myrtle Beach	Horry	South Carolina
58701	Minot	Ward	North Dakota
17201	Chambersburg	Franklin	Pennsylvania
20622	Charlotte Hall	St. Mary's	Maryland
18067	Northampton	Northampton	Pennsylvania
60062	Northbrook	Cook	Illinois
55413	Minneapolis	Hennepin	Minnesota
99114	Colville	Stevens	Washington
49670	Northport	Leelanau	Michigan
91324	northridge	Los Angeles	California
45223	Cincinnati	Hamilton	Ohio
53704	Madison	Dane	Wisconsin
48167	Northville	Wayne	Michigan
13815	Norwich	Chenango	New York
22180	Vienna	Fairfax	Virginia
07110	Nutley	Essex	New Jersey
53154	Oak Creek	Milwaukee	Wisconsin
44286	RICHFIELD	Summit	Ohio
22124	Oakton	Fairfax	Virginia
02135	Brighton	Suffolk	Massachusetts
20743	Capitol Heights	Prince George's	Maryland
34471	Ocala	Marion	Florida
92107	San Diego	San Diego	California
08226	Ocean City	Cape May	New Jersey
21811	Berlin	Worcester	Maryland
43906	Bellaire	Belmont	Ohio
43950	St. Clairsville	Belmont	Ohio
97239	Portland	Multnomah	Oregon
62701	Springfield	Sangamon	Illinois
90042	Los Angeles	Los Angeles	California
94609	Oakland	Alameda	California
28516	Beaufort	Carteret	North Carolina
43147	Pickerington	Fairfield	Ohio
98501	Olympia	Thurston	Washington
68106	Omaha	Douglas	Nebraska
68102	Omaha	Douglas	Nebraska
63107	St Louis	St. Louis City	Missouri
54155	Oneida	Outagamie	Wisconsin
28540	Jacksonville	Onslow	North Carolina
06477	Orange	New Haven	Connecticut
92866	Orange	Orange	California
32073	Orange Park	Clay	Florida
97045	Oregon City	Clackamas	Oregon
95340	Merced	Merced	California
94563	Orinda	Contra Costa	California
32174	Ormond Beach	Volusia	Florida
83544	Orofino	Clearwater	Idaho
60543	Oswego	Kendall	Illinois
66524	Overbrook	Osage	Kansas
14521	Ovid	Seneca	New York
47460	Spencer	Owen	Indiana
27565	Oxford	Granville	North Carolina
45056	Oxford	Butler	Ohio
93030	Oxnard	Ventura	California
97135	Pacific City	Tillamook	Oregon
42001	Paducah	McCracken	Kentucky
89048	Pahrump	Nye	Nevada
95076	Watsonville	Santa Cruz	California
10964	Palisades	Rockland	New York
00791	Humacao	Humacao	Puerto Rico
78224	San Antonio	Bexar	Texas
60463	Palos Heights	Cook	Illinois
90274	Rolling Hills Estates	Los Angeles	California
66071	Paola	Miami	Kansas
72450	Paragould, AR	Greene	Arkansas
73103	Oklahoma City	Oklahoma	Oklahoma
17262	Spring Run	Franklin	Pennsylvania
12564	Pawling	Dutchess	New York
02860	Pawtucket	Providence	Rhode Island
02905	Cranston	Providence	Rhode Island
83661	Payette	Payette	Idaho
85541	Payson	Gila	Arizona
43452	Port Clinton	Ottawa	Ohio
95370	Sonora	Tuolumne	California
77515	Angleton	Brazoria	Texas
05862	Peacham	Caledonia	Vermont
78669	Spicewood	Blanco	Texas
41040	Falmouth	Pendleton	Kentucky
46064	Pendleton	Madison	Indiana
08534	Pennington	Mercer	New Jersey
72126	Perryville	Perry	Arkansas
66073	Perry	Jefferson	Kansas
94952	Petaluma	Sonoma	California
01366	Petersham	Worcester	Massachusetts
27040	Pfafftown	Forsyth	North Carolina
78660	Pflugerville	Travis	Texas
92371	Phelan	San Bernardino	California
12565	Village of Philmont	Columbia	New York
40206	Louisville	Jefferson	Kentucky
27235	Colfax	Guilford	North Carolina
20852	North Potomac	Montgomery	Maryland
46254	Indianapolis	Marion	Indiana
41501	Pikeville	Pike	Kentucky
55063	Pine City	Pine	Minnesota
33156	Pinecrest	Miami-Dade	Florida
11207	Brooklyn	Kings	New York
66762	Pittsburg	Crawford	Kansas
74501	McAlester	Pittsburg	Oklahoma
48108	Ann Arbor	Washtenaw	Michigan
48739	Hale	Iosco	Michigan
49080	Plainwell	Allegan	Michigan
81624	Collbran	Mesa	Colorado
53818	Platteville	Grant	Wisconsin
90094	Playa Vista	Los Angeles	California
26170	St. Marys	Pleasants	West Virginia
10570	Pleasantville	Westchester	New York
46563	Plymouth	Marshall	Indiana
12140	Poestenkill	Rensselaer	New York
96792	Waianae	Honolulu	Hawaii
61764	Pontiac	Livingston	Illinois
10573	Port Chester	Westchester	New York
48469	Port Sanilac	Sanilac	Michigan
98368	PORT TOWNSEND	Jefferson	Washington
97217	Portland	Multnomah	Oregon
97211	Portland	Multnomah	Oregon
97266	Portland	Multnomah	Oregon
97201	Portland	Multnomah	Oregon
97205	Portland	Multnomah	Oregon
03801	Portsmouth	Rockingham	New Hampshire
53590	Sun Prairie	Dane	Wisconsin
43119	Galloway	Franklin	Ohio
86301	Prescott	Yavapai	Arizona
19127	Philadelphia	Philadelphia	Pennsylvania
84501	Price	Carbon	Utah
23875	Prince George	Prince George	Virginia
40059	Prospect	Oldham	Kentucky
87001	San Felipe Pueblo	Sandoval	New Mexico
99163	Pullman	Whitman	Washington
20132	Purcellville	Loudoun	Virginia
25526	Hurricane	Putnam	West Virginia
98371	Puyallup	Pierce	Washington
61201	Rock Island	Rock Island	Illinois
74363	Quapaw	Ottawa	Oklahoma
98109	Seattle	King	Washington
95971	Quincy	Plumas	California
62301	QUINCY	Adams	Illinois
87102	Albuquerque	Bernalillo	New Mexico
36278	Wedowee	Randolph	Alabama
72455	Pocahontas	Randolph	Arkansas
40913	Beverly	Clay	Kentucky
59068	Red Lodge	Carbon	Montana
51566	Red Oak	Montgomery	Iowa
70806	Baton Rouge	East Baton Rouge	Louisiana
70801	Baton Rouge	East Baton Rouge	Louisiana
70808	Baton Rouge	East Baton Rouge	Louisiana
33033	Homestead	Miami-Dade	Florida
92373	Redlands	San Bernardino	California
53959	Reedsburg	Sauk	Wisconsin
27320	Reidsville	Rockingham	North Carolina
21136	Reisterstown	Baltimore	Maryland
47978	Rensselaer	Jasper	Indiana
20190	Reston	Fairfax	Virginia
83440	Rexburg	Madison	Idaho
47374	Richmond	Wayne	Indiana
53582	Ridgeway	Iowa	Wisconsin
29115	Orangeburg	Orangeburg	South Carolina
29042	Denmark	Bamberg	South Carolina
03461	Rindge	Cheshire	New Hampshire
19103	Philadelphia	Philadelphia	Pennsylvania
23803	Petersburg	Petersburg	Virginia
59034	Hardin	Big Horn	Montana
20737	Riverdale Park	Prince George's	Maryland
28401	Wilmington	New Hanover	North Carolina
32204	Jacksonville	Duval	Florida
46208	indianapolis	Marion	Indiana
60546	Riverside	Cook	Illinois
70062	Kenner	Jefferson	Louisiana
07307	Jersey City	Hudson	New Jersey
19963	Milford	Sussex	Delaware
46783	Roanoke	Huntington	Indiana
51247	Rock Valley	Sioux	Iowa
61104	Rockford	Winnebago	Illinois
30153	Rockmart	Polk	Georgia
97220	Portland	Multnomah	Oregon
24151	Rocky Mount	Franklin	Virginia
59422	Choteau	Teton	Montana
55374	Rogers	Hennepin	Minnesota
65741	Rogersville	Webster	Missouri
97520	Ashland	Jackson	Oregon
97501	Medford	Jackson	Oregon
94928	Rohnert Park	Sonoma	California
60008	Rolling Meadows	Cook	Illinois
59864	Ronan	Lake	Montana
11575	Roosevelt	Nassau	New York
28216	Charlotte	Mecklenburg	North Carolina
75701	Tyler	Smith	Texas
02131	Roslindale	Suffolk	Massachusetts
15229	Pittsburgh	Allegheny	Pennsylvania
78665	Round Rock	Williamson	Texas
93436	LOMPOC	Santa Barbara	California
96797	Waipahu	Honolulu	Hawaii
22546	Ruther Glen	Caroline	Virginia
92382	Running Springs	San Bernardino	California
54848	Ladysmith	Rusk	Wisconsin
72801	Russellville	Pope	Arkansas
95446	Guerneville	Sonoma	California
46979	Russiaville	Howard	Indiana
71270	Ruston	Lincoln	Louisiana
22920	Afton	Nelson	Virginia
43206	Columbus	Franklin	Ohio
43072	Saint Paris	Champaign	Ohio
14779	Salamanca	Cattaraugus	New York
24153	Salem	Roanoke	Virginia
01970	Salem	Essex	Massachusetts
03079	Salem	Rockingham	New Hampshire
93901	Salinas	Monterey	California
48176	Saline	Washtenaw	Michigan
01952	Salisbury	Essex	Massachusetts
98686	Vancouver	Clark	Washington
46825	Fort Wayne	Allen	Indiana
96818	Honolulu	Honolulu	Hawaii
78227	San Antonio	Bexar	Texas
94110	San Francisco	San Francisco	California
04073	Sanford	York	Maine
95050	Santa Clara	Santa Clara	California
95403	Santa Rosa	Sonoma	California
95404	Santa Rosa	Sonoma	California
32571	Pace	Santa Rosa	Florida
49684	Traverse City	Grand Traverse	Michigan
71601	Pine Bluff	Jefferson	Arkansas
12983	Saranac Lake	Franklin	New York
95435	Finley	Lake	California
12477	Saugerties	Ulster	New York
02066	Scituate	Plymouth	Massachusetts
02857	North Scituate	Providence	Rhode Island
07076	Scotch Plains	Union	New Jersey
06264	Scotland	Windham	Connecticut
40324	Georgetown	Scott	Kentucky
14546	Scottsville	Monroe	New York
43232	Columbus	Franklin	Ohio
03833	Exeter	Rockingham	New Hampshire
03869	Rollinsford	Strafford	New Hampshire
77474	Sealy	Austin	Texas
72650	Marshall	Searcy	Arkansas
97138	Seaside	Clatsop	Oregon
27981	Wanchese	Dare	North Carolina
65301	Sedalia, MO	Pettis	Missouri
27101	Winston-Salem	Forsyth	North Carolina
13148	Seneca Falls	Seneca	New York
71832	De Queen	Sevier	Arkansas
68434	Seward	Seward	Nebraska
28470	Shallotte	Brunswick	North Carolina
54166	Shawano	Shawano	Wisconsin
51537	Harlan	Shelby	Iowa
46176	SHELBYVILLE	Shelby	Indiana
40165	Shepherdsville	Bullitt	Kentucky
45415	Dayton	Montgomery	Ohio
98133	Shoreline	King	Washington
53211	Shorewood	Milwaukee	Wisconsin
71101	Shreveport	Caddo	Louisiana
72761	Siloam Springs	Benton	Arkansas
88061	Silver City	Grant	New Mexico
83837	Kellogg	Shoshone	Idaho
93093	Simi Valley	Ventura	California
51101	Sioux City	Woodbury	Iowa
99835	Sitka	Sitka	Alaska
88030	Deming	Luna	New Mexico
16057	Slippery Rock	Butler	Pennsylvania
93401	San Luis Obispo	San Luis Obispo	California
37030	Carthage	Smith	Tennessee
93060	Santa paula	Ventura	California
92626	Costa Mesa	Orange	California
14551	sodus	Wayne	New York
42102	Bowling Green	Warren	Kentucky
92075	Solana Beach	San Diego	California
15501	Somerset	Somerset	Pennsylvania
02144	Somerville	Middlesex	Massachusetts
02145	Somerville	Middlesex	Massachusetts
32208	Jacksonville	Duval	Florida
94703	Berkeley	Alameda	California
34114	Naples	Collier	Florida
37375	Sewanee	Franklin	Tennessee
49506	Grand Rapids	Kent	Michigan
28203	Charlotte	Mecklenburg	North Carolina
78628	Georgetown	Williamson	Texas
23970	South Hill	Mecklenburg	Virginia
02879	Wakefield	Washington	Rhode Island
96150	South Lake Tahoe	El Dorado	California
48178	South Lyon	Oakland	Michigan
33143	Miami	Miami-Dade	Florida
53172	South Milwaukee	Milwaukee	Wisconsin
07079	SOUTH ORANGE	Essex	New Jersey
18505	Scranton	Lackawanna	Pennsylvania
64504	St. Joseph	Buchanan	Missouri
06074	South Windsor	Hartford	Connecticut
14760	Olean	Cattaraugus	New York
53177	sturtevant	Racine	Wisconsin
80123	Littleton	Jefferson	Colorado
24343	Hillsville	Carroll	Virginia
48228	Detroit	Wayne	Michigan
81089	Walsenburg	Huerfano	Colorado
89431	Sparks	Washoe	Nevada
46224	Speedway	Marion	Indiana
22407	Fredericksburg	Spotsylvania	Virginia
22170	Fredericksburg	Spotsylvania	Virginia
72764	Springdale	Washington	Arkansas
38606	Batesville	Panola	Mississippi
46373	St. John	Lake	Indiana
97203	Portland	Multnomah	Oregon
48880	St. Louis	Gratiot	Michigan
83861	St. Maries	Benewah	Idaho
40207	Louisville	Jefferson	Kentucky
21663	St. Michaels	Talbot	Maryland
55044	Lakeville	Dakota	Minnesota
33701	St Petersburg	Pinellas	Florida
85718	Tucson	Pima	Arizona
06076	Stafford Springs	Tolland	Connecticut
28001	Albemarle	Stanly	North Carolina
97383	Stayton	Marion	Oregon
01102	Springfield	Hampden	Massachusetts
17257	Shippensburg	Cumberland	Pennsylvania
65565	Steelville	Crawford	Missouri
44224	Stow	Summit	Ohio
05672	Stowe	Lamoille	Vermont
23434	Suffolk	Suffolk	Virginia
44311	Akron	Summit	Ohio
29153	Sumter	Sumter	South Carolina
80547	Timnath	Larimer	Colorado
88063	sunland park	Dona Ana	New Mexico
94086	Sunnyvale	Santa Clara	California
85173	Superior	Pinal	Arizona
29575	Surfside Beach	Horry	South Carolina
33991	Cape Coral	Lee	Florida
96104	Cedarville	Modoc	California
54942	Greenville	Winnebago	Wisconsin
78701	Austin	Travis	Texas
78745	Austin	Travis	Texas
49682	Suttons Bay	Leelanau	Michigan
30024	Suwanee	Gwinnett	Georgia
19081	Swarthmore	Delaware	Pennsylvania
33634	Tampa	Hillsborough	Florida
96145	Tahoe City	Nevada	California
89511	RENO	Washoe	Nevada
87571	Taos	Taos	New Mexico
40071	Taylorsville	Spencer	Kentucky
29601	Greenville	Greenville	South Carolina
03452	Jaffrey	Cheshire	New Hampshire
81435	Telluride	San Miguel	Colorado
94618	Oakland	Alameda	California
33617	Temple Terrace	Hillsborough	Florida
98589	Tenino	Thurston	Washington
49426	Hudsonville	Ottawa	Michigan
47803	Terre Haute	Vigo	Indiana
78613	Cedar Park	Williamson	Texas
78723	Austin, TX	Travis	Texas
49009	Kalamazoo	Kalamazoo	Michigan
28723	Cullowhee	Jackson	North Carolina
29150	Sumter	Sumter	South Carolina
04064	Old Orchard Beach	York	Maine
93534	LANCASTER	Los Angeles	California
37040	Clarksville	Montgomery	Tennessee
27403	Greensboro	Guilford	North Carolina
12518	cornwall n.y.	Orange	New York
81130	Creede	Mineral	Colorado
40245	Louisville/Jefferson County metro government (balance)	Jefferson	Kentucky
45014	Fairfield	Butler	Ohio
88042	Hillsboro	Sierra	New Mexico
01852	Lowell	Middlesex	Massachusetts
20742	College Park	Prince George's	Maryland
06371	Lyme	New London	Connecticut
07820	Allamuchy	Warren	New Jersey
19147	Philadelphia	Philadelphia	Pennsylvania
30337	College Park	Fulton	Georgia
30303	Atlanta	Fulton	Georgia
30311	Atlanta	Fulton	Georgia
24011	Roanoke	Roanoke City	Virginia
33785	Indian Shores	Pinellas	Florida
26452	Weston	Lewis	West Virginia
62656	Lincoln	Logan	Illinois
07853	Long Valley	Morris	New Jersey
24521	Amherst	Amherst	Virginia
54941	Green Lake	Green Lake	Wisconsin
46204	Indianapolis	Marion	Indiana
99833	Petersburg, AK	Wrangell-Petersburg	Alaska
35242	Birmingham	Shelby	Alabama
17327	Glen Rock	York	Pennsylvania
06468	Monroe	Fairfield	Connecticut
01364	Orange	Franklin	Massachusetts
80023	Westminster	Adams	Colorado
97030	Gresham	Multnomah	Oregon
94954	Petaluma	Sonoma	California
95476	Boyes Hot Springs	Sonoma	California
56081	St.james	Watonwan	Minnesota
61036	Galena	Jo Daviess	Illinois
07424	Little Falls	Passaic	New Jersey
89509	Reno	Washoe	Nevada
05148	Londonderry	Windham	Vermont
28403	Wilmington	New Hanover	North Carolina
95695	Woodland	Yolo	California
56701	Thief River Falls	Pennington	Minnesota
94903	San Rafael	Marin	California
16354	Titusville	Crawford	Pennsylvania
02878	Tiverton, RI	Newport	Rhode Island
72770	Tontitown, AR	Washington	Arkansas
82240	Torrington	Goshen	Wyoming
53213	Wauwatosa	Milwaukee	Wisconsin
36276	Wadley	Randolph	Alabama
05359	West Townshend	Windham	Vermont
29690	Travelers Rest	Greenville	South Carolina
15801	DuBois	Clearfield	Pennsylvania
44113	Cleveland	Cuyahoga	Ohio
59874	Trout Creek	Sanders	Montana
12180	Troy	Rensselaer	New York
35759	Meridianville	Madison	Alabama
95453	Lakeport	Lake	California
38804	Tupelo	Lee	Mississippi
35401	Tuscaloosa	Tuscaloosa	Alabama
59754	Twin Bridges	Madison	Montana
61081	Sterling IL	Whiteside	Illinois
54241	Two Rivers	Manitowoc	Wisconsin
29379	Union	Union	South Carolina
30512	Blairsville	Union	Georgia
37807	Maynardville	Union	Tennessee
04862	Union	Knox	Maine
02143	Somerville	Middlesex	Massachusetts
32608	Gainesville	Alachua	Florida
19104	Philadelphia	Philadelphia	Pennsylvania
43221	Upper Arlington	Franklin	Ohio
27858	Greenville	Pitt	North Carolina
29646	Greenwood	Greenwood	South Carolina
43081	Westerville	Franklin	Ohio
77027	Houston	Harris	Texas
52345	Urbana	Benton	Iowa
21704	Frederick	Frederick	Maryland
20250	Washington	District of Columbia	District of Columbia
13501	Utica	Oneida	New York
27536	Henderson	Vance	North Carolina
34109	Naples	Collier	Florida
98070	Vashon	King	Washington
57069	Vermillion	Clay	South Dakota
05701	RUTLAND	Rutland	Vermont
64772	Nevada	Vernon	Missouri
60061	Vernon Hills	Lake	Illinois
24482	Verona	Augusta	Virginia
49097	Vicksburg	Kalamazoo	Michigan
77901	Victoria	Victoria	Texas
44105	Cleveland	Cuyahoga	Ohio
49042	Constantine	St. Joseph	Michigan
60439	Lemont	Cook	Illinois
60077	Skokie	Cook	Illinois
47591	Vincennes	Knox	Indiana
62269	O'Fallon	St. Clair	Illinois
93704	Fresno	Fresno	California
33129	Miami	Miami-Dade	Florida
06384	Voluntown	New London	Connecticut
12186	Voorheesville	Albany	New York
55981	Wabasha	Wabasha	Minnesota
76701	Waco	McLennan	Texas
74467	Wagoner	Wagoner	Oklahoma
96786	Wahiawa	Honolulu	Hawaii
68066	Wahoo	Saunders	Nebraska
96782	Pearl City	Honolulu	Hawaii
96767	Waipahu	Honolulu	Hawaii
96795	Waimanalo	Honolulu	Hawaii
22003	Annandale	Fairfax	Virginia
98103	Seattle	King	Washington
94596	Walnut Creek	Contra Costa	California
52501	Ottumwa	Wapello	Iowa
77880	Washington	Washington	Texas
98335	Gig Harbor	Pierce	Washington
13165	Waterloo	Seneca	New York
06795	Watertown	Litchfield	Connecticut
58854	Watford City	McKenzie	North Dakota
52172	Waukon	Allamakee	Iowa
31503	Waycross	Ware	Georgia
49348	Wayland	Allegan	Michigan
01778	Wayland	Middlesex	Massachusetts
84775	Torrey	Wayne	Utah
48202	Detroit	Wayne	Michigan
22980	Waynesboro	Waynesboro	Virginia
15370	Waynesburg	Fulton	Pennsylvania
02914	East Providence	Providence	Rhode Island
64870	Webb City	Jasper	Missouri
26288	Webster Springs	Webster	West Virginia
14580	Webster	Monroe	New York
83672	Weiser	Washington	Idaho
51555	Missouri Valley	Harrison	Iowa
02667	Wellfleet	Barnstable	Massachusetts
90016	Los Angeles	Los Angeles	California
71355	Moreauville	Avoyelles	Louisiana
24016	Roanoke	Roanoke City	Virginia
06516	West Haven	New Haven	Connecticut
90025	Los Angeles	Los Angeles	California
47906	West Lafayette	Tippecanoe	Indiana
07052	West Orange	Essex	New Jersey
65775	West Plains	Wright	Missouri
10928	Village of Highland Falls	Orange	New York
60622	Chicago	Cook	Illinois
02893	West Warwick	Kent	Rhode Island
85382	Peoria	Maricopa	Arizona
77042	Houston	Harris	Texas
81252	Westcliffe	Custer	Colorado
02891	Westerly	Washington	Rhode Island
25962	Rainelle	Greenbrier	West Virginia
01085	Westfield	Hampden	Massachusetts
43204	Columbus	Franklin	Ohio
48185	Westland	Wayne	Michigan
01473	Westminster	Worcester	Massachusetts
40241	Louisville	Jefferson	Kentucky
53705	Madison	Dane	Wisconsin
48933	Lansing	Ingham	Michigan
95060	Santa Cruz	Santa Cruz	California
90024	Los Angeles	Los Angeles	California
02190	Weymouth	Norfolk	Massachusetts
37188	White House	Sumner	Tennessee
85929	Pinetop-Lakeside	Navajo	Arizona
38116	Memphis	Shelby	Tennessee
40771	Corbin	Whitley	Kentucky
40769	Williamsburg	Whitley	Kentucky
55408	Minneapolis	Hennepin	Minnesota
78228	San Antonio	Bexar	Texas
78217	San Antonio	Bexar	Texas
78220	San Antonio	Bexar	Texas
78237	San Antonio	Bexar	Texas
79407	Lubbock	Lubbock	Texas
28659	North Wilkesboro	Wilkes	North Carolina
23185	Williamsburg	Williamsburg	Virginia
25661	Williamson	Mingo	West Virginia
95125	San Jose	Santa Clara	California
01890	Winchester	Middlesex	Massachusetts
47394	Winchester	Randolph	Indiana
35811	Huntsville	Madison	Alabama
86325	CORNV	Yavapai	Arizona
75494	Winnsboro	Wood	Texas
37830	Oak Ridge	Anderson	Tennessee
54495	Wisconsin Rapids	Wood	Wisconsin
24293	Wise	Wise	Virginia
28806	Asheville	Buncombe	North Carolina
41301	Campton	Wolfe	Kentucky
03894	Wolfeboro	Carroll	New Hampshire
79382	Wolfforth	Lubbock	Texas
40347	Midway	Woodford	Kentucky
40383	VERSAILLES	Woodford	Kentucky
12498	Woodstock	Ulster	New York
30188	Woodstock	Cherokee	Georgia
60098	Woodstock	McHenry	Illinois
73801	Woodward	Woodward	Oklahoma
02895	Woonsocket	Providence	Rhode Island
18940	Wrightstown (use Newtown for GPS)	Bucks	Pennsylvania
24368	Wytheville	Wythe	Virginia
19067	Yardley borough	Bucks	Pennsylvania
14527	Penn Yan	Yates	New York
33021	Hollywood	Broward	Florida
47396	Yorktown	Delaware	Indiana
77024	Houston	Harris	Texas
77044	Houston	Harris	Texas
77443	Cypress	Harris	Texas
48197	Ypsilanti	Washtenaw	Michigan
96097	Yreka	Siskiyou	California
92399	Yucaipa	San Bernardino	California
27597	Zebulon	Wake	North Carolina
16063	Zelienople	Butler	Pennsylvania
\.



COPY public.market_media (fmid, website, facebook, twitter, youtube, other_media) FROM stdin;
1018261	https://www.caledoniafarmersmarket.com	https://www.facebook.com/Danville.VT.Farmers.Market/	\N	\N	\N
1009994	\N	https://www.facebook.com/ScottsbluffFarmersMarket	\N	\N	\N
1000709	http://www.highlandsnj.com	https://www.facebook.com/pages/Highlands-Business-Partnership-Highlands-NJ/165486543524770	\N	\N	visithighlandsnj - Instagram
1019956	\N	https://www.facebook.com/29palmsfarmersmarket/	\N	\N	IG @29palmsfarmersmarket
1009959	http://www.metroparks.org	https://www.facebook.com/2ndStreetMarket/	\N	\N	\N
1004950	http://www.3frenchhensmarket.blogspot.com	https://www.facebook.com/pages/3-French-Hens-French-Country-Market/422352511143508	\N	\N	\N
1019938	http://www.3rddayfarm.com	facebook/ 3rd Day Farm	\N	\N	\N
1018965	https://experimentalstation.org/market	61market	61market	\N	Instagram:
1019473	http://www.aberdeensundaymarket.org	Facebook.com/AberdeenSundayMarket	\N	\N	\N
1010487	http://www.abingdonfarmersmarket.com	https://www.facebook.com/abingdonfarmersmarket	\N	\N	\N
1019695	https://www.townofabitasprings.com/farmers-market	https://www.facebook.com/abitasprings.farmersmarket/	\N	\N	https://www.instagram.com/abitasprings.farmersmarket/
1021442	\N	facebook.com/acohfarmersmarket	\N	\N	instagram.com/acohfarmersmarket
1019676	\N	www.facebook.com/AdamsCountyFarmersMarket	@ACFarmFresh	\N	\N
1019351	http://www.acfarmersmarkets.org	www.facebook.com/AdamsCountyFarmersMarket	https://twitter.com/ACFarmFresh	\N	www.instagram.com/adamscountyfarmersmarket
1019847	\N	https://www.facebook.com/FarmersAtAdamsRicciParkEast/	@adamsriccifm	n/a	https://www.instagram.com/adamsriccifarmersmarket/
1008961	http://www.adaptationsaloha.com	https://www.facebook.com/adaptationsaloha	https://twitter.com/MaureenDatta	\N	http://instagram.com/adaptationskona
1019203	http://AGFarmersMarket.com	http://www.facebook.com/AGFarmersMarket	http://twitter.com/AGFarmMarket	\N	http://www.instagram.com/agfarmersmarket
1012233	http://www.agricenter.org/farmersmarket/	https://www.facebook.com/farmersmarketmemphis/	https://twitter.com/Agricenter_Intl	https://www.youtube.com/channel/UCGksUsmHEJonFv5cwivsjZA	https://www.instagram.com/agricenterinternational/
1005258	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1008054	\N	https://www.facebook.com/airportfarmersandfleamarket	\N	\N	\N
1008612	http://www.441market.com	https://www.facebook.com/441acfmarket	\N	\N	http://pinterest.com/441market
1018304	\N	https://www.facebook.com/AlamoHeightsFarmersMarket/	https://twitter.com/AlamoHeightsFM	\N	https://www.instagram.com/alamoheightsfm/?hl=en
1021689	\N	https://www.facebook.com/Albany.OR.Farmers.Market	\N	\N	https://www.instagram.com/albanyorfarmersmarket/
1019371	\N	https://www.facebook.com/Albany-IN-Farmers-Market-405175829889200/?modal=admin_todo_tour	\N	\N	\N
1021578	\N	https://www.facebook.com/MainStreetAlbany	\N	\N	\N
1000519	http://www.visitalexbay.org	https://www.facebook.com/pages/Alexandria-Bay-Chamber-of-Commerce/82504121853	\N	\N	\N
1019113	\N	Alexandria, MN Farmers Market	\N	\N	\N
1021464	https://www.louisiana-central.com/alexandria-farmers-market	https://www.facebook.com/AlexandriaFarmersMarket	\N	\N	https://www.instagram.com/alexandriafarmersmarket/
1021597	https://visitalgomawi.com/market/	https://www.facebook.com/AlgomaSundayFarmersMarket	\N	\N	\N
1019831	http://www.acfarmersmarket.com	Allen County Farmers' Market	\N	\N	\N
1019832	http://www.acfarmersmarket.com	Allen County Farmers' Market	\N	\N	\N
1012389	http://www.alohacommunityfarmersmarket.org	https://www.facebook.com/Aloha-Community-Farmers-Market-913645008655691/	@AlohaFarmMarket	\N	Instagram: Aloha Community Farmers' Market
1020150	http://svsaturdaymarket.org/	https://www.facebook.com/ModocCFM/	\N	\N	\N
1021309	http://www.farmtocitymarkets.com	https://www.facebook.com/FarmToCity	\N	\N	\N
1011171	http://www.amesmainsteetfarmersmarket.com	Ames Main Street Farmers' Market	\N	\N	\N
1003563	\N	https://www.facebook.com/amicalolafarmersmarket/	\N	\N	\N
1019438	https://amquistation.org/farmers-market/	\N	\N	\N	\N
1012157	\N	https://www.facebook.com/groups/478915098830452/	\N	\N	\N
1005944	http://www.anacortesfarmersmarket.org	https://www.facebook.com/AnacortesFarmersMarket	\N	\N	\N
1019647	https://www.andersoncountysc.org/parks/	www.facebook.com/andersoncountyfarmersmarket	\N	\N	\N
1020084	\N	AndersonCoFarmersMarket	\N	\N	\N
1003516	http://www.andersonvillemarket.org	https://www.facebook.com/andersonville?ref=bookmarks	\N	\N	\N
1020060	http://andoverfarmersmarket.com/	https://www.facebook.com/andoverfarmersmarket/?view_public_for=153480551390115	\N	\N	https://www.instagram.com/andovermafarmersmarket/
1019484	https://www.fairfaxcounty.gov/parks/farmersmarkets/annandale	https://www.facebook.com/events/557660981411692/	\N	\N	@fairfaxfarmmarkets
1019096	\N	Annandale Farmers Market	\N	\N	\N
1019350	https://www.antioch.il.gov/?s=Farmers+Market	https://www.facebook.com/VillageOfAntioch/	\N	\N	\N
1000431	http://www.appletondowntown.org	www.facebook.com/downtownappletonfarmmarket	\N	\N	\N
1021359	https://aquidneckcommunitytable.org/	https://www.facebook.com/Aquidneck-Growers-Market-145175198849594	\N	\N	@aquidneckgrowers
1021733	https://aquidneckcommunitytable.org/	https://www.facebook.com/Aquidneck-Growers-Market-145175198849594	\N	\N	@aquidneckgrowers
1021732	https://aquidneckcommunitytable.org/	https://www.facebook.com/Aquidneck-Growers-Market-145175198849594	\N	\N	@aquidneckgrowers
1019662	https://www.arlington-vermont.com/farmers-market	https://www.facebook.com/Market05250	\N	\N	\N
1019904	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=17	https://www.facebook.com/farmfreshri/	\N	\N	\N
1019222	https://www.arnoldmo.org/government/departments/parks-recreation/arnold-farmers-market/	https://www.facebook.com/arnoldfarmersmarket/?ref=settings	ArnoldFarmMarket	\N	\N
1009810	http://www.ashlandfarmersmarket.org/	https://www.facebook.com/AshlandMAFarmersMarket	\N	\N	\N
1021627	http://www.astoriasundaymarket.com	https://www.facebook.com/astoriasundaymarket	\N	\N	https://www.instagram.com/astoriasundaymarket/?hl=en
1001245	http://www.asuregionalfarmersmarket.org	https://www.facebook.com/asuregionalfarmersmarket	https://twitter.com/asufarmersmarket	\N	\N
1002984	https://atchisonkansas.com/business-directory/atchison-farmers-market	https://www.facebook.com/AtchisonFarmersMarket/	\N	\N	\N
1005086	http://www.athensfarmersmarket.org	https://www.facebook.com/athensohfarmersmarket/	@athensohfarmersmarket	\N	\N
1018033	http://www.athensfarmersmarket.net/	https://www.facebook.com/AthensFarmersMarket	https://twitter.com/AthFarmersMkt	\N	https://www.instagram.com/athensfarmersmarket/
1020098	http://www.bluegrassfarmersmarket.com	BluegrassFarmersMarket@bluegrassfarmersmarket	\N	\N	\N
1018032	http://www.athensfarmersmarket.net/	https://www.facebook.com/AthensFarmersMarket	https://twitter.com/AthFarmersMkt	\N	https://www.instagram.com/athensfarmersmarket/
1021450	\N	https://www.facebook.com/Atholfarmersmarket	\N	\N	\N
1018330	http://www.attleborofarmersmarket.com	AttleboroFarmersMarket@AttFrmMkt	\N	\N	\N
1021225	https://seela.org/markets-atwater-village/	\N	\N	\N	https://www.instagram.com/atwatervillagefm/
1019789	http://www.auburnfarmersmarket.org	https://www.facebook.com/AuburnInternationalFarmersMarket/?ref=bookmarks	https://twitter.com/AifmAuburnWA	\N	\N
1000559	\N	Aurora Local Farmers Market	\N	\N	\N
1021534	\N	https://www.facebook.com/farmergeorge.market	https://twitter.com/farmergeorgetx?lang=en	https://www.youtube.com/channel/UCvxG2wYZ5ebpCgcr8tQtV_Q/featured	https://www.instagram.com/farmergeorge.market/?hl=en
1019396	http://www.avongov.org/category/subcategory.php?categoryid=28	http://facebook.com/avonfarmersmarket	\N	\N	\N
1019126	\N	https://www.facebook.com/avonfreepubliclibrary/	\N	\N	@afplct (instagram)
1021528	https://thebackyardmarkets.com	https://www.facebook.com/BackyardMarketinBF/	\N	\N	https://www.instagram.com/backyardmarketinbf/
1021530	https://thebackyardmarkets.com	https://www.facebook.com/BackyardMarketinBF/	\N	\N	https://www.instagram.com/backyardmarketinbf/
1021529	https://thebackyardmarkets.com	https://www.facebook.com/BackyardMarketinBF/	\N	\N	https://www.instagram.com/backyardmarketinbf/
1019044	\N	bainbridgefarmmarket	\N	\N	\N
1019076	https://www.villageofbaldwin.com/community/page/main-st-farmers-market	https://www.facebook.com/BaldwinsMainStFarmersMarket/	\N	\N	\N
1021338	http://www.sfmamarkets.com/visit-ballard-farmers-market	https://www.facebook.com/BallardFarmersMarket	\N	\N	https://www.instagram.com/sfmamarkets/
1021521	\N	https://www.facebook.com/bambergfarmersmarket/?ref=page_internal	\N	\N	\N
1012081	http://www.bangorfarmersmarket.org	www.facebook.com/bangorfarmersmarket	\N	\N	\N
1021582	http://barmbargains.com	@barmbargains	\N	\N	\N
1001604	http://www.barnegat.net	@barnegatrecreation	\N	\N	\N
1020029	http://www.barrowcountyfarmersmarket.com	https://www.facebook.com/barrowcountyfarmersmarket	\N	\N	#barrowcountyfarmersmarket
1003335	http://www.basaltsundaymarket.com	\N	\N	\N	\N
1000436	http://www.bastrop1832farmersmarket.org	https://www.facebook.com/pages/Bastrop-1832-Farmers-Market/118950738119102	https://twitter.com/bastrop1832	\N	http://www.pinterest.com/dlpr/bastrop-1832-farmers-market/
1021540	https://downtownbatavia.com/farmers-market/	https://www.facebook.com/BataviaFarmersMarket/about/?ref=page_internal	\N	\N	https://www.instagram.com/bataviafarmersmarket/?hl=en
1021265	http://Www.Batesvillefarmersmarket.com	Batesville Farmers Market	\N	\N	\N
1021443	http://www.battlecreekfarmersmarket.com	facebook.com/BattleCreekFarmersMarketAssociation	\N	\N	\N
1019617	https://www.bayareafarmersmarkettexas.com/	https://www.facebook.com/bayareafarmersmarket/?modal=admin_todo_tour	\N	\N	\N
1020102	\N	Locally Made Market Beattyville Lee county	\N	\N	\N
1018735	http://www.beaumontfarmersmarket.org	Beaumont Farmers Market	\N	\N	Instagram
1021630	http://beaverdalefarmersmarket.org/	https://www.facebook.com/BeaverdaleFarmFest/	www.twitter.com/BeaverdaleFarm	\N	\N
1019853	http://Www.bedfordfarmersmarketnh.org	https://www.facebook.com/BedfordFarmersMarketNH/	\N	\N	\N
1019400	http://bedminsternj.hosted.civiclive.com/township_services/farmers_market	https://www.facebook.com/bedminsterfarmersmarket/?eid=ARArXvXuUVPdjTMbOd_12-gC2WKj6BpLHpqkVXPEOpscqeAh6w0Zv07etCwMUUqqHWLD7rH2eCWztrqR	\N	\N	https://www.instagram.com/bedminsterfarmersmarket/?hl=en
1010607	http://www.BelAirFarmersMarket.com	BelAir Farmers Market	@belairfm	\N	Instagram  @belairfm
1011902	http://bellevilleks.org	https://www.facebook.com/BellevilleKSFarmersMarket	\N	\N	\N
1021363	http://www.bellevillecentralbusinesscommunity.com	Belleville Farmers Market	\N	\N	\N
1008140	http://www.bellinghamfarmers.org	https://www.facebook.com/pages/Bellingham-Farmers-Market/30710694970	https://twitter.com/BhamFarmersMkt	\N	\N
1002064	\N	Belmont Farmers Market	\N	\N	www.thebelmontfarmersmarket.com
1011363	\N	https://www.facebook.com/BeltonMoFarmersMarket/	\N	\N	\N
1001316	\N	http://www.facebook.com/bemidjisfarmersmarket	\N	\N	\N
1001533	http://www.beniciamainstreet.org	\N	\N	\N	\N
1018644	http://www.bennetfarmersmarket.com/	\N	\N	\N	\N
1021403	https://www.downtownbentonville.org/event/fm	https://www.facebook.com/142086697017/	\N	\N	\N
1005183	http://www.berkeleyspringsfarmersmarket.com	https://www.facebook.com/pages/Berkeley-Springs-Farmers-Market/354062496235	\N	\N	IG @bsfarmersmarket
1021628	\N	https://www.facebook.com/berwickmainefarmersmarket	\N	\N	https://www.instagram.com/berwickwinterfarmersmarket/
1019168	\N	https://www.facebook.com/BessemerFarmersMarket/	\N	\N	\N
1019967	http://bethaltomarketinthepark.org	bethatofarmersmarket	\N	\N	\N
1021322	https://bethanybeachfarmersmarket.com/	https://www.facebook.com/bethanybeachfarmersmarket	@BBFarmersMarket	0	\N
1010406	http://www.centralfarmmarkets.com	www.facebook.com/CentralFarmMarkets	@CentralFarmMKTs	\N	http://dishingthedirtblog.wordpress.com/
1012494	http://www.bethlehemfarmersmarket.com	facebook.com/BethlehemFarmersMarketPA	twitter.com/BethFarmMkt	\N	instagram.com/bethlehemfarmersmarket
1020196	http://beverlyhills.org/departments/communityservices/farmersmarket/	https://www.facebook.com/BHFarmersMarket/	\N	\N	\N
1019765	http://www.bexleyfarmersmarket.org	\N	\N	\N	\N
1005949	http://www.highdesertfarmersmarket.com	https://www.facebook.com/BigBearFarmersMarket	\N	\N	\N
1019338	http://www.biglakemn.org/350/Farmers-Market	https://www.facebook.com/biglakefarmersmarket/	\N	\N	\N
1019339	http://www.biglakemn.org/432/Winter-Farmers-Market	https://www.facebook.com/biglakefarmersmarket/	\N	\N	\N
1019591	http://billericafarmersmarket.org	Billerica Farmers Market	\N	\N	\N
1021508	https://birdsboropa.org/community-events/	https://m.facebook.com/events/main-bird-park-226-n-water-st-birdsboro-pa-19508/birdsboro-farmers-market/752878688717725/	\N	\N	\N
1011037	http://www.bismarket.com	www.facebook.com/bismarketnd	\N	\N	\N
1012163	http://BlairstownFarmersMarket.com	https://www.facebook.com/blairstownfarmersmarket/	https://twitter.com/FoodshedNJ	\N	\N
1011829	http://www.bloomfieldpgh.org	https://www.facebook.com/bloomfieldmarket/	\N	\N	instagram.com/bloomfieldpgh
1018396	http://bloomington.in.gov/farmersmarket	https://www.facebook.com/pages/Bloomington-Community-Farmers-Market/130635957114110	\N	\N	\N
1018563	http://bloomingtonwinterfarmersmarket.com	https://www.facebook.com/Bloomington-Winter-Farmers-Market-205299875349/	\N	\N	https://www.instagram.com/bloomingtonwinterfarmersmarket/
1019932	http://summitparkblueash.com/residents/farmers_market.php	https://www.facebook.com/blueashfarmersmarket/	\N	\N	https://www.instagram.com/blueashfarmersmarket/
1005528	\N	https://www.facebook.com/washingtonfarmers	\N	\N	\N
1019372	https://www.explorebluffton.com/farmers-market	https://www.facebook.com/farmersmarketblufftonohio/	\N	\N	\N
1019440	\N	https://www.facebook.com/BlufftonIndianaFarmersMarket/	\N	\N	\N
1018092	http://www.thebmi.org/programs-events/bmi-farmers-market/	https://www.facebook.com/BaltimoreMuseumofIndustry/	https://twitter.com/BMIatWork	https://www.youtube.com/watch?v=or-mld01KWw	https://www.instagram.com/baltimoremuseumofindustry/
1018313	http://WWW.THEBOISEFARMERSMARKET.COM	BOISE FARMERS MARKET	BOISE FARMERS MARKET	\N	\N
1018316	http://www.theboisefarmersmarket.com	BOISE FARMERS MARKET	BOISE FARMERS MARKET	\N	\N
1020101	http://www.boonecountyfarmersmarker.org	\N	\N	\N	\N
1006833	http://www.boonefarmersmarket.com	\N	\N	\N	\N
1019318	https://boonvillemofarmersmarket.weebly.com/	@BoonvilleMOFarmersMarket	@boonfarmmarket	\N	\N
1019693	\N	https://www.facebook.com/BotetourtFarmersMarket/	\N	\N	\N
1018394	\N	facebook.com/Bottineau-Farmers-Market-1665424737011341/	\N	\N	\N
1001526	http://www.bouldermtchamber.org	Boulder MT Farmers and Artisans Market	\N	\N	\N
1019165	http://www.cityofbowie.org/103/Farmers-Market	https://www.facebook.com/BowieFarmersMarket/	\N	\N	\N
1020096	https://boyd.ca.uky.edu/content/farmersmarket	Boyd County Farmers Market	\N	\N	\N
1020099	https://boyd.ca.uky.edu/content/farmersmarket	Boyd County Farmers Market	\N	\N	\N
1019205	http://boynecitymainstreet.com/farmers-market-welcome/	https://www.facebook.com/BoyneCityFarmersMarket/	\N	\N	\N
1021248	http://www.braeswoodfarmersmarket.com	https://www.facebook.com/braeswoodfarmersmarket	\N	\N	https://www.instagram.com/braeswoodfarmersmarket/
1018227	http://www.braintreefarmersmarket.org	https://www.facebook.com/braintreefarmersmarket/	https://twitter.com/bfarmmarket	\N	https://www.instagram.com/braintreefarmersmarket/
1002407	http://www.brattleborofarmersmarket.com	https://www.facebook.com/pages/Brattleboro-Area-Farmers-Market/197642043604505	\N	\N	\N
1011075	http://www.brattleborowinterfarmersmarket.org	//www.facebook.com/BrattleboroWinterFarmersMarket	//twitter.com/BrattWinterMkt	\N	\N
1020113	\N	https://www.facebook.com/BreathittFarmersMarket	\N	\N	\N
1018556	http://www.bremertonmarket.com	https://www.facebook.com/BremertonMarket/	\N	\N	\N
1019146	\N	https://www.facebook.com/BridgewaterFarmersMarketNJ/	\N	\N	\N
1018756	http://visitbrighamcity.com/farmersmarket	@historicbrigham	@historicbrigham	\N	\N
1005483	http://www.hitchcockacademy.org	\N	\N	\N	\N
1019905	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=3	https://www.facebook.com/farmfreshri/	\N	\N	\N
1019257	http://www.town.broadway.va.us/farmers-market.html	https://www.facebook.com/BroadwayFarmMkt/	Broadwayfarmmkt	\N	\N
1019984	https://www.brocktonfarmersmarket.com/	https://www.facebook.com/BrocktonFarmersMarket/	https://twitter.com/BrocktonMarket	\N	https://www.instagram.com/brocktonfarmersmkt/
1019794	\N	https://www.facebook.com/2018BGM/?modal=admin_todo_tour	\N	\N	\N
1019527	http://www.101farmersmarket.com/	https://www.facebook.com/Brookingsharborfarmersmarket/	\N	\N	\N
1021210	https://www.brooklinefarmersmarket.com	\N	\N	\N	\N
1021736	https://www.brooksidefarmersmarket.com/	https://www.facebook.com/BrooksideFarmersMarket	\N	\N	\N
1018891	http://www.hernandogrowers.org	facebook.com/hernandogrowers	twitter.com/HernandoGrowers	\N	instagram.com/hernandogrowers
1021262	http://www.broomecountyregionalmarket.com	Broome County Regional Farmers Market	\N	\N	Instagram: broomecountyregionalfarmersmkt
1019906	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=5	https://www.facebook.com/farmfreshri/	\N	\N	\N
1019727	https://www.brownsburg.org/category/subcategory.php?categoryid=8	https://www.facebook.com/BrownsburgFarmersMarket/	https://twitter.com/home	\N	https://www.instagram.com/brownsburgfarmersmarket/
1017968	\N	Bruce Community Farmers Market	\N	\N	\N
1008607	http://www.btlt.org/farmers-market	\N	\N	\N	\N
1021311	http://www.farmtocitymarkets.com	https://www.facebook.com/TBMFM	\N	\N	\N
1019218	http://villagevents@cox.net	\N	\N	\N	\N
1008953	\N	https://www.facebook.com/BucksportBayFarmersMarket	\N	\N	\N
1000843	http://www.burbankfarmersmarket.org	https://www.facebook.com/burbankfarmersmarket	@BurbFarmMkt	\N	burbankfarmersmarket
1019492	https://www.fairfaxcounty.gov/parks/farmersmarkets/burke	https://www.facebook.com/events/786233015044186/	\N	\N	@fairfaxfarmmarkets
1021524	http://www.burkeareafarmersmarket.com	Burke Area Farmers Market	\N	\N	Instagram @burkeareafarmersmarket
1019965	https://www.burlingtonfarmersmarket.org/	https://www.facebook.com/BurlingtonFarmersMarketVT	\N	\N	https://www.instagram.com/bfmvermont/
1021728	http://burrillvillefarmersmarket.org	Burrillville Farmers Market	\N	\N	Instagram
1001362	http://www.mainstrreetbutte.org/fmarket.htm	https://www.facebook.com/ButteFM	\N	\N	\N
1021238	https://www.buylocalmarket.org/	https://www.facebook.com/buylocalfarmersmarket/	\N	\N	https://www.instagram.com/buylocalfarmersmarket/
1021614	\N	C & C Garden	\N	\N	\N
1020089	http://www.gocadiz.com	Cadiz-Trigg County Farmer's Market	\N	\N	\N
1004927	\N	https://www.facebook.com/caganfarmersmarket/	\N	\N	\N
1019922	https://www.calaverasgrown.org/	https://www.facebook.com/CalaverasGROWN	\N	https://www.youtube.com/channel/UC2ce-STvOmVNtxq8Ybk6DnQ	\N
1019978	\N	Murphys Farmers' Market	\N	\N	Instagram @murphysfarmersmarket
1018263	https://www.caledoniafarmersmarket.com/	https://www.facebook.com/St.J.Farmers.Market/	\N	\N	\N
1019980	\N	https://www.facebook.com/EatLocalRacine/	\N	\N	\N
1020188	https://uvfm.org/palo-alto-sundays	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage/
1018459	https://www.visitstmarysmd.com/food-drink/detail/california-farmers-market	https://www.facebook.com/CaliforniaBAEFarmersMarket	\N	\N	\N
1019997	http://www.camarillofarmersmarket.com	\N	\N	\N	\N
1020160	https://www.cambriafarmersmarket.com	https://www.facebook.com/cambriafarmersmarket/	\N	\N	https://www.instagram.com/cambriafarmersmarket/
1020183	http://www.uvfm.org	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage/
1002674	http://www.camelliacitymarket.org	https://www.facebook.com/CamelliaCityMarket	\N	\N	Facebook.com/CamelliaCityMarket
1021575	http://eldoradofarmersmarket.com	\N	\N	\N	\N
1020117	\N	https://www.facebook.com/campbellcountyfarmmarket	\N	\N	\N
1020118	\N	https://www.facebook.com/campbellcountyfarmmarket	\N	\N	\N
1020119	\N	https://www.facebook.com/campbellcountyfarmmarket	\N	\N	\N
1020184	https://uvfm.org/campbell-sundays	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage/
1009034	http://Canaldistrictfarmersmarket.com	https://www.facebook.com/canaldistrictfarmersmarket	https://twitter.com/Canaldistrict	\N	Instagram @canaldistrict
1019810	https://www.canalmarketdistrict.org/	https://www.facebook.com/canalmarketdistrict	\N	\N	https://www.instagram.com/canalmarketdistrict/
1021202	\N	Canal Village Farmers' Market	\N	\N	\N
1012038	http://coastalpacificinfo.us	https://www.facebook.com/canogafarmersmarket/	\N	\N	\N
1019772	https://www.canton-mi.org/496/Canton-Farmers-Market	@cantonfarmersmarket	\N	\N	\N
1021435	http://www.CantonFarmersMarket.com	www.facebook.com/CantonOhioFarmersMarket	\N	\N	\N
1021294	\N	Cape Coral Farmers Market	\N	\N	\N
1021655	https://www.downtowncapegirardeau.com/cape-riverfront-market/	https://www.facebook.com/CapeRiverfrontMarket/	\N	\N	https://www.instagram.com/cape.riverfront.market/
1011930	http://www.downtowndoverpartnership.com/	https://www.facebook.com/capitalcityfarmersmarket/	\N	\N	\N
1018359	http://www.capitalharvestdc.com	CapitalHarvestonthePlaza	@CapHarvestDC	\N	\N
1008450	http://www.montereybayfarmers.org	https://www.facebook.com/pages/Monterey-Bay-Certified-Farmers-Markets/112446802152723	https://twitter.com/MBFarmersMarket	\N	www.edibleparadise.com
1006651	http://www.carnationfarmersmarket.org	https://www.facebook.com/pages/Carnation-Farmers-Market/113831768657527	https://twitter.com/CarnationFmrMkt	\N	https://www.instagram.com/carnationfarmersmarket/
1019417	\N	CarolinafreshmarketandmoreSC	\N	\N	\N
1021269	http://www.carrborofarmersmarket.com	https://www.facebook.com/carrborofarmersmarket	\N	\N	https://www.instagram.com/carrborofarmersmarket
1008322	\N	https://www.facebook.com/CarrolltonFarmersMarket	\N	\N	\N
1021213	https://carsonfarmersmarket.com/	Carsonfarmersmarket	3rd&curry	\N	IG: carsonfarmersmarket
1021740	http://HistoricNewEngland.org/CaseyFarmMarket	\N	\N	\N	\N
1008276	http://www.catawbacountync.gov/phealth/Adult/FarmersMarket.asp	https://www.facebook.com/catawbacountypublichealth	\N	\N	\N
1019159	https://www.catawbafarmersmarket.com/	https://www.facebook.com/Catawba-Valley-Farmers-Market-129469157077509/	\N	\N	\N
1021242	\N	https://www.facebook.com/Cave-Spring-Farmers-Market-107965954240659/?view_public_for=107965954240659	\N	\N	\N
1012484	http://www.cedarmillfarmersmarket.org	Cedar Mill Farmers market	\N	\N	\N
1019842	\N	The Market at Cedar Point	\N	\N	instagram
1021362	http://www.celinafarmersmarket.com	https://www.facebook.com/CelinaFarmersMarket	\N	\N	\N
1018734	http://celinamarketonthesquare.com/	https://www.facebook.com/FridayNightMarketCelina/	\N	\N	https://www.instagram.com/celinafridaynightmarket/
1021226	https://seela.org/markets-central-avenue/	\N	\N	\N	https://www.instagram.com/centralavefm/
1019907	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=607	https://www.facebook.com/farmfreshri/	\N	\N	\N
1019618	http://www.ckfarmersmarket.org	https://www.facebook.com/CentralKitsapFarmersMarket/	\N	\N	https://www.instagram.com/centralkitsapfm/
1020142	http://www.certifiedfarmersmarkets.org	@CertifiedFarmersMarket	\N	\N	@certifiedfarmersmarketscv (Instagram)
1020141	http://www.certifiedfarmersmarkets.org	@CertifiedFarmersMarket	\N	\N	@certifiedfarmersmarketscv (Instagram)
1020058	http://www.cffma.com	fort washington farmers market	\N	\N	\N
1020057	http://www.cffma.com	river park farmer's market	\N	\N	\N
1020056	http://www.cffma.com	river park farmer's market	\N	\N	\N
1021267	https://champlainislandsfarmersmarket.org/	https://www.facebook.com/ChamplainIslandsFarmersMarket/	\N	\N	\N
1021564	https://champlainislandsfarmersmarket.org/	https://www.facebook.com/ChamplainIslandsFarmersMarket	\N	\N	https://www.google.com/search?client=firefox-b-1-d&q=champlain+islands+farmers+market+instagram
1018886	https://ctfm.jeffersongap.org	Charles Town Farmers Market, WV	\N	\N	\N
1017995	\N	https://www.facebook.com/Charleston-Ar-Farmers-Market-1593672464260381/	\N	\N	\N
1021741	https://charlestownlandtrust.org/farmers_market.html	https://www.facebook.com/charlestownfarmersmarket/	\N	\N	Instagram: @clt_farmersmarket
1011689	http://www.charlottefarmersmarket.com	https://www.facebook.com/CharlotteRegionalFarmersMarket	\N	\N	\N
1005834	\N	https://www.Facebook.com/ChathamFarmer'sMarket	\N	\N	\N
1004754	http://www.chelseafarmersmarket.org	https://www.facebook.com/chelseafarmersmarket	\N	\N	www.instagram.com/chelseafarmersmarket
1008606	\N	https://www.facebook.com/CFitFarmersMarket	\N	\N	\N
1021310	http://www.farmtocitymarkets.com	https://www.facebook.com/AmblerFarmersMarket	\N	\N	\N
1020128	http://chicofarmersmarket.com	Chico Certified Farmers Market	Chico Certified Farmers Market	\N	\N
1020129	http://chicofarmersmarket.com	Chico Certified Farmers Market	Chico Certified Farmers Market	\N	\N
1020127	http://chicofarmersmarket.com	Chico Certified Farmers Market	Chico Certified Farmers Market	\N	\N
1001763	http://www.chilhowie.org	\N	\N	\N	\N
1019104	\N	https://www.facebook.com/chinagrovefarmersmarket/	\N	\N	\N
1008409	http://www.chippewafallsmainst.org/Farmers_Market.html	\N	\N	\N	\N
1021237	https://www.douglasvillega.gov/government/city-departments/keep-douglasville-beautiful/church-st-farmers-market	https://www.facebook.com/events/6730-church-st-douglasville-ga-30134/church-st-farmers-market/198037544608925/	\N	\N	\N
1004360	\N	com/groups/CSFarmersMarket	\N	\N	\N
1021653	http://www.circlesquarecommons.com	https://www.facebook.com/csctownsquare	\N	\N	\N
1019141	https://www.cityofflorence.com/local-foods-initiative/city-center-market	https://www.facebook.com/citycenterfarmersmarket	\N	\N	\N
1005250	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1021199	http://sdfarmbureau.org	facebook.com/cityheightsfm	\N	\N	IG @cityheightsfm
1019717	https://www.auburnalabama.org/parks/programs/city-market/	https://www.facebook.com/CityMarketAuburnAL/	\N	\N	\N
1004255	https://www.cityofloveland.org/farmersmarket	https://www.facebook.com/cityoflovelandfarmersmarket	\N	\N	\N
1017956	http://explorenorthadams.com/item/north-adams-farmers-market/	https://www.facebook.com/NorthAdamsFarmersMarket/	\N	\N	https://www.instagram.com/northadamsfarmersmarket/
1000303	http://www.plymouthmn.gov	\N	\N	\N	\N
1021433	http://www.sevenhillsohio.org/en-US/farmers-market.aspx	https://www.facebook.com/cityofsevenhills?fref=ts	https://twitter.com/SevenHillsCity	\N	https://www.instagram.com/sevenhillsfarmersmarket/
1021420	http://www.scsmi.net	https://www.facebook.com/StClair-Shores-Farmers-Market-434292750726325	\N	\N	\N
1006460	http://www.whitebearlake.org	\N	\N	\N	\N
1005940	http://www.cityseed.org/edgewood-park	https://www.facebook.com/cityseed/	@CitySeedNH	\N	instagram: @cityseedhaven
1005941	http://cityseed.org/fair-haven/	https://www.facebook.com/cityseed	@CitySeedNH	\N	instagram: @cityseedhaven
1019206	http://cityseed.org/indoor-winter-market/	https://www.facebook.com/cityseed	CitySeedNH	\N	Instagram: cityseedhaven
1005943	http://cityseed.org/wooster-square/	https://www.facebook.com/cityseed/	@CitySeedNH	\N	instagram: @cityseedhaven
1002106	http://www.claremontforum.org	https://www.facebook.com/pages/Claremont-Farmers-Artisans-Market/148040805240200?fref=ts	\N	\N	\N
1019061	http://www.claremontnh.com/residents/departments/parks-and-recreation/farmers-market.aspx	ClaremontFarmersMarketnh	\N	\N	\N
1000579	http://www.clarencefarmersmarket.com	https://www.facebook.com/clarencehollowfm	\N	\N	\N
1019840	\N	Facebook.com/CLARKSTONFARMERSMARKET/	Twitter @ClarkstonFM  Instagram @clarkstonfm   Snapchat clarkstonfrmmkt	\N	\N
1021441	\N	Clay Center Farmers Market	\N	\N	\N
1019110	\N	Cleburne Farmer's Market	\N	\N	cleburnefarmers   Instagram
1019741	https://www.clemmons.org/243/Clemmons-Farmers-Market	https://www.facebook.com/clemmonsfarmersmarket	\N	\N	\N
1019704	http://clevelandparkmainstreet.org	https://www.facebook.com/CleParkMainStDC	\N	\N	https://www.instagram.com/clevelandparkfarmersmarket/
1018381	http://www.saratogafarmersmarket.org/clifton-park-farmers-market/	https://www.facebook.com/Clifton-Park-Farmers-Market-440138679349915/	\N	\N	\N
1019823	https://clintonnychamber.org/farmers-market/	https://www.facebook.com/ClintonNYFarmersMarket/	\N	\N	https://www.instagram.com/clintonfarmersmarketny/
1019763	http://www.clintonvillefarmersmarket.org	https://www.facebook.com/clintonvillefarmersmarket	\N	\N	\N
1019474	http://www.coopfarmersmarket.com	Co-Operative Farmers Market	\N	\N	TV, Radio, Newpaper, Billboard
1018969	https://www.coastalmarket.org	https://www.facebook.com/CoastalGrowers/	\N	\N	https://www.instagram.com/coastalgrowers/
1019821	http://www.coastalmarket.org/	https://www.facebook.com/CoastalGrowers	https://twitter.com/CoastalMarketRI	\N	https://www.instagram.com/coastalgrowers/
1020135	http://www.coastsidefarmersmarkets.org	https://www.facebook.com/Coastside-Farmers-Market-in-Half-Moon-Bay-135241926498880	\N	\N	#coastsidefarmersmarkets
1020137	http://www.coastsidefarmersmarkets.org	https://www.facebook.com/Coastside-Farmers-Market-in-Half-Moon-Bay-135241926498880	\N	\N	#coastsidefarmersmarkets
1021232	http://www.cpwa.us/residents/events/farmers_and_artisans_market.php	https://www.facebook.com/CP.Farmers.Market	\N	\N	\N
1001290	http://www.collinsvillefarmersmarket.org	https://www.facebook.com/collinsvillefarmersmarket1	@CollinsvilleFM	\N	\N
1000210	http://www.farmandartmarket.com	https://www.facebook.com/farmandartmarket	https://twitter.com/cofarmartmarket	\N	\N
1009656	http://www.farmandartmarket.com	https://www.facebook.com/farmandartmarket	https://twitter.com/cofarmartmarket	\N	\N
1018196	http://columbiafarmersfreshmarket.com/	https://www.facebook.com/Columbia-Farmers-Fresh-Market	\N	\N	\N
1019790	http://columbiafarmersmarket.org	https://www.facebook.com/ColumbiaFarmersMarket	https://twitter.com/comofarmers	\N	https://www.instagram.com/columbiafarmersmarket/
1010758	http://MountainPeopleOrganics.com	https://www.facebook.com/ColumbiaFarmory	\N	\N	\N
1019483	\N	Columbus Farmers Market	\N	\N	\N
1019199	\N	Facebook: columbus ks farmers' market	\N	\N	Instagram: thecolumbusksproject
1020124	https://www.colusacertifiedfarmersmarket.com	https://www.facebook@colusacertifiedfarmersmarket	\N	\N	\N
1011003	\N	https://www.facebook.com/colwellmarket	\N	\N	\N
1021541	https://www.comethrupdx.org/	https://www.facebook.com/comethrupdx	\N	\N	Instagram: @comethrupdx
1019592	http://comofarmark@aol.com	fb.me/comofarmersmarket@facebook.com	\N	\N	\N
1019042	https://www.cga.ct.gov/osh/farmersmkt.asp	facebook.com/ctoldstatehouse	twitter.com/ctoldstatehouse	\N	instagram.com/ctoldstatehouse
1012030	http://waccamawmarkets.org/	https://www.facebook.com/WaccamawMarketCooperative/	\N	\N	\N
1021396	\N	https://www.facebook.com/ConwayFarmersMktAntioch	\N	\N	\N
1006766	https://coosbaydowntown.org/farmers-market/	https://www.facebook.com/CoosBayFarmersMarket	\N	\N	https://www.instagram.com/coosbayfarmersmarket/
1018190	http://www.coralville.org/farmersmarket	www.facebook.com/coralvillefarmersmarket	www.twitter.com/CvilleParksRec	\N	www.instagram.com/coralvilleparksrec
1021639	https://www.adelantemujeres.org/cornelius-farmers-market	https://www.facebook.com/CorneliusFarmersMarket	\N	\N	Instagram: @corneliusfarmersmarket
1012666	http://www.ccdowntownfm.com	https://www.facebook.com/CorpusChristiDowntownFarmersMarket/	https://twitter.com/ccdowntownfm	https://www.youtube.com/channel/UCYbRpp3vuRs5xLsbrB1ospA	https://www.instagram.com/ccdowntownfm/
1008959	http://www.cortezfarmmarket.com	https://www.facebook.com/groups/265957719169/admins/?order=default	\N	\N	\N
1021691	http://www.locallygrown.org	https://www.facebook.com/Corvallis.Farmers.Market	\N	\N	https://www.instagram.com/corvallisfarmersmarket/
1018629	http://www.ilovefarmersmarkets.org	https://www.facebook.com/CotatiFarmersMarket/	\N	\N	Instagram communitymarkets
1004382	http://www.cottinshardware.com/farmersmarket/	https://www.facebook.com/pages/Cottins-Hardware-Farmers-Market/130797680335852	@cottins	\N	Instagram @cottinshardware
1018221	http://www.cottonmillfarmersmarket.org	https://www.facebook.com/cottonmillfarmersmarket/?ref=settings	\N	\N	\N
1000368	http://www.countrylanemarket.com/farmers-market	\N	\N	\N	\N
1019530	http://cvcountryside.org	https://www.facebook.com/countrysidefoodandfarms/	https://twitter.com/countrysideohio	\N	https://www.instagram.com/countrysidefoodandfarms/
1019529	http://cvcountryside.org	https://www.facebook.com/countrysidefoodandfarms	https://twitter.com/countrysideohio	\N	https://www.instagram.com/countrysidefoodandfarms/
1019531	http://cvcountryside.org	https://www.facebook.com/countrysidefoodandfarms/	https://twitter.com/countrysideohio	\N	https://www.instagram.com/countrysidefoodandfarms/
1019258	http://cvcountryside.org	https://www.facebook.com/countrysidefoodandfarms/	https://twitter.com/countrysideohio	\N	\N
1019325	http://www.coventryfarmersmarket.org	www.facebook.com/coventryfarmersmarket	@coventryfarmmkt	\N	www.instsgram.com/coventryfarmersmarket
1019296	https://www.rcov.org/covfarmersmarket/	https://www.facebook.com/covingtonfarmersmarket/	\N	\N	https://www.instagram.com/covingtonfarmersmarket/
1012552	http://www.cowtownmarket.com	@cowtownfarmersmkt	\N	\N	\N
1009993	\N	https://www.facebook.com/pages/Cozad-Haymaker-Grand-Generation-Center/581875038530338	\N	\N	\N
1021330	https://www.crawfordsville.net/topic/index.php?topicid=160&structureid=13	https://www.facebook.com/crawfordsvillefarmersmarket	\N	\N	https://www.instagram.com/crawfordsvilleinfarmersmarket/
1021331	https://www.crawfordsville.net/topic/index.php?topicid=160&structureid=13	https://www.facebook.com/crawfordsvillefarmersmarket	\N	\N	https://www.instagram.com/crawfordsvilleinfarmersmarket/
1021227	https://seela.org/markets-crenshaw/	\N	\N	\N	https://www.instagram.com/crenshawfm/
1019260	http://www.crescentcityfarmersmarket.org/	https://www.facebook.com/CrescentCityFarmersMarket/	https://twitter.com/ccfmtweets	\N	https://www.instagram.com/crescentcityfarmersmkt/
1021710	\N	https://www.facebook.com/eatdrinkri	\N	https://www.youtube.com/eatdrinkri	https://www.instagram.com/eatdrinkri/
1019261	http://www.crescentcityfarmersmarket.org/	https://www.facebook.com/CrescentCityFarmersMarket/	https://twitter.com/ccfmtweets	\N	https://www.instagram.com/crescentcityfarmersmkt/
1019262	http://www.crescentcityfarmersmarket.org/	https://www.facebook.com/CrescentCityFarmersMarket/	https://twitter.com/ccfmtweets	\N	https://www.instagram.com/crescentcityfarmersmkt/
1002470	\N	https://www.facebook.com/DowntownFremontInc	https://twitter.com/DowntownFremont	\N	https://instagram.com/downtownfremont
1012365	https://www.crossroadscommunityfoodnetwork.org/farmers-market/	https://www.facebook.com/CrossroadsFarmersMarket/	@CrossroadsNtwk	https://www.youtube.com/channel/UCm23V5zJ2FZV7vC57i8OASQ	Instagram: @CrossroadsNtwk
1001869	\N	www.facebook.com/CrystalLakeFarmersMarket	\N	Downtown Crystal Lake	\N
1021346	http://www.culvercityfarmersmarket.org	Culver City Farmers Market	Culver City Farmers Market @CulverFM	\N	\N
1019701	\N	@culverfarmersmarket	\N	\N	@culverfarmersmarket (instagram)
1019702	\N	@culverfarmersmarket	\N	\N	@culverfarmersmarket (instagram)
1020109	\N	https://www.facebook.com/CumberlandCountyKYFarmersMarket	\N	\N	\N
1021387	http://www.town.cumberland.in.us/government/departments/farmers_market/index.php	https://www.facebook.com/CumberlandINFM	\N	\N	\N
1019539	http://www.farmersmarketinthefalls.weebly.com	Farmers' Market in the Falls	\N	\N	Instagram= @farmersmarketinthefalls
1021408	\N	Dallas County Farmer's Market	\N	\N	\N
1004516	http://www.danburyfarmersmarket.org	danburyconnecticutfarmersmarket	danburyfarmersmarket	dadnburyfarmerwmarket	instagram
1019163	\N	fb.me/dardanellefarmersmarket	\N	\N	@dardanellefarmersmarket on Instagram
1018157	http://mvgrowers.com	Mississippi Valley Growers farmers Market	\N	\N	\N
1012254	\N	dawson madison farmers market	\N	\N	\N
1019100	http://www.daybreakfarmersmarket.com	http://www.facebook.com/daybreakfarmersmarket	\N	\N	http://www.instagram.com/daybreakfarmersmarket
1021457	https://gethealthydesoto.org/	https://www.facebook.com/cultivatingfoodandcommunity	\N	https://www.youtube.com/channel/UCW0fYCdzTgTVIeWAGlLjicw	https://www.instagram.com/desotofarmersmarket/
1018945	http://www.dearbornfarmersartisansmarket.com	@DearbornFarmersArtisansMarket	\N	\N	\N
1019970	https://cfmatl.org/decatur/	https://www.facebook.com/DecaturFarmersMarkets/	\N	\N	\N
1021570	http://decorahfarmersmarket.com	https://www.facebook.com/decorahfarmersmarket/	\N	\N	https://www.instagram.com/decorah_farmers_market/
1012296	http://www.vi.deforest.wi.us/index.asp?Type=B_BASIC&SEC={38A90127-1135-4F1B-99D2-5AC8EE5AF484}	https://www.facebook.com/deforestmarket/	\N	\N	\N
1011103	http://www.dekalb.org/farmersmarket	https://www.facebook.com/dekalbfarmersmarket	\N	\N	https://www.instagram.com/dekalbfarmersmarket/
1002536	http://www.montereybayfarmers.org	https://www.facebook.com/pages/Monterey-Bay-Certified-Farmers-Markets/112446802152723	https://twitter.com/MBFarmersMarket	\N	www.edibleparadise.com
1020061	\N	facebook.com/delanoneighborhoodmarket	\N	\N	\N
1018416	http://www.DelcambreMarket.org	DelcambreMarket	@DelcambreMarket	Delcambre Seafood and Farmers Market	Instagram @DelcambreMarket
1019308	http://delmarmarket.org	delmarmarket	@delmarmarket	\N	\N
1020191	http://delraycra.org	Delray Beach GreenMarket	\N	\N	IG: delraygreenmarket  IG: delraygreenmarketdogs
1021591	http://achdo.org/delridgefarmersmarket	https://www.facebook.com/DelridgeFarmersMarket	\N	\N	https://www.instagram.com/delridgefarmersmarket/
1021649	https://www.dentonmarket.org/	https://www.facebook.com/DentonCommunityMarket/	https://twitter.com/Dentonmarket	https://www.youtube.com/channel/UCItKEPL9LmABDfpgYqPFVmw	https://www.instagram.com/CommunityMarket/
1007255	http://www.DMFM.org	https://www.facebook.com/pages/Des-Moines-Waterfront-Farmers-Market/112845878735116?ref=hl	\N	\N	\N
1021318	http://www.farmtocitymarkets.com	https://www.facebook.com/DSPFarmersMarket	\N	\N	\N
1021261	\N	https://www.facebook.com/Dillsboro-Farmers-Market-1682514815354955/	\N	\N	\N
1018958	http://dillsburgfarmersma.wixsite.com/dbgfarmersmarket	https://www.facebook.com/DillsburgFarmersMarket/	\N	\N	\N
1019458	http://villageofdimondale.org	http://facebook.com/dimondalefarmersmarket	\N	\N	\N
1018816	\N	www.facebook.com/DodgeCountyFarmersMarket	\N	\N	instagram
1019742	\N	https://www.facebook.com/dodgevillefarmersmarket	\N	\N	\N
1019439	http://www.dovecreekfood.org	https://www.facebook.com/DoloresCountyFarmersMarket/	\N	\N	\N
1019964	\N	donnelly farmers market	\N	\N	\N
1018706	http://dothousehealth.org/	DotHouse Health	\N	\N	\N
1020111	http://www.doreyparkfarmersmarket.org	https://www.facebook.com/doreyparkfarmersmarket/?ref=bookmarks	\N	\N	\N
1003046	http://www.dousmanchamber.org/farmers_market.html	https://www.facebook.com/DousmanFarmersMarket	\N	\N	\N
1009829	http://www.seacoastgrowers.org	https://www.facebook.com/Market03820	https://twitter.com/market03820	\N	\N
1009894	\N	https://www.facebook.com/chelseanycfarmersmarket	https://twitter.com/DowntoEarthMkts	\N	https://www.instagram.com/downtoearthmkts
1021296	https://downtoearthmarkets.com/	https://www.facebook.com/cunninghamparkfarmersmarket	\N	\N	https://www.instagram.com/downtoearthmkts
1010954	\N	https://www.facebook.com/larchmontfarmersmarket	twitter.com/DowntoEarthMkts	\N	https://instagram.com/downtoearthmkts/
1016793	\N	https://www.facebook.com/mamaroneckfarmersmarket	https://twitter.com/DowntoEarthMkts	\N	https://www.instagram.com/downtoearthmkts
1010969	\N	https://www.facebook.com/mcgolrickparkfarmersmarket	https://twitter.com/DowntoEarthMkts	\N	https://www.instagram.com/downtoearthmkts
1010972	\N	https://www.facebook.com/morningsideparkfarmersmarket/	https://twitter.com/DowntoEarthMkts	\N	https://instagram.com/downtoearthmkts/
1010958	\N	https://www.facebook.com/newrochellefarmersmarket/	https://twitter.com/DowntoEarthMkts	\N	http://www.instagram.com/downtoearthmkts/
1016792	\N	https://www.facebook.com/ossiningfarmersmarket/	https://twitter.com/DowntoEarthMkts	\N	https://www.instagram.com/downtoearthmkts
1009895	\N	https://www.facebook.com/parkslopefarmersmarket/	https://twitter.com/DowntoEarthMkts	\N	https://www.instagram.com/downtoearthmkts
1010982	\N	https://www.facebook.com/queensbotanicalfarmersmarket	https://twitter.com/DowntoEarthMkts	\N	https://instagram.com/downtoearthmkts/
1010960	\N	https://www.facebook.com/ryefarmersmarket	twitter.com/DowntoEarthMkts	\N	instagram.com/downtoearthmkts/
1016867	http://growingrootspartners.com	https://www.facebook.com/DowningtownFarmersMarket/	\N	\N	Instagram:  downingtownfm
1019667	http://alachuafarmersmarket.com	https://www.facebook.com/alachuafarmersmarket	\N	\N	\N
1009043	http://www.allenparkdowntown.org	https://www.facebook.com/allenpark.dda?sk=wall	\N	\N	\N
1003643	http://www.downtownbeloit.com	https://www.facebook.com/BeloitFarmersMarket?ref=hl	\N	\N	\N
1021228	https://seela.org/markets-echo-park/	\N	\N	\N	https://www.instagram.com/echoparkfm/
1020064	https://ecologycenter.org/fm/	https://www.facebook.com/ecologycenter.org	https://twitter.com/EcologyCenter	\N	https://www.instagram.com/ecology.center/?hl=en
1020000	http://downtownbloomington.org	https://www.facebook.com/BLMFarmersMarket/	DBFarmersMarket	\N	Instagram- @bloomingtonmarket
1020001	http://downtownbloomington.org	https://www.facebook.com/DBAFarmersMarket/	\N	\N	Instagram- @bloomingtonmarket
1019370	https://www.cantonmainstreet.org/farmers-market/	https://www.facebook.com/CantonTexasMainStreetProgram?ref=hl	\N	\N	https://www.instagram.com/downtowncantontx/
1019944	https://www.downtownchico.com/event-thursday-night-market_16.htm	https://www.facebook.com/thursdaynightmarket	\N	\N	\N
1021401	\N	downtownconwayfarmersandcraftsmarket	\N	\N	\N
1000841	http://www.downtowndenisonfarmersmarket.com	https://www.facebook.com/denison.farmermarket?fref=ts	\N	\N	Downtown Denison Farmers Market (FaceBook business page)
1019401	https://www.downtownelgin.com/farmers-market/	https://www.facebook.com/DowntownElginFarmersMarket	https://twitter.com/ElginFarmersMkt	\N	\N
1021631	http://Cityofevanston.org/farmersmarket	Evanston markets	\N	\N	\N
1008853	http://www.downtownevansvillefarmersmarket.com	downtown evansvillefarmersmarket.com	\N	\N	\N
1002400	http://www.murraymainstreet.org	https://www.facebook.com/satmarket	https://twitter.com/murraymainst	\N	instagram: @downtownfarmersmarketmky
1019032	http://www.lancastercitysc.com	https://www.facebook.com/seelancastercity	\N	\N	\N
1019856	http://www.murrayfarmersmarket.com	Facebook: Murray Downtown Farmers Market	Twitter: @mkyfarmersmkt	\N	instagram: @downtownfarmersmarketmky
1019216	http://dfpfarmersmarket@yahoo.com	downtown fort pierce farmers market	\N	\N	\N
1012243	http://downtownfdl.com/farmers-market.html	https://www.facebook.com/FondDuLacFarmersMarket/	\N	https://www.youtube.com/channel/UCA4zODGpao80RPD27BFfPzA	https://www.instagram.com/downtownfdl/
1012256	http://downtownfdl.com/farmers-market.html	https://www.facebook.com/FondDuLacFarmersMarket/	\N	https://www.youtube.com/channel/UCA4zODGpao80RPD27BFfPzA	https://www.instagram.com/downtownfdl/
1019654	https://downtowngreenbay.com/explore/downtown-events/saturday-farmers-market	facebook.com/downtowngreenbay	twitter.com/downtowngb	\N	\N
1019341	https://www.thinklawrenceburg.com/event/downtown-lawrenceburg-farmers-market-13/	https://www.facebook.com/lawrenceburgfarmersmarket/?ref=br_rs	\N	\N	\N
1019083	\N	Downtown Lima Farmers Market	\N	\N	\N
1009757	\N	https://www.facebook.com/DowntownMadisonFarmersMarket	\N	\N	\N
1018930	http://mqtfarmersmarket.com	facebook.com/downtownmqtfarmersmarket/	\N	\N	\N
1003977	http://newportfarmersmarket.org	\N	\N	\N	\N
1018621	http://www.ilovefarmersmarkets.org	https://www.facebook.com/DowntownNovatoCommunityFarmersMarket/	\N	\N	Instagram communitymarkets
1019721	\N	http://www.facebook.com/paloaltofarmersmarket	@paloaltofarmers	\N	https://www.instagram.com/paloaltofarmersmarket/
1021716	https://downtownphoenixfarmersmarket.org/	https://www.facebook.com/dtphxfarmersmarket	https://twitter.com/dtphxfarmersmkt	\N	https://www.instagram.com/dtphxfarmersmarket/
1021411	https://www.downtownrogersinc.org/market	https://www.facebook.com/DTRMarket	\N	\N	\N
1005281	http://www.santacruzfarmersmarket.org	www.facebook.com/santacruzfarmersmarket/	\N	\N	www.instagram.com/santacruzfarmersmkts/
1019525	https://downtownyakimafarmersmarket.com/	https://facebook.com/DowntownYakimaFarmersMarket/	\N	\N	https://www.instagram.com/DowntownYakimaFarmersMarket/
1019729	http://www.cityofdresden.net/	https://www.facebook.com/DresdenFarmersMarket/#	\N	\N	\N
1004676	http://www.druidhillmkt.org	https://www.facebook.com/Druid-Hill-Farmers-Market-196200720417576/	https://twitter.com/DruidHillMkt	\N	\N
1005358	http://www.pcfma.org	\N	\N	\N	\N
1005197	http://www.DubuqueFarmersMarket.org	https://www.facebook.com/dbqfarmersmarket	\N	\N	https://www.instagram.com/dbqfarmersmarket/
1019994	http://www.downtownduluth.com	Facebook.com/GreaterDowntownCouncil	Twitter.com/GreaterDowntownCouncil	\N	\N
1018953	http://www.durangofarmersmarket.com/	https://www.facebook.com/durangofarmersmarket/	\N	\N	Instagram: @durangofarmers
1000312	http://www.durhamfarmersmarket.com	www.facebook.com/durhamfarmersmarketnc	www.twitter.com/DurhamFarmerMkt	\N	www.instagram.com/durhamfarmersmarket/
1009830	http://www.seacoastgrowers.org	https://www.facebook.com/Market03824	https://twitter.com/market03824	\N	\N
1012345	http://duvallfarmersmarket.org	http://www.facebook.com/pages/Duvall-Farmers-Market/141032938155	\N	\N	\N
1019082	https://www.fallonfoodhub.com/farmers-market/	\N	\N	\N	\N
1021275	https://www.insideeaglesprings.com/farmers-markey/	https://www.facebook.com/buylocalfarmersmarket	\N	\N	https://www.instagram.com/buylocalfarmersmarket/
1018159	http://cfmatl.org/eav	https://www.facebook.com/EAVFarmersMarket	\N	\N	https://www.instagram.com/communityfarmersmarkets/?hl=en
1021303	https://external.ebnhc.org/en/food-access/farmers-market.html	https://www.facebook.com/EastBostonFarmersMarket?fref=ts	\N	\N	instagram.com/eastbostonfarmersmarket
1021414	https://www.ebnhc.org/en/food-access/farmers-market.html	https://www.facebook.com/EastBostonFarmersMarket?fref=ts	\N	\N	instagram.com/eastbostonfarmersmarket
1011673	http://eastendfoundation.org	https://www.facebook.com/eastendfarmersmarket/	https://twitter.com/eestreetmarket	https://www.youtube.com/channel/UCuxUc9s2vRLeyAI7PdRY6yQ	\N
1019079	https://eastgreenbushlibrary.org/events-newsletters/farmers-market/	https://www.facebook.com/EastGreenbushLibraryYMCAFarmerMarket/	@eglibrary	\N	Instagram: @eglibrary
1020133	http://www.ehfarmersmkt.com/	https://www.facebook.com/EHFarmersMkt/	https://twitter.com/EHFarmersMkt	\N	https://www.instagram.com/ehfarmersmkt/
1011113	http://www.eastnashvillemarket.com	https://www.facebook.com/eastnashvillefarmersmarket?fref=ts	enfarmersmkt	\N	@eastnashvillefarmersmarket (Instagram)
1020172	https://www.freshapproach.org/epa-farmers-market/	https://www.facebook.com/freshapproach/	https://twitter.com/FreshApproachSF	https://www.youtube.com/channel/UCyHvZwpSOXFjez4VsbcTJvw	https://www.instagram.com/freshapproachbayarea/?hl=en
1012717	http://www.downtowneastpoint.com/eastpointfarmersmarket/	https://www.facebook.com/search/top/?q=East%20Point%20Farmers%20Market	\N	\N	\N
1019094	http://chemung.cce.cornell.edu/agriculture/buy-local/farmers-markets	https://www.facebook.com/EastSideMarketElmiraNY/	\N	\N	\N
1019125	\N	https://www.facebook.com/EastgatePlazaClarence/	\N	\N	\N
1021698	http://easthamptonmarket.com	https://www.facebook.com/EasthamptonFarmersMarket	https://www.instagram.com/easthamptonmarket/	\N	\N
1009867	https://eastonfarmersmarket.com	https://www.facebook.com/EastonFarmersMarket	https://twitter.com/buyfresh	https://www.youtube.com/user/EastonFarmersMarket	https://www.instagram.com/eastonfarmersmarket
1019624	http://eastsidesundaymarket.org	https://www.facebook.com/EastsideSundayMarket/	\N	\N	https://www.instagram.com/eastsidesundaymarket/
1012783	http://www.edentonfarmersmarket.com	https://www.facebook.com/edentonfarmersmarket/	\N	\N	\N
1012160	http:// www.historicedmonds.org/summer-market	https://www.facebook.com/edmondsmuseumsummermarket/	\N	\N	\N
1019118	http://www.eggharbordoorcounty.org/events/farmers-market/	https://www.facebook.com/pg/EggHarborDoorCounty/events/?ref=page_internal	\N	\N	\N
1021574	http://eldoradofarmersmarkets.com	\N	\N	\N	\N
1019936	https://monte.campaignrep.org/	https://www.facebook.com/CityofElMonte/	\N	\N	\N
1019921	http://Elginfarmersmarket.com	@elgintxfarmersmarket	\N	\N	Elginfarmersmarket (IG)
1021587	\N	https://www.facebook.com/ElkhartFarmersMarket	\N	\N	\N
1018900	http://www.ellingtonfarmersmarket.com	https://www.facebook.com/ellingtonfarmersmarket/	https://twitter.com/EllingtonFM	https://www.youtube.com/channel/UChxlu0EBdSd_NfWvOTHi1cA	https://www.instagram.com/ellingtonfm/
1018898	http://Www.ellingtonfarmersmarket.com	Www.facebook.com/ellingtonfarmersmarket	Twitter.com/EllingtonFM	\N	Www.instagram.com/ellingtonfm
1020112	\N	Elliott County Farmers Market	\N	\N	\N
1018717	http://www.newtonma.gov/farmersmarket	https://www.facebook.com/NewtonFarmersMarket	https://twitter.com/newton_market (@newton_market)	\N	\N
1021207	http://elmwoodmarket.org	ElmwoodBidwellFarmersMarket	\N	\N	\N
1002657	http://www.emmausmarket.com	https://www.facebook.com/EmmausFarmersMarket/	https://www.twitter.com/EmmausFarmMkt/	https://www.youtube.com/channel/UCX8tZUatO9ZyXRhoNJMiavg	https://www.instagram.com/emmausfarmmkt
1002769	http://www.leelanaufarmersmarkets.com	https://www.facebook.com/leelanaufarmersmarkets/	\N	\N	\N
1019398	https://downtownjoplin.com/joplin-empire-market/	https://www.facebook.com/JoplinEmpireMarket	https://twitter.com/TheEmpireMarket	\N	https://www.instagram.com/joplinempiremarket
1012045	http://www.encniofarmersmarket.org	Encino Farmers Market	\N	\N	\N
1019684	http://www.ashevillefarmstead.org/enka-candler-tailgate-market	www.facebook.com/enkacandlertailgatemarket	\N	\N	\N
1018765	http://ennistx.com/farmers-market	https://www.facebook.com/ennistxfarmersmarket/?ref=bookmarks	\N	\N	\N
1019687	http://enumclawplateaufarmersmarket.org	http://www.facebook.com/EnumclawPlateauFarmersMarket/	\N	\N	http://www.instagram.com/EnumclawPlateauFarmersMarket/
1006678	http://www.espanolafarmersmarket.org	\N	\N	\N	\N
1003568	http://estacadafarmersmarket.org	\N	\N	\N	\N
1020053	https://www.etnafarmersmarket.com/	https://www.facebook.com/EtnaFarmersMarket/	\N	\N	instagram:  etnafarmersmarket
1019954	\N	https://www.facebook.com/ESFarmersMarket	\N	\N	\N
1010195	https://www.evart.org/our_community/farmers_market.php	https://www.facebook.com/EvartFarmersMarket	\N	\N	\N
1005267	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1007798	http://www.seacoastgrowers.org	https://www.facebook.com/Market03833	https://twitter.com/market03833	\N	\N
1019081	https://vtfarmersmarket.org/	The Vermont Farmers Market	@VFMRutland	\N	\N
1018622	http://www.ilovefarmersmarkets.org	https://www.facebook.com/FairfaxCommunityFarmersMarket/	\N	\N	Instagram communitymarkets
1019186	http://www.FairfaxSaturdayMarket.com	https://www.facebook.com/FairfaxSaturdayMarket/	\N	\N	\N
1019049	\N	FairlandFarmersMarket	\N	\N	instagram.com/FairlandFarmersMarket
1018562	http://Www.fairwoodfarmersmarket.com	Fairwood farmers' market	\N	\N	\N
1019457	http://www.fallbrookfarmersmarket.com/	https://www.facebook.com/fallbrookfarmersmarket/	\N	\N	\N
1010889	http://www.fallsparkfarmersmarket.com	www.facebook.com/FallsParkFarmersMarket	\N	\N	\N
1019841	\N	Lineage the Market	\N	\N	IG:  lineage_market
1021514	https://www.indiancreekplaza.com/farm-to-fork-farmers-market	https://www.facebook.com/farmtoforkfarmersmarketcaldwell	\N	\N	https://www.instagram.com/caldwellfarmersmarket/
1019499	http://www.sphp.com/mercy-cares-for-kids	\N	\N	\N	\N
1019523	https://www.farmersandcraftsmarketoflascruces.com/	https://www.facebook.com/LasCrucesMarket/	\N	\N	\N
1018937	http://www.farmersbranchmarket.com/	www.facebook.com/farmersbranchmarket	\N	\N	\N
1019436	\N	https://www.facebook.com/FarmersFreshMarketAK/	\N	\N	\N
1021666	\N	https://www.facebook.com/search/top?q=farmer%27s%20market%20covington	\N	\N	\N
1021734	\N	https://www.facebook.com/farmersmarketcovington	\N	\N	\N
1018131	http://www.stjohns-episcopal.com	Farmers Market at St. John's/Naperville	\N	\N	\N
1021388	\N	https://www.facebook.com/FarmersMarketAtTheFairgrounds	https://twitter.com/AtTheFairground	\N	\N
1019705	http://farmersmarketnorthscottsdale.com	@FarmersMarketNorthScottsdale	\N	\N	Instagram.com/FMNScottsdale
1005069	http://www.farmersmarketbluffton.org	farmersmarketbluffton	\N	\N	\N
1021620	https://www.madisonmainstreet.com/farmers-market	https://www.facebook.com/madfarmersmarket	\N	\N	Instagram - @MadFarmersMarket
1005159	http://www.LoveYourFarmer.com	https://www.facebook.com/FMOZARKS/	https://twitter.com/FMOzarks	\N	\N
1021538	https://farmersmarketogden.com/	https://www.facebook.com/farmersmarketogden	\N	\N	https://www.instagram.com/farmersmarketogden/
1021581	http://www.farmersmarketongrandparkway.com/	https://www.facebook.com/farmersmarketongrandparkway	\N	\N	https://www.instagram.com/farmersmarketongrandparkway/
1019993	\N	https://www.facebook.com/MarketOnGreenRiver/	\N	\N	\N
1020079	\N	Farmers Market on the Square	\N	\N	\N
1020080	\N	Farmers Market on the Square	\N	\N	\N
1021595	http://FarmersMarketPartners.com	Farmers Market Partners Missouri ity	\N	\N	Instagram
1019862	http://www.farmersonthesquare.com	https://www.facebook.com/FarmersontheSquare/	\N	\N	https://www.instagram.com/farmersonthesquare/
1018427	\N	https://www.facebook.com/Farmers-Gateway-Market-250248165001885/	\N	\N	\N
1016870	http://www.hamakuaharvest.org	facebook/hamakuaharvest	\N	\N	\N
1021460	https://fayettecountyfarmersmarket.wordpress.com/	https://www.facebook.com/OHFCFM/	https://twitter.com/FAYCOFARMERSMKT	\N	\N
1019800	\N	https://www.facebook.com/FayettecountyfarmersmarketIN/?ref=bookmarks	\N	\N	\N
1012627	http://fearringtonfarmersmarket.com	https://www.facebook.com/fearringtonfarmersmarket	\N	\N	\N
1002721	http://www.feltonfarmersmarket.org	www.facebook.com/santacruzfarmersmarket/	\N	\N	www.instagram.com/santacruzfarmersmkts/
1018973	http://fergusonfarmersmarket.com/	https://www.facebook.com/FergusonFarmersMarket/	\N	\N	\N
1021676	\N	https://www.facebook.com/FerndaleFarmersMarket	\N	\N	\N
1021665	\N	@fernleypoolsidefarmersmarket	\N	\N	@fernleypoolsidefarmersmarket
1020193	\N	facebook.com/cuesa	twitter.com/cuesa	youtube.com/user/cuesasf	instagram.com/cuesa
1019771	http://fibbrew.com/farmers-market-application/	https://www.facebook.com/events/722787851585113/	\N	\N	\N
1018193	\N	FifthStreetFarmersMarket	\N	\N	\N
1020008	http://www.fightingvillefresh.com	https://www.facebook.com/FightingvilleFresh/	\N	\N	instagram.com/fightingvillefreshmarket/
1019677	https://www.fireflyfarmwichita.com/	https://www.facebook.com/fireflyfarmwichitakansas/	\N	\N	Instagram
1004377	http://settlementshops.com	\N	\N	\N	\N
1019897	http://fleming.ca.uky.edu/anr/farmersmarket	https://www.facebook.com/flemingcountyfarmersmarket/	\N	\N	\N
1021453	http://www.fondymarket.org	www.facebook.com/fondymarket/	www.twitter.com/fondymarket	www.youtube.com/channel/UCVNVRvOp84S6yHDnFn8ef1w	www.instagram.com/fondymarkets
1019123	http://www.wyfftp.org/summermarket	www.facebook.com/foodforthoughtmarkets	\N	\N	\N
1000958	http://www.forestfarmersmarket.com	https://www.facebook.com/pages/Forest-farmers-market/193117547377111	https://twitter.com/FFM221	\N	Forest Farmers' Market
1021638	https://www.adelantemujeres.org/forest-grove-farmers-market	https://www.facebook.com/fgfm1	\N	\N	Instagram: @forestgrovefarmersmarket
1021504	http://www.foresthillsfarmersmarket.com	Forest Hills PA Farmers Market	\N	\N	\N
1002803	\N	https://www.facebook.com/ForestLakesFarmersmarket	\N	\N	\N
1018989	http://www.cityoflawrence.org/fortbenfarmersmarket	https://www.facebook.com/FortBenFarmersMarket/	\N	\N	\N
1021680	\N	Fort Smith Farmer's Market on Garrison Ave	\N	\N	Instagram
1018505	\N	\N	\N	\N	None
1019101	https://www.foxlakefarmersmarket.com/	https://www.facebook.com/events/167501670531638/	\N	\N	\N
1002880	http://www.frankenmuthfarmersmarket.org	https://www.facebook.com/Frankenmuth-Farmers-Market-106279602732863/	https://twitter.com/MuthFarmMarket	\N	https://www.instagram.com/frankenmuth_farmers_market/
1019298	http://www.franklincountyfarmersmarket.org/	https://www.facebook.com/franklincountyfarmersmarketky/	https://twitter.com/FrankfortFrmMkt	\N	https://www.instagram.com/franklincountyfarmersmarket/
1019147	http://discoverdowntownfranklin.com	https://www.facebook.com/DiscoverDowntownFranklin/	\N	\N	https://www.instagram.com/discoverdowntownfranklin/
1021654	https://www.fpconservatory.org/education-programs/outreach-programs/farmers-market/	\N	\N	\N	\N
1020092	https://franklinsimpsonfarmersmarket.com/	https://www.facebook.com/FranklinSimpsonFarmersMarket/	\N	\N	\N
1020007	\N	https://www.facebook.com/Franklin-Street-Bazaar-2296932127209023/	\N	\N	\N
1021565	http://www.FranktonTownMarket.com	www.Facebook.com/FranktonTownMarket	\N	\N	www.Instagram.com/FranktonTownMarket
1012429	http://www.freedomfarmersmkt.com	https://www.facebook.com/freedomfarmersmkt/	https://twitter.com/freedomfarmersm	\N	https://www.instagram.com/freedomfarmersmkt/
1021353	http://www.freighthousefarmersmarket.com	www.fb.com/freighthousefarmersmarket	\N	https://www.youtube.com/channel/UCAhsofrLDEQDLA6xY7l9Ujw	www.instagram.com/freighthousefarmersmarket
1019600	http://www.freiheitvillagefm.com	www.facebook.com/freiheitvillagefm	\N	\N	freiheitvillagefm
1019404	\N	https://facebook.com/freshapproach	https://twitter.com/FreshApproachSF	\N	https://instagram.com/freshapproachbayarea/
1012466	http://chestercountyfoodbank.org/programs/fresh2you/	@fresh2youmarket	@fresh2youmarket	https://www.youtube.com/watch?v=Mlagghq7cgA	\N
1018671	\N	https://www.facebook.com/freshfarmdc	https://twitter.com/FRESHFARMDC	https://www.youtube.com/channel/UCKUcsUpWJ8f7YK0nwMklZXw/videos	https://www.instagram.com/freshfarmdc/
1011730	http://friendswoodmarket.com	https://www.facebook.com/FriendswoodMarket	\N	\N	\N
1021552	http://www.fortthomasfarmersmarket.com	https://www.facebook.com/fortthomasfarmersmarket	\N	\N	https://www.instagram.com/fortthomasfarmersmarket/
1019762	https://ftwaynesfarmersmarket.com/	https://www.facebook.com/ftwaynesfm/	https://twitter.com/FtWaynesFM	https://www.youtube.com/channel/UCDLC0Lqi7tfqiTxpPpaNghQ?view_as=subscriber	https://www.instagram.com/ftwaynesfm/?hl=en
1019285	https://ftwaynesfarmersmarket.com/	https://www.facebook.com/ftwaynesfm/	@FtwaynesFM	\N	Instagram:  ftwaynesfm
1019998	http://fulshearfarmersmarket.com/	https://www.facebook.com/foreverfulshear/	\N	\N	Instagram: fulshear_farmers_market
1019949	http://fultonstallmarket.org	fultonmarketnyc	fultonmarketnyc	\N	instagram fultonstallmarket
1006661	http://www.fultonstreetmarket.org	www.facebook.com/fultonstmarket	\N	\N	\N
1021590	https://www.fvgrowersmarket.com/	https://www.facebook.com/fvgrowersmarket	https://twitter.com/FVGrowersMarket	\N	https://www.instagram.com/fvgrowersmarket/
1021444	\N	https://Facebook.com/GalenaKSFarmersMarket	\N	\N	https://Instagram.com/Galenaksmarket/
1021730	\N	https://www.facebook.com/GalenaKSFarmersMarket	\N	\N	https://www.instagram.com/galenaksmarket/
1019630	http://www.gallatintn.org/life-in-gallatin/farmers-market	www.facebook.com/gallatinfarmersmarket/	\N	\N	www.instagram.com/gallatinfarmersmarket/
1011814	http://coastalpacificinfo.us	https://www.facebook.com/Galleria-at-Tyler-Riverside-Farmers-Market-329529333808763/	\N	\N	\N
1018831	http://gardnerfarmersmarket@gmail.com	Gardner Farmers Market	\N	\N	\N
1019728	\N	https://www.facebook.com/GarfieldParkFarmersMarket/	\N	\N	https://www.instagram.com/explore/locations/427672397422019/garfield-park-farmers-market/
1021662	https://www.gpcommunitycouncil.org/programs/neighborhood-market	https://www.facebook.com/gpccouncil/	https://twitter.com/gpccouncil	https://www.youtube.com/channel/UCSwgrWklA_60UeQUWWQ8Csg/	https://www.instagram.com/gpccouncil/
1019587	\N	https://m.facebook.com/FarmersMarketsinGasCityIndiana/?ref=bookmarks	\N	\N	\N
1021677	http://thegatewayfarmersmarket.com	https://www.facebook.com/search/top?q=gateway%20farmers%20market	\N	\N	\N
1021416	\N	fb.me/generalstoremarket	\N	\N	\N
1012033	http://waccamawmarkets.org/	https://www.facebook.com/WaccamawMarketCooperative/	\N	\N	\N
1019602	http://gohealthyhouston.org/farmersmarkets/	www.facebook.com/gohealthyhouston/	twitter.com/GoHealthyHTX	\N	\N
1019603	http://gohealthyhouston.org/farmersmarkets/	www.facebook.com/gohealthyhouston/	twitter.com/GoHealthyHTX	\N	\N
1019604	http://gohealthyhouston.org/farmersmarkets/	www.facebook.com/gohealthyhouston/	twitter.com/GoHealthyHTX	\N	\N
1019605	http://gohealthyhouston.org/farmersmarkets/	www.facebook.com/gohealthyhouston/	twitter.com/GoHealthyHTX	\N	\N
1019606	http://gohealthyhouston.org/farmersmarkets/	www.facebook.com/gohealthyhouston/	twitter.com/GoHealthyHTX	\N	\N
1019607	http://gohealthyhouston.org/farmersmarkets/	www.facebook.com/gohealthyhouston/	twitter.com/GoHealthyHTX	\N	\N
1019608	http://gohealthyhouston.org/farmersmarkets/	www.facebook.com/gohealthyhouston/	twitter.com/GoHealthyHTX	\N	\N
1021461	http://gilbertmarket.com	facebook.com/gilbertmarket/	twitter.com/gilbertmarket	\N	instagram.com/gilbertmarket
1021284	http://Gilmantonfarmersmarket.com	Facebook.com/gilmantoncommunityfarmersmarket	\N	\N	\N
1008573	http://www.gladstone.mo.us/farmersmarket/	https://www.facebook.com/pages/Gladstone-Farmers-Market/107406389284555?fref=ts	\N	\N	\N
1002767	http://www.leelanaufarmersmarkets.com	https://www.facebook.com/leelanaufarmersmarkets/	\N	\N	\N
1018407	\N	https://www.facebook.com/groups/119877659959/	\N	\N	\N
1019710	https://www.glensfallsfarmersmarket.com/	https://www.facebook.com/GFFarmersMarket/	\N	\N	https://www.instagram.com/gffarmersmarket/
1019414	https://www.glenwoodsundaymarket.org/	https://www.facebook.com/GlenwoodSunday/	https://twitter.com/glenwoodsunday	\N	https://www.instagram.com/glenwoodsundaymarket
1021364	http://www.dem.ri.gov/programs/agriculture/farmersmarkets.php	\N	\N	\N	\N
1020050	http://goodlocalmarkets.org	\N	\N	\N	goodlocalmarkets
1019833	\N	Goodhue Farmers Market	\N	\N	\N
1021350	\N	GoodingFarmersMarket	\N	\N	\N
1021308	http://www.farmtocitymarkets.com	https://www.facebook.com/FarmToCity	\N	\N	\N
1012253	http://goshennychamber.com	Goshenfarmersmarket	\N	\N	\N
1021392	\N	https://www.facebook.com/GrandPrairieFarmersMarket	\N	\N	\N
1005937	http://www.grfarmersmarket.org/	https://www.facebook.com/GRFarmersMarketMN	\N	\N	\N
1017947	http://www.leapforlocalfood.org/grandin	facebook.com/grandinvillagecommunitymarket	@leapforlocal	\N	@leapmarkets Instagram
1021484	https://cfmatl.org/markets/	https://www.facebook.com/grantparkfarmersmarket	\N	\N	\N
1019989	\N	Grassroots Farmers Market	\N	\N	Instagram - Grassroots FM
1009808	http://greatfallsfarmersmarketturners.blogspot.com/	https://www.facebook.com/GreatFallsFarmersMarket	\N	\N	instagram.com/greatfallsfarmersmarkettf
1021456	http://www.gwcfb.org	Greater Washington County Food Bank	\N	\N	facebook.com/HHTraining Center
1006059	http://www.watertownfarmandcraft.com	https://www.facebook.com/watertownfarmandcraft/?ref=br_rs	\N	\N	\N
1021289	https://greeleygov.com/activities/fm/home	@greeleyfarmersmarket	\N	\N	@greeleyfarmersmarket
1021319	http://www.greencitymarket.org	www.facebook.com/greencitymarket	www.twitter.com/greencitymarket	\N	www.instagram.com/greencitymarket
1021320	http://www.greencitymarket.org	www.facebook.com/greencitymarket	www.twitter.com/greencitymarket	\N	www.instagram.com/greencitymarket
1004849	http://www.piedmontpark.org/programs/green_market.html	https://www.facebook.com/greenmarketatl?ref=hl	\N	\N	https://www.facebook.com/pages/Piedmont-Park-Conservancy/112803705441290?ref=hl
1006997	http://walkergreenscene.com/walker-farmers-market/	https://www.facebook.com/walkergreenscene	\N	\N	\N
1019805	https://greenbeltfarmersmarket.org	https://www.facebook.com/GreenbeltFarmersMarket/	https://twitter.com/greenbeltfm	N/A	https://www.instagram.com/greenbelt.farmersmarket/
1019132	http://exploregreene.com/events/farmersmarket	https://www.facebook.com/greenefarmersmarket/	\N	\N	\N
1018472	http://www.gretnafarmersmarket.org	Gretna Farmers' Market	\N	\N	www.gretnala.com
1021382	http://www.grinnellfarmersmarket.com	facebook.com/grinnellfarmersmarket	\N	\N	@grinnellfarmersmarket
1021536	https://www.grovefarm.com/grovefarmmarket	https://www.facebook.com/GroveFarmMarket/	\N	\N	https://www.instagram.com/grovefarmmarket/
1019088	http://www.GrowBatonRouge.com	http://facebook.com/GrowBatonRouge	\N	\N	\N
1021247	\N	http://facebook.com/growingaugusta	http://twitter.com/growingaugusta	https://www.youtube.com/channel/UCHc7WOK79WWDmzvRKhn9yew	http://instagram.com/growingaugusta
1018619	http://www.guttenbergiowa.net/farmers-market.html	https://www.facebook.com/GuttenbergFarmersMarket/	\N	\N	\N
1005265	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1001804	http://www.townofhalifax.com	https://www.facebook.com/halifaxmarketplace	\N	\N	\N
1021584	https://hpna.wildapricot.org/Farmers-Market	https://www.facebook.com/hpnafmkt	\N	\N	https://www.instagram.com/hamiltonparkfarmersmarket
1019673	http://www.hamiltonshistoricfarmersmarket.com	Hamilton's Historic Farmer's Market	\N	\N	\N
1018774	\N	hammondsgrandsonsproduce	\N	\N	\N
1019738	http://www.hampdenfarmersmarket.com/	https://www.facebook.com/HampdenFarmersMarket/	\N	\N	\N
1019209	https://www.hamptonblvdfarmersmarket.com	https://www.facebook.com/hamptonblvdfarmersmarket/	\N	\N	\N
1021583	http://www.hanafarmersmarket.org	HFUU Hana Chapter	\N	\N	@hanafarmersmarket
1006425	http://halehalawai.org/	https://www.facebook.com/hanaleifarmersmarket.halehalawai/	\N	\N	instagram.com/hanalei_farmersmarket
1019065	https://hancockfarmmarket.wixsite.com/home	@HancockCountyFarmersMarket	\N	\N	\N
1019148	http://www.hanover-market.com	www.Facebook.com/hanovermarket	\N	\N	\N
1019770	http://asiaohio.org	\N	\N	\N	\N
1019154	\N	Hardy’s Farm Market	\N	\N	\N
1018380	http://www.ci.harker-heights.tx.us/index.php/programs-a-events/farmers-market	https://www.facebook.com/harkerheightspr/	\N	\N	\N
1021696	http://www.harlingenfarmersmarket.com	www.facebook.com/harlingenfarmersmarket	\N	\N	www.instagram.com/harlingenfarmersmarket
1021555	http://www.harrisoncitymarket.com	https://www.facebook.com/GardenGrillandGallery	\N	\N	\N
1020122	\N	https://www.facebook.com/hcfmky/	\N	\N	\N
1020125	\N	https://www.facebook.com/hcfmky/	\N	\N	\N
1020107	\N	https://www.facebook.com/Hart-County-Farmers-Market-112546692116875/	\N	\N	\N
1011782	http://hartfordfarmersmarket.weebly.com/	https://www.facebook.com/HartfordSDFarmersMarket/	\N	\N	\N
1019373	http://harvesthomefm.org	\N	\N	\N	\N
1002339	http://harvesthomefm.org	\N	\N	\N	\N
1002335	http://www.harvesthomefm.org	https://www.facebook.com/HarvestHomeMkts/	https://twitter.com/HarvestHomeMkts	\N	https://www.instagram.com/harvesthomemkts/
1009660	http://www.honoluluparks.com	\N	\N	\N	\N
1018282	http://haymakermarket.com/	http://www.facebook.com/haymaker.farmers.market	https://twitter.com/haymakermarket	\N	http://instagram.com/haymakerfarmersmarket
1020044	http://haymakermarket.com	https://www.facebook.com/haymaker.farmers.market	https://twitter.com/haymakermarket	\N	http://pinterest.com/haymakermarket
1021431	\N	https://www.facebook.com/HealthwayParkFarmersMarket	\N	\N	\N
1021671	https://healthynewalbany.org/farmers-market/	https://www.facebook.com/hnafarmersmarket	n/a	n/a	https://www.instagram.com/hnafarmersmarket
1021672	https://healthynewalbany.org/farmers-market/	https://www.facebook.com/hnafarmersmarket	n/a	n/a	https://www.instagram.com/hnafarmersmarket
1021211	http://www.rhhtfoundationinc.org	https://www.facebook.com/RHHTFoundationinc	\N	\N	\N
1019786	http://www.heberut.gov	\N	\N	\N	\N
1019757	https://www.weho.org/farmersmarket	facebook.com/westhollywoodrec	\N	\N	www.instagram.com/wehorec
1019192	http://www.hendersoncountytailgatemarket.com	@hendersoncountytailgatemarket	@hctgm	Henderson County Tailgate Market	Instagram
1021286	\N	Buller Gardens	\N	\N	\N
1019802	\N	@herefordfarmmarket	\N	\N	\N
1021282	http://heritageacres.net	@heritageacresfarm	\N	\N	Instagram @heritageacresfarm
1003684	http://www.heritagefarmersmarket.blogspot.com	\N	\N	\N	\N
1019234	https://www.whitemtncommunitycoop.com/	https://www.facebook.com/groups/1881445965496016/	\N	\N	\N
1006285	http://www.cityofhernando.org/farmersmarket	https://www.facebook.com/pages/Hernando-Farmers-Market/	\N	\N	\N
1019486	https://www.fairfaxcounty.gov/parks/farmersmarkets/herndon	https://www.facebook.com/events/804594679906261/	\N	\N	@fairfaxfarmmarkets
1021355	\N	Good4Life Markets	\N	\N	ig:@good4lifemarkets
1020026	\N	www.facebook.com/hickorypointumcproducemarket	\N	\N	\N
1019224	http://www.highdesertfarmersmarket.com	High Desert Farmers Market	\N	\N	\N
1019220	https://www.highpointnc.gov/1753/High-Point-Farmers-Market	https://www.facebook.com/hpncfarmersmarket/	\N	\N	https://www.instagram.com/highpointfarmersmarket/?hl=en
1012260	http://highspringsfarmersmarket.com	fb.com/farmersmarkethighsprings	\N	\N	\N
1006831	http://thehighlandcenter.org/farmers-market	https://www.facebook.com/thehighlandcenter	\N	\N	\N
1021327	http://denverfarmersmarket.com	Metro Denver Farmers' Market	\N	\N	\N
1018951	https://highway7market.wixsite.com/manson	https://www.facebook.com/highway7market/	\N	\N	\N
1019688	http://www.kressfarm.org	\N	\N	\N	\N
1019959	https://www.hillsboromarkets.org/	https://www.facebook.com/hillsboromarkets/	https://twitter.com/home	\N	https://www.instagram.com/hillsboromarkets/
1019962	https://www.hillsboromarkets.org/	https://www.facebook.com/hillsboromarkets/	https://twitter.com/HFMkt	\N	https://www.instagram.com/hillsboromarkets/
1021249	http://www.hillsdalefarmersmarket.com	https://www.facebook.com/HillsdaleFM/	https://twitter.com/HillsdaleFM	https://www.instagram.com/hillsdalefm/	\N
1019669	\N	https://www.facebook.com/hinesvillefarmersmarket/?ref=aymt_homepage_panel&eid=ARD0szjrieT0U1nAUmLT5Gyh_giCODZ5TaoqN9AkJlW3lxm6eodoZSI-q1j5Dest8KQiuY-mukmFMDXS	\N	\N	\N
1008020	http://www.hinghamfarmersmarket.org	https://www.facebook.com/pages/Hingham-Farmers-Market/129956870371803	\N	\N	\N
1005076	http://www.hinsdalechamber.com	\N	\N	\N	\N
1019330	http://hotspringsfarmermarket.com	facebook.com/hotspringsfarmersmarket	twitter.com/hs_farmersmkt	\N	\N
1021208	https://jcdowntown.org/events/farmers-market	https://www.facebook.com/downtownjcfarmersmarket/	https://twitter.com/DowntownHDSID	https://www.youtube.com/user/JCHDSID	Instagram: https://www.instagram.com/hdsid_jc/?hl=en
1010937	http://www.historicfarmersmarketoflapeer.com	Historic Farmers Market of Lapeer	\N	\N	Facebook/Historic Farmers Market of Lapeer
1021533	http://www.LafayetteFarmersMarket.com	www.facebook.com/lafayettefarmersmarket	\N	\N	www.instagram.com/historiclafayettefarmersmarket
1021509	http://www.historiclewesfarmersmarket.org	https://www.facebook.com/historiclewesfarmersmarket/	\N	\N	\N
1021511	http://www.historiclewesfarmersmarket.org	https://www.facebook.com/historiclewesfarmersmarket/	\N	\N	\N
1021512	http://www.historiclewesfarmersmarket.org	https://www.facebook.com/historiclewesfarmersmarket/	\N	\N	\N
1021516	\N	https://www.facebook.com/historiclewesfarmersmarket	\N	\N	https://www.instagram.com/historiclewesfarmersmarket/?hl=en
1011761	\N	mariontailgatemarket	marionevents	marionevents	marionbizassociation
1018972	http://newburghfarmersmarket.org	facebook.com/newburghfarmersmarket	@marketnewburgh	\N	Instagram: @newburghfarmersmarket
1008980	\N	https://www.facebook.com/holdenmarket	\N	\N	\N
1021547	\N	https://www.facebook.com/HollidaysburgFarmersMarket	\N	\N	\N
1019302	http://www.hollyfarmersmarket.weebly.com	www.facebook.com/HollyFarmers	\N	\N	\N
1018853	\N	https://www.facebook.com/hsfarmersmarket/	https://twitter.com/HSFarmersMarket	\N	\N
1021229	https://seela.org/markets-hollywood/	\N	\N	\N	https://www.instagram.com/thehfm/
1018458	http://homegrownfarmmarket.webs.com	https://www.facebook.com/homegrownfarmmarket	\N	\N	\N
1007267	http://www.homerfarmersmarket.org	https://www.facebook.com/homerakfarmersmarket/	\N	\N	\N
1009663	http://www.homesweethomewood.com	https://www.facebook.com/VillageofHomewood	\N	\N	\N
1012076	http://www.gorgegrown.com	https://www.facebook.com/HoodRiverFarmersMarket	\N	\N	@HoodRiverFarmersMarket
1019819	\N	Hoodland Farmers Market	\N	\N	Hoodland Farmers Market (Instagram)
1021705	https://makefoodyourbusiness.org/markets/	https://www.facebook.com/HopeandMain	\N	\N	https://www.instagram.com/hopemain/
1021711	http://www.hopestreetmarket.com	http://www.facebook.com/HopeStFarmersMkt	\N	\N	http://www.instagram.com/hopestreetmarket
1012041	http://www.hopkinsfarmersmarket.com	www.facebook.com/hopkinsfarmersmarket	\N	\N	\N
1020100	http://www.hopkinsvilleky.us/visitors/historic_hopkinsville/downtown_farmers_market/index.php	https://www.facebook.com/HopkinsvilleDowntownFarmersMarket/	\N	\N	\N
1008366	http://www.hopkintonfarmersmarket.com	https://www.facebook.com/HopkintonFarmersMarket	\N	\N	\N
1019313	\N	www.facebook.com/soakinlocalfood	\N	\N	\N
1018200	http://Hubcityfm.org	@HubCityFM	@HubCityFM	\N	\N
1005674	http://www.hudsonfarmersmarketny.com	https://www.facebook.com/hudson.markt	\N	\N	\N
1018152	http://greatbiggreenhouse.com	Huguenot-Robious Farmers Market	\N	\N	\N
1019990	http://Great Big Greenhouse.com	Huguenot-Robious Farmers Market	\N	\N	\N
1021610	http://www.carbondalemarket.com/	https://www.facebook.com/communityfarmersmarket	\N	\N	https://www.instagram.com/carbondalemarket/
1021612	https://humpdayfarmersmarket.com/	https://www.facebook.com/Humpday-Farmers-Market-101574485558655	\N	\N	https://www.instagram.com/carbondalehdfm/
1019056	http://www.hunterdonlandtrust.org	https://www.facebook.com/HunterdonLandTrust	\N	\N	\N
1010598	https://www.huntingdonfarmersmarket.org/	https://www.facebook.com/HuntFarmMarket	\N	\N	\N
1021268	http://www.huntley.il.us	https://www.facebook.com/huntleyfarmersmarket	\N	VILLAGE OF HUNTLEY	\N
1019586	http://www.huttotx.gov	Downtown Huto	N/A	N/A	Instagram @dwntwnhutto
1021635	HTTPS://www.Facebook.com/Hwy80Produce	Hwy80Produce	Hwy80Produce	\N	\N
1011325	http://www.hyattsville.org/farmersmarket	www.facebook.com/hyattsville-farmers-market	\N	\N	@hyattsville_farmers_market
1021703	http://www.HydeParkFarmersMarket.com	https://www.facebook.com/HydeParkFarmersMarket/	https://twitter.com/hpfarmersmarket	\N	https://www.instagram.com/hydeparkfarmersmarket
1012621	http://www.idafarmersmarket.com	Ida Area Farmers Market	\N	\N	\N
1006417	http://www.idahofallsfarmersmarket.org/	https://www.facebook.com/pages/Idaho-Falls-Farmers-Market/83193557893	\N	\N	\N
1005080	http://www.icdda.com	https://www.facebook.com/pages/Imlay-City-Farmers-Market/215845188439242	\N	\N	\N
1019011	\N	https://www.facebook.com/indeefarmersmarket/	\N	\N	\N
1019236	http://independenceuptownmarket.com	\N	\N	\N	\N
1018772	\N	Indian Lake Community Farmers Market	\N	\N	\N
1019861	https://indianafarmmarket.blogspot.com/	https://www.facebook.com/indianafarmmarket/	\N	\N	\N
1004384	http://www.cityofionia.org	\N	\N	\N	\N
1019340	http://Isabahlialoefinc.org	Isabahlia ladies of Elegance Foundation Inc	Isabahlialoef	\N	\N
1003680	http://www.issaquahwa.gov/market	\N	\N	\N	\N
1004380	\N	https://www.facebook.com/BullerGardens	\N	\N	\N
1006376	\N	https://www.facebook.com/Jackalope-Square-Farmers-Market-1336784669703622	\N	\N	http://www.seewhatconversecando.com/
1018907	\N	Jackson Farmers Market	\N	\N	\N
1018343	http://www.jcfarmmarket.org/	https://www.facebook.com/brf.wi/	\N	\N	https://www.instagram.com/jcfarmmarket/
1019263	http://www.jacksoncountyfarmersmarket.org	www.facebook.com/thegloriousjacksoncountyfarmersmarket	\N	\N	www.instagram.com/jacksoncountyfarmersmarket
1018978	http://www.jacksoncountyfarmersmarket.org	www.facebook.com/TheGloriousJacksonCountyFarmersMarket/	\N	\N	\N
1021281	http://www.lammscape.com	Lammscapes	Lammscapes	Lammscapes	Instagram - Lammscapes
1009970	http://janesvillefarmersmarket.com/jfm/	https://www.facebook.com/pages/Janesville-Farmers-Market-Inc/212710452079344	https://twitter.com/jnsvlfarmmkt	\N	\N
1008299	\N	https://www.facebook.com/JasperFarmersMarket/	\N	\N	\N
1021306	http://www.farmtocitymarkets.com	https://www.facebook.com/Jefferson-Farmers-Market-129580207073874	\N	\N	\N
1020192	http://jeffersontownky.com/farmersmarket/	\N	\N	\N	\N
1002907	http://www.joshuatreefarmersmarket.com	https://www.facebook.com/pages/Joshua-Tree-Farmers-Market/164059226980487	\N	\N	\N
1018242	https://jahc.org/food-festival/	facebook/juneau.arts	\N	\N	@juneau_arts_council (instagram)
1005270	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1008375	http://www.kp.org/fresno	\N	https://twitter.com/kpfresno	\N	\N
1019774	http://pfcmarkets.com	https://www.facebook.com/KalamazooFarmersMarket/	\N	\N	https://www.instagram.com/kalamazoomarket/
1005252	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1008118	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1021264	http://kamuelafarmersmarket.com	https://www.facebook.com/kamuelafarmersmarket	\N	\N	\N
1005253	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1005254	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1005255	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1019003	https://www.kellerfarmersmarket.com/	https://www.facebook.com/KellerFarmersMarket/	https://twitter.com/KellerFarmersM	\N	https://www.instagram.com/kellerfarmersmarket/
1021369	https://www.KenoshaPublicMarket.com	www.facebook.com/KenoshaPublicMarket	\N	\N	\N
1021743	https://KenoshaPublicMarket.com	https://facebook.com/KenoshaPublicMarket	\N	\N	\N
1021349	http://www.KenoshaPublicMarkets.com	www.facebook.com/KenoshaPublicMarkets	\N	\N	\N
1020011	http://www.ExploreKensington.com	\N	\N	\N	\N
1021742	http://kentwoodfarmersmarket.com	https://www.facebook.com/CityofKentwoodFarmersMarket/	\N	\N	Instagram.com/KentwoodMIFarmersMarket
1021567	https://www.kershawcountyfarmersmarket.com/	https://www.facebook.com/KCFMMarket	\N	\N	https://www.instagram.com/kershawcountyfarmersmarket/
1010636	http://www.kingfarmersmarket.com	www.facebook.com/KingFarmersMarket	https://twitter.com/KingFarmersMkt	\N	https://www.instagram.com/king_farmers_market/
1019120	\N	@KingGeorgeFarmersMarket	\N	\N	\N
1003269	http://www.kingstonfarmersmarket.org	Facebook.com/kingstonfarmersmarket	\N	\N	@kingstonfarmersmarket
1019491	https://www.fairfaxcounty.gov/parks/farmersmarkets/kingstowne	https://www.facebook.com/events/388112988700408/	\N	\N	@fairfaxfarmmarkets
1020032	https://www.towncenterevents.com/farmersmarket.html	https://www.facebook.com/kingwoodfarmersmarket	\N	\N	\N
1019266	\N	Kirksville Kiwanis Farmers' Market	\N	\N	\N
1019212	\N	https://www.facebook.com/KirtlandGrowersMarket/	\N	\N	\N
1011117	http://www.kitterycommunitymarket.com	facebook.com/kitterymarket	twitter.com/kitterymarket	\N	instagram.com/kitterymarket
1021332	https://knoxcountyfarmersmarket.wordpress.com/	https://www.facebook.com/KnoxCountyMOFarmersMarket	\N	\N	\N
1020075	http://www.knoxcountymarket.com	https://www.facebook.com/knoxcountyfarmersmarket	\N	\N	\N
1021633	https://friendsofkoreshan.org/Farmers-Market	\N	\N	\N	\N
1021244	http://ksqfarmersmarket.com	facebook.com/ksqfarmersmarket	\N	\N	Instagram: ksqfarmersmarket
1021345	http://www.lacienegafarmersmkt.com	La Cienega Farmers' Market	La Cienega Farmers @laCienegaCFM	\N	\N
1003343	http://www.lafamiliaverde.org	\N	\N	\N	\N
1019986	http://lafamiliaverde.org	\N	\N	\N	\N
1020123	http://lagrangefarmersmarket.com	La Grange Farmers' Market & Artisans	\N	\N	\N
1019506	https://townoflaplata.org/farmersmarket	https://www.facebook.com/LaPlataFarmersMarket/	\N	\N	https://www.instagram.com/lpmdmarketmaster/
1019649	https://lachattownfarm.org/farmers-market.php	https://www.facebook.com/Lachat-Town-Farm-1453666524945229/?epa=SEARCH_BOX	\N	\N	https://www.instagram.com/lachattownfarm/
1019409	\N	https://www.facebook.com/Lafayette-County-Farmers-Market-At-Lewisville-1709681622637869/	\N	\N	\N
1019103	http://www.LakeBarringtonFarmersMarket.com	https://www.facebook.com/Labafama/	\N	\N	#LaBaFaMa
1003863	\N	https://www.facebook.com/pages/Lake-Oswego-Farmers-Market/	\N	\N	\N
1012206	http://www.ausablevalleygrangefarmersmarkets.com/lake-placid.html	https://www.facebook.com/ausablevalleygrangefarmersmarkets/	\N	\N	\N
1019850	http://www.brainerdfarmersmarket.com	Lakes Area Growers Market	\N	\N	\N
1019851	http://www.brainerdfarmersmarket.com	Lakes Area Growers Market	\N	\N	\N
1019198	http://www.lakesidefarmersmarket.net/	https://www.facebook.com/LakesideMarketRVA/	\N	\N	@LakesideMarketRVA
1002021	http://www.lakesidefarmersmarket.net	https://www.facebook.com/pages/Lakeside-farmers-market/96856541016	\N	\N	\N
1002521	http://www.leafcommunity.org	https://www.facebook.com/pg/leafcommunity.org/posts/	\N	\N	@leaf_community
1019427	http://lakewoodny.com/government/lakewoods-farmers-artisans-market/	https://www.facebook.com/lakewoodnyfarmersmarket/	\N	\N	https://www.instagram.com/farmersmarketlakewoodny/
1020051	http://goodlocalmarkets.org	\N	\N	\N	\N
1019035	\N	Lamoni Farmers' Market	\N	\N	\N
1021683	https://lanarkfarmersmarket.com/	https://www.facebook.com/LanarkFarmersMarket/	https://twitter.com/lanark_market	\N	https://www.instagram.com/lanarkfarmersmarket/
1019852	https://www.lancasterohfarmersmarket.org/	https://www.facebook.com/lancasterohfarmersmarket	\N	\N	\N
1019352	https://landonsgreenhouse.com/local-foods/	Landon's Saturday Farmers Market	\N	\N	\N
1005352	http://www.lanecountyfarmersmarket.org/	https://www.facebook.com/lanecounty.farmersmarket.3?fref=ts	https://twitter.com/farmmarketeers	https://www.youtube.com/channel/UCZELeX-wwsyo4M1h7ehatVQ	\N
1009803	http://www.lanecountyfarmersmarket.org/	https://www.facebook.com/lanecounty.farmersmarket.3?fref=ts	https://twitter.com/farmmarketeers	https://www.youtube.com/channel/UCZELeX-wwsyo4M1h7ehatVQ	\N
1019756	https://www.lansdalefarmersmarket.org/	https://www.facebook.com/LansdaleFarmersMarket/	Twitter: @LansdaleFM	\N	https://www.instagram.com/lansdalefarmersmarket/
1021291	http://larimercountyfm.org	https://www.facebook.com/larimercountyfm	\N	\N	@larimercountyfm
1021661	http://www.latahfarmersmarket.com/	https://www.facebook.com/latahfarmersmarket	\N	\N	https://www.instagram.com/latahfarmersmarket
1012344	http://Lathamfarmersmarket.org	Latham Farmers Market	\N	\N	Instagram
1019030	http://downtownthursday.com	facebook.com/downtownlaurelfarmersmarket/	\N	\N	\N
1018834	http://www.lawrencemi.org/lawrence-farmers-market/	https://www.facebook.com/LawrenceFarmersMkt	\N	\N	\N
1021324	https://www.lawrencefarmersmarket.org/	https://www.facebook.com/lawrencefarmersmarket	https://twitter.com/lawrencefresh?lang=en	\N	https://www.instagram.com/lawrencefarmersmarket/
1021325	https://www.lawrencefarmersmarket.org/	https://www.facebook.com/lawrencefarmersmarket	https://twitter.com/lawrencefresh?lang=en	\N	https://www.instagram.com/lawrencefarmersmarket/
1019450	http://www.lunited.org/programs/community-planning-development/lawrenceville-farmers-market/	www.facebook.com/lvillefarmmarket	\N	\N	@lvillefarmmarket (Instagram)
1021647	http://www.leaffoodhub.com	https://www.facebook.com/LEAFFoodHub	\N	\N	https://www.instagram.com/leaffoodhub/
1016810	\N	www.facebook.com/lebanoncitymarket	https://twitter.com/lebanoncitymkt	\N	\N
1018113	http://www.lebanonct.gov	Lebanon Farmers' Market	\N	\N	\N
1019158	http://legacyfarmersmarket.com	www.facebook.com/LegacyFarmersMarket	\N	\N	www.instagram.com/legacyfarmersmarket/
1006652	http://urbanoasisproject.org	https://www.facebook.com/LegionParkFarmersMarket/	https://twitter.com/urbanoasisproj	\N	IG @urban_oasis_project
1002768	http://www.leelanaufarmersmarkets.com	https://www.facebook.com/leelanaufarmersmarkets/	\N	\N	\N
1019512	\N	www.facebook.com/groups/lenexafarmmkt/	\N	\N	\N
1010483	\N	Lenoir County Farmers Market	\N	\N	\N
1016916	http://www.lewfm.org	lewfm	\N	\N	\N
1004651	http://www.lcgh.net	\N	\N	\N	\N
1019503	http://www.crossingscenter.com/farmersmarket	@TheCrossingsCenter	\N	\N	Instagram:  crossingscenter
1019808	https://www.lewistonfarmersmarket.com/	https://www.facebook.com/lewistonfarmersmarket/	https://twitter.com/LewistonMarket	https://www.youtube.com/user/mainefarmersmarket/	\N
1019726	https://www.lewistonfarmersmarket.com/	https://www.facebook.com/lewistonfarmersmarket/	@LewistonMarket	lewistonfarmersmarket	\N
1021470	https://www.lexingtonfarmersmarket.org/	https://www.facebook.com/LexingtonFarmersMkt	\N	\N	https://www.instagram.com/lexingtonfarmersmarket/
1019346	http://www.lexingtonfarmersmarket.org/	https://www.facebook.com/LexingtonFarmersMkt/	\N	\N	https://www.instagram.com/lexingtonfarmersmarket/
1019650	\N	https://www.facebook.com/libertyparkmarket/?ref=settings	https://twitter.com/LibertyParkMrkt	\N	https://www.instagram.com/libertyparkmarket/
1018927	http://www.ligoniercountrymarket.com	@LigonierCountryMarket	@LigonierMarket	\N	#ligoniermarket
1021361	http://www.lilburnfarmersmarket.org	www.facebook.com/lilburnfarmersmarket	\N	\N	@lilburnfarmersmkt
1011300	http://LHBA.org	Lincoln Heights Certified Farmers Market	\N	\N	\N
1020132	http://www.lhbala.org	Lincoln Heights Certified Farmers Market	\N	\N	\N
1019304	https://www.lpfarmersmarket.org/	https://www.facebook.com/Lincoln-Park-Farmers-Market-208206362528258/	https://twitter.com/LPFarmersMarket	\N	https://www.instagram.com/lpmarket2012/
1021198	http://sdfarmbureau.org	facebook.com/lindavistafm	\N	\N	IG @lindavistafm
1019167	http://www.lintonfarmersmarket.com	@lintonfarmersmarket	\N	\N	Instagram: lintonfarmersmkt
1019678	http://www.litchfieldhillsfarmfresh-ct.org	https://www.facebook.com/LHFFM/?ref=br_rs	https://twitter.com/search?src=typd&q=Litchfield%20Hills%20Farm-Fresh	\N	https://www.instagram.com/litchfieldhillsfarmfreshmarket/
1019679	http://www.litchfieldhillsfarmfresh-ct.org	\N	\N	\N	\N
1019631	\N	https://www.facebook.com/PleasantValleyFamilyFarm/	\N	\N	\N
1019207	http://www.ssjnn.org	https://www.facebook.com/SSJNN/	https://twitter.com/SSJNN	\N	https://www.instagram.com/ssj.nn/
1019995	http://www.LittleItalyMercato.com	https://www.facebook.com/LittleItalyMercato/	\N	\N	https://www.instagram.com/littleitalymercato/
1021390	\N	https://www.facebook.com/LRCFarmersMarket/	\N	\N	\N
1012027	http://waccamawmarkets.org/	https://www.facebook.com/WaccamawMarketCooperative/	\N	\N	\N
1019538	https://www.westernsustainabilityexchange.org/events/2019/5/29/livingston-farmers-market	https://www.facebook.com/Livingston-Farmers-Market-108693092565965/	\N	\N	\N
1018418	\N	The Wilson Barn	\N	\N	www.wilsonbarn.com
1018901	http://www.localapxmarket.com	https://www.facebook.com/LocalAPX/	\N	\N	#localapx
1019494	https://www.fairfaxcounty.gov/parks/farmersmarkets/lorton	https://www.facebook.com/events/1096089703908635/	\N	\N	@fairfaxfarmmarkets
1005431	\N	https://www.facebook.com/LosRanchosNM	\N	\N	\N
1018919	\N	Louisiana Community Betterment Farmers Market	\N	\N	\N
1000462	http://www.lovelandfm.com	https://www.facebook.com/LovelandFarmersMarket	\N	\N	\N
1016820	http://www.lowlinemarket.com	https://www.facebook.com/LowLineMarket	\N	\N	https://www.instagram.com/lowlinemarket
1021727	https://www.discoverlowell.org/farmers-market/	https://www.facebook.com/Lowell-Farmers-Market-426239604141282	\N	\N	\N
1011233	https://www.facebook.com/LowerValleyFarmersMarket/timeline	\N	\N	\N	\N
1018922	\N	https://www.facebook.com/lowvillefarmandcraftmarket/	\N	\N	\N
1011800	http://lsiowa.org/market	\N	\N	\N	\N
1021257	\N	https://www.facebook.com/Ludingtonfarmersmarket	\N	\N	\N
1019622	http://www.loudounfarmersmarkets.org	https://www.facebook.com/BluemontFarmersMarket/	\N	\N	https://www.instagram.com/loudounfarmmkts/
1019177	http://www.loudounfarmersmarkets.org	https://www.facebook.com/CascadesFarmersMarket	@LoudounFarmMkts	\N	\N
1019175	http://www.loudounfarmersmarkets.org	https://www.facebook.com/LeesburgFarmersMarket/	@LoudounFarmMkts	\N	\N
1019176	\N	https://www.facebook.com/LoudounStationFarmersMarket/	@LoudounFarmMkts	\N	\N
1019940	http://lynchburgcommunitymarket.com/	https://www.facebook.com/LynchburgCommunityMarket/	\N	https://www.youtube.com/channel/UCHqmO3XFRjNe8fhYstITNAA	@LynchburgCommunityMarket - Instagram
1019435	http://www.lyndenfarmersmarket.com	https://www.facebook.com/lyndenfarmersmarket/	\N	\N	\N
1011538	http://www.mableton.org/mableton-farmers-market	Mableton Farmers Market	\N	\N	\N
1000481	\N	https://www.facebook.com/madisoncofarmersmarket	\N	\N	\N
1012249	\N	dawson madison farmers market	\N	\N	\N
1005201	http://www.rosenet.org/gov/ddc	https://www.facebook.com/ilovemadisonnj	\N	\N	\N
1012046	http://www.madrassaturdaymarket.com	Madras Saturday Market	\N	\N	\N
1021339	http://www.sfmamarkets.com/madrona-farmers-market	https://www.facebook.com/MadronaFarmersMarket	\N	\N	https://www.instagram.com/sfmamarkets/
1019360	\N	www.facebook.com/MADWestFM	\N	\N	www.instagram.com/madwest_winter_farmers_market
1021197	http://www.mainstreetdfs.org/farmers-market/	https://www.facebook.com/MainStreetDFS/	\N	\N	\N
1006837	https://edc-farmtrails.org/our-trails/farmers-market/	https://www.facebook.com/edcfarmersmarket/	\N	\N	\N
1011119	http://www.chanutemainstreet.com	Main Street Chanute Farmers Market	\N	\N	\N
1019706	https://thecooperageproject.org/markets/farmersmarket/	https://www.facebook.com/pg/thecooperageproject/events/?ref=page_internal	\N	\N	\N
1021624	\N	Murfreesboro Saturday Market	\N	\N	\N
1019752	\N	https://www.facebook.com/MainStreetWadsworthFarmersMarket/	\N	\N	https://www.instagram.com/wadsworthfarmersmarket/
1019501	http://www.libertyvillefarmersmarket.org	https://www.facebook.com/Libertyville-Farmers-Market-166588080019691	\N	\N	\N
1005256	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1019969	http://naf1.townofmanchester.org/index.cfm/spruce-street-market/	sprucestreetmarketct	\N	\N	Instagram: sprucestreetmarket
1003980	\N	https://www.facebook.com/pages/Manhattan-Farmers-Market/143100112435501	\N	\N	\N
1018217	https://manisteekitchen.org/farmers-market/	https://www.facebook.com/Manistee-Farmers-Market-203800259657175/	\N	\N	\N
1018998	http://ManistiqueFarmersMarket.org/	facebook.com/MSTQFarmersMKT	twitter.com/MSTQFarmersMKT	\N	\N
1005257	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1019111	http://www.mansfieldtxfarmersmarket.com	www.facebook.com/mansfieldtxfarmersmarket	\N	\N	www.instagram.com/mansfieldfarmersmarket
1010286	\N	https://www.facebook.com/MansonFarmersMarket	https://twitter.com/MansonFarmerMkt	\N	\N
1018310	\N	https://www.facebook.com/mansoniafarmersmarket	\N	\N	\N
1005218	http://www.manzanitafarmersmarket.com	https://www.facebook.com/manzanitafarmersmarket/	\N	\N	\N
1016799	http://www.maplevalleyfarmersmarket.com	www.facebook.com/maplevalleyfarmersmarket	www.twitter.com/mvfm_2016	\N	\N
1003238	http://www.MariettaSquareFarmersMarket.com	https://www.facebook.com/mariettasquarefarmersmarket	\N	\N	\N
1021358	http://www.menomineefarmersmarket.com/	https://www.facebook.com/MenomineeFarmersMarket	\N	\N	\N
1021713	https://www.cityofmarion.org/recreation/parks-recreation/parks/farmers-market	\N	\N	\N	\N
1019058	\N	Marion Ohio Market	\N	\N	\N
1019482	\N	Market 23	\N	\N	\N
1019368	http://www.orlandpark.org/market	https://www.facebook.com/VillageofOrlandPark/	https://twitter.com/VillageOrlandPk	https://www.youtube.com/user/VillageofOrlandPark	\N
1012031	http://waccamawmarkets.org/	https://www.facebook.com/WaccamawMarketCooperative/	\N	\N	\N
1000242	http://www.specialeventsmobile.org	MarketsinMobile	\N	\N	\N
1019022	http://www.OSFMI.com	Oshkosh Farmers Markets	\N	\N	\N
1000616	http://www.specialeventsmobile.org	MarketsinMobile	\N	\N	\N
1019185	http://urbanoasisproject.org	https://www.facebook.com/urbanoasisproject	\N	\N	\N
1019806	http://www.marketonmainevv.com	https://www.facebook.com/MarketonMainEVV/	\N	\N	\N
1011972	http://MilitaryAve.org	Military Avenue Business Association	\N	\N	Market on Military FB event
1021341	https://whitehall-oh.us/581/Market-on-the-Green	@CityofWhiehall	\N	\N	\N
1019189	https://www.nourishknoxville.org/market-square-farmers-market/	https://www.facebook.com/marketsquarefarmersmarket/	https://twitter.com/MktSqFarmersMkt	\N	https://www.instagram.com/marketsquarefarmersmarket
1019924	\N	https://www.facebook.com/MarksvilleMarket/?modal=admin_todo_tour	\N	\N	\N
1019843	http://www.cityofmarlette.com/2216/Marlette-Farmers-Market	http://www.facebook.com/marlettefarmersmarket	\N	\N	\N
1020190	https://marshall.ca.uky.edu/farmersmarket	https://www.facebook.com/groups/178294012981631	\N	\N	\N
1002929	https://marshfieldfair.org/farmers-market/	https://www.facebook.com/MarshfieldFM/	https://twitter.com/MarshfieldFM	\N	Instagram: @MarshfieldFM
1019659	\N	www.facebook.com/mcmainstreetmarket	\N	\N	\N
1018976	http://www.maryvilleILfarmersmarket.org	www.facebook.com/maryvilleILfarmersmarket	\N	\N	\N
1011139	http://www.farmersmarketmaryville.com	Maryville Farmers Market	\N	\N	\N
1019902	\N	https://www.facebook.com/masoncofarmersmarket/	\N	\N	\N
1001281	\N	https://www.facebook.com/groups/309799505821466/	\N	\N	\N
1005642	http://www.mattapanfoodandfitness.org	https://www.facebook.com/pages/Mattapan-Square-Farmers-Market/132570930215702	\N	\N	\N
1003199	http://www.matthysfarmmarket.com	Matthys Farm Market	\N	\N	\N
1019300	http://www.mauldinculturalcenter.org/mauldin-market	https://www.facebook.com/mauldinmarket/	\N	\N	https://www.instagram.com/mauldinmarket/
1019968	https://www.maustonfarmersmarket.com/	https://www.facebook.com/maustonsfarmersmarket/	\N	\N	\N
1020145	\N	McCreary County Farmers Market	\N	\N	\N
1019487	https://www.fairfaxcounty.gov/parks/farmersmarkets/mccutcheon-mount-vernon	https://www.facebook.com/events/424552635030264	\N	\N	@fairfaxfarmmarkets
1020134	http://www.northcoastgrowersassociaton.org	https://www.facebook.com/McKinleyvilleFarmersMartket/	\N	\N	\N
1019490	https://www.fairfaxcounty.gov/parks/farmersmarkets/mclean	https://www.facebook.com/events/909125412812849/	\N	\N	@fairfaxfarmmarkets
1020081	\N	Meade County Farmers Market	\N	\N	\N
1019634	https://medfordfarmersmarket.org/	https://www.facebook.com/MedfordFarmerMkt/	https://twitter.com/medfordfarmmkt?lang=en	\N	https://www.instagram.com/medfordfarmersmarket/
1021314	http://www.farmtocitymarkets.com	https://www.facebook.com/mediafarmersmarket	\N	\N	\N
1018908	http://www.oyatetecaproject.org	Medicine Root Farmers Market	\N	\N	\N
1019858	http://www.medinafarmersmarket.com	medina farmers market	\N	\N	\N
1019759	http://www.meigscountyfarmersmarket.com	www.facebook.com/meigscountyfarmersmarket	\N	\N	\N
1021209	http://memphisfarmersmarket.org	https://www.facebook.com/memphisfarmersmarket	@MemFarmersMkt	Memphis Farmers Market	https://www.instagram.com/memfarmersmkt/
1020199	\N	https://www.facebook.com/Menifee-County-Farmers-Market-1412859525644869	\N	\N	\N
1002905	http://www.localharvest.org	Menlo Park Farmers Market	\N	\N	\N
1019816	http://menomineefarmersmarket.com/	https://www.facebook.com/MenomineeFarmersMarket/	\N	\N	\N
1021357	http://www.menomineefarmersmarket.com/	https://www.facebook.com/MenomineeFarmersMarket	https://twitter.com/MenoFarmMarket	\N	\N
1018093	\N	https://www.facebook.com/merchantvillemarketoffcentre/	\N	\N	https://www.instagram.com/marketoffcentre/
1019464	http://www.meridianmainstreetmarket.com	https://www.facebook.com/MeridianMainStreetMarket/	\N	\N	\N
1021458	\N	https://www.facebook.com/metuchenfarmersmarket	https://twitter.com/MetuchenMkt	\N	https://www.instagram.com/metuchenmkt/
1019137	\N	Miami County Farmers' Market	\N	\N	\N
1000021	http://www.mtfarmersmarket.com	https://www.facebook.com/mtmarket	\N	\N	\N
1011076	\N	Middlebury Farmers Market	\N	\N	\N
1019683	http://www.middletownmdfarmersmarket.com	https://www.facebook.com/middletownmdfarmersmarket	http://www.twitter.com/mtownfarmersmkt	\N	http://instagram.com/middletownfarmers
1009707	http://www.waccamawmarkets.org	https://www.facebook.com/WaccamawMarketCooperative/	\N	\N	\N
1019777	http://mbami.org/farmersmarket/	https://www.facebook.com/midlandfarmersmarket/	https://twitter.com/midlandfmarket	\N	https://www.instagram.com/midlandfarmersmarket/
1012786	http://www.midwestfarmersmarkets.org/markets/midtown-farmers-market/	https://www.facebook.com/Midtown-Farmers-Market-655879797806495/	https://twitter.com/MidtownFmsMkt	\N	\N
1006681	http://www.downtowntownmilfordfarmersmarket.com	https://www.facebook.com/Milfordmarket	\N	\N	\N
1009658	http://www.honoluluparks.com	\N	\N	\N	\N
1020034	https://www.milkladymarkets.org/derwood-market.html	https://www.facebook.com/MilkladyFarmersMarkets/	https://twitter.com/milkladymarkets	https://www.youtube.com/channel/UCwayQJb5tA74z6JPYQIFAcA	https://app.sourcewhatsgood.com/markets?filter=derwood
1020035	https://www.milkladymarkets.org/derwood-market.html	https://www.facebook.com/MilkladyFarmersMarkets/	https://twitter.com/milkladymarkets	https://www.youtube.com/channel/UCwayQJb5tA74z6JPYQIFAcA	https://app.sourcewhatsgood.com/markets?filter=derwood
1020038	https://www.milkladymarkets.org/shady-grove-market	https://www.facebook.com/MilkladyFarmersMarkets	https://twitter.com/milkladymarkets	https://www.youtube.com/channel/UCwayQJb5tA74z6JPYQIFAcA	https://app.sourcewhatsgood.com/markets/shady-grove-farmers-market/products
1012523	http://millcityfarmersmarket.org/	https://www.facebook.com/MillCityFarmersMarket/	https://twitter.com/mcfarmersmkt	\N	instagram: @mcfarmersmkt
1010485	\N	Main Street Millen	\N	\N	\N
1018486	http://www.miltondefarmersmarket.org/	https://www.facebook.com/Miltonfarmkt/	\N	\N	\N
1021454	http://www.mcwfm.org	www.facebook.com/mcwfm	www.twitter.com/fondymarket	www.youtube.com/channel/UCVNVRvOp84S6yHDnFn8ef1w	www.instagram.com/fondymarkets
1019239	https://mineolafarmersmarket.com/	https://www.facebook.com/mineolafarmersmarket/	\N	\N	\N
1019716	https://minnetrista.net/home/things-to-do/farmers-market2/	https://www.facebook.com/minnetrista	\N	\N	\N
1006069	https://www.minturn.org/explore-minturn/pages/minturn-market	https://www.facebook.com/minturnmarket	\N	\N	https://www.instagram.com/minturnmarket/
1020195	http://cuesa.org/mcm	facebook.com/mission.community.market	twitter.com/missionmercado	\N	instagram.com/missionmercado
1016862	http://missionks.org/market	https://www.facebook.com/missionksmarket/	https://twitter.com/missionksmarket	\N	https://www.instagram.com/missionksmarket/?hl=en
1018939	http://missoulafarmersmarket.com/	https://www.facebook.com/MissoulaFarmersMarket/	\N	\N	\N
1010037	http://www.seela.org/	https://www.facebook.com/MLKCampusFarmersMarket/	\N	\N	instagram- mlkcampusfm
1001104	http://www.tscpl.org	\N	\N	\N	\N
1006547	http://www.farmersmarketmonroemi.com	https://www.facebook.com/farmersmarketmonroemi	\N	\N	\N
1012314	http://www.mainstreetmonroe.org	Main Street Monroe Farmers Market	\N	\N	\N
1019844	http://www.montavillamarket.org	https://www.facebook.com/MontavillaMarket/	https://twitter.com/Montavillamkt	\N	https://www.instagram.com/accounts/activity/
1020166	\N	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage
1004297	\N	https://www.facebook.com/montevallofarmersmarket	\N	\N	\N
1020085	http://www.mocofarmersmarket.com	Montgomery County-KY-Farmers' Market	\N	\N	\N
1021377	https://jaspercountycoc.com/events/market-on-the-square/	https://www.facebook.com/monticellogafarmersmarket	\N	\N	\N
1011901	http://www.montourfallsfarmersmarket.com	https://www.facebook.com/Montour-Falls-Library-140122486056562	\N	\N	\N
1019507	http://montrosefarmersmarket.weebly.com/	https://m.facebook.com/MontroseFarmersMarket/	\N	\N	Instagram @montrosecoloradofarmersmarket
1019480	http://www.morelandfarmersmarket.org	https://www.facebook.com/morelandfarmersmarket/	\N	\N	https://www.instagram.com/morelandfarmers/
1018573	http://morgan.osu.edu	Morgan County Farmers Market	\N	\N	\N
1018314	http://www.info@mcfarmers.org	Morgan County Farmers Market	\N	\N	\N
1018317	http://www.info@mcfarmers.org	Morgan County Farmers Market	\N	\N	\N
1021252	http://www.info@mcfarmers.org	Morgan County Farmers Market	\N	\N	\N
1012560	http://www.downtownmorganton.com/index.php/shop/farmers-markets	www.facebook.com/morgantonfarmersmarket	\N	\N	\N
1021656	https://www.morningsidemarket.com	https://www.facebook.com/morningsidefarmersmarket	\N	\N	@morningsidefarmersmarket
1021467	https://www.growitgreenmorristown.org/local-food-access	Morris Winter Farmers Market	\N	\N	@morriswintermarket
1020162	https://www.morrobayfarmers.com	https://www.facebook.com/MorroBayMainStreetFarmersMarket/	\N	\N	https://www.instagram.com/morrobaymainstfarmersmarket/
1018926	http://www.ci.moscow.id.us/197/Farmers-Market	https://www.facebook.com/MoscowFarmersMarket/	https://twitter.com/mosfarmersmkt	\N	\N
1005559	http://www.mosineechamber.org	https://www.facebook.com/profile.php?id=1671726160	\N	\N	\N
1005499	\N	https://www.facebook.com/MountCarrollFarmersMarket	\N	\N	\N
1018991	http://www.mounthopefarm.org	https://www.facebook.com/mounthopefarm	\N	\N	\N
1004717	https://experiencemountpleasant.com/events/farmers-market/	https://www.facebook.com/MountPleasantFarmersMarket	\N	\N	\N
1018995	http://MtPFM.org	facebook.com/MtPFarMar	twitter.com/mtpfarmermarket	\N	\N
1000585	http://www.MountainFresh.org	https://www.facebook.com/mountainfreshfarmersmarket	\N	\N	\N
1021307	http://www.farmtocitymarkets.com	https://www.facebook.com/Mt-Airy-Farmers-Market-115303871848990	\N	\N	\N
1021288	\N	https://www.facebook.com/mpfarmersmarket	\N	\N	\N
1021287	http://www.mt-pleasant.org/farmersmarket	https://www.facebook.com/mpfarmersmarket	\N	\N	\N
1021571	http://Www.mtwashingtonky.org	@mwfarmersmarket	\N	\N	\N
1010316	http://www.mulberrymarket.org	https://www.facebook.com/MulberryStreetMarket	\N	\N	https://www.instagram.com/mulberry_market/
1012725	http://muldoonfarmersmarket.org	http://www.facebook.com/muldoonfarmersmarket	http://twitter.com/MuldoonFarmers	\N	\N
1018924	\N	https://www.facebook.com/groups/1627047027524961/	\N	\N	\N
1018931	\N	MunisingMarket	\N	\N	\N
1019857	https://murrysvilleparecreation.com/190/Farmers-Market	https://www.facebook.com/Murrysville-Farmers-Market-452857878198702/	\N	\N	\N
1018903	https://www.facebook.com/MyMatanuskaMarketplace/?ref=bookmarks	https://www.facebook.com/MyMatanuskaMarketplace/?ref=bookmarks	\N	\N	\N
1019682	http://www.myersvillefarmersmarket.com	https://www.facebook.com/myersvillefarmersmarket	\N	\N	http://instagram.com/myersvillefarmersmarket
1011535	http://www.napafarmersmarket.org	www.facebook.com/NapaFarmersMarket	www.twitter.com/napafarmersmkt	\N	www.instagram.com/napafarmersmkt
1020055	https://narrowsburgfarmersmarket.org/	https://www.facebook.com/narrowsburgfarmmarket/	\N	\N	https://www.instagram.com/narrowsburgfarmmarket/
1003081	http://nash.ces.ncsu.edu	Nash County Farmers Market in Rocky Mount	\N	\N	Instagram - naashcountyfarmersmarketinrocky
1020017	http://www.natickfarmersmarekt.org	\N	\N	\N	\N
1021715	https://www.navarrofarm.org/	https://www.facebook.com/navarrofarm.org/	\N	\N	https://www.instagram.com/navarrofarm/
1021642	https://www.nederlandfarmersmarket.org/	https://www.facebook.com/NederlandFarmersMarket/	\N	\N	https://www.instagram.com/nederlandfarmersmarket/
1018702	http://www.needhamfarmersmarket.org	https://www.facebook.com/NeedhamFarmersMarket/	\N	\N	\N
1019737	http://neoshofarmersmarket@gmail.com	https://www.facebook.com/NeoshoFarmersMarket	\N	\N	https://www.instagram.com/neoshofarmersmarket/
1021634	http://www.gonetcong.com/	Netcong Community Marketplace	\N	\N	Netcong Community Partnership
1019908	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=454	https://www.facebook.com/farmfreshri/	\N	\N	\N
1019725	http://www.newbaltimorefarmersmarket.com	https://www.facebook.com/New-Baltimore-Farmers-Market-Fan-Page-298736159230/	\N	\N	\N
1012739	https://coastalfoodshed.org/	https://www.facebook.com/massinmotionnewbedford/	\N	\N	\N
1012738	https://coastalfoodshed.org/	https://www.facebook.com/massinmotionnewbedford/	\N	\N	\N
1019348	https://coastalfoodshed.org/	https://www.facebook.com/newbedfordfarmersmarket/	\N	\N	\N
1012737	https://coastalfoodshed.org/	https://www.facebook.com/massinmotionnewbedford/	\N	\N	\N
1021601	http://www.neweracrc.org	New Era Farmers Market	\N	\N	\N
1019227	\N	https://www.facebook.com/newglarusfarmersmarket/	\N	\N	https://www.instagram.com/newglarusfarmersmarket/
1021632	\N	https://www.facebook.com/NewHarmonyFarmersMarket	\N	\N	\N
1020043	https://www.nourishknoxville.org/new-harvest/	https://www.facebook.com/newharvestfarmersmarket	https://twitter.com/nourishmarkets	\N	instagram.com/nourishmarkets
1005939	http://cityseed.org/downtown/	https://www.facebook.com/cityseed	@CitySeedNH	\N	instagram: @cityseedhaven
1005991	http://newhighlandbaptist.org/farmers-market/	https://www.facebook.com/#!/NHBCFarmersMarket	\N	\N	https://www.instagram.com/nhbcfarmersmarket/
1021336	http://noehospital.org	\N	\N	\N	\N
1021549	https://www.commongroundfarm.org/markets/newburgh-farmers-market	https://www.facebook.com/NewburghNYFarmersMarket	\N	\N	https://www.instagram.com/newburghnyfarmersmarket/
1021708	https://www.facebook.com/newcastlewyfarmersmarket	https://www.facebook.com/newcastlewyfarmersmarket	\N	\N	\N
1012044	\N	https://www.facebook.com/Newmarketfarmersmarket	\N	\N	\N
1019240	http://www.farmermark.com/newportbeach	https://www.facebook.com/newportbeachFM	\N	\N	@farmermarknb
1019294	\N	Nicholasville Farmers Market	\N	\N	\N
1010614	http://www.norfolkfarmersmarket.org	https://www.facebook.com/NorfolkFarmersMarket	\N	\N	\N
1021279	http://northalbanyfarmersmarket.com/	https://www.facebook.com/NAlbanyFarmermarket/	\N	\N	https://www.instagram.com/northalbanyfarmersmarket/
1020066	http://www.ecologycenter.org/fm	\N	\N	\N	\N
1021518	\N	North Branch - Minnesota Farmers Market	\N	\N	\N
1021243	http://www.NCantonFarmersMarket.com	https://www.facebook.com/NorthCantonFarmersMarket/	\N	\N	https://www.instagram.com/northcantonfarmersmarket/
1021434	http://www.NCantonFarmersMarket.com	https://www.facebook.com/NorthCantonFarmersMarket/	\N	\N	\N
1019407	http://www.NorthCreekFarmersMarket.com	https://www.facebook.com/NorthCreekFarmersMarket	\N	\N	\N
1018875	http://www.necic-ohio.org	www.facebook.com/nefm2014/	twitter.com/necic	www.youtube.com/user/necic1	www.instagram.com/necic/
1021344	http://necic-ohio.org	North End Farmers Market	\N	\N	\N
1018184	https://northiowafarmersmarket.com/	https://www.facebook.com/northiowafarmersmarket/	\N	\N	\N
1018550	http://northmarket.com	https://www.facebook.com/NorthMarket/	https://twitter.com/NorthMarket	\N	https://www.instagram.com/northmarket/
1001059	http://www.waccamawmarkets.org	https://www.facebook.com/WaccamawMarketCooperative/	\N	\N	\N
1004865	http://www.northprairiefarmersmarket.com	\N	\N	\N	\N
1009884	http://www.northsquarefarmersmarket.com	https://www.facebook.com/pages/North-Square-Farmers-Market/114897878526668	\N	\N	https://www.instagram.com/northsquarefarmersmarket/
1018455	https://www.visitstmarysmd.com/food-drink/detail/north-st.-marys-county-farmers-market	\N	\N	\N	\N
1019640	\N	Northampton Pa Farmers Market	\N	\N	\N
1003694	http://www.NorthbrookFarmersMarket.org	https://www.facebook.com/pages/Northbrook-Farmers-Market/145228398876527	\N	\N	@northbrookfarmersmarket
1006780	http://www.northeastmarket.org	https://www.facebook.com/NortheastFarmersMarket	https://twitter.com/nefarmersmarket	\N	https://instagram.com/ne_fm/
1010755	http://newfarmersmarket.org	Northeast Washington Farmers Market	\N	\N	\N
1002764	http://www.leelanaufarmersmarkets.com	https://www.facebook.com/leelanaufarmersmarkets/	\N	\N	\N
1018728	http://northridgefarmersmarket.org	https://www.facebook.com/northridgefarmersmarket/	\N	\N	\N
1019815	http://www.northsidefm.org	https://www.facebook.com/CinciNorthsideFarmersMarket	\N	\N	\N
1021379	http://northsidefarmersmarket.org	madNFM	madNFM	\N	Instagram: madNFM
1021554	https://www.northville.org/farmers-market-vendors	https://www.facebook.com/NorthvilleFarmersMarket	https://twitter.com/NorthvilleChamb	\N	https://www.instagram.com/northvillefarmersmarket/
1019008	http://www.lambsquartersinc.com	Norwich NY Farmers Market	\N	\N	\N
1019345	https://www.nourishknoxville.org/winter-market/	https://www.facebook.com/nourishknoxville/	https://twitter.com/NourishKnox	\N	https://www.instagram.com/nourishknox/
1020054	http://centralfarmmarkets.com	https://www.facebook.com/CentralFarmMarkets/	@CentralFarmMkts	\N	\N
1019127	http://www.nutleynj.org/farmersmarket	www.facebook.com/nutleyfarmersmarket1	www.twitter.com/nutleyfm	\N	www.instagram.com/nutleyfarmersmarket
1019828	http://www.visitoakcreek.org	https://www.facebook.com/groups/OakCreekFarmersMarket/	\N	\N	\N
1021566	http://Www.oakhillhops.com	Www.facebook.com/oakhillhops	\N	\N	\N
1019488	https://www.fairfaxcounty.gov/parks/farmersmarkets/oak-marr	https://www.facebook.com/events/344006939558658/	\N	\N	@fairfaxfarmmarkets
1018829	\N	www.facebook.com/oaksquarefarmersmarket	\N	\N	\N
1019223	http://Foodjusticecoalition.com	https://www.facebook.com/oakcrestfarmersmarket	https://twitter.com/oakcrest_market	\N	https://www.instagram.com/oakcrestfarmersmarket/
1019971	https://cfmatl.org/oakhurst/	https://www.facebook.com/OakhurstFarmersMarketGA/	\N	\N	\N
1019353	http://www.ocaladowntownmarket.com	\N	\N	\N	\N
1001839	http://www.OceanBeachSanDiego.com	https://www.facebook.com/OBFM	https://twitter.com/OceanBeachCA	\N	\N
1006250	http://www.oceancityvacation.com	https://www.facebook.com/OceanCityNJVacation	\N	\N	\N
1019200	http://www.oceanpines.org/amenities/ocean-pines-farmers-and-artisans-market/	https://www.facebook.com/OceanPinesFarmersArtisansMarketplace/	https://twitter.com/OPFarmersMkt	\N	\N
1021412	http://www.ovfarmersmarket.org	Ohio Valley Farmers' Market	OV Farmers Market @ovfarmersmarket	\N	Instagram: ovfarmersmarket
1021413	http://www.ovfarmersmarket.org	Ohio Valley Farmers' Market	OV Farmers Market @ovfarmersmarket	\N	Instagram: ovfarmersmarket
1001271	http://www.ohsu.edu/farmersmarket	https://www.facebook.com/ohsufarmersmarket	https://twitter.com/OHSUfarmmarket	\N	\N
1021356	https://www.downtownspringfield.org/old-capitol-farmers-market/	https://www.facebook.com/OldCapitolFarmersMarket	\N	\N	@oldcapitolfarmersmarket
1020130	http://www.oldla.org	Highland Park Old LA Certified Farmers Market	\N	\N	\N
1020131	http://www.oldla.org	Highland Park Old LA Certified Farmers Market	\N	\N	\N
1020146	https://uvfm.org/old-oakland-fridays	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage
1009659	http://www.honoluluparks.com	\N	\N	\N	\N
1010865	http://oldebeaufortfarmersmarket.org	www.facebook.com/oldebeaufortfarmersmarket	@BeaufortFarmers	\N	Instagram:  oldebeaufortfarmersmarket
1021667	https://www.pickeringtonvillage.com/farmers-market	https://www.facebook.com/oldepickeringtonfarmersmarket	https://twitter.com/pickfarmers	\N	https://www.instagram.com/pickfarmers/
1019646	http://olympiafarmersmarket.com	https://www.facebook.com/olympiafarmersmarket/	https://twitter.com/olyfarmersmkt	\N	https://www.instagram.com/olympiafarmersmarket/
1018655	http://omahafarmersmarket.com	www.facebook.com/omahafarmersmarket	@omahafarmersmkt	\N	Instagram: @omahafarmersmarket
1019343	http://omahafarmersmarket.com	https://www.facebook.com/omahafarmersmarket/	@OmahaFarmersMkt	\N	Instagram: @omahafarmersmarket
1021685	\N	https://www.facebook.com/OneAfricaMarket/	\N	https://www.youtube.com/c/BlackPowerBlueprint	https://www.instagram.com/black_power_blueprint/
1001034	http://www.oneidanation.org/ofm	https://www.facebook.com/#!/pages/Oneida-Farmers-Market-Wisconsin/157816204275054	\N	\N	\N
1019317	https://www.onslowcountyfarmersmarket.com/	https://www.facebook.com/OnslowCountyFarmersMarket/	https://twitter.com/OnslowCoFarmer	\N	https://www.instagram.com/onslowcountyfarmersmarket/
1021608	http://www.farmersmarketatthedole.org	www.facebook.com/FarmersMarketatTheDole	\N	\N	https://www.instagram.com/farmersmarketatd/
1018807	http://farmmarketorange.com	facebook.com/OrangeCTFarmersMarket	\N	\N	\N
1020114	https://orangehomegrown.org/	Orange Home Grown Farmers & Artisans Market	\N	Orange Home Grown	Instagram:  orangehomegrown
1018920	http://www.OrangeParkMarket.com	@OrangeParkMarket	\N	\N	\N
1008468	http://www.orcityfarmersmarket.com	https://www.facebook.com/ocfarmersmarket/	\N	\N	\N
1019202	http://mercedcfm.com/	https://www.facebook.com/mercedcfm/	\N	\N	https://www.instagram.com/mercedfarmersmarket/
1020198	http://www.cccfm.org/	https://www.facebook.com/OrindaFarmersMarket	\N	\N	https://www.instagram.com/orindafarmersmarket/
1008360	http://www.ormondbeachfarmersmarket.com	https://www.facebook.com/ormondfarmersmarket	\N	\N	\N
1019416	http://www.orofinofarmersmarket.com/	https://www.facebook.com/Orofino-Farmers-Market-139500116131731/	\N	\N	\N
1019019	http://www.OSFMI.com	Oshkosh Farmers Markets	\N	\N	\N
1019023	http://www.OSFMI.com	Oshkosh Farmers Markets	\N	\N	\N
1019025	http://www.OSFMI.com	Oshkosh Farmers Markets	\N	\N	\N
1021699	https://www.oswegolandparkdistrict.org/programs-events/special-events/oswego-country-market/	https://www.facebook.com/OswegoCountryMarket	\N	\N	\N
1021215	https://www.fromthelandofkansas.com/market/overbrook-farmers-market	Overbrook Farmers Market	\N	\N	\N
1020023	\N	https://www.facebook.com/ovidfarmersmarket	\N	\N	\N
1021384	https://owencountyfarmersmarket.com/	https://www.facebook.com/owencountyfarmersmarket	\N	\N	\N
1004212	\N	https://www.facebook.com/OxfordMarket	\N	\N	\N
1021335	http://www.oxfordfarmersmarket.com	oxford farmers market	\N	\N	\N
1012777	http://www.OxnardFarmersMarket.com	www.facebook.com/OxnardFarmersMarket/	https://twitter.com/oxnfarmersmkt	www.youtube.com/DowntownOxnard	www.instagram.com/oxnardfarmersmarket/
1008946	\N	https://www.facebook.com/PacificCityFarmersMarket?ref=hl	\N	\N	\N
1021721	http://paducahky.gov/farmers-market	https://m.facebook.com/paducah.homegrown/	\N	\N	\N
1021722	http://paducahky.gov/farmers-market	https://www.facebook.com/paducah.homegrown	\N	\N	\N
1021599	\N	Pahrump Farmers' Market	\N	\N	\N
1021200	http://Pajarovalleyfarmersmarket.com	\N	\N	\N	\N
1019723	http://www.palisadesfm.org	https://www.facebook.com/Palisades-Indoor-Farmers-Market-NY-198235466870315/	\N	\N	https://www.instagram.com/palisadescommunitycenterny/
1021648	https://palmasfarmersmarket.com/	https://www.facebook.com/PalmasFarmersMarket	https://twitter.com/wegrowpr	\N	https://www.instagram.com/palmasfarmersmarket/
1005248	http://www.honolulu.gov/parks/program/pom	\N	\N	\N	\N
1018687	http://www.palosheights.org	palosheightsfarmersmarket	\N	\N	\N
1011995	\N	https://www.facebook.com/palosverdesfarmersmarket/	@farmersmarketpv	\N	http://instagram.com/palosverdesfarmersmarket
1021491	http://paolafarmersmarket.org	facebook.com/paolafarmersmarket	\N	\N	\N
1021398	\N	https://www.facebook.com/paragouldmarket	\N	\N	\N
1019755	\N	https://www.facebook.com/Parkviewfarmersmarket/	https://twitter.com/parkview_market	\N	https://www.instagram.com/parkviewfarmersmarket/
1019761	\N	https://www.facebook.com/Parkviewfarmersmarket/	https://twitter.com/parkview_market	\N	https://www.instagram.com/parkviewfarmersmarket/
1006927	http://www.parkvillefarmersmarket.com	https://www.facebook.com/pages/Parkville-Farmers-Market	\N	\N	\N
1019939	http://www.paseofarmersmarket.com	paseofarmersmkt	\N	\N	Instagram
1021417	\N	https://www.facebook.com/patchandpasture/	\N	\N	\N
1019674	http://www.pawlingfarmersmarket.org	Pawling Farmer's Market - Saturdays 9am-1pm	\N	\N	pawlingfarmersmarket
1019910	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=30	https://www.facebook.com/farmfreshri/	\N	\N	\N
1018944	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=29	\N	\N	\N	\N
1021735	https://pawtuxetmarket.com/	https://www.facebook.com/pawtuxetvillagefarmersmarket	\N	\N	https://www.instagram.com/pawtuxet_farmers_market/
1019068	http://www.payettevalleyfoodconnection.com	www.facebook.com/payettefarmersmarket/	\N	\N	\N
1021389	https://www.paysonfarmersmarket.com/	https://www.facebook.com/PaysonFarmersMarket	\N	\N	https://www.instagram.com/payson_farmers_market_/
1021718	http://PCSundayMarket.com	https://www.facebook.com/thesundaymarketPC	\N	\N	\N
1020175	http://www.peacefulvalleyfarmersmarket.com	@CertifiedPVFM	\N	\N	Instagram:  peacefulvalleyfarmersmarket
1019685	http://Www.psfmarket.org	Peach Street Farmers Market	Psfmarket	\N	IG Peach Street Farmers Market
1018466	http://www.peachamfarmersmarket.com/	https://m.facebook.com/PeachamFarmersMarket/	\N	\N	\N
1019454	\N	facebook.com/pedernalesfarmersmarket	\N	\N	@pedernalesfarmersmarket (instagram)
1020072	https://www.pcfarmersmarket.com/	https://m.facebook.com/PendletonFarmersMarket/?tsid=0.44193321945021247&source=result	\N	\N	Pencofarmersmarket - Instagram
1021688	\N	Facebook.com/Pendletonindfarmersmarket	\N	\N	Instagram.com/Pendletonindianafarmersmarket
1019854	http://penningtonfarmersmarket.org	@PenningtonFarmersMkt	PenngtnFarmMkt	\N	\N
1019822	http://www.perrylecomptonfarmersmarket.com	@perrylecomptonfarmersmarket	\N	\N	\N
1018626	http://www.ilovefarmersmarkets.org	https://www.facebook.com/PetalumaFarmersMarket/	\N	\N	Instagram communitymarkets
1018627	http://www.ilovefarmersmarkets.org	https://www.facebook.com/PetalumaFarmersMarket/	\N	\N	ins
1012060	http://www.petershamcommon.com/fridaymarket.htm	\N	\N	\N	\N
1010839	https://petworthcmarket.wordpress.com/	https://www.facebook.com/petworthcommunitymarket	https://twitter.com/petworthmarket	\N	https://www.instagram.com/petworthmarket/
1019128	https://www.instagram.com/pfafftownfarmersmarket/?hl=en	\N	\N	\N	\N
1001260	http://www.pflugervilletx.gov/pfarmersmarket	\N	\N	\N	\N
1020126	https://www.phelancertifiedfarmersmarket.org	https://www.facebook.com/PhelanCertifiedFarmersMarket/	phelanfarmers	\N	https://www.instagram.com/explore/locations/322486348/phelan-certified-farmers-market/
1002060	http://www.philmontcooperative.com	\N	\N	\N	\N
1020177	\N	Phoenix Hill NuLu Farmer's Market	\N	\N	Instagram - phoenixhillnulufarmersmarket
1007245	http://www.triadfarmersmarket.com	https://www.facebook.com/pages/Robert-G-Shaw-Piedmont-Triad-Farmers-Market/144426648949461	\N	\N	\N
1010408	http://www.centralfarmmarkets.com	www.facebook.com/CentralFarmMarkets	@CentralFarmMKTs	\N	http://dishingthedirtblog.wordpress.com/
1021731	http:// www.pikefarmersmarket.org/	https://www.facebook.com/PikeFarmersMarket	\N	\N	https://www.instagram.com/pikefarmersmarket/
1020165	\N	Pikeville Farmers Market	\N	\N	\N
1021380	http://www.pinecitychamber.com	@PineCityFarmersMarket	\N	\N	\N
1010638	http://www.greenmarketco-op.org	https://www.facebook.com/greenmarketco.op/	https://twitter.com/GreenMarket_FL	https://www.youtube.com/channel/UC-evWnGLPGDR9y-HNqku7yQ	https://www.instagram.com/greenmarketco.op/
1016803	http://www.cypresshills.org	www.facebook.com/CHLDC	twitter.com/CHLDC	\N	\N
1021641	http://pittsburgfarmersmarket.org	Pittsburg Farmers' Market	\N	\N	Instagram: pittsburgfarmersmarket
1018921	http://oces.okstate.edu/pittsburg/farmers-market	\N	\N	\N	\N
1020005	https://www.pittsfield-mi.gov/Index.aspx?NID=760	https://www.facebook.com/pittsfieldtwpfarmersmarket	\N	\N	https://www.instagram.com/pittsfieldtwpparksandrec/
1021572	http://eldoradofarmersmarket.com	\N	\N	\N	\N
1012268	http://plainwell.org	Plainwell Farmers Market Official	\N	\N	\N
1019344	http://plainwell.org	Plainwell Farmers Market Official	\N	\N	\N
1019616	https://plattevillefarmersmarketwi.com/	www.facebook.com/PlattevilleFarmersMarket/	\N	\N	ttps://www.instagram.com/plattevillefarmersmarketwi/
1019615	https://plattevillefarmersmarketwi.com/	www.facebook.com/PlattevilleFarmersMarket/	\N	\N	ttps://www.instagram.com/plattevillefarmersmarketwi/
1020019	http://www.farmermark.com/playavista	https://www.facebook.com/playavistaFM	\N	\N	@farmermarkpv
1008213	\N	Pleasants Area Farmers Market	N/A	N/A	N/A
1021455	https://www.pleasantvillefarmersmarket.org/	https://www.facebook.com/PvilleFarmMarket	\N	\N	\N
1004602	http://www.plymouthfarmersmarket.com	https://www.facebook.com/pages/Plymouth-Farmers-Market-Inc/136145306459265	\N	\N	\N
1011146	http://www.poestenkillfarmersmarket.com	http://www.facebook.com/poestenkillfarmersmarket	\N	\N	\N
1005259	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1021485	https://cfmatl.org/markets/	https://www.facebook.com/pcfmbeltline	\N	\N	\N
1021462	https://downtownpontiacil.com/farmers-market-about/	https://www.facebook.com/pontiac.farmers.market/	\N	\N	\N
1019027	https://www.portchesterfarmersmarket.com	https://www.facebook/Port-Chester-Farmers-Market-1440567712732869/	https://www.twitter.com/cgmarketsllc	\N	https://www.instagram.com/portchesterfarmersmarket/
1018986	\N	https://m.facebook.com/portsanilacfarmersmarket	\N	\N	\N
1020037	http://jcfmarkets.org	https://www.facebook.com/PortTownsendFarmersMarket/	\N	\N	jeffcofarmersmarkets
1018474	https://www.portlandfarmersmarket.org/	https://www.facebook.com/portlandfarmersmarket/	https://twitter.com/portlandfarmers?lang=en	\N	https://www.instagram.com/portlandfarmers/?hl=en
1018477	https://www.portlandfarmersmarket.org/	https://www.facebook.com/portlandfarmersmarket/	https://twitter.com/portlandfarmers?lang=en	\N	https://www.instagram.com/portlandfarmers/?hl=en
1018478	https://www.portlandfarmersmarket.org/	https://www.facebook.com/portlandfarmersmarket/	https://twitter.com/portlandfarmers?lang=en	\N	https://www.instagram.com/portlandfarmers/?hl=en
1018482	https://www.portlandfarmersmarket.org/	https://www.facebook.com/portlandfarmersmarket/	https://twitter.com/portlandfarmers?lang=en	\N	https://www.instagram.com/portlandfarmers/?hl=en
1018483	https://www.portlandfarmersmarket.org/	https://www.facebook.com/portlandfarmersmarket/	https://twitter.com/portlandfarmers?lang=en	\N	https://www.instagram.com/portlandfarmers/?hl=en
1007797	http://www.seacoastgrowers.org	https://www.facebook.com/Market03801	https://twitter.com/market03801	\N	\N
1018963	\N	https://www.facebook.com/PrairieLakesSunPrairie/	\N	\N	\N
1019807	http://oh-prairietownship2.civicplus.com/219/Farmers-Market	\N	\N	\N	\N
1021263	https://www.prescottfarmersmarket.org/	https://www.facebook.com/prescottfarmersmarket	\N	\N	https://www.instagram.com/prescottfarmersmarket/
1021501	http://www.friendsofpretzelpark.org	https://www.facebook.com/pretzelparkfarmersmarket	\N	\N	\N
1019149	\N	https://www.facebook.com/Price-Farmers-Market-217357654964801/	\N	\N	\N
1019793	https://www.princegeorgecountyva.gov/farmersmarket/index.php	https://www.facebook.com/PrinceGeorgeFarmersMarket/	\N	\N	\N
1021617	https://pullmanchamber.com/live-in-pullman/farmers-market/	https://www.facebook.com/pullmanmarket/	\N	\N	\N
1019868	https://www.purcellvillefarmersmarket.com/	https://www.facebook.com/PurcellvilleFarmersMarket/	\N	\N	https://www.instagram.com/purcellvillefarmersmarket/
1021266	http://www.pfmwv.com	Putnam Farmers Market	\N	\N	\N
1011596	https://www.pfmwv.com	putnamfarmersmarket	\N	\N	\N
1003402	http://www.puyallupmainstreet.com/farmersmarket	Puyallup Farmers Market	\N	\N	\N
1021618	\N	http://www.facebook.com/qcfarmersmarket	\N	\N	http://www.instagram.com/qcfarmersmarket
1019477	\N	https://www.facebook.com/QuapawFarmersMarket/	\N	\N	\N
1010145	http://www.qafm.org	https://www.facebook.com/QAFarmersMkt	\N	\N	https://www.instagram.com/queenannefarmersmarket/?hl=en
1005260	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1019122	http://www.quincyfarmersmarket.org	\N	\N	\N	\N
1019315	https://www.thedistrictquincy.com/farmers-market/	https://www.thedistrictquincy.com/farmers-market/	\N	\N	\N
1021579	http://www.railyardsmarket.org	https://www.facebook.com/RailYardsMarket/	\N	\N	https://www.instagram.com/railyardsmarket.abq/?hl=en
1011310	\N	https://www.facebook.com/randolphcountymarket/	\N	\N	\N
1019204	\N	Randolph County Farmers' Market	\N	\N	\N
1019500	http://www.redlodgefarmersmarket.com	redlodgefarmersmarket	\N	\N	\N
1001766	http://redoakfarmersmarket.com	facebook.com@redoakfarmersmarket	\N	\N	\N
1020024	http://breada@earthlink.net	Facebook.com/breada	\N	\N	Instagram: @redstickfarmersmarket
1021277	http://www.breada.org	https://www.facebook.com/breada	\N	https://www.youtube.com/user/breadaweb	https://www.instagram.com/redstickfarmersmarket/?hl=en
1003610	http://www.breada.org	https://www.facebook.com/breada	\N	\N	Instagram: @redstickfarmersmarket
1019410	\N	https://www.facebook.com/RedlandCommunityFAM/	\N	\N	https://www.instagram.com/redlandcommunityfam/
1019411	\N	https://www.facebook.com/RedlandCommunityFAM/	\N	\N	https://www.instagram.com/redlandcommunityfam/
1004750	http://www.cityofredlands.org/redlandsmarketnight	\N	\N	\N	\N
1004751	https://www.cityofredlands.org/cms/One.aspx?portalId=6255746&pageId=7211257	\N	\N	\N	\N
1000712	http://www.ramchealth.com	\N	\N	\N	\N
1019235	http://www.ci.reidsville.nc.us/planning_a_visit/market_square/farmer_market.php	https://www.facebook.com/reidsvillefarmersmarket/	\N	\N	\N
1021615	http://reisterstown.com	https://www.facebook.com/ReisterstownFarmersMarket/	\N	\N	https://www.instagram.com/reisterstownfarmersmarket/
1009020	\N	https://www.facebook.com/pages/Rensselaer-Farmers-Market/120400308005878	\N	\N	\N
1019493	https://www.fairfaxcounty.gov/parks/farmersmarkets/reston	https://www.facebook.com/events/2109984659095016/	\N	\N	@fairfaxfarmmarkets
1002843	http://www.rexburgfarmersmarket.org/	https://www.facebook.com/rexburgfarmersmarket/	https://twitter.com/RexburgMarket	\N	https://www.pinterest.com/rexburgmarket/
1018549	https://www.richmondindiana.gov/resources/farmers-market	https://www.facebook.com/RichmondFarmersMarketIN/	\N	\N	https://www.instagram.com/richmondinfarmersmarket/
1021272	https://www.richmondindiana.gov/resources/farmers-market	https://www.facebook.com/RichmondFarmersMarketIN/	\N	\N	https://www.instagram.com/richmondinfarmersmarket/
1019930	http://ridgewayfarmersmarket.org	https://www.facebook.com/ridgewayfarmersmarketwi/	\N	\N	\N
1019142	http://www.myfhc.org	https://www.facebook.com/Family-Health-Centers-Farmers-Market-243660653033996/	\N	\N	\N
1019145	http://www.myfhc.org	https://www.facebook.com/Family-Health-Centers-Farmers-Market-243660653033996/	\N	\N	\N
1005060	\N	https://www.facebook.com/pages/Rindge-Farmers-and-Crafters-Market/131621310193301	\N	\N	\N
1021312	http://www.farmtocitymarkets.com	https://www.facebook.com/RittenhouseFarmersMarket	\N	\N	\N
1021302	http://www.farmtocitymarkets.com	https://www.facebook.com/RittenhouseFarmersMarket	\N	\N	\N
1019419	http://www.riverstreetmarket.com	www.facebook.com/riverstreetfarmersmarket	@rsmpetersburg	\N	Instagram - @riverstreetmarket
1019312	http://www.farmersmarketonline.com/fm/RiverValleyFarmersMarketMT.html	\N	\N	\N	\N
1004073	\N	https://www.facebook.com/RPFMarket	https://twitter.com/rpfm	\N	\N
1019418	http://www.riverfrontfarmersmarket.org	www.facebook.com/riverfrontfarmersmarket	www.twitter.com@RFMWilmingtonNC	\N	www.facebook.com/riverfrontfarmersmarket/
1000194	http://justeatlocal.wordpress.com/	https://www.facebook.com/Riverside.Farmers.Mkt	\N	\N	\N
1019259	http://www.crescentcityfarmersmarket.org/	https://www.facebook.com/rivertownfarmersmarketkenner/	\N	\N	https://www.instagram.com/rivertownfarmersmarket/
1019927	http://www.riverviewfarmersmarket.org/	https://www.facebook.com/farmsintheheights/	https://twitter.com/JCHeightsMarket	\N	https://www.instagram.com/riverviewfarmersmarket/
1019635	http://downtownmilford.org/farmersmarket	Facebook@riverwalkfarmersmarket	\N	\N	\N
1019070	http://discoverroanoke.org/events/farmers-market	https://www.facebook.com/RoanokeFarmersMarket/	\N	\N	\N
1019899	\N	Rock Valley Farmers Market (group)	\N	\N	Instagram - Rock_Valley_Farmers_Market
1020173	http://rockfordmidtownmarket.com	https://www.facebook.com/RockfordMidtownMarket	https://twitter.com/marketmidtown	\N	https://www.instagram.com/rockfordmidtownmarket/
1019033	http://RockmartFarmersMarket.com	https://www.facebook.com/rockmartfarmersmarket/	@rockmartfarmmkt	\N	Instagram: @rockmartfarmersmarket
1012576	http://www.rockvillemd.gov/farmers	facebook.com/RockvilleFarmersMarket	\N	\N	\N
1021623	http://www.rockybuttemarket.com	https://www.facebook.com/RockyButteFM/	\N	\N	https://www.instagram.com/rockybuttefm/
1019048	\N	Rocky Mountain Front Farmers Market	\N	\N	\N
1011286	http://rogersmn.gov/farmers-market	www.facebook.com/RogersFarmersMarket	\N	\N	\N
1019747	\N	https://www.facebook.com/rogersvillefriendsofthepark/	\N	\N	\N
1003969	http://www.rvgrowersmarket.com	https://www.facebook.com/rvgrowersmarket/	\N	\N	https://www.instagram.com/rvgrowersmarket/
1003970	http://www.rvgrowersmarket.com	https://www.facebook.com/rvgrowersmarket/	\N	\N	https://www.instagram.com/rvgrowersmarket/
1003971	http://www.rvgrowersmarket.com	https://www.facebook.com/rvgrowersmarket	https://twitter.com/rvgrowersmarket	\N	https://www.instagram.com/rvgrowersmarket/
1018637	http://www.ilovefarmersmarkets.org	https://www.facebook.com/rohnertparkfarmersmarket/	\N	\N	Instagram communitymarkets
1011778	http://www.cityrm.org	cityofrollingmeadows	@CityofRM1	\N	\N
1019479	\N	https://www.facebook.com/RonanFarmersMarket/	\N	\N	\N
1018349	http://www.rooseveltfarmersmarket.com	https://www.facebook.com/Roosevelt-Community-Farmers-Market-1412573385674026/?ref=bookmarks	@RCRGLI	https://www.youtube.com/results?search_query=roosevelt+community+revitalization+group	\N
1019973	\N	Friends of the Rosa Parks Farmers Market Community Advisory Council	\N	\N	\N
1010821	http://www.foodcoalition.org	www.facebook.com/rosecityfarmersmarket	\N	\N	\N
1019194	http:// Roslindale.net	https://www.facebook.com/roslindalevillagemainstreet/	\N	\N	https://www.instagram.com/roslindalefarmersmarket/
1019791	\N	https://www.facebook.com/Ross-Twp-Farmers-Market-414344225264700/	\N	\N	\N
1021535	\N	www.facebook.com/farmergeorge.market	www.twitter.com/farmergeorgetx	www.youtube.com/channel/UCvxG2wYZ5ebpCgcr8tQtV_Q/featured	www.instagram.com/farmergeorge.market/?hl=en
1021218	\N	facebook.com/routeonefarmersmarket	\N	\N	\N
1005261	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1019119	\N	https://www.facebook.com/groups/586850535001520	\N	\N	\N
1021451	http://runningspringschamber.com	RSfarmersmarket	RSfarmersmarket	\N	Twitter @rs_farmersmarket
1003915	\N	Rusk County Farmers Market	\N	\N	\N
1019620	http://russellville.locallygrown.net	@russellvilleCM	\N	\N	Instagram: @russellvilleCM
1021646	http://russianriverfarmersmarket.com	russianriverfarmersmarket	\N	\N	\N
1021503	\N	https://www.facebook.com/RussiavilleFM	\N	\N	\N
1018975	http://www.rustonfarmersmarket.org	www.facebook.com/RustonFarmersMarket	twitter.com/rustonfarmmkt	\N	www.instagram.com/rustonfarmersmarket
1019825	\N	https://m.facebook.com/saintmaryfarmersmarketgv/	\N	\N	@saintmaryfarmersmarketgv
1019734	\N	SaintParis FarmersMarket	\N	\N	\N
1005214	http://market.salemva.gov	https://www.facebook.com/SalemVaMarket	https://twitter.com/SalemVaMarket	\N	https://www.instagram.com/salemfarmersmarket/
1021613	http://www.salemfarmersmarket.org	www.facebook.com/SalemMAFarmersMarket	\N	\N	\N
1019211	http://www.salemnhfarmersmarket.org	https://www.facebook.com/salemnhfarmersmarket/?ref=bookmarks	\N	\N	\N
1004988	http://www.cityofsaline.org/farmersmarket	https://www.facebook.com/pages/Saline-Farmers-Market/199592293395735	\N	\N	\N
1004990	http://www.cityofsaline.org/farmersmarket	https://www.facebook.com/pages/Saline-Farmers-Market/199592293395735	\N	\N	\N
1021724	http://salisburyfarmersmarket.org/	@SalisburyMAFarmers	@SalisburyParks	\N	Insta: salisburyrecreation
1002485	http://www.salmoncreekfarmersmarket.com	https://www.facebook.com/SalmonCreekFarmersMarket	\N	\N	\N
1019428	http://www.fortwayneparks.org	https://www.facebook.com/Salomon-Farm-Park-134187289927760/	\N	\N	\N
1005262	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1021468	https://safoodbank.org/farmersmarket	\N	\N	\N	\N
1018449	http://www.sanfordfarmersmarket.org/	https://www.facebook.com/SanfordFarmersMarket/	https://twitter.com/SanfrdFarmrsMkt	\N	\N
1020185	http://www.uvfm.org	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage/
1021645	http://Thesantarosafarmersmarket.com	@santarosaoriginalfarmersmarket	\N	\N	@santarosafarmersmarket
1018625	http://www.ilovefarmersmarkets.org	https://www.facebook.com/santarosacommunityfarmersmarket/	\N	\N	Instagram communitymarkets
1018315	http://www.wednesdaynightmarket.org	https://www.facebook.com/Santa-Rosa-Downtown-Market-Wednesday-Night-Market-293742913694/	\N	\N	https://www.instagram.com/wednesdaynightmarket/
1011160	\N	https://www.facebook.com/FarmersMarketSantaRosa	https://twitter.com/NWFLfarmersmkt	\N	https://instagram.com/nwflfarmersmkt/
1007261	http://www.downtowntc.com	https://www.facebook.com/SaraHardyFarmersMarket	https://twitter.com/downtowntc	\N	Instagram: @downtown_tc
1008303	\N	https://www.facebook.com/pages/Saracen-Landing-Farmers-Market/384646718262191	\N	\N	\N
1012203	http://www.ausablevalleygrangefarmersmarkets.com	https://www.facebook.com/ausablevalleygrangefarmersmarkets/	\N	\N	\N
1021577	http://www.lakecountyfarmersfinest.org	https://www.facebook.com/Lake-County-Farmers-Finest-124667697570982	\N	\N	\N
1007250	http://www.saugertiesfarmersmarket.com/	https://www.facebook.com/SaugertiesFarmersMarket	\N	\N	Instagram: @saugertiesfarmersmarket
1021558	http://www.ScituateFarmersMarket.com	https://www.facebook.com/ScituateFarmersMarket	\N	\N	https://www.instagram.com/scituatefarmersmarket/
1021707	https://www.scituatefarmersmarketri.org/	@scituatefarmersmarketri	\N	\N	Instagram - northscituatefarmersmarket
1012037	http://SCOTCHPLAINSFARMERSMARKET.COM	https://www.facebook.com/ScotchPlainsFarmersMarket/	\N	\N	\N
1019627	\N	Scotland Farmer's Market	\N	\N	\N
1020088	https://scott.ca.uky.edu/content/farmers-market	hhttps://www.facebook.com/gtown.scottco.farmersmarket/	\N	\N	\N
1019515	\N	Scottsville Midweek Farmers' Market	\N	\N	\N
1019445	\N	https://www.facebook.com/Southeastfarmersgrowers43232/	\N	\N	\N
1018167	http://www.seacoasteatlocal.org	facebook.com/seacoasteatlocal	@SeacoastEatLocl	Seacoast Eat Local	Instagram: @SeacoastEatLocal
1018172	http://seacoasteatlocal.org	facebook.com/seacoasteatlocal	@SeacoastEatLocl	\N	\N
1019237	\N	https://www.facebook.com/sealyfm/	\N	\N	\N
1021693	\N	https://www.facebook.com/Searcy-County-Farmers-Market-1581639858749229	\N	\N	\N
1021664	https://www.seasidemarket.org/	https://www.facebook.com/SeasideORFarmersMarket	\N	https://www.youtube.com/channel/UCw5cRH_iA8uw0TnKjOvsS9A	https://www.instagram.com/seasidefarmermarket/
1021233	https://secotanmarket.com/	https://www.facebook.com/secotanmarket/	\N	\N	https://www.instagram.com/secotanmarket/
1018773	http://www.sedaliaareafarmersmarket.com/	https://www.facebook.com/SedaliaFarmersMarket/	\N	\N	https://www.instagram.com/sedalia_farmers_market/
1019610	\N	https://m.facebook.com/Seed2Seed-Farmers-Market-2419667011596134/	\N	\N	\N
1019442	http://senecamarket.com	https://www.facebook.com/SenecaFallsFarmersMarket/	\N	\N	\N
1019395	\N	https://m.facebook.com/SevierCountyFarmersMarketDeQueenArkansas	\N	\N	\N
1021700	\N	https://www.facebook.com/sewardnefarmersmarket/	\N	\N	\N
1010838	http://www.townofshallotte.org	https://www.facebook.com/ShallotteFarmersMarket	\N	\N	\N
1019455	http://www.thefreshproject.org	https://www.facebook.com/shawanofarmersmarket	https://twitter.com/shawanomarket	\N	\N
1021429	http://www.cityofshawnee.org	www.facebook.com/cityofshawnee	\N	\N	\N
1001280	\N	https://www.facebook.com/pages/Shelby-County-Farmers-Market/	\N	\N	\N
1019976	https://www.mainstreetshelbyville.org/mainstreet-farmers-market/	https://www.facebook.com/shelbycofarmersmarket	\N	\N	\N
1020103	\N	Shepherdsville Farmer's Market	\N	\N	\N
1018988	http://www.shilohfarmersmarket.com/	https://www.facebook.com/Shiloh-Farmers-Market-508150235911225/	\N	\N	\N
1019319	http://www.shorelinefarmersmarket.org	https://www.facebook.com/shorelinefarmersmarket	\N	\N	https://www.instagram.com/shoreline.farmers.market/
1012179	http://www.shorewoodfarmersmarket.com/	https://www.facebook.com/shorewoodfarmersmarket/	\N	\N	\N
1020004	https://redriverrevel.com/shreveport-farmers-market/	https://www.facebook.com/ShreveportFarmersMarket	\N	\N	https://www.instagram.com/shreveport_farmers_market/
1021397	http://www.mainstreetsiloam.org/farmersmarket	Facebook.com/SiloamSpringsFarmersMarket	\N	\N	Instagram.com/siloam_farmersmarket
1018771	\N	www.facebook.com/silvercityfarmersmarket/	\N	www.youtube.com/channel/UCTxVmxGRNXyVphALQ9b4KiA	\N
1021219	\N	https://www.facebook.com/silvercityfarmersmarket	\N	\N	\N
1011044	\N	wwww.facebook.com/silverlake.cfm	\N	\N	\N
1016822	http://www.silvervalleychamber.com/farmers-market.htm	https://business.facebook.com/silvervalleymarket/?business_id=522814814564925	\N	\N	@silvervalleyfarmersmarket
1018601	http://www.SilverdaleFarmersMarket.com	Facebook/SilverdaleFarmersMarket	\N	\N	\N
1011811	\N	https://www.facebook.com/simivalleycertifiedfarmersmarket/	\N	\N	\N
1010560	http://www.farmersmarketsiouxcity.com	Sioux City Farmers Market	@SiouxCityFarmersMarket	\N	@siouxcityfm
1003169	http://www.sitkalocalfoodsnetwork.org/	www.facebook.com/SitkaLocalFoodsNetwork	@SitkaLocalFoods	\N	www.facebook.com/SitkaFarmersMarket
1018814	http://www.davmid.com	www.facebook.com/sleepingdragonfarmersoutlet	\N	\N	\N
1019869	\N	https://www.facebook.com/SRCFM/	\N	\N	Instagram: slipperyrockfarmers
1020163	\N	https://www.facebook.com/farmsupplyfarmersmarket/	\N	\N	https://www.instagram.com/farmsupplyfarmersmarket/
1010014	\N	https://www.facebook.com/pages/Smith-County-Farmers-Market/253009170501	\N	\N	\N
1020022	http://www.farmermark.com/soco	https://www.facebook.com/socofm	\N	\N	@farmermarksoco
1019926	https://www.sutmc.org/sodus-farmers-market	https://www.facebook.com/SodusFarmersMarket/?eid=ARAx1anugPLGTuAOgrSyAlxV8qSLvqleZBvkN3fo2Pe5yANpwQzvWSFcv6MK2K1anPvrVy_2sGgpGRfe	\N	\N	Instagram - sodusfm
1020159	\N	SoKY Marketplace	\N	\N	\N
1003836	http://www.solanabeachfarmersmarket.com	https://www.facebook.com/SolanaBeachFarmersMarket	\N	\N	\N
1019829	http://soldotnasaturdayfarmersmarket.com	Facebook.com/soldotnasaturdayfarmersmarket	\N	\N	\N
1019671	http://somersetcountyfarmersmarket.com	https://www.facebook.com/Somerset-County-Farmers-Market-139142146101195/	\N	\N	\N
1020039	\N	www.facebook.com/shapeupsomerville	@shapeupsville	\N	\N
1020040	\N	www.facebook.com/shapeupsomerville	@shapeupsville	\N	\N
1011934	\N	facebook.com/shapeupsomerville	twitter.com/shapeupsville	\N	\N
1011935	\N	facebook.com/shapeupsomerville	twitter.com/shapeupsville	\N	\N
1019803	\N	https://www.facebook.com/SoutelCommunityMarket/	https://twitter.com/SoutelM	\N	\N
1020067	http://www.ecologycenter.org/fm	\N	\N	\N	\N
1021697	https://SouthCollierFarmersMarket.com	https://www.facebook.com/SouthCollierFarmersMarket	https://twitter.com/southcollierfm	https://www.youtube.com/channel/UCkpRnTwmz-Ioac8TrDURbvw	https://www.instagram.com/southcollierfarmersmarket/
1019385	https://sewanee.locallygrown.net/	South Cumberland Farmers Market	\N	\N	\N
1018138	https://oktjustice.org/resources/	https://www.facebook.com/seafmfarmermarket/	\N	\N	\N
1021214	https://southendmkt.com/	https://www.facebook.com/southendmarketclt	\N	\N	https://www.instagram.com/southendmarketclt/
1019599	\N	https://www.facebook.com/southforkgtx/	\N	\N	\N
1002526	http://www.southhillva.org	https://www.facebook.com/southhillfarmersmarket	\N	\N	\N
1019915	https://www.southkingstownfarmersmarket.org/	\N	\N	\N	\N
1021573	http://eldoradofarmersmarket.com	\N	\N	\N	\N
1019511	http://www.southlyonfarmersmarket.org	South Lyon Farmers and Artisans Market	\N	\N	\N
1010997	http://www.urbanoasisproject.org/farmers-markets.html	\N	\N	\N	IG @urban_oasis_project
1010445	http://www.smmarket.org	https://www.facebook.com/smdowntownmarket	\N	\N	\N
1021553	https://www.sovillagecenter.org/pub/event/story/2557/	https://www.facebook.com/SOVillageCenter	\N	\N	https://www.instagram.com/sovillagecenter/
1019091	http://www.facebook.com/southsidefarmersmarket	www.facebook.com/southsidefarmersmarket	\N	\N	instagram.com/southsidefarmersmarket
1018098	\N	Southside Junction Farmers Market	\N	\N	\N
1021563	https://www.southwaterfront.com/farmers-market	https://www.facebook.com/SouthWaterfrontFarmersMarket	\N	https://www.youtube.com/watch?v=jmREHSrfXGQ	https://www.instagram.com/southwaterfrontfarmersmarket/
1021589	https://southwindsor.recdesk.com/Community/Page?pageId=28812	https://www.facebook.com/SWPRD	\N	\N	instagram :  southwindsorparksandrecreation
1002063	\N	https://www.facebook.com/pages/Southern-Tier-Farmers-Market/165092373544019	\N	\N	\N
1019979	\N	https://www.facebook.com/MondayMorningMarket/	\N	\N	\N
1021326	http://denverfarmersmarket.com	Metro Denver Farmers' Market	\N	\N	\N
1005560	http://www.swvafarmersmarket.org/	https://www.facebook.com/swvafarmersmarket	\N	\N	\N
1019305	https://www.joysouthfield.org/	\N	\N	\N	\N
1018952	\N	Spanish Peaks Farm Stand	\N	\N	\N
1021568	\N	www.facebook.com/sparksumcevents	\N	\N	@sparksumcevents
1019173	\N	Speedway Farmers Market	\N	\N	\N
1019784	https://www.spotsylvaniafarmersmarket.com/	https://www.facebook.com/SpotsyFarmersMarket/	@SpotsyFarmMkt	\N	\N
1019452	http://www.spotsylvaniafarmersmarket.com	https://www.facebook.com/SpotsyFarmersMarket/	@spotsyfarmmkt	\N	\N
1019782	http://SpotsylvaniaFarmersMarket.com	https://www.facebook.com/SpotsyFarmersMarket/	@spotsyfarmmkt	\N	\N
1021394	http://springdale.locallygrown.net	Springdale Farmers’ Market at the Jones Center	\N	\N	\N
1003588	http://www.batesvillemainstreet.com/events/	\N	\N	\N	\N
1021670	\N	www.facebook.com/stjohnmarket	\N	\N	\N
1018312	http://www.stjohnsopportunity.org/	https://www.facebook.com/stjohnsfarmersmarket/	https://twitter.com/pdxsjfm	\N	\N
1021466	http://www.gratiotfarmersmarkets.com/st-louis	www.facebook.com/stlouisfm	\N	\N	www.instagram.com/stlouisfm
1019628	\N	https://www.facebook.com/stmariesfarmersmarkets/	\N	\N	https://www.instagram.com/stmariesfarmersmarket/
1020176	http://www.smfarmersmarket.com	https://www.facebook.com/SMFarmersMarket/	https://twitter.com/farmersmarketsm	\N	\N
1019675	\N	https://www.facebook.com/loveyourfarmer/	\N	\N	https://www.instagram.com/explore/locations/92355524/st-michaels-farmers-market/
1007810	http://www.stpaulfarmersmarket.com	\N	\N	\N	\N
1012278	http://www.saturdaymorningmarket.com	https://www.facebook.com/Saturday-Morning-Market	SPSatAMMkt	\N	\N
1021483	\N	https://www.facebook.com/stphilipsplazamarket/	\N	\N	\N
1012766	http://Www.staffordcommunityfarmersmarket.com	Stafford Community Farmers Market	\N	\N	\N
1018211	\N	Stanly Commons Farmers Market	\N	\N	Instagram:  stanlycommonsfarmersmarket
1021526	http://Downtownstayton.org	@staytonfarmersmarket	\N	\N	#staytonfarmersmarket
1012100	\N	https://www.facebook.com/pages/Springfield-Technical-Community-College/109746082384737?fref=ts	\N	\N	\N
1018918	\N	https://www.facebook.com/STCCOpenAirMarket/	https://twitter.com/StccOAM	\N	https://www.instagram.com/stccopenairmarket/
1021333	\N	https://www.facebook.com/SteelvilleMarket/	\N	\N	https://www.instagram.com/steelvillemarket
1021334	\N	https://www.facebook.com/SteelvilleMarket/	\N	\N	https://www.instagram.com/steelvillemarket
1010057	http://stonesriver.locallygrown.net/	https://www.facebook.com/StonesRiverMarket	\N	\N	\N
1019526	http://www.stowfarmersmarket.com	@StowCommunityFarmersMarket	\N	\N	\N
1018451	http://www.stowefarmersmarket.com	https://www.facebook.com/stowefarmersmarket	\N	\N	https://www.instagram.com/stowefarmersmarket/
1012116	http://www.suffolkvafarmersmarket.com/	https://www.facebook.com/SuffolkFarmersMarketVirginia/	\N	\N	https://www.instagram.com/suffolkvafarmersmarket/
1019545	http://www.letsgrowakron.org	https://www.facebook.com/LetsGrowAkron/	letsgrowakron	\N	letsgrowakron_ on Instagram
1019036	http://Sumterfarmersmarket.com	Sumter Farmers Market	\N	\N	Instagram
1019112	http://www.ColoradoFeedAndGrain.com/SundayMarket	Facebook.com/COFeedGrain	\N	\N	\N
1007271	http://www.ardovinos.com	https://www.facebook.com/FarmersMarketAtADC	\N	\N	\N
1020186	https://uvfm.org/sunnyvale-saturday	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage/
1021432	\N	Superior Farm-to-Fantastic Farmer's Market	\N	\N	\N
1008173	\N	https://www.facebook.com/SurfsideSunsetMarket	https://twitter.com/capecoralfarmer	\N	\N
1020149	http://svsaturdaymarket.org/	https://www.facebook.com/ModocCFM/	\N	\N	\N
1019481	http://www.sustaingreenville.org/	https://www.facebook.com/Sustain.Greenville.Market/	\N	\N	\N
1021643	https://sustainablefoodcenter.org/farmers-market	https://www.facebook.com/SFCFarmersMarket/	\N	\N	https://www.instagram.com/sfcfarmersmarket/
1021644	https://sustainablefoodcenter.org/farmers-market	https://www.facebook.com/SFCFarmersMarket/	\N	\N	https://www.instagram.com/sfcfarmersmarket/
1002765	http://www.leelanaufarmersmarkets.com	https://www.facebook.com/leelanaufarmersmarkets/	\N	\N	\N
1019981	http://www.suwanee.com	@cityofsuwaneeGA	cityofsuwaneeGA	\N	\N
1021313	http://www.farmtocitymarkets.com	https://www.facebook.com/swarthmorefarmersmarket	\N	\N	\N
1018923	http://sweetwater-organic.org/	https://www.facebook.com/sundaymarket/	https://twitter.com/SweetwaterTampa	\N	https://www.instagram.com/sweetwater_organic_farm/
1019015	http://www.tahoecityfarmersmarket.com	https://www.facebook.com/tahoecityfarmersmarket/	\N	\N	https://www.instagram.com/tahoefarmersmarket/
1020036	http://shirleysfarmersmarkets@gmail.com	Shirley's Farmers' Markets	\N	\N	Instagram
1018476	http://www.taosfarmersmarket.org	Www.facebook.com/taosfarmersmarket	\N	\N	Www.instagram.com/taos_farmers_market
1020073	http://www.spencerextension.com/farmersmarket	Facebook.com/TaylorsvilleFarmersMarket	\N	\N	\N
1011738	http://www.saturdaymarketlive.com/	https://www.facebook.com/saturdaymarket	https://twitter.com/gvillesatmarket	\N	https://www.instagram.com/gvillesatmarket/
1019138	http://www.teamjaffrey.org	Teamjaffreymarket	\N	\N	\N
1003982	http://www.thetelluridefarmersmarket.com	https://www.facebook.com/thetelluridefarmersmarket/?modal=admin_todo_tour	\N	\N	@telluridefarmersmarket on Instagram
1020147	https://uvfm.org	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage
1019075	https://www.ttfarmersmarket.com/	https://www.facebook.com/ttfarmersmarket/	\N	\N	\N
1021694	https://teninofarmersmarket.org/	https://www.facebook.com/teninofarmersmarket	\N	\N	instagram- Teninofarmersmarket
1018994	http://Terrasquare.com	\N	\N	\N	\N
1010998	http://www.terrehautefarmersmarket.com	https://www.facebook.com/Terrehautedowntownfarmersmarket	\N	\N	\N
1000710	http://www.TexasFarmersMarket.org	https://www.facebook.com/TFMLakeline	\N	\N	https://www.instagram.com/texasfarmersmarket/, our new farmers' market app:  https://texasfarmersmarket.spnd.st/join
1021616	http://texasfarmersmarket.org/	www.facebook.com/TFMMueller/	\N	https://www.youtube.com/channel/UCbO6zX0lGYi2BdwdbJiwjwA	www.instagram.com/texasfarmersmarket/
1018279	http://www.texastownship.org/farmers-market/	https://www.facebook.com/TexasTownshipFarmersMarket/	https://twitter.com/freshonQ	\N	https://www.instagram.com/texastwpfm/
1021235	http://thewheemarket.org	https://www.facebook.com/WheeMarket/?view_public_for=461052543905947	\N	\N	\N
1021204	http://Www.facebook.com/albemarlefarmersmarket	Albemarle farmersmarket	\N	\N	\N
1020049	http://americanlegionfarmersmarket.com	https://www.facebook.com/Americanlegionfarmersmarket/	n/a	n/a	americanlegion_farmersmarket
1019047	http://oobballpark.com	\N	\N	\N	\N
1019933	https://www.berlinmainstreet.com/farmersmarket/	https://www.facebook.com/theberlinfarmersmarket	\N	\N	\N
1021203	\N	https://www.facebook.com/TheBlvdFarmersMarket	\N	\N	\N
1019596	https://www.instagram.com/thecapitalmarket20743	https://www.facebook.com/thecapitalmarket20743	\N	\N	\N
1018959	http://www.cityofclarksville.com/index.aspx?page=406	https://www.facebook.com/ClarksvilleDowntownMarket/	\N	\N	\N
1021254	http://www.cornermarketgso.com	https://www.facebook.com/walkerelamcornermarket/	\N	https://youtube.com/c/Walkerelammarket	https://www.instagram.com/cornermarketgso/
1019303	http://www.creedefarmersmarket.com	www.facebook.com/creedefarmersmarket	www.twitter.com/creedemarket	\N	\N
1019544	http://www.eastendfm.com	http://www.facebook.com/eastendfm	\N	\N	http://www.instagram.com/eastendfm
1019775	\N	http://bit.ly/thefairfieldfarmersmarket	\N	\N	https://www.instagram.com/fairfieldoh/
1019931	\N	the Farm Market	\N	\N	\N
1019948	https://millno5.com/the-farm-market/	https://www.facebook.com/thefarmmarket/	\N	\N	https://www.instagram.com/farmlowell
1019166	http://farmersmarket.umd.edu	https://www.facebook.com/farmersmarket.umd/	https://twitter.com/farmersmarketum	\N	https://www.instagram.com/farmersmarketum/
1019626	https://www.tiffanyfarmsct.com/new-page	From the Farm, LLC	\N	\N	@fromthefarmllc
1019751	http://AgresticAcres.com	@FarmMarketRutherfurdHall	\N	\N	\N
1021304	http://www.farmtocitymarkets.com	https://www.facebook.com/FarmToCity	\N	\N	\N
1019697	https://www.itsmarta.com/marta-market.aspx	https://www.facebook.com/MARTAFresh/	\N	\N	\N
1019700	https://www.itsmarta.com/marta-market.aspx	https://www.facebook.com/MARTAFresh/	\N	\N	\N
1019699	https://www.itsmarta.com/marta-market.aspx	https://www.facebook.com/MARTAFresh/	\N	\N	\N
1019698	https://www.itsmarta.com/marta-market.aspx	https://www.facebook.com/MARTAFresh/	\N	\N	\N
1019696	https://www.itsmarta.com/marta-market.aspx	https://www.facebook.com/MARTAFresh/	\N	\N	\N
1021276	https://www.buylocalmarket.org/the-groves-marketplace	https://www.facebook.com/TheGrovesMarketplace	\N	\N	https://www.instagram.com/thegrovesmarketplace/
1021619	http://Downtownroanoke.org	The Historic City Market	\N	\N	\N
1012357	http://www.TheBeachMarkets.com	https://www.facebook.com/IndianShoresSundayMarket/	\N	\N	\N
1019001	\N	The Lewis Co. Farmers Market	\N	\N	\N
1021659	\N	https://www.facebook.com/thelmhmarket/photos/?ref=page_internal	\N	\N	https://www.instagram.com/lmh_market
1019504	http://themarketlvnj.wixsite.com/themarket-longvalley	https://www.facebook.com/TheMarketatLongValley/	\N	\N	\N
1019966	https://secondstageamherst.org/markets	https://www.facebook.com/The-Market-at-Second-Stage-994201827398686	\N	\N	\N
1018422	http://greenlakerenewal.org/	\N	\N	\N	\N
1021702	http://www.whiteriverstatepark.org/	www.facebook.com/WhiteRiverStatePark/	twitter.com/WhiteRiverStPrk	\N	www.instagram.com/whiteriverstprk/
1016917	\N	facebook.com/petersburgmarket	\N	\N	\N
1019928	http://www.themarketplaceatleebranch.com	@themarketplaceatleebranch	\N	\N	\N
1011497	http://www.marketsatshrewsbury.com	The Markets at Shrewsbury	The Markets at Shrewsbury	\N	\N
1019517	https://www.monroefarmersmarket.org/	https://facebook.com/monroectfarmersmarket	https://twitter.com/ctfarmersmarket	\N	https://instagram.com/monroectfarmersmarket
1002101	\N	https://www.facebook.com/OrangeFarmersMarket	\N	\N	\N
1019739	\N	https://facebook.com/orchardfarmersmarket/	\N	\N	\N
1019513	http://www.tfbgc.org/farmers-market	https://www.facebook.com/VictoriaFarmersMarket/	\N	\N	Instagram: @victoriafarmersmarket
1019826	https://www.greshamfarmersmarket.com/	https://www.facebook.com/GreshamFarmersMarket	https://twitter.com/greshamfarmersmarket	\N	https://www.instagram.com/greshamfarmersmarket/
1019975	http://www.peoplesmarketbtown.org	The People’s Market	\N	\N	peoplesmarketbtown on Instagram
1018628	http://www.ilovefarmersmarkets.org	https://www.facebook.com/petalumaeastsidefarmersmarket/	\N	\N	Instagram communitymarkets
1018624	http://www.ilovefarmersmarkets.org	https://www.facebook.com/TheSpringsCommunityFarmersMarket/	\N	\N	Instagram communitymarkets
1000278	\N	www.facebook.com/TheTerritoryFarmersMarket	\N	\N	\N
1020015	\N	Facebook.com/LittleFallsFarmersMarket	\N	\N	Instagram.com/LittleFallsFarmersMarket
1010798	http://www.shirleysfarmersmarkets.com	htwww.facebook.com/ShirleysFarmersMarketsNV	\N	\N	Instagram
1012799	http://westriverfarmersmarket.com	@westriverfarmersmarket	\N	\N	Instagram - westriverfarmersmarket
1021586	http://www.thewilmingtonfarmersmarket@gmail.com	https://www.facebook.com/thewilmingtonfarmersmarket/	\N	\N	https://instagram.com/thewilmingtonfarmersmarket?r=nametag
1008826	http://www.thewoodlandfarmersmarket.org	https://www.facebook.com/pages/The-Woodland-Farmers-Market/128409933892000	\N	\N	\N
1008827	http://www.thewoodlandfarmersmarket.org	https://www.facebook.com/pages/The-Woodland-Farmers-Market/128409933892000	\N	\N	\N
1019228	\N	www.facebook.com/thiefriverfallsfarmersmarket	\N	\N	\N
1017961	http://agriculturalinstitue.org	https://www.facebook.com/MarinFarmersMarkets/	\N	\N	https://www.instagram.com/aim_farmers_markets/
1009802	http://www.tigardfarmersmarket.org	https://www.facebook.com/tigardfarmersmarket	https://twitter.com/Tigardfarmers	https://www.youtube.com/channel/UC_Xs5DT42SQxkh9ZHeYJtCw	https://www.instagram.com/tigardfarmersmarket/
1021562	\N	https://www.facebook.com/titusvilleopenairmarket	\N	\N	\N
1021744	http://www.TivertonFarmersmarket.com	https://www.facebook.com/TivertonFarmersMarket	\N	\N	https://www.instagram.com/TivertonFarmersMarket
1021447	https://www.tontitown.com/tontitown-farmers-market/	https://www.facebook.com/Tontitown-Farmers-Market-101353608349771/	https://twitter.com/TontitownM	\N	\N
1019963	\N	https://www.facebook.com/torringtonwyfarmersmarket/	\N	\N	\N
1021490	https://www.tosafarmersmarket.com	https://www.facebook.com/TosaFarmersMarket	\N	\N	https://www.instagram.com/tosafarmersmarket/
1019393	https://hillsvillefarmersm.wixsite.com/mysite	www.facebook.com/townofhillsvillefarmersmarket/	\N	\N	\N
1019213	\N	https://www.facebook.com/wadleyfarmersmarket/	\N	\N	\N
1006324	\N	Townshend Farmers Market	\N	\N	\N
1021745	http://travelersrestfarmersmarket.com	facebook.com/travelersrestfarmersmarket	\N	\N	instagram.com/trfarmersmarket
1021343	https://experiencetremont.com/featured-events/farmers-market/	https://www.facebook.com/search/top?q=tremont%20farmers%27%20market	\N	\N	\N
1018933	https://www.troutcreekcia.org/farmers-market/	https://www.facebook.com/troutcreekfarmersmarket/	\N	\N	\N
1020002	http://troymarket.org	facebook.com/troywaterfrontfarmersmarket	\N	\N	instagram.com/troymarket
1019632	http://tuesdayfarmersmarket.com	Tuesday Farmers Market at Meridianville	Mville Farmers Market	\N	\N
1018397	http://bloomington.in.gov/farmersmarket	https://www.facebook.com/pages/Bloomington-Community-Farmers-Market/130635957114110	\N	\N	\N
1021576	http://www.lakecountyfarmersfinest.org	https://www.facebook.com/Tuesday-Farmers-Market-at-Library-Park-238157099542658/?ref=pages_you_manage	\N	\N	\N
1018283	http://www.tupelomainstreet.com	tupelo farmers depot	\N	\N	\N
1019349	http://www.tuscaloosarivermarket.com/	https://www.facebook.com/TuscaloosaFarmersMarket/	https://twitter.com/TuscRiverMarket	\N	https://www.instagram.com/tuscaloosarivermarket/
1012573	\N	Twin Bridges ALL YEAR Farmers Market	\N	\N	\N
1005493	http://www.twincityfarmersmarket.com	https://www.facebook.com/twincityfarmersmarket	@twincitymarket	\N	www.instagram.com/twincitymarket
1018968	\N	Union County Farm & Craft Market	\N	\N	\N
1019215	http://ucfarmersmarket.com	facebook.com/unioncountyfm	\N	\N	\N
1019925	\N	https://www.facebook.com/UnionCountyFarmersMarket/	\N	\N	https://www.instagram.com/unioncountytnfarmersmarket/
1010158	http://www.unionfarmersmarket.org/	\N	\N	\N	\N
1019540	http://www.unionsquaremain.org	https://www.facebook.com/unionsquaremarkets/	https://twitter.com/unionsquarefm	\N	https://www.instagram.com/unionsqmarket/
1018634	http://unionstreetfarmersmkt.com	Union Street Farmers Market	\N	\N	instagram @director_unionstreetfarmersmkt
1021305	http://www.farmtocitymarkets.com	https://www.facebook.com/FarmToCity	\N	\N	\N
1019764	http://www.getfreshmarkets.org	\N	\N	\N	\N
1021726	http://uptownfarmersmarket.org	https://www.facebook.com/chicagomarket	\N	\N	https://www.instagram.com/chicago_market/
1001886	http://uptowngreenville.com/play/umbrella-market/	https://www.facebook.com/uptownumbrellamarket/	https://twitter.com/Umbrella_Market	\N	https://www.instagram.com/umbrella_market/
1019105	http://www.uptowngreenwood.com/uptown-market	https://www.facebook.com/uptowngreenwoodmarket/	https://twitter.com/UptownGwdMarket?lang=en	\N	https://www.instagram.com/uptowngwdmarket/
1019448	https://www.marketwednesday.com/	https://www.facebook.com/MarketWednesday/	https://twitter.com/marketwednesday	\N	https://uptownwestervillefarmersmarket.blogspot.com/
1019342	http://www.urbanharvest.org	https://www.facebook.com/UrbanHarvestHouston/	\N	\N	\N
1018852	\N	urbanafarmersmarket	urbanaiafm	\N	\N
1019498	\N	https://www.facebook.com/UrbanaLibraryFarmersMarket/	\N	\N	\N
1005631	http://www.usda.gov/farmersmarket	\N	\N	\N	\N
1001999	http://www.CityofUtica.com	\N	\N	\N	\N
1018535	http://vancecounty.org	Vance County Regional Farmers Market	Vance County Regional Farmers Market	\N	\N
1019692	https://www.vanderbiltfarmersmarket.com/	https://www.facebook.com/vanderbiltfarmersmarket	\N	\N	https://www.instagram.com/vanderbiltmarket/
1012325	http://www.vashonfarmersmarket.org	www.facebook.com/vashonfarmersmarket	\N	\N	https://www.instagram.com/viga_vashonfresh/
1018597	http://www.vermillionfarmersmarket.org	https://www.facebook.com/groups/VAFarmersMarket/	https://twitter.com/VAFarmMkt	https://www.youtube.com/channel/UCoZ5JxA7x2CKzsVmdUxySFg	\N
1018598	http://www.vermillionfarmersmarket.org	https://www.facebook.com/groups/VAFarmersMarket/	https://twitter.com/VAFarmMkt	https://www.youtube.com/channel/UCoZ5JxA7x2CKzsVmdUxySFg	\N
1019078	https://vtfarmersmarket.org/	The Vermont Farmers Market	@VFMRutland	\N	\N
1019080	https://vtfarmersmarket.org/	The Vermont Farmers Market	@VFMRutland	\N	\N
1019182	\N	Nevada Vernon County Farmers Market	\N	\N	\N
1019952	http://vhpdfarmersmarket.org	\N	\N	\N	\N
1020048	https://www.projectgrows.org/food-access/north-augusta-farmers-market/	https://www.facebook.com/NAFarmMarket/?ref=bookmarks	\N	\N	\N
1012247	\N	Vicksburg Farmers' Market	\N	\N	\N
1012297	http://slavicvillage.org/villagemarket	https://www.facebook.com/VillageMarketSlavicVillage/	\N	\N	\N
1018155	\N	Constantine Farmers' Market	\N	\N	\N
1019645	http://www.lemont.il.us/FarmersMarket	http://www.facebook.com/VillageofLemont	\N	\N	\N
1019156	http://www.skokie.org/FarmersMarket.cfm	\N	\N	\N	https://www.instagram.com/skokiefarmersmarket/?hl=en
1006342	http://www.vincennes.org	Vincennes Historic Farmers Market	\N	\N	Facebook
1021297	https://ofallonstation.com/vine-street-market/	@vinestreetmarketofallon	\N	\N	Instagram:  @vinestreetmarketofallon
1018214	http://www.vineyardfarmersmarket.com	https://www.facebook.com/VineyardFarmersMarket/	\N	\N	\N
1021487	https://cfmatl.org/virginia-highland/	www.facebook.com/VirginiaHighlandFarmersMarket	\N	\N	\N
1021251	http://urbanoasisproject.org	https://www.facebook.com/urbanoasisproject	\N	\N	\N
1018504	\N	https://www.facebook.com/VoluntownFarmersArtisansMarket/	\N	\N	https://www.instagram.com/voluntown_farmers_market/
1001925	\N	https://www.facebook.com/VoorheesvilleFarmersMarket	\N	\N	\N
1010394	\N	www.facebook.com/wabashafm	\N	\N	\N
1019155	http://wacodowntownfarmersmarket.org	https://www.facebook.com/WacoDowntownFarmersMarket/	\N	\N	https://www.instagram.com/wacofarmersmkt/
1021537	\N	@wagonermarket	\N	\N	\N
1005268	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1005263	http://www.co.honolulu.hi.us/parks/programs/pom	\N	\N	\N	\N
1005269	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1005264	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1005266	http://www.honolulu.gov/parks/programs/pom	\N	\N	\N	\N
1019489	https://www.fairfaxcounty.gov/parks/farmersmarkets/wakefield	https://www.facebook.com/events/420079218795888/	\N	\N	@fairfaxfarmmarkets
1021340	http://www.sfmamarkets.com/visit-wallingford-farmers-market	https://www.facebook.com/WallingfordFarmersMarket	\N	\N	https://www.instagram.com/sfmamarkets/
1020197	http://www.cccfm.org/	https://www.facebook.com/WalnutCreekFarmersMarket	\N	\N	https://www.instagram.com/walnutcreekfarmersmarket/
1018219	\N	Wapello County  Farmers Market	\N	\N	\N
1021366	http://www.wheretexasbecametexas.org	https://www.facebook.com/events/2544980005810836	\N	\N	\N
1018552	http://www.waterfrontfarmersmarket.org	www.facebook.com/waterfrontfarmersmarketgigharbor/	@WaterfrontMktGH	\N	Instagram: @waterfrontfarmersmarket
1020021	\N	https://www.facebook.com/rotaryfarmarket	\N	\N	\N
1019394	\N	https://www.facebook.com/Watertown-CT-Farmers-Market-296552447624881/	\N	\N	\N
1018319	\N	https://www.facebook.com/watfordmarket/	\N	\N	\N
1001962	\N	https://www.facebook.com/WaukonFM	\N	\N	\N
1011229	http://www.waygreeninc.org	https://www.facebook.com/WayxGreen/	\N	\N	Instagram @WayxGreen
1019613	\N	https://www.facebook.com/groups/marketonmainstreet/	\N	\N	\N
1004499	https://www.russellsgc.com/farmersmarket	https://www.facebook.com/pages/Wayland-Summer-Farmers-Market/216269755070032	Wayland Wint/Sum Mkt	\N	Instagram: waylandfarmersmarket
1019016	\N	Wayne County Farmers Market	\N	\N	\N
1021559	\N	Wayne County Farmers Market	\N	\N	\N
1012485	http://coe.wayne.edu/centerforhealthandcommunityimpact/farmersmarket.php	https://facebook.com/WSUFarmersMarket/	@wsufarmersmkt	\N	Instagram: wsufarmersmarket
1020047	https://www.projectgrows.org	https://www.facebook.com/WboroFM/	\N	\N	\N
1019124	http://waynesbugpa.org	https://www.facebook.com/Waynesburg-Farmers-Market-236396956398280/	\N	\N	\N
1021709	http://www.eastprovidencelibrary.org	https://www.facebook.com/weaverlibraryfarmersmarket	\N	\N	\N
1021452	http://www.webbcityfarmersmarket.com/	https://www.facebook.com/WebbCityFarmersMarket	\N	https://www.youtube.com/channel/UCcFOS0YzbUDbb_dj5xQXcZg	http://webbcityfarmersmarket.blogspot.com/
1000384	http://www.webstersjoeobbiefarmersmarketinc.org	https://www.facebook.com/pages/Websters-Joe-Obbie-Farmers-Market-Inc/271407932889827	\N	\N	\N
1019864	https://indianafarmmarket.blogspot.com/	https://www.facebook.com/indianafarmmarket/	\N	\N	\N
1012212	\N	Weiser Farmers Market	\N	\N	\N
1019641	\N	https://www.facebook.com/Harrison-County-Iowa-Welcome-Center-198265796855610/	\N	\N	\N
1019114	http://www.wellfleetfarmersmarket.com/	https://www.facebook.com/WellfleetFarmersMarket/	\N	\N	https://www.instagram.com/wellfleetfarmersmarket/
1002890	http://www.wellingtonsquarefarmersmarket.com	https://www.facebook.com/wellingtonsquarefarmersmarket	https://twitter.com/wsfarmersmarket	\N	\N
1002280	\N	https://www.facebook.com/pages/WesMar-Farms	\N	\N	\N
1019067	http://leapforlocalfood.org/westend	https://www.facebook.com/WestEndCommunityMarket/	http://twitter.com/leap4local	\N	http://instagram.com/leapmarkets
1021569	\N	https://www.facebook.com/WestHavenFarmersMarket/	\N	\N	\N
1018650	http://www.wlafarmersmarket.com	https://www.facebook.com/WestLaFarmersMarket/	\N	\N	https://www.instagram.com/westlafarmersmarket/?hl=en
1011203	http://wlfarmersmarket.com/	www.facebook.com/westlafayettefarmersmarket	@WLFarmersMkt	\N	Instagram: wlfarmersmarket
1019424	http://WOFarmersMarket.com	https://www.facebook.com/WestOrangeFM	\N	\N	\N
1019657	\N	www.facebook.com/WestPlainsAreaFarmersMarket/	\N	\N	\N
1002177	\N	https://www.facebook.com/pages/WestPointTownofHighlandsFarmersMarket	\N	\N	\N
1016908	http://www.presencehealth.org/west-town-health-market	https://www.facebook.com/PresenceHealth/	\N	\N	\N
1019911	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=30	https://www.facebook.com/farmfreshri/	\N	\N	\N
1012204	http://www.westbrookvillage.org	\N	\N	\N	\N
1010319	http://westchasedistrictfarmersmarket.com	https://www.facebook.com/westchasedistrictfarmersmarket	\N	\N	\N
1019509	http://www.westcliffefarmersmarket.com	www.facebook.com/WestcliffeFarmersMarket	\N	\N	\N
1021367	http://www.westerlylandtrust.org	@westerlypawcatuckfarmersmarket	\N	\N	\N
1019364	\N	https://www.facebook.com/RainelleRupertQuinwood/	\N	\N	\N
1019444	http://www.UptownWestervilleInc.com	Westerville Saturday Farmers Market	\N	\N	Instagram: Westerville Farmers Market
1021274	http://www.westfieldfarmersmarket.org	Westfieldfarmersmarket	\N	\N	\N
1019797	http://www.westgatefarmersmarket.com	https://www.facebook.com/WestgateFarmersMarket/	\N	\N	https://www.instagram.com/westgatefarmersmarket/
1021246	http://www.westlandfarmersmarket.com/	https://www.facebook.com/WestlandFarmersMarket	\N	\N	https://www.instagram.com/westlandfarmersmarket
1002816	http://www.westminstermafarmersmarket.com/	https://www.facebook.com/pages/Westminster-Farmers-Market/133750303302808?ref=hl	\N	https://www.youtube.com/watch?v=vJdhQocOYCg	\N
1020070	\N	https://www.facebook.com/westportrdbaptistfarmersmarket	\N	\N	\N
1001661	http://www.westsidecommunitymarket.org	https://www.facebook.com/WestsideCommunityMarket	@WCM_Market	\N	Instagram: westside_community_market
1021217	http://www.westsidecommunitymarket.org	www.facebook.com/WestsideCommunityMarket	@WCM_Market	\N	Instagram: @westside_community_market
1004515	http://www.nwlansing.org	https://www.facebook.com/nwlansing	https://twitter.com/NWIlansing	\N	\N
1005280	http://www.santacruzfarmersmarket.org	www.facebook.com/santacruzfarmersmarket/	\N	\N	www.instagram.com/santacruzfarmersmkts/
1020020	http://www.farmermark.com/westwood	https://www.facebook.com/farmermarkwv	\N	\N	@farmermarkwv
1021258	https://www.weymouth.ma.us/farmers-market	https://www.facebook.com/weyfarmersmarketprograms	\N	\N	https://www.instagram.com/weymouthfarmersmarket/
1020010	\N	https://www.facebook.com/WHFarmersMarket/	\N	\N	\N
1021488	http://www.whitemountainsmarket.com	https://www.facebook.com/AZWhiteMountainsMarket	\N	\N	\N
1019955	\N	https://www.facebook.com/SaturdayFarmersMarket	\N	\N	\N
1019392	https://whitehavenkulliye.org/the-suq/	\N	\N	\N	\N
1020157	https://whitley.ca.uky.edu/FarmersMarket?fbclid=IwAR2QSgyjtKtnyLgqukENwHG2MaAa48SJY_RLeZqGPX-i9cqVHBrR2qmSo9c	WCfarmersmarket	\N	\N	Instagram: Whitleycountyfarmersmarket
1020156	https://whitley.ca.uky.edu/FarmersMarket?fbclid=IwAR2QSgyjtKtnyLgqukENwHG2MaAa48SJY_RLeZqGPX-i9cqVHBrR2qmSo9c	WCfarmersmarket	\N	\N	Instagram: whitleycountyfarmersmarket
1019221	http://whittierfarmersmarket.com	@whittierfarmersmarket	\N	\N	\N
1019069	http://WTGPA.org	WTGPA	\N	\N	\N
1018274	http://www.downtownnorthwilkesboro.com	https://www.facebook.com/wilkescountyfarmersmarket/	\N	\N	\N
1019652	http://wilkinsburgchamber.com	\N	\N	\N	\N
1021720	https://williamsburgfarmersmarket.com	https://www.facebook.com/WilliamsburgFM	https://twitter.com/WilliamsburgFM	\N	https://www.instagram.com/williamsburgfarmersmarket
1019337	http://www.healthyinthehills.com	https://www.facebook.com/WilliamsonFarmersMarket/	\N	\N	\N
1020187	https://uvfm.org/willow-glen-saturday	https://www.facebook.com/UrbanVillageOnFB	\N	\N	https://www.instagram.com/urbanvillage/
1019433	http://winchesterfarmersmarket.org	winchfarmmkt	winchfarmmkt	\N	instagram.com/winchesterfmkt
1019369	https://winchesterinfarmersmarket.blogspot.com/	WinchesterMainStreet	\N	\N	\N
1011274	http://www.tvwomeninag.com	@winchesterrdfarmersmarket	\N	\N	\N
1021231	\N	https://www.facebook.com/WindmillParkFarmersMarket	\N	\N	\N
1019229	http://winnsborofarmersmarket.com	Winnsboro Farmers' Market	\N	\N	\N
1019848	https://growoakridge.org/markets	https://www.facebook.com/GrowOakRidge/	https://twitter.com/ORWinterMarket	https://www.youtube.com/channel/UChY4t88TFXQ2HoE4JMk0ekQ	https://instagram.com/growoakridge
1019653	https://downtowngreenbay.com/explore/downtown-events/winter-farmers-market	facebook.com/downtowngreenbay	twitter.com/downtowngb	\N	\N
1019449	http://www.wyfftp.org/wintermarket	www.facebook.com/foodforthoughtmarkets	\N	\N	www.instagram.com/foodforthoughtmarkets
1019463	\N	https://www.facebook.com/WRDowntownFM/	\N	\N	\N
1008231	http://www.townofwise.net	https://www.facebook.com/WiseSpecialEvents	\N	\N	\N
1019845	https://www.ncagr.gov/markets/facilities/markets/asheville/	https://www.facebook.com/WncFarmersMarket/	\N	\N	Instagram  wncfarmersmarket
1009027	http://www.wolfeboroareafarmersmarket.com	https://www.facebook.com/wolfeboroareafarmersmarket	\N	\N	Instagram.com/wolfeboroareafarmersmarket
1019098	http://wolfforthfarmersmarket.com	Wolfforth Farmers Market	\N	\N	Instagram Wolfforth Farmers Market
1020138	\N	https://www.facebook.com/WoodfordCountyFarmersMarket/	\N	\N	\N
1020168	\N	https://www.facebook.com/WoodfordCountyFarmersMarket/	\N	\N	\N
1019038	https://www.woodstockfarmfestival.org/	https://www.facebook.com/woodstockfarmfestival/	\N	\N	https://www.instagram.com/woodstockfarmfest/
1005140	http://www.visitwoodstockga.com	https://www.facebook.com/dtwoodstock	www.twitter.com/dtwoodstock	www.youtube.com/dtwoodstock	https://www.pinterest.com/downtownwoodstock
1021317	http://www.woodstockfarmersmarket.org	https://www.facebook.com/woodstockfarmersmarket	@woodstockfarmmk	\N	\N
1021386	http://www.woodstockfarmersmarket.org	https://www.facebook.com/woodstockfarmersmarket	@woodstockfarmmk	\N	\N
1021385	http://www.woodstockfarmersmarket.org	https://www.facebook.com/woodstockfarmersmarket	@woodstockfarmmk	\N	\N
1011337	http://www.woodwardfarmersmarket.com	Woodward Farmers Market Association	@wwfarmers	\N	\N
1021328	https://bloomingtonwinterfarmersmarket.com/bwfm-in-the-summer/about/	https://www.facebook.com/wooleryfarmersmarket/	\N	\N	https://www.instagram.com/wooleryfarmersmarket/
1019912	https://guide.farmfreshri.org/food/farmersmarkets_details.php?market=23	https://www.facebook.com/farmfreshri/	\N	\N	\N
1007309	http://www.wrightstownfarmersmarket.org	https://www.facebook.com/WrightstownFarmersMarket	https://twitter.com/WRmarket	\N	https://instagram.com/wrightstownmarket/
1017915	http://www.wythevillefarmersmarket.com	Wytheville Farmers Market	\N	\N	\N
1019708	http://www.yardleyfarmersmarket.com	https://www.facebook.com/YardleyFarmersMarket/	https://twitter.com/yardleyfarmmart	https://www.youtube.com/watch?v=rnt3Tcv_49A	https://www.instagram.com/yardleyfarmersmarket/
1018508	http://yardleyfarmersmarket.com/	https://www.facebook.com/YardleyFarmersMarket/	https://twitter.com/yardleyfarmmart	https://www.youtube.com/channel/UCPyEWf4FdNUFUWiVQfiJdIA	https://www.instagram.com/yardleyfarmersmarket/
1007259	https://www.facebook.com/PennYan.Farmers.Market	https://www.facebook.com/PennYan.Farmers.Market	\N	\N	\N
1002366	http://www.ygfarmersmarket.com	https://www.facebook.com/YGFarmersMarket	https://twitter.com/ygfarmersmarket	https://www.youtube.com/channel/UCvxcGswgI6TnAvlu3nSqB1g?	https://www.instagram.com/ygfarmersmarket/
1019508	\N	https://www.facebook.com/yorktownfarmersmarketplace	\N	\N	\N
1019247	http://www.YourNeighborhoodFarmersMarket.com	https://www.facebook.com/yourneighborhoodfarmersmarket/	\N	\N	\N
1019245	http://www.YourNeighborhoodFarmersMarket.com	https://www.facebook.com/yourneighborhoodfarmersmarket/	\N	\N	\N
1019246	http://www.YourNeighborhoodFarmersMarket.com	https://www.facebook.com/yourneighborhoodfarmersmarket/	\N	\N	\N
1019250	http://www.YourNeighborhoodFarmersMarket.com	https://www.facebook.com/yourneighborhoodfarmersmarket/	\N	\N	\N
1019242	http://www.YourNeighborhoodFarmersMarket.com	https://www.facebook.com/yourneighborhoodfarmersmarket/	\N	\N	\N
1019244	http://www.YourNeighborhoodFarmersMarket.com	https://www.facebook.com/yourneighborhoodfarmersmarket/	\N	\N	\N
1019327	http://growinghope.net/farmers-markets/ypsilanti/	https://www.facebook.com/YpsilantiFarmersMarkets/	\N	\N	https://www.instagram.com/growingthehope/
1021545	\N	https://www.facebook.com/29palmsfarmersmarket	\N	\N	IG @yucaipa_farmers_market
1019863	https://www.townofzebulon.org/departments/parks-and-recreation/farm-fresh-market	https://www.facebook.com/zebulonfarmfreshmarket/	\N	\N	https://www.instagram.com/zebulonfarmfreshmarket/
1019792	\N	https://www.facebook.com/ZelieHarmonyFarmersMarket/	\N	\N	\N
\.


COPY public.market_payments (fmid, payment_method_id) FROM stdin;
1018261	1
1018261	2
1018261	4
1009994	1
1009994	4
1000709	1
1000709	2
1000709	3
1000709	4
1000709	5
1019956	1
1009959	1
1009959	3
1009959	5
1004950	1
1019938	1
1019938	2
1019938	3
1019938	4
1019938	5
1021607	1
1021607	5
1018965	1
1018965	5
1009004	1
1009004	2
1009004	4
1009004	5
1019473	1
1019473	2
1019473	4
1019473	5
1010487	1
1010487	4
1010487	5
1019695	1
1021442	1
1021442	5
1019676	1
1019676	2
1019676	4
1019676	5
1019351	1
1019351	2
1019351	4
1019351	5
1019847	1
1019847	2
1019847	4
1008961	1
1008961	5
1019203	1
1019203	2
1019203	3
1019203	4
1019203	5
1012233	1
1012233	2
1012233	3
1012233	4
1005258	1
1005258	4
1005258	5
1008054	1
1008612	1
1008612	2
1008612	4
1008612	5
1018304	1
1021689	1
1021689	2
1021689	4
1021689	5
1019371	1
1019371	2
1019371	3
1019371	4
1019371	5
1021578	1
1000519	1
1000519	2
1019113	1
1019113	4
1021464	1
1021464	2
1021464	4
1021464	5
1021597	1
1021597	2
1021597	4
1019831	1
1019831	4
1019831	5
1019832	1
1019832	4
1019832	5
1012389	1
1012389	2
1012389	4
1012389	5
1020150	1
1020150	2
1020150	4
1020150	5
1021309	1
1021309	2
1021309	4
1011171	1
1011171	2
1011171	3
1011171	4
1011171	5
1003563	1
1019438	1
1019438	5
1012157	1
1012157	5
1005944	1
1005944	2
1005944	4
1005944	5
1019647	1
1019647	2
1019647	3
1019647	4
1019647	5
1020084	1
1020084	4
1003516	1
1003516	2
1003516	3
1003516	4
1003516	5
1020060	1
1020060	2
1020060	4
1020060	5
1019484	1
1019096	1
1019096	5
1019350	1
1000431	1
1000431	2
1000431	3
1000431	5
1021359	1
1021359	3
1021359	5
1021733	1
1021733	2
1021733	3
1021733	4
1021733	5
1021732	1
1021732	2
1021732	3
1021732	4
1021732	5
1019662	1
1019904	1
1019904	2
1019904	3
1019904	4
1019904	5
1019222	1
1019495	1
1019495	5
1020068	1
1020068	5
1009810	1
1009810	2
1009810	3
1009810	4
1009810	5
1021627	1
1021627	2
1021627	3
1021627	5
1001245	1
1001245	2
1001245	3
1001245	5
1002984	1
1002984	4
1002984	5
1005086	1
1005086	2
1005086	4
1005086	5
1018033	1
1018033	5
1018032	1
1018032	5
1021450	1
1021450	5
1018330	1
1018330	3
1018330	4
1021225	1
1021225	2
1021225	3
1021225	4
1021225	5
1019789	1
1019789	2
1019789	4
1019789	5
1021329	1
1000559	1
1021534	1
1021534	2
1021534	5
1019396	1
1019396	2
1019396	5
1019126	1
1019126	2
1019126	3
1019126	4
1019126	5
1021528	1
1021528	5
1021530	1
1021530	5
1021529	1
1021529	5
1019044	1
1019044	2
1019044	3
1019044	4
1019076	1
1021338	1
1021338	2
1021338	3
1021338	4
1021338	5
1021521	1
1012081	1
1012081	2
1012081	3
1012081	5
1021582	1
1021582	2
1001604	1
1001604	5
1020029	1
1003335	1
1003335	5
1019871	1
1000436	1
1000436	5
1021540	1
1021540	5
1021265	1
1021443	1
1021443	2
1021443	4
1021443	5
1019617	1
1019874	1
1020102	1
1020102	2
1018735	1
1019875	1
1020097	1
1020097	3
1020097	4
1021630	1
1021630	2
1021630	3
1021630	4
1021630	5
1019853	1
1019400	1
1010607	1
1010607	2
1010607	3
1010607	4
1011902	1
1011902	4
1021363	1
1008140	1
1008140	2
1008140	4
1008140	5
1002064	1
1002064	2
1002064	3
1002064	4
1002064	5
1011363	1
1001316	1
1001316	2
1001533	1
1001533	2
1001533	5
1018644	1
1021403	1
1021403	2
1021403	4
1021403	5
1005183	1
1005183	4
1005183	5
1019005	1
1021628	1
1021628	5
1019168	1
1019168	4
1019168	5
1019169	1
1019169	4
1019169	5
1019967	1
1021322	1
1010406	1
1010406	2
1010406	3
1012494	1
1012494	2
1012494	4
1012494	5
1020196	1
1020196	2
1020196	4
1020196	5
1019765	1
1019765	2
1019765	4
1019765	5
1005949	1
1005949	2
1005949	3
1005949	4
1005949	5
1019338	1
1019338	5
1019339	1
1019339	5
1019591	1
1019591	2
1019591	4
1019591	5
1021508	1
1011037	1
1011037	5
1012163	1
1012163	5
1011829	1
1011829	2
1011829	3
1011829	4
1011829	5
1018396	1
1018396	2
1018396	4
1018396	5
1018563	1
1018563	5
1019932	1
1020098	1
1020098	2
1020098	4
1019372	1
1019372	4
1019440	1
1018092	1
1018092	2
1018092	4
1018313	1
1018313	5
1018316	1
1018316	5
1020101	1
1020101	2
1006833	1
1006833	2
1006833	3
1006833	4
1006833	5
1019318	1
1019693	1
1018394	1
1001526	1
1019165	1
1019165	2
1020096	1
1020096	2
1020096	4
1020099	1
1020099	2
1020099	4
1019205	1
1019205	2
1019205	4
1019205	5
1021248	1
1021248	5
1018227	1
1018227	2
1018227	3
1018227	4
1018227	5
1002407	1
1002407	2
1002407	4
1002407	5
1011075	1
1011075	5
1020113	1
1020113	4
1018556	1
1018556	2
1018556	4
1018556	5
1019146	1
1018756	1
1018756	5
1005483	1
1005483	2
1005483	3
1005483	4
1005483	5
1019905	1
1019905	2
1019905	3
1019905	4
1019905	5
1019257	1
1019257	5
1019984	1
1019984	3
1019984	4
1019984	5
1019794	1
1019527	1
1019527	2
1019527	3
1019527	4
1019527	5
1021210	1
1021210	2
1021210	4
1021210	5
1021736	1
1021736	5
1018891	1
1018891	4
1018891	5
1021515	1
1021262	1
1021262	2
1021262	4
1021262	5
1019906	1
1019906	2
1019906	3
1019906	4
1019906	5
1019727	1
1019727	2
1019727	4
1019727	5
1017968	1
1017968	2
1017968	4
1008607	1
1008607	5
1021311	1
1021311	2
1021311	4
1019218	1
1008953	1
1008953	2
1008953	3
1008953	5
1000843	1
1000843	2
1000843	4
1000843	5
1019492	1
1021524	1
1019965	1
1019965	5
1021728	1
1021728	3
1021728	4
1021728	5
1002567	1
1002567	4
1001362	1
1001362	2
1001362	4
1001362	5
1021238	1
1021614	1
1021614	5
1020089	1
1020089	2
1020089	4
1004927	1
1019922	1
1019922	2
1019922	3
1019922	4
1019922	5
1019978	1
1019978	2
1019978	5
1018263	1
1018263	5
1019980	1
1019980	2
1019980	3
1019980	4
1020188	1
1020188	2
1020188	5
1018459	1
1018459	2
1019997	1
1019997	2
1019997	3
1019997	4
1020160	1
1020160	2
1020160	3
1020160	4
1020160	5
1020183	1
1020183	2
1002674	1
1002674	4
1002674	5
1021575	1
1021575	2
1021575	4
1021575	5
1020117	1
1020117	2
1020117	4
1020118	1
1020118	2
1020118	4
1020119	1
1020119	2
1020119	4
1020184	1
1020184	2
1020184	5
1009034	1
1009034	3
1009034	4
1019810	1
1019810	2
1019810	4
1019810	5
1021202	1
1021202	2
1021202	4
1021202	5
1012038	1
1012038	2
1012038	5
1019772	1
1019772	2
1019772	4
1019772	5
1021435	1
1021435	2
1021435	4
1021435	5
1021294	1
1021294	5
1021655	1
1011930	1
1011930	2
1011930	4
1011930	5
1018359	1
1008450	1
1008450	2
1006651	1
1006651	2
1006651	4
1006651	5
1019417	1
1019417	4
1021269	1
1021269	2
1021269	4
1021269	5
1008322	1
1021213	1
1021213	2
1021213	3
1021213	4
1021213	5
1020071	1
1020071	2
1020071	4
1020074	1
1020074	2
1020074	4
1012093	1
1021740	1
1008276	1
1008276	2
1008276	4
1008276	5
1019159	1
1021242	1
1012484	1
1012484	2
1012484	4
1012484	5
1019842	1
1021362	1
1018734	1
1021226	1
1021226	2
1021226	3
1021226	4
1021226	5
1019907	1
1019907	2
1019907	3
1019907	4
1019907	5
1019618	1
1019618	2
1019618	4
1019618	5
1020142	1
1020142	2
1020142	3
1020142	5
1020141	1
1020141	2
1020141	3
1020141	4
1020141	5
1020058	1
1020058	2
1020058	3
1020058	4
1020058	5
1020057	1
1020057	2
1020057	3
1020057	4
1020057	5
1020056	1
1020056	2
1020056	3
1020056	4
1020056	5
1019225	1
1021267	1
1021267	3
1021267	5
1021564	1
1021564	5
1018886	1
1018886	2
1018886	4
1018886	5
1017995	1
1021741	1
1021741	2
1021741	3
1021741	4
1011689	1
1005834	1
1005834	2
1005834	3
1005834	4
1005834	5
1019881	1
1004754	1
1004754	3
1004754	5
1008606	1
1021310	1
1021310	2
1021310	4
1020128	1
1020128	2
1020128	3
1020128	4
1020128	5
1020129	1
1020129	2
1020129	3
1020129	4
1020129	5
1020127	1
1020127	2
1020127	3
1020127	4
1020127	5
1001763	1
1001763	4
1001763	5
1019104	1
1019104	5
1008409	1
1008409	2
1021237	1
1021237	5
1004360	1
1021653	1
1019141	1
1019141	5
1005250	1
1005250	4
1005250	5
1021199	1
1021199	2
1021199	3
1021199	4
1021199	5
1019717	1
1019717	4
1004255	1
1004255	5
1017956	1
1017956	3
1017956	4
1017956	5
1017930	1
1017930	2
1017930	4
1017930	5
1000303	1
1021433	1
1021420	1
1021420	2
1021420	3
1021420	4
1021420	5
1006460	1
1006460	4
1005940	1
1005940	2
1005940	3
1005940	4
1005940	5
1005941	1
1005941	2
1005941	3
1005941	4
1005941	5
1019206	1
1019206	2
1019206	3
1019206	4
1019206	5
1005943	1
1005943	2
1005943	3
1005943	4
1005943	5
1002106	1
1002106	2
1002106	3
1002106	5
1019061	1
1019061	5
1000579	1
1000579	3
1000579	4
1019840	1
1019840	2
1019840	4
1019840	5
1021441	1
1021441	4
1019110	1
1019110	5
1019741	1
1019704	1
1019704	5
1018381	1
1018381	2
1018381	4
1019823	1
1019823	5
1019763	1
1019763	2
1019763	4
1019763	5
1000549	1
1000549	4
1000549	5
1002808	1
1019474	1
1019474	2
1019474	4
1018969	1
1018969	2
1018969	5
1019821	1
1019821	2
1019821	4
1019821	5
1020135	1
1020135	2
1020135	4
1020135	5
1020137	1
1020137	2
1020137	4
1020137	5
1021232	1
1021232	2
1021232	4
1021232	5
1001290	1
1001290	2
1001290	3
1001290	5
1000210	1
1000210	5
1009656	1
1009656	5
1018196	1
1018196	2
1019790	1
1019790	4
1019790	5
1010758	1
1019483	1
1019483	2
1019483	3
1019483	4
1019199	1
1019199	4
1019199	5
1020124	1
1020124	2
1020124	3
1020124	4
1020124	5
1011003	1
1011003	5
1021541	1
1021541	2
1021541	5
1019592	1
1019042	1
1019042	4
1012030	1
1012030	2
1012030	3
1012030	4
1012030	5
1021396	1
1021396	2
1006766	1
1006766	2
1006766	3
1006766	4
1006766	5
1018190	1
1018190	2
1018190	4
1021639	1
1021639	2
1021639	4
1021639	5
1012666	1
1008959	1
1008959	5
1021691	1
1021691	2
1021691	4
1021691	5
1018629	1
1018629	2
1018629	3
1018629	4
1018629	5
1010975	1
1010975	4
1010975	5
1004382	1
1004382	2
1004382	3
1004382	4
1004382	5
1018221	1
1018221	5
1000368	1
1000368	3
1000368	4
1019530	1
1019530	2
1019530	4
1019530	5
1019529	1
1019529	2
1019529	4
1019529	5
1019531	1
1019531	2
1019531	4
1019531	5
1019258	1
1019258	5
1019325	1
1019325	2
1019296	1
1019296	3
1019296	5
1012552	1
1009993	1
1009993	4
1019130	1
1021330	1
1021330	4
1021330	5
1021331	1
1021331	4
1021331	5
1021227	1
1021227	2
1021227	3
1021227	4
1021227	5
1019260	1
1019260	2
1019260	4
1019260	5
1019261	1
1019261	2
1019261	4
1019261	5
1019262	1
1019262	2
1019262	4
1019262	5
1002470	1
1002470	2
1002470	3
1002470	4
1002470	5
1021391	1
1012365	1
1012365	2
1012365	3
1012365	4
1012365	5
1001869	1
1001869	2
1001869	3
1021346	1
1021346	2
1021346	3
1021346	4
1021346	5
1019701	1
1019701	2
1019701	3
1019701	4
1019702	1
1019702	2
1019702	3
1019702	4
1020109	1
1020109	2
1020109	4
1021387	1
1021387	2
1021387	4
1021387	5
1019539	1
1019539	4
1021408	1
1004516	1
1004516	2
1004516	4
1004516	5
1019163	1
1019163	2
1019163	5
1012505	1
1012505	2
1012505	3
1018157	1
1018157	2
1018157	3
1018157	4
1018157	5
1019880	1
1019880	2
1019880	3
1019880	4
1012254	1
1019100	1
1021457	1
1018945	1
1018945	3
1018945	4
1018945	5
1019970	1
1019970	5
1021570	1
1021570	2
1021570	4
1021570	5
1012296	1
1012296	3
1012296	4
1012296	5
1011103	1
1011103	5
1002536	1
1002536	2
1020061	1
1018416	1
1018416	4
1019308	1
1019308	3
1019308	4
1019308	5
1020191	1
1021591	1
1021591	2
1021591	4
1021591	5
1021649	1
1021649	2
1021649	5
1007255	1
1007255	2
1007255	4
1007255	5
1003628	1
1003628	4
1003628	5
1021318	1
1021318	2
1021318	4
1021261	1
1021261	2
1021261	4
1018958	1
1018958	4
1019458	1
1019458	2
1019458	4
1019458	5
1018816	1
1018816	5
1019742	1
1019742	2
1019742	4
1019742	5
1019439	1
1019439	5
1019964	1
1019964	5
1018706	1
1018706	2
1018706	3
1018706	5
1020111	1
1020111	5
1003046	1
1009829	1
1009829	5
1009894	1
1009894	2
1009894	3
1009894	4
1009894	5
1021296	1
1021296	2
1021296	3
1021296	4
1021296	5
1010954	1
1010954	2
1010954	3
1010954	4
1010954	5
1016793	1
1016793	2
1016793	3
1016793	4
1016793	5
1010969	1
1010969	2
1010969	3
1010969	4
1010969	5
1010972	1
1010972	2
1010972	3
1010972	4
1010972	5
1010958	1
1010958	2
1010958	3
1010958	4
1010958	5
1016792	1
1016792	2
1016792	3
1016792	4
1016792	5
1009895	1
1009895	2
1009895	3
1009895	4
1009895	5
1010982	1
1010982	2
1010982	3
1010982	4
1010982	5
1010960	1
1010960	2
1010960	3
1010960	4
1010960	5
1016867	1
1016867	2
1016867	4
1019667	1
1009043	1
1009043	5
1003643	1
1003643	2
1003643	4
1003643	5
1020064	1
1020064	2
1020064	4
1020064	5
1020000	1
1020000	2
1020000	4
1020000	5
1020001	1
1020001	5
1019370	1
1019944	1
1019944	2
1019944	4
1019944	5
1021401	1
1021401	2
1021401	5
1000841	1
1019401	1
1019401	5
1021631	1
1021631	2
1021631	4
1021631	5
1008853	1
1008853	2
1008853	3
1008853	4
1008853	5
1002400	1
1019032	1
1019856	1
1019216	1
1012243	1
1012243	2
1012243	5
1012256	1
1012256	2
1012256	5
1019654	1
1019654	2
1019654	4
1019654	5
1019341	1
1019341	2
1019341	4
1019341	5
1019083	1
1019083	5
1009757	1
1018930	1
1018930	2
1018930	4
1018930	5
1003977	1
1003977	2
1003977	4
1003977	5
1018621	1
1018621	2
1018621	3
1018621	4
1018621	5
1019721	1
1021716	1
1021716	2
1021716	4
1021716	5
1021411	1
1005281	1
1005281	2
1005281	3
1005281	4
1005281	5
1019525	1
1019525	2
1019525	4
1019525	5
1019729	1
1019729	5
1004676	1
1004676	2
1004676	3
1004676	4
1004676	5
1005358	1
1005358	2
1005358	3
1005358	4
1005358	5
1005197	1
1005197	2
1005197	3
1005197	4
1005197	5
1019994	1
1018953	1
1018953	5
1000312	1
1000312	2
1000312	4
1000312	5
1009830	1
1009830	5
1012345	1
1012345	2
1012345	4
1012345	5
1019082	1
1019082	2
1019082	5
1019870	1
1021275	1
1018159	1
1018159	4
1018159	5
1021303	1
1021303	2
1021303	4
1021303	5
1021414	1
1021414	2
1021414	4
1021414	5
1011673	1
1011673	5
1019079	1
1019079	2
1020133	1
1020133	2
1020133	3
1020133	4
1020133	5
1011113	1
1011113	5
1019510	1
1019510	2
1019510	3
1019510	4
1019510	5
1020172	1
1020172	2
1020172	3
1020172	4
1020172	5
1012717	1
1012717	3
1012717	4
1012717	5
1019094	1
1019094	2
1019094	4
1019094	5
1021300	1
1021300	2
1021300	4
1021300	5
1019125	1
1021698	1
1021698	2
1021698	4
1021698	5
1009867	1
1009867	2
1009867	3
1009867	4
1009867	5
1019624	1
1019624	2
1019624	5
1021710	1
1021710	3
1021710	4
1021228	1
1021228	2
1021228	3
1021228	4
1021228	5
1012783	1
1012783	2
1012783	4
1012783	5
1012160	1
1012160	2
1012160	4
1019118	1
1021652	1
1021574	1
1021574	2
1021574	4
1019936	1
1019936	2
1019936	4
1019936	5
1012634	1
1012634	2
1012634	3
1012634	4
1019921	1
1021587	1
1021587	2
1021587	4
1018900	1
1018900	2
1018900	4
1018900	5
1018898	1
1018898	2
1018898	4
1018898	5
1020112	1
1020112	2
1020112	4
1018717	1
1018717	2
1018717	3
1018717	5
1021207	1
1021207	2
1021207	5
1002657	1
1002657	3
1002657	5
1002769	1
1002769	2
1002769	4
1019398	1
1019398	5
1012045	1
1012045	2
1012045	4
1012045	5
1018940	1
1018940	2
1018940	4
1019684	1
1018765	1
1018765	2
1018765	5
1019687	1
1006678	1
1006678	2
1006678	4
1006678	5
1003568	1
1003568	2
1003568	4
1020053	1
1020053	2
1020053	5
1019954	1
1019954	2
1019954	3
1019954	4
1019954	5
1010195	1
1010195	2
1010195	4
1010195	5
1005267	1
1005267	4
1005267	5
1007798	1
1007798	5
1019081	1
1019081	2
1018622	1
1018622	2
1018622	3
1018622	4
1018622	5
1019186	1
1019049	1
1019049	4
1019049	5
1018562	1
1018562	2
1018562	3
1018562	4
1018562	5
1019457	1
1019457	4
1019457	5
1010889	1
1019841	1
1019841	5
1021514	1
1021514	4
1021514	5
1019499	1
1019499	2
1019499	3
1019499	4
1019499	5
1019523	1
1019523	2
1019523	4
1019523	5
1018937	1
1019436	1
1019436	2
1019436	3
1019436	4
1021666	1
1021666	2
1021666	4
1021734	1
1018131	1
1020104	1
1020104	2
1020104	4
1021388	1
1021388	2
1021388	5
1019705	1
1005069	1
1005069	2
1005069	4
1005069	5
1021404	1
1021404	3
1021404	4
1021620	1
1021620	2
1021620	3
1021620	4
1005159	1
1005159	5
1021538	1
1021538	5
1021581	1
1019993	1
1019993	2
1020079	1
1020079	3
1020079	4
1020080	1
1020080	3
1020080	4
1021595	1
1019862	1
1019862	2
1019862	4
1019862	5
1018427	1
1016870	1
1016870	4
1016870	5
1021460	1
1021460	4
1021460	5
1019800	1
1019800	3
1019800	4
1019800	5
1012627	1
1002721	1
1002721	2
1002721	3
1002721	4
1002721	5
1018973	1
1018973	5
1021676	1
1021665	1
1021665	2
1021665	4
1021665	5
1020193	1
1020193	2
1020193	4
1020193	5
1012308	1
1012308	2
1012308	3
1012308	4
1012308	5
1019771	1
1019771	5
1018193	1
1020008	1
1020008	4
1020008	5
1019677	1
1004377	1
1004377	3
1019914	1
1019914	2
1019914	3
1019914	4
1019897	1
1019897	2
1019897	4
1020091	1
1020091	2
1020091	3
1020091	4
1020065	1
1020065	2
1021453	1
1021453	2
1021453	4
1021453	5
1019123	1
1019123	5
1000958	1
1000958	5
1021638	1
1021638	2
1021638	4
1021638	5
1021504	1
1021504	2
1021504	5
1002803	1
1018989	1
1018989	2
1018989	3
1018989	4
1018989	5
1021680	1
1018505	1
1018505	2
1018505	3
1018505	4
1018505	5
1019101	1
1002880	1
1002880	2
1002880	4
1002880	5
1019298	1
1019298	2
1019298	4
1019298	5
1019147	1
1019147	5
1021654	1
1021654	2
1021654	4
1021654	5
1020092	1
1020092	2
1020007	1
1020007	2
1020007	5
1021565	1
1012429	1
1012429	5
1018415	1
1021353	1
1021353	2
1021353	3
1021353	4
1021353	5
1019600	1
1019404	1
1019404	5
1012466	1
1012466	2
1012466	4
1012466	5
1018671	1
1018671	2
1018671	4
1018671	5
1011730	1
1021552	1
1019762	1
1019285	1
1019998	1
1018121	1
1018121	3
1019949	1
1019949	5
1006661	1
1006661	2
1006661	4
1006661	5
1021590	1
1021590	2
1021590	4
1021590	5
1021444	1
1021444	4
1021730	1
1021730	4
1019630	1
1011814	1
1011814	2
1011814	3
1011814	4
1011814	5
1018970	1
1018970	4
1018831	1
1019728	1
1019728	2
1019728	3
1019728	4
1019728	5
1021662	1
1021662	4
1021662	5
1020095	1
1020095	4
1019587	1
1021677	1
1021677	2
1021416	1
1012033	1
1012033	2
1012033	3
1012033	4
1012033	5
1019602	1
1019602	2
1019602	3
1019602	5
1019603	1
1019603	2
1019603	3
1019603	5
1019604	1
1019604	2
1019604	3
1019604	5
1019605	1
1019605	2
1019605	3
1019605	5
1019606	1
1019606	2
1019606	3
1019606	5
1019607	1
1019607	2
1019607	3
1019607	5
1019608	1
1019608	2
1019608	3
1019608	5
1021461	1
1021284	1
1021284	5
1008573	1
1008573	5
1002767	1
1002767	2
1002767	4
1005588	1
1005588	4
1019710	1
1019710	2
1019710	3
1019710	4
1019710	5
1019414	1
1019414	2
1019414	4
1019414	5
1021364	1
1021364	2
1021364	3
1021364	4
1021364	5
1020050	1
1020050	4
1020050	5
1019833	1
1021350	1
1021350	5
1021308	1
1021308	2
1021308	4
1012253	1
1012253	2
1012253	3
1012253	4
1021392	1
1005937	1
1005937	5
1017947	1
1017947	5
1021484	1
1021484	5
1019989	1
1019989	2
1019989	4
1019989	5
1009808	1
1009808	2
1009808	4
1009808	5
1021456	1
1021456	5
1006059	1
1006059	3
1006059	5
1021289	1
1021289	5
1021319	1
1021319	2
1021319	4
1021319	5
1021320	1
1021320	2
1021320	4
1021320	5
1004849	1
1006997	1
1006997	5
1019805	1
1019805	3
1019805	4
1019805	5
1019132	1
1018472	1
1018472	4
1021382	1
1021382	2
1021382	4
1021382	5
1021536	1
1019088	1
1019088	2
1019088	5
1021247	1
1021247	5
1018619	1
1018619	2
1018619	3
1018619	4
1018619	5
1005265	1
1005265	4
1005265	5
1001804	1
1001804	4
1001804	5
1021584	1
1021584	2
1021584	5
1019673	1
1018774	1
1019738	1
1019738	2
1019738	3
1019738	5
1019209	1
1001597	1
1001597	2
1001597	4
1001597	5
1021583	1
1021583	4
1021583	5
1006425	1
1019065	1
1019065	4
1019148	1
1019533	1
1019533	2
1019533	4
1019533	5
1019770	1
1019770	3
1019770	4
1019770	5
1019154	1
1019154	2
1019154	3
1018380	1
1021696	1
1021555	1
1021555	4
1020122	1
1020122	2
1020122	4
1020125	1
1020125	2
1020125	4
1020107	1
1020107	2
1020107	4
1011782	1
1019383	1
1019383	2
1019383	3
1019383	4
1019383	5
1019373	1
1019373	2
1019373	3
1019373	4
1019373	5
1019374	1
1019374	2
1019374	3
1019374	4
1019374	5
1019366	1
1019366	2
1019366	3
1019366	4
1019366	5
1019375	1
1019375	2
1019375	3
1019375	4
1019375	5
1019380	1
1019380	2
1019380	3
1019380	4
1019380	5
1019381	1
1019381	2
1019381	3
1019381	4
1019381	5
1019377	1
1019377	2
1019377	3
1019377	4
1019377	5
1019378	1
1019378	2
1019378	3
1019378	4
1019378	5
1019376	1
1019376	2
1019376	3
1019376	4
1019376	5
1019382	1
1019382	2
1019382	3
1019382	4
1019382	5
1002339	1
1002339	2
1002339	3
1002339	4
1002339	5
1002335	1
1002335	2
1002335	3
1002335	4
1002335	5
1005332	1
1005332	2
1005332	3
1005332	4
1005332	5
1019379	1
1019379	2
1019379	3
1019379	4
1019379	5
1002345	1
1002345	2
1002345	3
1002345	4
1002345	5
1009660	1
1009660	4
1009660	5
1018282	1
1018282	2
1018282	4
1018282	5
1020044	1
1020044	2
1020044	4
1020044	5
1021431	1
1021431	2
1021431	4
1021431	5
1021671	1
1021671	5
1021672	1
1021672	5
1021211	1
1019786	1
1019757	1
1019192	1
1019895	1
1021286	1
1019802	1
1019802	5
1021282	1
1020174	1
1003684	1
1003684	2
1003684	4
1003684	5
1019234	1
1006285	1
1006285	2
1006285	4
1006285	5
1019486	1
1019486	5
1021355	1
1021355	4
1021355	5
1020026	1
1019224	1
1019224	3
1019224	4
1019224	5
1019220	1
1019220	5
1012260	1
1012260	2
1012260	3
1012260	4
1012260	5
1006831	1
1006831	4
1006831	5
1021327	1
1021327	5
1018951	1
1018951	4
1019688	1
1019959	1
1019959	2
1019959	4
1019959	5
1019962	1
1019962	2
1019962	4
1019962	5
1021249	1
1021249	2
1021249	4
1021249	5
1019669	1
1019669	5
1008020	1
1008020	2
1008020	3
1008020	4
1008020	5
1005076	1
1019330	1
1019330	3
1019330	5
1021208	1
1021208	2
1021208	3
1010937	1
1010937	2
1010937	4
1010937	5
1021533	1
1021533	2
1021533	4
1021533	5
1021509	1
1021511	1
1021511	2
1021511	4
1021511	5
1021512	1
1021512	2
1021512	4
1021512	5
1021516	1
1021516	3
1021516	4
1021516	5
1011761	1
1011761	5
1018972	1
1018972	2
1018972	4
1008980	1
1021547	1
1021547	2
1019302	1
1018853	1
1018853	2
1018853	4
1018853	5
1021229	1
1021229	2
1021229	3
1021229	4
1021229	5
1018458	1
1018458	2
1018458	4
1018458	5
1007267	1
1007267	2
1007267	3
1007267	4
1007267	5
1009663	1
1012076	1
1012076	2
1012076	3
1012076	4
1012076	5
1019819	1
1019819	2
1021705	1
1021705	4
1021705	5
1021711	1
1021711	2
1021711	4
1012041	1
1012041	2
1012041	3
1012041	4
1012041	5
1020100	1
1020100	2
1020100	4
1020100	5
1008366	1
1008366	2
1008366	4
1008366	5
1019313	1
1018200	1
1018200	2
1018200	3
1018200	4
1018200	5
1005674	1
1005674	2
1005674	3
1005674	4
1005674	5
1018152	1
1019990	1
1021610	1
1021610	5
1021612	1
1021612	3
1021612	4
1021612	5
1019056	1
1010598	1
1010598	2
1010598	4
1010598	5
1021268	1
1021268	2
1021268	4
1019586	1
1021635	1
1011325	1
1011325	4
1011325	5
1021703	1
1012621	1
1012621	2
1012621	4
1006417	1
1006417	5
1005080	1
1005080	2
1005080	4
1005080	5
1020136	1
1019011	1
1019011	2
1019011	4
1019236	1
1019236	5
1018772	1
1019861	1
1019861	2
1019861	3
1019861	4
1019861	5
1004384	1
1004384	2
1004384	3
1004384	4
1012626	1
1012626	2
1012626	3
1012626	4
1019340	1
1019340	2
1019340	3
1019340	4
1019340	5
1003680	1
1003680	2
1003680	4
1001641	1
1004380	1
1006376	1
1018907	1
1018343	1
1018343	2
1018343	4
1020106	1
1020106	2
1020106	4
1020106	5
1020108	1
1020108	2
1020108	4
1020108	5
1019263	1
1019263	5
1018978	1
1018978	5
1021281	1
1021281	2
1009970	1
1009970	2
1009970	4
1009970	5
1008299	1
1021306	1
1021306	2
1021306	4
1020192	1
1020192	4
1020090	1
1020090	4
1020090	5
1002907	1
1002907	2
1002907	3
1002907	4
1018242	1
1005270	1
1005270	4
1005270	5
1008375	1
1008375	2
1008375	3
1008375	4
1019774	1
1019774	2
1019774	4
1019774	5
1005252	1
1005252	4
1005252	5
1008118	1
1008118	4
1008118	5
1021264	1
1021264	4
1021264	5
1005253	1
1005253	4
1005253	5
1005254	1
1005254	4
1005254	5
1005255	1
1005255	4
1005255	5
1021748	1
1019003	1
1019003	5
1021369	1
1021369	2
1021743	1
1021743	2
1021743	4
1021743	5
1021349	1
1021349	2
1021349	4
1021349	5
1020011	1
1021742	1
1021742	2
1021742	4
1021742	5
1021567	1
1021567	2
1021567	4
1021567	5
1010636	1
1010636	2
1010636	4
1019120	1
1019120	5
1003269	1
1003269	2
1003269	3
1003269	4
1003269	5
1019491	1
1020032	1
1019266	1
1019212	1
1011117	1
1011117	2
1011117	5
1021332	1
1020075	1
1020075	2
1020075	3
1020075	4
1020075	5
1021633	1
1021244	1
1021244	2
1021244	4
1021250	1
1021345	1
1021345	2
1021345	3
1021345	4
1021345	5
1003343	1
1003343	2
1003343	3
1003343	4
1003343	5
1019986	1
1019986	2
1019986	3
1019986	4
1019986	5
1020123	1
1019506	1
1019506	2
1019506	4
1019649	1
1019649	5
1019409	1
1019409	5
1019103	1
1003863	1
1003863	2
1003863	3
1003863	4
1003863	5
1012206	1
1012206	2
1012206	5
1019850	1
1019851	1
1019198	1
1019198	5
1002021	1
1002021	5
1002521	1
1002521	4
1002521	5
1019427	1
1019427	3
1019427	4
1020051	1
1020051	5
1019035	1
1019035	2
1019035	4
1019035	5
1021683	1
1021683	5
1019852	1
1019852	2
1019852	4
1019852	5
1019352	1
1005352	1
1005352	2
1005352	3
1005352	4
1005352	5
1009803	1
1009803	2
1009803	3
1009803	4
1009803	5
1019756	1
1019756	2
1019756	4
1021291	1
1021291	5
1021661	1
1012344	1
1012344	2
1012344	4
1012344	5
1019030	1
1019030	5
1018834	1
1018834	2
1018834	4
1021324	1
1021324	4
1021324	5
1021325	1
1021325	4
1021325	5
1019450	1
1019450	2
1019450	3
1019450	4
1019450	5
1021647	1
1016810	1
1016810	2
1016810	4
1016810	5
1018113	1
1018113	2
1018113	4
1019158	1
1006652	1
1006652	5
1002768	1
1002768	2
1002768	4
1019512	1
1019512	4
1019512	5
1010483	1
1016916	1
1016916	5
1004651	1
1004651	2
1004651	3
1004651	4
1019503	1
1019503	5
1019808	1
1019808	2
1019808	3
1019808	4
1019808	5
1019726	1
1019726	2
1019726	5
1021470	1
1021470	2
1021470	4
1021470	5
1019346	1
1019346	5
1019650	1
1019650	5
1018927	1
1018927	2
1018927	4
1021361	1
1021361	5
1004848	1
1004848	3
1004848	4
1004848	5
1011300	1
1011300	2
1011300	4
1011300	5
1020132	1
1020132	2
1020132	4
1020132	5
1019304	1
1019304	2
1019304	4
1019304	5
1021198	1
1021198	2
1021198	3
1021198	4
1021198	5
1019167	1
1019167	2
1019167	4
1019167	5
1019678	1
1019678	2
1019678	4
1019678	5
1019679	1
1019679	2
1019679	4
1019679	5
1019631	1
1019207	1
1019207	2
1019207	4
1019207	5
1019995	1
1019995	2
1019995	5
1021390	1
1012027	1
1012027	2
1012027	3
1012027	4
1012027	5
1019538	1
1019538	4
1018418	1
1018901	1
1020094	1
1020094	2
1020094	4
1020094	5
1019494	1
1019494	5
1005431	1
1005431	2
1005431	4
1018919	1
1000462	1
1000462	5
1016820	1
1021727	1
1011233	1
1011233	2
1011233	4
1018922	1
1018922	2
1018922	3
1018922	4
1011800	1
1011800	2
1011800	3
1011800	4
1011800	5
1021257	1
1021257	2
1021257	4
1021257	5
1019622	1
1019177	1
1019177	5
1019175	1
1019175	5
1019176	1
1019940	1
1019940	5
1019435	1
1011538	1
1011538	5
1000481	1
1000481	2
1000481	4
1012249	1
1005201	1
1005201	2
1005201	3
1012046	1
1012046	2
1012046	4
1012046	5
1021339	1
1021339	2
1021339	3
1021339	4
1021339	5
1019360	1
1019360	5
1021197	1
1021197	2
1018407	1
1018407	4
1005528	1
1005528	2
1005528	4
1005528	5
1006837	1
1006837	2
1006837	3
1006837	4
1006837	5
1011119	1
1011119	4
1011119	5
1019706	1
1019706	2
1019706	4
1021624	1
1019752	1
1019501	1
1019501	2
1019501	4
1005256	1
1005256	4
1005256	5
1019969	1
1019969	3
1019969	4
1019969	5
1003980	1
1003980	2
1003980	4
1003980	5
1018217	1
1018217	2
1018217	4
1018217	5
1018998	1
1018998	2
1018998	4
1005257	1
1005257	4
1005257	5
1019111	1
1010286	1
1010286	3
1010286	4
1018310	1
1018310	2
1018310	3
1018310	4
1005218	1
1005218	2
1005218	4
1005218	5
1016799	1
1016799	2
1016799	3
1016799	4
1016799	5
1003238	1
1021358	1
1021358	2
1021358	4
1021358	5
1021713	1
1021713	2
1021713	4
1019058	1
1019058	2
1019058	5
1019482	1
1019482	2
1019482	3
1019482	4
1019368	1
1012031	1
1012031	2
1012031	3
1012031	4
1012031	5
1000242	1
1000242	4
1019022	1
1019022	3
1019022	5
1000616	1
1000616	4
1019185	1
1019185	5
1019866	1
1019806	1
1019806	2
1019806	3
1019806	4
1019806	5
1011972	1
1011972	2
1011972	3
1011972	4
1011972	5
1021341	1
1021341	5
1019876	1
1019189	1
1019189	2
1019189	5
1019924	1
1019924	4
1019843	1
1019843	4
1019843	5
1020190	1
1002929	1
1002929	2
1002929	3
1002929	4
1002929	5
1019659	1
1018976	1
1018976	5
1011139	1
1019902	1
1019902	3
1019902	4
1001281	1
1005642	1
1005642	2
1005642	3
1005642	4
1005642	5
1003199	1
1019300	1
1019968	1
1019968	3
1019968	4
1020145	1
1020145	4
1019487	1
1019487	5
1020134	1
1020134	2
1020134	3
1020134	4
1020134	5
1019490	1
1020081	1
1020081	2
1019634	1
1019634	2
1019634	4
1019634	5
1021314	1
1021314	2
1021314	4
1018908	1
1018908	4
1018908	5
1019858	1
1019858	2
1019858	5
1019759	1
1019759	2
1019759	4
1021209	1
1021209	2
1021209	5
1020199	1
1020199	2
1020199	4
1020199	5
1002905	1
1019816	1
1019816	2
1019816	4
1019816	5
1021357	1
1021357	2
1021357	4
1021357	5
1018093	1
1019464	1
1021458	1
1021458	2
1021458	3
1021458	4
1019137	1
1019137	3
1019137	4
1000021	1
1011076	1
1011076	2
1011076	4
1011076	5
1020087	1
1019683	1
1019777	1
1019777	2
1019777	4
1019777	5
1012786	1
1012786	5
1005633	1
1005633	2
1005633	4
1006681	1
1006681	2
1006681	4
1009658	1
1009658	4
1009658	5
1020034	1
1020035	1
1020035	2
1020035	4
1020038	1
1020038	2
1020038	4
1012523	1
1012523	2
1012523	3
1012523	4
1012523	5
1010485	1
1018486	1
1018486	2
1021454	1
1021454	5
1019239	1
1019716	1
1019716	2
1019716	3
1019716	4
1019716	5
1006069	1
1020195	1
1020195	2
1020195	4
1020195	5
1016862	1
1016862	4
1016862	5
1021493	1
1021493	3
1021493	4
1021493	5
1018939	1
1018939	2
1018939	4
1018939	5
1010037	1
1010037	2
1010037	3
1010037	4
1010037	5
1001104	1
1001104	4
1006547	1
1006547	2
1006547	4
1006547	5
1012314	1
1012314	2
1012314	5
1019844	1
1019844	2
1019844	4
1019844	5
1020166	1
1020166	2
1020166	3
1020166	4
1004297	1
1004297	2
1004297	4
1020085	1
1020085	2
1020085	4
1020085	5
1021377	1
1011901	1
1011901	2
1011901	3
1011901	4
1011901	5
1019507	1
1019507	5
1021430	1
1021430	4
1021430	5
1019480	1
1019480	2
1019480	4
1019480	5
1018573	1
1018573	4
1018314	1
1018314	2
1018314	4
1018314	5
1018317	1
1018317	2
1018317	4
1021252	1
1012560	1
1012560	3
1012560	4
1012560	5
1021656	1
1021656	5
1021467	1
1021467	5
1020162	1
1020162	2
1020162	4
1018926	1
1018926	5
1005559	1
1005559	2
1005499	1
1018991	1
1018991	2
1018991	3
1018991	4
1018991	5
1004717	1
1004717	4
1004717	5
1018995	1
1018995	2
1018995	3
1018995	4
1018995	5
1000585	1
1000585	2
1000585	4
1000585	5
1021307	1
1021307	2
1021307	4
1021288	1
1021288	2
1021288	4
1021288	5
1021287	1
1021287	2
1021287	4
1021287	5
1021571	1
1010316	1
1010316	5
1012725	1
1012725	2
1012725	3
1012725	4
1018924	1
1018924	5
1018931	1
1018931	2
1018931	4
1018931	5
1019857	1
1019857	2
1019857	3
1019857	4
1018903	1
1019682	1
1011535	1
1011535	2
1011535	4
1011535	5
1020055	1
1003081	1
1003081	2
1003081	4
1003081	5
1020017	1
1020017	2
1020017	5
1021715	1
1021642	1
1021642	5
1018702	1
1018702	2
1018702	3
1018702	4
1019737	1
1019737	4
1019737	5
1021634	1
1019908	1
1019908	2
1019908	3
1019908	4
1019908	5
1019725	1
1019725	2
1019725	4
1019725	5
1012739	1
1012739	2
1012739	4
1012739	5
1012738	1
1012738	2
1012738	4
1012738	5
1019348	1
1019348	2
1019348	4
1019348	5
1012737	1
1012737	2
1012737	4
1012737	5
1021478	1
1021478	3
1021478	4
1021601	1
1021601	2
1021601	4
1021601	5
1019227	1
1019227	2
1019879	1
1021632	1
1020043	1
1020043	2
1020043	5
1005939	1
1005939	2
1005939	3
1005939	4
1005939	5
1005991	1
1005991	5
1021336	1
1021336	2
1021336	4
1021549	1
1021549	2
1021549	3
1021549	4
1021549	5
1021708	1
1012044	1
1019240	1
1019240	2
1019240	3
1019240	5
1019294	1
1019294	4
1019883	1
1010614	1
1021279	1
1021279	2
1021279	3
1021279	4
1020066	1
1020066	2
1020066	3
1020066	4
1020066	5
1021518	1
1021243	1
1021243	2
1021243	4
1021434	1
1021434	2
1021434	4
1019407	1
1019407	5
1018875	1
1018875	2
1018875	5
1021344	1
1021344	3
1021344	4
1021344	5
1018184	1
1018184	2
1018184	3
1018184	4
1018184	5
1018550	1
1018550	2
1018550	4
1018550	5
1001059	1
1001059	2
1001059	3
1001059	5
1004865	1
1004865	5
1009884	1
1009884	2
1009884	3
1009884	4
1009884	5
1018455	1
1018455	2
1018455	4
1019640	1
1019640	3
1019640	4
1019640	5
1003694	1
1003694	2
1003694	3
1003694	4
1003694	5
1006780	1
1006780	4
1006780	5
1010755	1
1010755	2
1010755	3
1010755	4
1010755	5
1002764	1
1002764	2
1002764	4
1018728	1
1018728	2
1018728	3
1018728	4
1018728	5
1019815	1
1019815	2
1019815	4
1019815	5
1021379	1
1021379	2
1021379	3
1021379	4
1021379	5
1021554	1
1019008	1
1019008	2
1019008	4
1019008	5
1019345	1
1019345	5
1020054	1
1020054	2
1019127	1
1019127	2
1019127	3
1019127	4
1019127	5
1019828	1
1019828	2
1019828	3
1019828	4
1019828	5
1021566	1
1021566	5
1019488	1
1018829	1
1018829	2
1018829	4
1018829	5
1019223	1
1019223	2
1019223	3
1019223	5
1019971	1
1019971	5
1019353	1
1001839	1
1006250	1
1006250	2
1006250	3
1006250	4
1006250	5
1019200	1
1021412	1
1021412	2
1021412	4
1021412	5
1021413	1
1021413	2
1021413	4
1021413	5
1001271	1
1001271	2
1001271	3
1001271	4
1001271	5
1021356	1
1021356	2
1021356	4
1021356	5
1020130	1
1020130	2
1020130	4
1020130	5
1020131	1
1020131	2
1020131	4
1020131	5
1020146	1
1020146	2
1020146	3
1020146	4
1020146	5
1009659	1
1009659	4
1009659	5
1010865	1
1021667	1
1019646	1
1019646	2
1019646	4
1019646	5
1018655	1
1018655	2
1018655	4
1018655	5
1019343	1
1019343	2
1019343	4
1019343	5
1021685	1
1021685	4
1021685	5
1001034	1
1001034	2
1001034	4
1001034	5
1019317	1
1019317	2
1019317	4
1019317	5
1021608	1
1018807	1
1018807	2
1018807	3
1018807	5
1020114	1
1020114	2
1020114	5
1018920	1
1018920	5
1008468	1
1008468	2
1008468	3
1008468	4
1008468	5
1019202	1
1019202	2
1019202	3
1019202	4
1020198	1
1020198	2
1020198	4
1020198	5
1008360	1
1019416	1
1019019	1
1019019	3
1019019	5
1019023	1
1019023	3
1019023	5
1019025	1
1019025	3
1019025	5
1021699	1
1021215	1
1020023	1
1020023	3
1020023	4
1020023	5
1021384	1
1021384	3
1021384	4
1004212	1
1021335	1
1021335	2
1021335	4
1021335	5
1012777	1
1012777	4
1008946	1
1008946	2
1008946	3
1008946	4
1008946	5
1021721	1
1021721	2
1021721	3
1021721	4
1021722	1
1021722	2
1021722	3
1021722	4
1021599	1
1021200	1
1021200	2
1021200	3
1021200	4
1021200	5
1019723	1
1021648	1
1019102	1
1019102	3
1019102	4
1019102	5
1005248	1
1005248	4
1005248	5
1018687	1
1018687	5
1011995	1
1011995	5
1021491	1
1021491	4
1021491	5
1021398	1
1019755	1
1019755	2
1019755	4
1019755	5
1019761	1
1019761	2
1019761	3
1019761	4
1019761	5
1006927	1
1006927	5
1019939	1
1019939	4
1019939	5
1021417	1
1019674	1
1019910	1
1019910	2
1019910	3
1019910	4
1019910	5
1018944	1
1018944	3
1018944	4
1018944	5
1021735	1
1021735	2
1021735	3
1021735	5
1019068	1
1019068	3
1019068	5
1021389	1
1021389	2
1021389	5
1021718	1
1020175	1
1020175	2
1020175	4
1019685	1
1018466	1
1018466	5
1019454	1
1020072	1
1020072	2
1020072	4
1021688	1
1019854	1
1021746	1
1019822	1
1019822	4
1018626	1
1018626	2
1018626	3
1018626	4
1018626	5
1018627	1
1018627	2
1018627	3
1018627	4
1018627	5
1012060	1
1010839	1
1010839	2
1010839	3
1010839	4
1010839	5
1019128	1
1001260	1
1020126	1
1020126	2
1020126	3
1020126	4
1020126	5
1002060	1
1002060	3
1002060	4
1002060	5
1020177	1
1020177	4
1020177	5
1021494	1
1021494	3
1021494	4
1021494	5
1007245	1
1007245	2
1007245	4
1007245	5
1010408	1
1010408	2
1021731	1
1021731	5
1020165	1
1020165	2
1020165	3
1020165	4
1020165	5
1021380	1
1010638	1
1016803	1
1016803	2
1016803	4
1016803	5
1021641	1
1021641	4
1021641	5
1018921	1
1018921	3
1018921	4
1018921	5
1020005	1
1020005	5
1021572	1
1021572	2
1021572	4
1021572	5
1019328	1
1019328	2
1019328	4
1019885	1
1012268	1
1012268	5
1019344	1
1019344	5
1019478	1
1019478	5
1019616	1
1019616	3
1019616	4
1019615	1
1019615	3
1019615	4
1019884	1
1020019	1
1020019	2
1020019	3
1020019	5
1008213	1
1008213	3
1008213	4
1021455	1
1021455	2
1021455	3
1021455	4
1021455	5
1004602	1
1004602	3
1004602	4
1004602	5
1011146	1
1005259	1
1005259	4
1005259	5
1021485	1
1021485	5
1021462	1
1019027	1
1019027	5
1018986	1
1018986	2
1018986	4
1018986	5
1020037	1
1020037	2
1020037	4
1020037	5
1018474	1
1018474	2
1018474	3
1018474	4
1018474	5
1018477	1
1018477	2
1018477	3
1018477	4
1018477	5
1018478	1
1018478	2
1018478	3
1018478	4
1018478	5
1018482	1
1018482	2
1018482	3
1018482	4
1018482	5
1018483	1
1018483	2
1018483	3
1018483	4
1018483	5
1007797	1
1007797	5
1018963	1
1019807	1
1019807	2
1019807	3
1019807	4
1019807	5
1021263	1
1021263	2
1021263	4
1021263	5
1021501	1
1021501	4
1019149	1
1019793	1
1019793	5
1020086	1
1018215	1
1018215	2
1018215	4
1021617	1
1021617	2
1021617	4
1021617	5
1019868	1
1021266	1
1021266	2
1021266	3
1021266	4
1021266	5
1011596	1
1011596	2
1011596	3
1011596	4
1011596	5
1003402	1
1003402	2
1003402	4
1003402	5
1021618	1
1021618	5
1019477	1
1019477	4
1019477	5
1010145	1
1010145	2
1010145	4
1010145	5
1005260	1
1005260	4
1005260	5
1019122	1
1019122	2
1019122	4
1019122	5
1019315	1
1019315	2
1019315	3
1019315	4
1019315	5
1021579	1
1021579	2
1021579	4
1021579	5
1011310	1
1011310	4
1011310	5
1019204	1
1020093	1
1019500	1
1019500	4
1019500	5
1001766	1
1001766	2
1001766	3
1001766	4
1020024	1
1020024	2
1020024	4
1020024	5
1021277	1
1021277	2
1021277	3
1021277	4
1021277	5
1003610	1
1003610	2
1003610	4
1003610	5
1019410	1
1019410	5
1019411	1
1019411	5
1004750	1
1004750	2
1004750	3
1004750	4
1004750	5
1004751	1
1004751	2
1004751	3
1004751	4
1004751	5
1000712	1
1019235	1
1019235	2
1019235	3
1019235	5
1021615	1
1009020	1
1019493	1
1019493	5
1002843	1
1002843	5
1018549	1
1018549	2
1018549	4
1018549	5
1021272	1
1021272	5
1019930	1
1019142	1
1019142	2
1019142	3
1019142	4
1019142	5
1019145	1
1019145	2
1019145	4
1019145	5
1005060	1
1021312	1
1021312	2
1021312	4
1021302	1
1021302	2
1021302	4
1019419	1
1019419	5
1019312	1
1019312	5
1004073	1
1004073	2
1004073	3
1004073	4
1004073	5
1019418	1
1018284	1
1018284	2
1018284	5
1021409	1
1021409	2
1000194	1
1019259	1
1019259	2
1019259	4
1019259	5
1019927	1
1019927	2
1019927	3
1019927	4
1019927	5
1019635	1
1019635	2
1019635	4
1019070	1
1019899	1
1020173	1
1020173	5
1019033	1
1019033	5
1012576	1
1012576	2
1012576	4
1012576	5
1021623	1
1021623	4
1021623	5
1021606	1
1021606	2
1021606	4
1021606	5
1019048	1
1011286	1
1019747	1
1019747	4
1003969	1
1003969	2
1003969	3
1003969	4
1003969	5
1003970	1
1003970	2
1003970	3
1003970	4
1003970	5
1003971	1
1003971	2
1003971	3
1003971	4
1003971	5
1018637	1
1018637	2
1018637	3
1018637	4
1018637	5
1011778	1
1019479	1
1019479	4
1019479	5
1018349	1
1018349	2
1018349	4
1018349	5
1019973	1
1019973	5
1010821	1
1010821	2
1010821	5
1019194	1
1019194	2
1019194	5
1019791	1
1019791	3
1019791	4
1021535	1
1021535	2
1021535	5
1021218	1
1021218	2
1021218	5
1005261	1
1005261	4
1005261	5
1019119	1
1019119	5
1021451	1
1021451	2
1003915	1
1003915	2
1003915	4
1003915	5
1019620	1
1019620	5
1021646	1
1021646	2
1021646	3
1021646	4
1021646	5
1021503	1
1018975	1
1018975	4
1018975	5
1019715	1
1019825	1
1019734	1
1002062	1
1002062	4
1002062	5
1005214	1
1005214	5
1021613	1
1021613	2
1021613	4
1021613	5
1019211	1
1019211	5
1021546	1
1004988	1
1004988	2
1004988	4
1004988	5
1004990	1
1004990	5
1021724	1
1021724	5
1002485	1
1002485	2
1002485	4
1002485	5
1019428	1
1005262	1
1005262	4
1005262	5
1021468	1
1021468	2
1021468	4
1021468	5
1009080	1
1009080	2
1009080	4
1018449	1
1018449	2
1018449	3
1018449	5
1019913	1
1019913	5
1020185	1
1020185	2
1021645	1
1021645	2
1021645	3
1021645	4
1021645	5
1018625	1
1018625	2
1018625	3
1018625	4
1018625	5
1018315	1
1018315	5
1011160	1
1011160	2
1011160	4
1007261	1
1007261	2
1007261	4
1007261	5
1008303	1
1008303	2
1008303	3
1008303	4
1008303	5
1012203	1
1012203	2
1012203	5
1021577	1
1021577	2
1021577	3
1021577	4
1021577	5
1007250	1
1007250	2
1007250	5
1021558	1
1021707	1
1021707	2
1021707	4
1012037	1
1012037	2
1019627	1
1019627	2
1019627	4
1020088	1
1020088	2
1020088	4
1019515	1
1019515	2
1019515	3
1019515	4
1019445	1
1019445	2
1019445	4
1019445	5
1018167	1
1018167	5
1018172	1
1018172	5
1019237	1
1021693	1
1021693	4
1021664	1
1021664	2
1021664	3
1021664	4
1021664	5
1021233	1
1021233	5
1018773	1
1018773	5
1019610	1
1019442	1
1019442	2
1019442	4
1019442	5
1019395	1
1021700	1
1021700	4
1021700	5
1010838	1
1019455	1
1019455	2
1019455	4
1019455	5
1021429	1
1021429	4
1021429	5
1001280	1
1001280	2
1001280	3
1001280	4
1001280	5
1019976	1
1019976	2
1019976	4
1019976	5
1020103	1
1018988	1
1018988	2
1018988	5
1019319	1
1019319	2
1019319	4
1019319	5
1012179	1
1012179	3
1012179	4
1012179	5
1020004	1
1020004	4
1020004	5
1021397	1
1021397	2
1021397	3
1021397	4
1021397	5
1018771	1
1018771	2
1018771	4
1018771	5
1021219	1
1021219	2
1021219	4
1021219	5
1011044	1
1011044	2
1011044	5
1016822	1
1018601	1
1018601	4
1011811	1
1011811	2
1011811	4
1011811	5
1010560	1
1010560	2
1010560	4
1003169	1
1003169	2
1003169	3
1003169	5
1018814	1
1019869	1
1019869	4
1020163	1
1020163	2
1020163	4
1010014	1
1021675	1
1021675	2
1021675	3
1021675	4
1021675	5
1020022	1
1020022	2
1020022	3
1020022	5
1019926	1
1019926	3
1019926	4
1019926	5
1020159	1
1020159	2
1020159	3
1020159	4
1020159	5
1003836	1
1019829	1
1019829	2
1019829	4
1019829	5
1019671	1
1019671	3
1020039	1
1020039	2
1020039	4
1020039	5
1020040	1
1020040	2
1020040	4
1020040	5
1011934	1
1011934	2
1011934	4
1011934	5
1011935	1
1011935	2
1011935	4
1011935	5
1019803	1
1019803	5
1020067	1
1020067	2
1020067	3
1020067	4
1020067	5
1021697	1
1019385	1
1018138	1
1018138	2
1018138	3
1018138	4
1018138	5
1021214	1
1021214	5
1019599	1
1002526	1
1019915	1
1019915	2
1019915	3
1019915	4
1021573	1
1021573	2
1021573	4
1021573	5
1019511	1
1010997	1
1010997	5
1010445	1
1010445	2
1010445	3
1010445	4
1021553	1
1021553	2
1021553	3
1021553	4
1021553	5
1019091	1
1019091	4
1019091	5
1018098	1
1018098	5
1021563	1
1021563	2
1021563	4
1021563	5
1021589	1
1021589	2
1021589	4
1021589	5
1002063	1
1002063	2
1002063	3
1002063	4
1002063	5
1019979	1
1019979	2
1019979	3
1019979	4
1021326	1
1021326	5
1005560	1
1005560	4
1005560	5
1019305	1
1019305	2
1019305	4
1019305	5
1018952	1
1018952	5
1021568	1
1021568	2
1021568	4
1021568	5
1019173	1
1019173	2
1019173	4
1019784	1
1019784	5
1019452	1
1019452	5
1019782	1
1019782	5
1021394	1
1021394	2
1021394	4
1021394	5
1003588	1
1003588	4
1003588	5
1021670	1
1018312	1
1018312	2
1018312	4
1018312	5
1021466	1
1021466	2
1021466	4
1021466	5
1019628	1
1020176	1
1019675	1
1019675	2
1019675	4
1019675	5
1007810	1
1012278	1
1012278	5
1021483	1
1012766	1
1012766	2
1012766	4
1018211	1
1018211	2
1018211	5
1021526	1
1012100	1
1012100	2
1012100	3
1012100	4
1012100	5
1018918	1
1018918	2
1018918	4
1021333	1
1021333	4
1021333	5
1021334	1
1021334	4
1021334	5
1010057	1
1019526	1
1019526	5
1018451	1
1012116	1
1019545	1
1019545	2
1019545	3
1019545	4
1019545	5
1019036	1
1019036	2
1019036	4
1019112	1
1007271	1
1007271	2
1007271	3
1007271	4
1020186	1
1020186	2
1020186	5
1021432	1
1009707	1
1009707	2
1009707	3
1009707	4
1009707	5
1008173	1
1008173	5
1020149	1
1020149	2
1020149	4
1020149	5
1019481	1
1019481	2
1019481	5
1021643	1
1021643	2
1021643	3
1021643	5
1021644	1
1021644	2
1021644	3
1021644	5
1002765	1
1002765	2
1002765	4
1019981	1
1021313	1
1021313	2
1021313	4
1018923	1
1018923	5
1019015	1
1019015	2
1020036	1
1020036	3
1020036	4
1020036	5
1018476	1
1018476	2
1018476	4
1018476	5
1020073	1
1011738	1
1011738	2
1011738	4
1011738	5
1019138	1
1019138	5
1003982	1
1003982	2
1003982	5
1020147	1
1020147	2
1020147	3
1020147	4
1020147	5
1019075	1
1019075	3
1019075	5
1021694	1
1021694	2
1021694	3
1021694	4
1021694	5
1018994	1
1018994	2
1018994	3
1018994	4
1018994	5
1010998	1
1010998	2
1010998	3
1010998	4
1000710	1
1000710	2
1000710	5
1021616	1
1021616	2
1021616	5
1018279	1
1018279	2
1018279	4
1018279	5
1021235	1
1021204	1
1020049	1
1020049	4
1019047	1
1019933	1
1019933	2
1021203	1
1019596	1
1019596	2
1019596	3
1019596	4
1019596	5
1018959	1
1018959	4
1018959	5
1021254	1
1021254	5
1019181	1
1019303	1
1019544	1
1019775	1
1019775	4
1019931	1
1019948	1
1019948	5
1019166	1
1019166	3
1019166	5
1019626	1
1019626	2
1019751	1
1021304	1
1021304	2
1021304	4
1019697	1
1019697	5
1019700	1
1019700	5
1019699	1
1019699	5
1019698	1
1019698	5
1019696	1
1019696	5
1021276	1
1021619	1
1021619	5
1012357	1
1019001	1
1019001	2
1019001	4
1021659	1
1021659	2
1021659	4
1021659	5
1019504	1
1019966	1
1019966	5
1018422	1
1018422	4
1021702	1
1016917	1
1019928	1
1019928	5
1011497	1
1019517	1
1019517	2
1019517	4
1002101	1
1002101	2
1002101	3
1002101	4
1002101	5
1019739	1
1019826	1
1019826	2
1019826	3
1019826	4
1019826	5
1019975	1
1019975	5
1018628	1
1018628	2
1018628	3
1018628	4
1018628	5
1018624	1
1018624	2
1018624	3
1018624	4
1018624	5
1021499	1
1021499	5
1000278	1
1020015	1
1020015	5
1010798	1
1010798	3
1010798	4
1010798	5
1012799	1
1021586	1
1021586	5
1008826	1
1008826	2
1008826	3
1008826	4
1008826	5
1008827	1
1008827	2
1008827	3
1008827	4
1008827	5
1019228	1
1017961	1
1017961	2
1017961	5
1009802	1
1009802	4
1009802	5
1021562	1
1021562	2
1021562	3
1021562	4
1021562	5
1021744	1
1021447	1
1019963	1
1021490	1
1021490	2
1021490	3
1021490	4
1021490	5
1019393	1
1019213	1
1019213	4
1019213	5
1006324	1
1006324	2
1006324	4
1006324	5
1021745	1
1021745	5
1019638	1
1021343	1
1021343	5
1018933	1
1018933	5
1020002	1
1020002	2
1020002	3
1020002	4
1020002	5
1019632	1
1019632	2
1019632	4
1018397	1
1018397	2
1018397	4
1018397	5
1021576	1
1021576	2
1021576	3
1021576	4
1021576	5
1018283	1
1019349	1
1019349	2
1019349	3
1019349	4
1019349	5
1012573	1
1012573	2
1012573	3
1012573	4
1012573	5
1005493	1
1006169	1
1006169	2
1006169	4
1018968	1
1018968	2
1018968	4
1018968	5
1019215	1
1019925	1
1019925	5
1010158	1
1010158	2
1010158	3
1010158	5
1019540	1
1019540	3
1019540	4
1019540	5
1018634	1
1018634	2
1018634	4
1018634	5
1021305	1
1021305	2
1021305	4
1019764	1
1019764	2
1019764	4
1019764	5
1021726	1
1021726	5
1001886	1
1019105	1
1019105	2
1019105	4
1019105	5
1019448	1
1019448	2
1019448	4
1019342	1
1019342	5
1018852	1
1018852	2
1018852	4
1019498	1
1005631	1
1001999	1
1001999	2
1001999	3
1001999	4
1001999	5
1018535	1
1018535	5
1019692	1
1012325	1
1012325	2
1012325	4
1012325	5
1018597	1
1018597	5
1018598	1
1018598	5
1019078	1
1019078	2
1019078	5
1019080	1
1019080	5
1019182	1
1019182	5
1019952	1
1020048	1
1020048	2
1020048	3
1020048	4
1020048	5
1012247	1
1012247	2
1012247	4
1012247	5
1019513	1
1012297	1
1012297	5
1018155	1
1019645	1
1019156	1
1019156	4
1019156	5
1006342	1
1006342	2
1006342	4
1021297	1
1018214	1
1018214	5
1021487	1
1021487	5
1021251	1
1021251	5
1018504	1
1018504	2
1018504	3
1018504	4
1001925	1
1001925	5
1010394	1
1010394	2
1010394	3
1010394	4
1010394	5
1019155	1
1019155	2
1019155	5
1021537	1
1021537	4
1021537	5
1005268	1
1005268	4
1005268	5
1004574	1
1004574	4
1004574	5
1005263	1
1005263	4
1005263	5
1005269	1
1005269	4
1005269	5
1005264	1
1005264	4
1005264	5
1005266	1
1005266	4
1005266	5
1019489	1
1021340	1
1021340	2
1021340	3
1021340	4
1021340	5
1020197	1
1020197	2
1020197	4
1020197	5
1018219	1
1018219	2
1018219	3
1018219	4
1018219	5
1021366	1
1018552	1
1018552	2
1018552	4
1018552	5
1020021	1
1020021	2
1020021	4
1020021	5
1019394	1
1019394	2
1019394	4
1018319	1
1001962	1
1001962	2
1001962	4
1011229	1
1011229	5
1019613	1
1019613	2
1004499	1
1004499	2
1004499	3
1004499	5
1019016	1
1021559	1
1021559	2
1021559	4
1012485	1
1012485	4
1012485	5
1020047	1
1020047	2
1020047	3
1020047	4
1020047	5
1019124	1
1019124	4
1021709	1
1021709	2
1021709	4
1021709	5
1021452	1
1021452	5
1006093	1
1006093	2
1006093	4
1000384	1
1000384	2
1000384	4
1019864	1
1019864	2
1019864	4
1019864	5
1012212	1
1012212	5
1019641	1
1019641	2
1019641	3
1019641	4
1019641	5
1019114	1
1019114	2
1019114	4
1019114	5
1002890	1
1002890	2
1002890	5
1002280	1
1002280	4
1019067	1
1019067	5
1021569	1
1021569	4
1018650	1
1018650	5
1011203	1
1011203	2
1011203	4
1011203	5
1019424	1
1019424	2
1019424	3
1019657	1
1019657	4
1019877	1
1002177	1
1002177	2
1002177	4
1016908	1
1016908	2
1016908	3
1016908	4
1016908	5
1019911	1
1019911	2
1019911	3
1019911	4
1019911	5
1012204	1
1010319	1
1019509	1
1021367	1
1021367	2
1021367	5
1019364	1
1019364	4
1019364	5
1019444	1
1019444	3
1019444	5
1021274	1
1021274	2
1021274	4
1021274	5
1019797	1
1019797	2
1019797	3
1019797	4
1019797	5
1021246	1
1021246	2
1021246	4
1021246	5
1002816	1
1002816	2
1002816	3
1002816	4
1002816	5
1020070	1
1001661	1
1001661	2
1001661	3
1001661	4
1001661	5
1021217	1
1021217	2
1021217	3
1021217	4
1021217	5
1004515	1
1004515	2
1004515	4
1004515	5
1005280	1
1005280	2
1005280	3
1005280	4
1005280	5
1020020	1
1020020	2
1020020	3
1020020	5
1021258	1
1021258	5
1020010	1
1021488	1
1019955	1
1019955	2
1019955	3
1019955	4
1019392	1
1019392	5
1020157	1
1020157	3
1020157	4
1020157	5
1020156	1
1020156	3
1020156	4
1020156	5
1019221	1
1019221	5
1021495	1
1021495	3
1021495	4
1021495	5
1021497	1
1021497	3
1021497	4
1021497	5
1021498	1
1021498	3
1021498	4
1021498	5
1021496	1
1021496	3
1021496	4
1021496	5
1019878	1
1019069	1
1019069	5
1018274	1
1018274	2
1018274	5
1019652	1
1019652	5
1021720	1
1021720	5
1019337	1
1019337	4
1019337	5
1020187	1
1020187	2
1020187	5
1019433	1
1019433	2
1019433	4
1019433	5
1019369	1
1019369	5
1011274	1
1011274	2
1011274	4
1021231	1
1019229	1
1019848	1
1019848	5
1019653	1
1019653	2
1019653	4
1019653	5
1019449	1
1019449	5
1018925	1
1019463	1
1019463	2
1019463	3
1019463	4
1019463	5
1008231	1
1008231	2
1008231	4
1019845	1
1019845	5
1020158	1
1020158	2
1020158	4
1009027	1
1009027	5
1019098	1
1019098	2
1019098	5
1020138	1
1020138	2
1020138	4
1020168	1
1020168	2
1020168	4
1020168	5
1019038	1
1019038	2
1019038	3
1019038	4
1019038	5
1005140	1
1021317	1
1021317	2
1021317	4
1021317	5
1021386	1
1021386	3
1021386	4
1021386	5
1021385	1
1021385	3
1021385	4
1021385	5
1011337	1
1011337	5
1021328	1
1021328	5
1019912	1
1019912	2
1019912	3
1019912	4
1019912	5
1007309	1
1007309	2
1007309	4
1017915	1
1017915	5
1019708	1
1019708	5
1018508	1
1007259	1
1007259	2
1007259	4
1002366	1
1002366	5
1019508	1
1019508	5
1019247	1
1019245	1
1019246	1
1019250	1
1019242	1
1019244	1
1019327	1
1019327	2
1019327	4
1019327	5
1016909	1
1016909	2
1016909	5
1021545	1
1021545	5
1019863	1
1019863	5
1019792	1
1019792	2
1019792	4
1019792	5
\.


--
-- Data for Name: market_products; Type: TABLE DATA; Schema: public; 
--

COPY public.market_products (fmid, product_id) FROM stdin;
1018261	1
1018261	2
1018261	3
1018261	4
1018261	5
1018261	6
1018261	8
1018261	9
1018261	10
1018261	11
1018261	12
1018261	13
1018261	17
1018261	18
1018261	19
1018261	20
1018261	22
1018261	23
1018261	24
1018261	27
1018261	28
1009994	1
1009994	2
1009994	3
1009994	4
1009994	5
1009994	6
1009994	8
1009994	9
1009994	10
1009994	11
1009994	13
1009994	16
1009994	17
1009994	18
1009994	22
1009994	23
1009994	24
1000709	1
1000709	2
1000709	3
1000709	4
1000709	5
1000709	6
1000709	8
1000709	9
1000709	10
1000709	11
1000709	15
1000709	16
1000709	19
1000709	24
1000709	26
1000709	30
1019956	1
1019956	2
1019956	4
1019956	6
1019956	8
1019956	9
1019956	10
1019956	11
1019956	15
1019956	18
1019956	19
1019956	24
1019956	26
1009959	1
1009959	2
1009959	3
1009959	4
1009959	5
1009959	6
1009959	8
1009959	9
1009959	10
1009959	11
1009959	12
1009959	13
1009959	15
1009959	16
1009959	17
1009959	18
1009959	19
1009959	22
1009959	23
1009959	24
1009959	25
1009959	26
1009959	27
1009959	28
1009959	30
1004950	1
1004950	2
1004950	3
1004950	4
1004950	5
1004950	6
1004950	8
1004950	9
1004950	10
1004950	11
1004950	12
1004950	13
1004950	16
1004950	17
1004950	18
1004950	19
1004950	20
1004950	22
1004950	23
1004950	24
1004950	28
1019938	2
1019938	3
1019938	4
1019938	5
1019938	6
1019938	8
1019938	9
1019938	10
1019938	11
1019938	12
1019938	13
1019938	16
1019938	17
1019938	19
1019938	20
1019938	24
1019938	27
1019938	30
1021607	4
1021607	8
1021607	10
1021607	13
1021607	15
1021607	19
1021607	22
1018965	2
1018965	3
1018965	5
1018965	6
1018965	7
1018965	8
1018965	9
1018965	10
1018965	11
1018965	12
1018965	15
1018965	18
1018965	19
1018965	22
1018965	24
1018965	26
1018965	27
1009004	2
1009004	3
1009004	5
1009004	6
1009004	8
1009004	9
1009004	10
1009004	11
1009004	18
1009004	19
1009004	24
1009004	27
1019473	2
1019473	4
1019473	5
1019473	6
1019473	7
1019473	9
1019473	10
1019473	11
1019473	16
1019473	18
1019473	19
1019473	20
1019473	21
1019473	22
1019473	24
1019473	26
1019473	28
1010487	1
1010487	2
1010487	3
1010487	4
1010487	5
1010487	6
1010487	8
1010487	9
1010487	10
1010487	11
1010487	12
1010487	13
1010487	15
1010487	16
1010487	17
1010487	18
1010487	19
1010487	21
1010487	22
1010487	23
1010487	24
1010487	26
1010487	27
1010487	28
1010487	30
1019695	2
1019695	3
1019695	4
1019695	5
1019695	6
1019695	9
1019695	10
1019695	11
1019695	13
1019695	16
1019695	17
1019695	18
1019695	19
1019695	20
1019695	22
1019695	24
1019695	25
1019695	26
1019695	27
1019695	30
1021442	2
1021442	5
1021442	6
1021442	8
1021442	9
1021442	10
1021442	11
1021442	12
1021442	13
1021442	17
1021442	19
1021442	20
1021442	22
1021442	24
1019676	1
1019676	2
1019676	3
1019676	5
1019676	6
1019676	8
1019676	9
1019676	10
1019676	11
1019676	12
1019676	13
1019676	17
1019676	18
1019676	19
1019676	21
1019676	22
1019676	24
1019676	28
1019351	2
1019351	3
1019351	5
1019351	6
1019351	8
1019351	9
1019351	10
1019351	11
1019351	12
1019351	17
1019351	18
1019351	21
1019351	22
1019351	24
1019351	27
1019847	2
1019847	3
1019847	5
1019847	6
1019847	8
1019847	9
1019847	10
1019847	11
1019847	13
1019847	16
1019847	17
1019847	18
1019847	19
1019847	21
1019847	22
1019847	23
1019847	24
1019847	28
1008961	1
1008961	2
1008961	3
1008961	6
1008961	8
1008961	9
1008961	10
1008961	11
1008961	15
1008961	22
1008961	24
1008961	27
1019203	1
1019203	2
1019203	4
1019203	8
1019203	9
1019203	10
1019203	11
1019203	16
1019203	18
1019203	19
1019203	20
1019203	22
1019203	24
1019203	26
1019203	28
1012233	1
1012233	2
1012233	4
1012233	5
1012233	6
1012233	7
1012233	8
1012233	9
1012233	10
1012233	11
1012233	13
1012233	15
1012233	17
1012233	18
1012233	19
1012233	22
1012233	24
1012233	26
1005258	8
1005258	9
1005258	15
1005258	23
1005258	24
1005258	27
1008054	1
1008054	2
1008054	3
1008054	4
1008054	5
1008054	6
1008054	7
1008054	8
1008054	9
1008054	10
1008054	11
1008054	12
1008054	15
1008054	16
1008054	18
1008054	19
1008054	20
1008054	21
1008054	22
1008054	24
1008054	26
1008054	28
1008054	30
1008612	1
1008612	2
1008612	3
1008612	5
1008612	6
1008612	8
1008612	9
1008612	10
1008612	11
1008612	13
1008612	16
1008612	17
1008612	18
1008612	19
1008612	20
1008612	22
1008612	24
1008612	27
1008612	28
1008612	30
1018304	2
1018304	3
1018304	6
1018304	8
1018304	9
1018304	10
1018304	11
1018304	12
1018304	13
1018304	15
1018304	17
1018304	18
1018304	19
1018304	22
1018304	24
1018304	26
1018304	28
1021689	1
1021689	2
1021689	3
1021689	5
1021689	6
1021689	7
1021689	8
1021689	9
1021689	10
1021689	11
1021689	13
1021689	15
1021689	16
1021689	17
1021689	18
1021689	19
1021689	20
1021689	22
1021689	23
1021689	24
1021689	25
1021689	27
1021689	30
1019371	2
1019371	3
1019371	4
1019371	5
1019371	6
1019371	8
1019371	9
1019371	10
1019371	11
1019371	13
1019371	16
1019371	18
1019371	19
1019371	24
1021578	2
1021578	5
1021578	6
1021578	9
1021578	10
1021578	16
1021578	17
1021578	18
1021578	22
1021578	24
1000519	2
1000519	4
1000519	9
1000519	10
1000519	11
1000519	12
1000519	16
1000519	21
1000519	24
1019113	1
1019113	2
1019113	3
1019113	5
1019113	6
1019113	8
1019113	9
1019113	10
1019113	11
1019113	12
1019113	13
1019113	16
1019113	17
1019113	24
1021464	1
1021464	2
1021464	3
1021464	5
1021464	6
1021464	7
1021464	8
1021464	9
1021464	10
1021464	11
1021464	13
1021464	15
1021464	16
1021464	17
1021464	18
1021464	19
1021464	20
1021464	23
1021464	24
1021464	27
1021597	2
1021597	3
1021597	4
1021597	8
1021597	9
1021597	10
1021597	11
1021597	12
1021597	13
1021597	17
1021597	18
1021597	19
1021597	24
1021597	25
1019831	2
1019831	4
1019831	6
1019831	9
1019831	10
1019831	11
1019831	13
1019831	17
1019831	18
1019831	19
1019832	2
1019832	4
1019832	5
1019832	6
1019832	8
1019832	9
1019832	10
1019832	11
1019832	13
1019832	17
1019832	19
1012389	2
1012389	4
1012389	8
1012389	9
1012389	15
1012389	16
1012389	18
1012389	19
1012389	20
1012389	22
1012389	23
1012389	24
1012389	28
1020150	2
1020150	4
1020150	5
1020150	6
1020150	8
1020150	9
1020150	10
1020150	11
1020150	13
1020150	19
1020150	20
1020150	24
1020150	28
1021309	1
1021309	2
1021309	3
1021309	4
1021309	5
1021309	6
1021309	9
1021309	10
1021309	11
1021309	12
1021309	13
1021309	16
1021309	17
1021309	18
1021309	19
1021309	20
1021309	21
1021309	22
1021309	24
1021309	27
1021309	28
1011171	1
1011171	2
1011171	3
1011171	4
1011171	5
1011171	6
1011171	8
1011171	9
1011171	10
1011171	11
1011171	13
1011171	15
1011171	16
1011171	17
1011171	18
1011171	19
1011171	21
1011171	22
1011171	24
1011171	26
1011171	27
1011171	28
1011171	30
1003563	2
1003563	3
1003563	4
1003563	5
1003563	6
1003563	7
1003563	8
1003563	9
1003563	10
1003563	13
1003563	16
1003563	19
1003563	20
1003563	24
1003563	27
1019438	2
1019438	3
1019438	4
1019438	6
1019438	9
1019438	10
1019438	11
1019438	13
1019438	15
1019438	17
1019438	18
1019438	19
1019438	24
1019438	27
1012157	2
1012157	3
1012157	4
1012157	6
1012157	8
1012157	9
1012157	10
1012157	11
1012157	13
1012157	16
1012157	18
1012157	19
1012157	22
1012157	24
1005944	1
1005944	2
1005944	3
1005944	4
1005944	5
1005944	6
1005944	7
1005944	8
1005944	9
1005944	10
1005944	11
1005944	12
1005944	13
1005944	15
1005944	16
1005944	17
1005944	18
1005944	19
1005944	20
1005944	21
1005944	22
1005944	23
1005944	24
1005944	25
1005944	26
1005944	27
1005944	28
1005944	30
1019647	2
1019647	3
1019647	4
1019647	5
1019647	6
1019647	8
1019647	9
1019647	10
1019647	11
1019647	13
1019647	16
1019647	17
1019647	18
1019647	19
1019647	20
1019647	24
1019647	28
1020084	2
1020084	4
1020084	5
1020084	6
1020084	8
1020084	9
1020084	10
1020084	11
1020084	13
1020084	16
1020084	17
1020084	20
1020084	24
1003516	1
1003516	2
1003516	3
1003516	5
1003516	6
1003516	7
1003516	8
1003516	9
1003516	10
1003516	11
1003516	12
1003516	13
1003516	16
1003516	17
1003516	18
1003516	19
1003516	23
1003516	24
1003516	25
1003516	27
1003516	29
1003516	30
1020060	1
1020060	2
1020060	3
1020060	4
1020060	5
1020060	6
1020060	7
1020060	8
1020060	9
1020060	10
1020060	11
1020060	12
1020060	16
1020060	18
1020060	19
1020060	20
1020060	21
1020060	22
1020060	23
1020060	24
1020060	25
1020060	27
1020060	30
1019484	2
1019484	5
1019484	6
1019484	9
1019484	10
1019484	11
1019484	13
1019484	16
1019484	18
1019484	22
1019484	24
1019096	1
1019096	4
1019096	5
1019096	6
1019096	9
1019096	10
1019096	11
1019096	12
1019096	16
1019096	17
1019096	18
1019096	19
1019096	22
1019096	24
1019096	25
1019096	26
1019096	28
1019350	2
1019350	3
1019350	4
1019350	5
1019350	6
1019350	10
1019350	11
1019350	12
1019350	16
1019350	17
1019350	18
1019350	19
1019350	22
1019350	23
1019350	24
1019350	25
1019350	26
1019350	27
1019350	28
1000431	1
1000431	2
1000431	3
1000431	4
1000431	5
1000431	6
1000431	7
1000431	8
1000431	9
1000431	10
1000431	11
1000431	12
1000431	13
1000431	15
1000431	16
1000431	17
1000431	18
1000431	19
1000431	20
1000431	22
1000431	24
1000431	25
1000431	26
1000431	27
1000431	28
1021359	1
1021359	2
1021359	3
1021359	5
1021359	6
1021359	7
1021359	8
1021359	9
1021359	10
1021359	11
1021359	12
1021359	13
1021359	17
1021359	18
1021359	22
1021359	24
1021359	26
1021359	27
1021733	2
1021733	5
1021733	6
1021733	9
1021733	10
1021733	12
1021733	13
1021733	16
1021733	17
1021733	18
1021733	22
1021733	24
1021733	27
1021732	1
1021732	2
1021732	3
1021732	4
1021732	5
1021732	6
1021732	7
1021732	8
1021732	9
1021732	10
1021732	11
1021732	12
1021732	13
1021732	17
1021732	18
1021732	19
1021732	22
1021732	24
1021732	26
1021732	27
1019662	2
1019662	3
1019662	4
1019662	5
1019662	6
1019662	8
1019662	9
1019662	10
1019662	11
1019662	12
1019662	13
1019662	15
1019662	16
1019662	17
1019662	18
1019662	19
1019662	22
1019662	24
1019662	27
1019662	30
1019904	2
1019904	3
1019904	5
1019904	6
1019904	7
1019904	8
1019904	9
1019904	10
1019904	11
1019904	18
1019904	22
1019904	23
1019904	24
1019904	29
1019222	1
1019222	2
1019222	4
1019222	5
1019222	6
1019222	8
1019222	9
1019222	10
1019222	11
1019222	13
1019222	15
1019222	16
1019222	17
1019222	18
1019222	19
1019222	22
1019222	23
1019222	24
1019222	28
1019222	30
1019495	2
1019495	4
1019495	5
1019495	6
1019495	7
1019495	8
1019495	9
1019495	10
1019495	11
1019495	13
1019495	15
1019495	16
1019495	17
1019495	18
1019495	19
1019495	20
1019495	21
1019495	22
1019495	24
1019495	25
1019495	28
1020068	2
1020068	3
1020068	4
1020068	5
1020068	6
1020068	7
1020068	8
1020068	9
1020068	10
1020068	11
1020068	12
1020068	15
1020068	16
1020068	17
1020068	20
1020068	22
1020068	23
1020068	24
1020068	25
1020068	26
1020068	27
1020068	30
1009810	1
1009810	2
1009810	3
1009810	4
1009810	5
1009810	6
1009810	7
1009810	8
1009810	9
1009810	10
1009810	11
1009810	12
1009810	13
1009810	17
1009810	19
1009810	21
1009810	22
1009810	24
1009810	27
1009810	28
1021627	1
1021627	2
1021627	3
1021627	4
1021627	5
1021627	6
1021627	7
1021627	8
1021627	9
1021627	10
1021627	11
1021627	13
1021627	15
1021627	16
1021627	17
1021627	18
1021627	19
1021627	20
1021627	21
1021627	22
1021627	23
1021627	24
1021627	26
1021627	27
1021627	28
1021627	30
1001245	2
1001245	4
1001245	5
1001245	6
1001245	8
1001245	9
1001245	10
1001245	11
1001245	12
1001245	13
1001245	15
1001245	16
1001245	17
1001245	18
1001245	19
1001245	20
1001245	22
1001245	24
1001245	28
1002984	2
1002984	5
1002984	6
1002984	9
1002984	10
1002984	11
1002984	13
1002984	15
1002984	16
1002984	19
1002984	20
1002984	22
1002984	24
1002984	25
1002984	27
1005086	1
1005086	2
1005086	3
1005086	5
1005086	6
1005086	8
1005086	9
1005086	10
1005086	11
1005086	12
1005086	13
1005086	15
1005086	16
1005086	17
1005086	18
1005086	19
1005086	20
1005086	21
1005086	22
1005086	23
1005086	24
1005086	25
1005086	27
1005086	28
1005086	30
1018033	1
1018033	2
1018033	5
1018033	6
1018033	8
1018033	9
1018033	10
1018033	11
1018033	13
1018033	17
1018033	18
1018033	19
1018033	21
1018033	24
1018033	26
1018032	1
1018032	2
1018032	4
1018032	5
1018032	6
1018032	7
1018032	8
1018032	9
1018032	10
1018032	11
1018032	13
1018032	16
1018032	17
1018032	18
1018032	19
1018032	22
1018032	23
1018032	24
1018032	25
1018032	26
1018032	27
1018032	28
1021450	2
1021450	3
1021450	4
1021450	5
1021450	6
1021450	8
1021450	9
1021450	10
1021450	11
1021450	12
1021450	13
1021450	15
1021450	16
1021450	17
1021450	18
1021450	19
1021450	20
1021450	21
1021450	22
1021450	24
1021450	28
1018330	1
1018330	2
1018330	3
1018330	4
1018330	5
1018330	6
1018330	7
1018330	8
1018330	9
1018330	10
1018330	11
1018330	12
1018330	13
1018330	15
1018330	16
1018330	17
1018330	18
1018330	19
1018330	21
1018330	22
1018330	24
1018330	26
1018330	27
1018330	28
1018330	30
1021225	1
1021225	2
1021225	3
1021225	5
1021225	6
1021225	7
1021225	8
1021225	9
1021225	10
1021225	11
1021225	15
1021225	17
1021225	20
1021225	22
1021225	24
1021225	25
1021225	26
1021225	27
1021225	29
1019789	1
1019789	2
1019789	3
1019789	4
1019789	5
1019789	9
1019789	10
1019789	11
1019789	13
1019789	15
1019789	18
1019789	19
1019789	21
1019789	22
1019789	24
1019789	25
1019789	26
1021329	2
1021329	4
1021329	5
1021329	6
1021329	9
1021329	10
1021329	11
1021329	12
1021329	15
1021329	16
1021329	18
1021329	19
1021329	22
1021329	24
1021329	30
1000559	2
1000559	4
1000559	5
1000559	6
1000559	8
1000559	9
1000559	11
1000559	16
1000559	18
1000559	19
1000559	24
1000559	30
1021534	1
1021534	2
1021534	4
1021534	5
1021534	6
1021534	8
1021534	9
1021534	10
1021534	11
1021534	12
1021534	13
1021534	15
1021534	16
1021534	17
1021534	18
1021534	19
1021534	20
1021534	21
1021534	22
1021534	23
1021534	24
1021534	26
1021534	27
1021534	28
1019396	2
1019396	4
1019396	5
1019396	6
1019396	10
1019396	11
1019396	13
1019396	18
1019396	19
1019126	1
1019126	2
1019126	3
1019126	5
1019126	6
1019126	9
1019126	11
1019126	18
1019126	19
1019126	24
1019126	28
1021528	1
1021528	2
1021528	3
1021528	4
1021528	5
1021528	6
1021528	8
1021528	9
1021528	10
1021528	11
1021528	12
1021528	13
1021528	15
1021528	16
1021528	17
1021528	18
1021528	19
1021528	22
1021528	24
1021528	27
1021528	28
1021528	30
1021530	2
1021530	3
1021530	4
1021530	6
1021530	8
1021530	9
1021530	10
1021530	11
1021530	13
1021530	17
1021530	18
1021530	19
1021530	22
1021530	23
1021530	24
1021530	25
1021530	26
1021530	27
1021530	28
1021529	2
1021529	3
1021529	4
1021529	6
1021529	8
1021529	9
1021529	10
1021529	11
1021529	12
1021529	13
1021529	15
1021529	17
1021529	18
1021529	19
1021529	21
1021529	22
1021529	23
1021529	24
1021529	25
1021529	26
1021529	27
1021529	28
1021529	30
1019044	1
1019044	2
1019044	3
1019044	4
1019044	5
1019044	6
1019044	8
1019044	9
1019044	10
1019044	11
1019044	13
1019044	16
1019044	17
1019044	18
1019044	19
1019044	24
1019044	30
1019076	1
1019076	2
1019076	5
1019076	6
1019076	8
1019076	9
1019076	10
1019076	11
1019076	12
1019076	13
1019076	16
1019076	17
1019076	19
1019076	24
1019076	27
1021338	1
1021338	2
1021338	3
1021338	4
1021338	5
1021338	6
1021338	7
1021338	8
1021338	9
1021338	10
1021338	11
1021338	12
1021338	13
1021338	15
1021338	16
1021338	17
1021338	18
1021338	19
1021338	20
1021338	21
1021338	22
1021338	23
1021338	24
1021338	25
1021338	26
1021338	27
1021338	28
1021338	30
1021521	2
1021521	4
1021521	6
1021521	9
1021521	11
1021521	15
1021521	24
1012081	1
1012081	2
1012081	3
1012081	5
1012081	6
1012081	8
1012081	9
1012081	11
1012081	12
1012081	13
1012081	16
1012081	17
1012081	18
1012081	19
1012081	22
1012081	23
1012081	24
1012081	26
1021582	2
1021582	4
1021582	6
1021582	9
1021582	10
1021582	11
1021582	16
1021582	18
1021582	19
1021582	20
1021582	21
1021582	24
1001604	2
1001604	3
1001604	4
1001604	5
1001604	6
1001604	8
1001604	9
1001604	10
1001604	11
1001604	16
1001604	18
1001604	22
1001604	24
1001604	27
1020029	1
1020029	2
1020029	4
1020029	5
1020029	6
1020029	8
1020029	9
1020029	10
1020029	11
1020029	15
1020029	16
1020029	18
1020029	19
1020029	22
1020029	24
1020029	27
1003335	2
1003335	3
1003335	4
1003335	5
1003335	6
1003335	7
1003335	8
1003335	9
1003335	10
1003335	11
1003335	13
1003335	18
1003335	19
1003335	22
1003335	24
1003335	25
1003335	26
1003335	27
1019871	9
1000436	2
1000436	4
1000436	6
1000436	8
1000436	9
1000436	10
1000436	11
1000436	13
1000436	15
1000436	16
1000436	17
1000436	18
1000436	19
1000436	20
1000436	22
1000436	24
1000436	26
1000436	28
1021540	1
1021540	2
1021540	3
1021540	5
1021540	6
1021540	8
1021540	9
1021540	10
1021540	11
1021540	12
1021540	13
1021540	16
1021540	17
1021540	18
1021540	19
1021540	22
1021540	24
1021540	26
1021540	28
1021265	2
1021265	3
1021265	4
1021265	5
1021265	6
1021265	8
1021265	9
1021265	10
1021265	11
1021265	12
1021265	16
1021265	19
1021265	21
1021265	24
1021265	27
1021443	2
1021443	3
1021443	4
1021443	5
1021443	6
1021443	8
1021443	9
1021443	10
1021443	11
1021443	12
1021443	13
1021443	16
1021443	17
1021443	18
1021443	19
1021443	21
1021443	22
1021443	23
1021443	24
1019617	2
1019617	5
1019617	6
1019617	7
1019617	8
1019617	9
1019617	10
1019617	11
1019617	13
1019617	15
1019617	17
1019617	18
1019617	19
1019617	21
1019617	22
1019617	24
1019617	26
1019617	27
1019617	28
1019617	30
1019874	9
1019874	24
1020102	2
1020102	4
1020102	9
1020102	10
1020102	11
1020102	19
1020102	23
1020102	24
1018735	2
1018735	4
1018735	5
1018735	6
1018735	7
1018735	8
1018735	9
1018735	10
1018735	11
1018735	13
1018735	16
1018735	17
1018735	18
1018735	19
1018735	20
1018735	22
1018735	24
1018735	30
1019875	9
1019875	24
1020097	2
1020097	4
1020097	5
1020097	6
1020097	9
1020097	10
1020097	11
1020097	12
1020097	13
1020097	17
1020097	19
1020097	27
1021630	2
1021630	4
1021630	5
1021630	8
1021630	9
1021630	10
1021630	11
1021630	18
1021630	19
1021630	22
1021630	24
1021630	28
1019853	1
1019853	2
1019853	3
1019853	4
1019853	5
1019853	6
1019853	7
1019853	8
1019853	9
1019853	10
1019853	11
1019853	12
1019853	13
1019853	16
1019853	17
1019853	18
1019853	19
1019853	21
1019853	22
1019853	24
1019853	26
1019853	27
1019400	1
1019400	2
1019400	3
1019400	5
1019400	6
1019400	8
1019400	9
1019400	10
1019400	11
1019400	13
1019400	16
1019400	17
1019400	18
1019400	19
1019400	21
1019400	22
1019400	24
1019400	25
1019400	27
1019400	30
1010607	1
1010607	2
1010607	3
1010607	4
1010607	5
1010607	6
1010607	8
1010607	9
1010607	10
1010607	11
1010607	12
1010607	13
1010607	16
1010607	17
1010607	18
1010607	19
1010607	20
1010607	21
1010607	22
1010607	24
1010607	27
1010607	28
1011902	2
1011902	4
1011902	5
1011902	8
1011902	9
1011902	10
1011902	11
1011902	12
1011902	16
1011902	19
1011902	24
1021363	1
1021363	2
1021363	4
1021363	5
1021363	9
1021363	10
1021363	11
1021363	12
1021363	19
1008140	1
1008140	2
1008140	4
1008140	5
1008140	6
1008140	8
1008140	9
1008140	10
1008140	11
1008140	15
1008140	16
1008140	18
1008140	19
1008140	20
1008140	24
1002064	2
1002064	4
1002064	5
1002064	6
1002064	8
1002064	9
1002064	10
1002064	11
1002064	12
1002064	13
1002064	16
1002064	19
1002064	24
1011363	2
1011363	4
1011363	5
1011363	6
1011363	9
1011363	10
1011363	11
1011363	12
1011363	19
1011363	24
1001316	1
1001316	2
1001316	4
1001316	5
1001316	8
1001316	9
1001316	10
1001316	11
1001316	12
1001316	13
1001316	16
1001316	19
1001316	22
1001316	24
1001316	30
1001533	1
1001533	2
1001533	3
1001533	4
1001533	5
1001533	6
1001533	7
1001533	8
1001533	9
1001533	10
1001533	11
1001533	13
1001533	15
1001533	17
1001533	18
1001533	19
1001533	22
1001533	24
1001533	27
1018644	1
1018644	2
1018644	4
1018644	5
1018644	6
1018644	8
1018644	9
1018644	11
1018644	13
1018644	15
1018644	16
1018644	17
1018644	19
1018644	20
1018644	24
1021403	2
1021403	3
1021403	4
1021403	5
1021403	6
1021403	8
1021403	9
1021403	10
1021403	11
1021403	16
1021403	17
1021403	18
1021403	19
1021403	22
1021403	24
1021403	27
1005183	1
1005183	2
1005183	3
1005183	4
1005183	5
1005183	6
1005183	8
1005183	9
1005183	10
1005183	11
1005183	13
1005183	16
1005183	17
1005183	18
1005183	19
1005183	22
1005183	24
1005183	26
1005183	27
1005183	30
1019005	2
1019005	3
1019005	4
1019005	8
1019005	9
1019005	10
1019005	11
1019005	12
1019005	19
1019005	21
1019005	24
1021628	1
1021628	2
1021628	3
1021628	4
1021628	5
1021628	6
1021628	7
1021628	8
1021628	9
1021628	11
1021628	12
1021628	13
1021628	15
1021628	17
1021628	18
1021628	19
1021628	24
1021628	27
1021628	28
1019168	5
1019168	6
1019168	9
1019168	10
1019168	11
1019168	16
1019168	18
1019168	24
1019168	26
1019169	9
1019169	10
1019169	11
1019169	16
1019169	24
1019967	2
1019967	9
1019967	10
1019967	11
1019967	13
1019967	16
1019967	19
1019967	24
1021322	1
1021322	2
1021322	5
1021322	9
1021322	10
1021322	19
1021322	24
1021322	26
1021322	27
1010406	1
1010406	2
1010406	3
1010406	4
1010406	5
1010406	6
1010406	7
1010406	8
1010406	9
1010406	10
1010406	11
1010406	13
1010406	15
1010406	16
1010406	17
1010406	18
1010406	19
1010406	21
1010406	22
1010406	24
1010406	25
1010406	26
1010406	27
1010406	28
1010406	30
1012494	2
1012494	5
1012494	6
1012494	8
1012494	9
1012494	10
1012494	11
1012494	13
1012494	15
1012494	17
1012494	18
1012494	19
1012494	24
1012494	27
1020196	1
1020196	2
1020196	3
1020196	5
1020196	6
1020196	7
1020196	8
1020196	9
1020196	10
1020196	11
1020196	15
1020196	17
1020196	18
1020196	19
1020196	20
1020196	23
1020196	24
1020196	25
1020196	26
1020196	27
1019765	1
1019765	2
1019765	5
1019765	6
1019765	7
1019765	9
1019765	10
1019765	11
1019765	13
1019765	17
1019765	18
1019765	22
1019765	24
1019765	28
1005949	2
1005949	3
1005949	4
1005949	5
1005949	6
1005949	8
1005949	9
1005949	10
1005949	11
1005949	13
1005949	15
1005949	16
1005949	17
1005949	18
1005949	19
1005949	20
1005949	22
1005949	24
1005949	25
1005949	28
1019338	2
1019338	4
1019338	5
1019338	6
1019338	8
1019338	9
1019338	10
1019338	11
1019338	12
1019338	13
1019338	16
1019338	17
1019338	18
1019338	19
1019338	20
1019338	22
1019338	24
1019338	26
1019338	27
1019338	30
1019339	2
1019339	4
1019339	6
1019339	8
1019339	9
1019339	10
1019339	11
1019339	12
1019339	13
1019339	17
1019339	18
1019339	19
1019339	22
1019339	24
1019339	26
1019339	30
1019591	2
1019591	3
1019591	4
1019591	5
1019591	6
1019591	7
1019591	8
1019591	9
1019591	10
1019591	13
1019591	16
1019591	18
1019591	19
1019591	21
1019591	22
1019591	24
1021508	2
1021508	4
1021508	5
1021508	6
1021508	8
1021508	9
1021508	10
1021508	11
1021508	16
1021508	18
1021508	19
1021508	22
1021508	24
1021508	26
1021508	28
1011037	2
1011037	4
1011037	5
1011037	6
1011037	8
1011037	9
1011037	10
1011037	11
1011037	13
1011037	16
1011037	18
1011037	19
1011037	21
1011037	22
1011037	24
1011037	28
1012163	1
1012163	2
1012163	3
1012163	4
1012163	5
1012163	6
1012163	8
1012163	9
1012163	10
1012163	11
1012163	13
1012163	16
1012163	17
1012163	18
1012163	19
1012163	20
1012163	22
1012163	24
1012163	27
1011829	1
1011829	2
1011829	3
1011829	5
1011829	6
1011829	7
1011829	8
1011829	9
1011829	10
1011829	11
1011829	12
1011829	13
1011829	17
1011829	18
1011829	19
1011829	21
1011829	22
1011829	24
1011829	26
1011829	27
1011829	30
1018396	1
1018396	2
1018396	3
1018396	4
1018396	5
1018396	6
1018396	7
1018396	8
1018396	9
1018396	10
1018396	11
1018396	12
1018396	13
1018396	15
1018396	16
1018396	17
1018396	18
1018396	19
1018396	20
1018396	22
1018396	23
1018396	24
1018396	25
1018396	28
1018396	30
1018563	1
1018563	2
1018563	3
1018563	4
1018563	5
1018563	6
1018563	7
1018563	8
1018563	9
1018563	10
1018563	11
1018563	12
1018563	13
1018563	17
1018563	18
1018563	19
1018563	22
1018563	23
1018563	24
1018563	25
1018563	27
1018563	30
1019932	2
1019932	4
1019932	5
1019932	9
1019932	10
1019932	11
1019932	18
1019932	24
1020098	2
1020098	4
1020098	5
1020098	8
1020098	9
1020098	10
1020098	11
1020098	13
1020098	16
1020098	17
1020098	19
1020098	23
1020098	24
1019372	1
1019372	2
1019372	5
1019372	9
1019372	10
1019372	11
1019372	12
1019372	13
1019372	16
1019372	19
1019372	20
1019372	24
1019440	2
1019440	4
1019440	5
1019440	6
1019440	9
1019440	10
1019440	11
1019440	16
1019440	19
1019440	24
1018092	2
1018092	3
1018092	4
1018092	5
1018092	6
1018092	7
1018092	9
1018092	11
1018092	13
1018092	17
1018092	18
1018092	19
1018092	21
1018092	22
1018092	24
1018313	1
1018313	2
1018313	3
1018313	5
1018313	6
1018313	7
1018313	8
1018313	9
1018313	10
1018313	11
1018313	13
1018313	15
1018313	16
1018313	17
1018313	18
1018313	19
1018313	21
1018313	22
1018313	24
1018313	25
1018313	26
1018313	27
1018313	30
1018316	1
1018316	2
1018316	3
1018316	4
1018316	6
1018316	7
1018316	8
1018316	9
1018316	10
1018316	11
1018316	12
1018316	13
1018316	15
1018316	17
1018316	18
1018316	19
1018316	22
1018316	23
1018316	24
1018316	25
1018316	26
1018316	27
1018316	30
1020101	1
1020101	2
1020101	5
1020101	6
1020101	9
1020101	10
1020101	11
1020101	13
1020101	16
1020101	17
1020101	20
1020101	24
1006833	2
1006833	4
1006833	6
1006833	8
1006833	9
1006833	10
1006833	11
1006833	16
1006833	18
1006833	19
1006833	21
1006833	24
1006833	27
1019318	2
1019318	4
1019318	5
1019318	6
1019318	8
1019318	9
1019318	10
1019318	11
1019318	13
1019318	16
1019318	17
1019318	19
1019318	24
1019318	27
1019693	2
1019693	4
1019693	5
1019693	6
1019693	8
1019693	9
1019693	10
1019693	11
1019693	13
1019693	16
1019693	17
1019693	18
1019693	19
1019693	21
1019693	24
1019693	27
1019693	30
1018394	2
1018394	4
1018394	5
1018394	6
1018394	8
1018394	9
1018394	10
1018394	11
1018394	13
1018394	15
1018394	16
1018394	17
1018394	18
1018394	19
1018394	20
1018394	23
1018394	24
1018394	25
1018394	30
1001526	2
1001526	4
1001526	5
1001526	6
1001526	8
1001526	9
1001526	11
1001526	19
1001526	24
1019165	2
1019165	4
1019165	5
1019165	6
1019165	8
1019165	9
1019165	10
1019165	11
1019165	12
1019165	13
1019165	16
1019165	17
1019165	18
1019165	19
1019165	22
1019165	24
1019165	28
1020096	2
1020096	5
1020096	6
1020096	8
1020096	9
1020096	10
1020096	11
1020096	12
1020096	13
1020096	17
1020096	19
1020096	24
1020096	27
1020099	2
1020099	5
1020099	6
1020099	8
1020099	9
1020099	10
1020099	11
1020099	13
1020099	17
1020099	24
1020099	27
1019205	1
1019205	2
1019205	3
1019205	4
1019205	5
1019205	6
1019205	7
1019205	8
1019205	9
1019205	10
1019205	11
1019205	12
1019205	13
1019205	16
1019205	17
1019205	18
1019205	19
1019205	20
1019205	21
1019205	22
1019205	23
1019205	24
1019205	26
1019205	27
1019205	28
1019205	30
1021248	1
1021248	2
1021248	4
1021248	5
1021248	6
1021248	7
1021248	8
1021248	9
1021248	10
1021248	11
1021248	12
1021248	13
1021248	15
1021248	17
1021248	18
1021248	19
1021248	21
1021248	22
1021248	24
1021248	25
1021248	26
1021248	27
1021248	28
1021248	30
1018227	1
1018227	2
1018227	3
1018227	5
1018227	6
1018227	7
1018227	8
1018227	9
1018227	10
1018227	11
1018227	12
1018227	13
1018227	15
1018227	16
1018227	17
1018227	18
1018227	19
1018227	22
1018227	24
1018227	25
1018227	26
1018227	28
1002407	1
1002407	2
1002407	3
1002407	4
1002407	5
1002407	6
1002407	8
1002407	9
1002407	10
1002407	11
1002407	12
1002407	13
1002407	16
1002407	17
1002407	18
1002407	19
1002407	21
1002407	22
1002407	23
1002407	24
1002407	26
1002407	27
1002407	30
1011075	1
1011075	2
1011075	3
1011075	4
1011075	6
1011075	8
1011075	9
1011075	10
1011075	11
1011075	12
1011075	13
1011075	17
1011075	18
1011075	19
1011075	22
1011075	24
1011075	26
1011075	30
1020113	2
1020113	4
1020113	6
1020113	9
1020113	10
1020113	11
1020113	12
1020113	16
1020113	19
1020113	24
1018556	2
1018556	4
1018556	5
1018556	6
1018556	8
1018556	9
1018556	10
1018556	11
1018556	16
1018556	18
1018556	19
1018556	21
1018556	24
1018556	27
1019146	1
1019146	2
1019146	3
1019146	4
1019146	5
1019146	6
1019146	7
1019146	9
1019146	11
1019146	18
1019146	19
1019146	24
1019146	25
1018756	2
1018756	3
1018756	4
1018756	6
1018756	8
1018756	9
1018756	10
1018756	11
1018756	13
1018756	15
1018756	18
1018756	19
1018756	20
1018756	22
1018756	23
1018756	24
1005483	1
1005483	2
1005483	3
1005483	4
1005483	5
1005483	6
1005483	8
1005483	9
1005483	10
1005483	11
1005483	12
1005483	13
1005483	16
1005483	17
1005483	19
1005483	24
1005483	27
1019905	9
1019905	10
1019905	24
1019257	2
1019257	4
1019257	5
1019257	6
1019257	8
1019257	9
1019257	10
1019257	11
1019257	13
1019257	18
1019257	19
1019257	22
1019257	24
1019257	28
1019984	5
1019984	9
1019984	10
1019984	16
1019984	19
1019984	24
1019794	2
1019794	4
1019794	8
1019794	9
1019794	11
1019794	18
1019794	19
1019794	24
1019794	27
1019527	1
1019527	2
1019527	3
1019527	4
1019527	5
1019527	6
1019527	7
1019527	8
1019527	9
1019527	10
1019527	11
1019527	13
1019527	15
1019527	16
1019527	17
1019527	18
1019527	19
1019527	20
1019527	21
1019527	22
1019527	23
1019527	24
1019527	25
1019527	27
1019527	28
1019527	30
1021210	1
1021210	2
1021210	3
1021210	5
1021210	6
1021210	7
1021210	9
1021210	11
1021210	13
1021210	16
1021210	17
1021210	22
1021210	24
1021210	27
1021736	2
1021736	4
1021736	5
1021736	6
1021736	8
1021736	9
1021736	10
1021736	11
1021736	13
1021736	16
1021736	17
1021736	18
1021736	19
1021736	22
1021736	24
1021736	25
1021736	26
1021736	27
1021736	28
1018891	2
1018891	3
1018891	4
1018891	6
1018891	7
1018891	8
1018891	9
1018891	10
1018891	11
1018891	13
1018891	16
1018891	17
1018891	19
1018891	20
1018891	24
1018891	29
1021515	2
1021515	5
1021515	6
1021515	9
1021515	10
1021515	11
1021515	24
1021262	1
1021262	2
1021262	3
1021262	4
1021262	5
1021262	6
1021262	7
1021262	8
1021262	9
1021262	10
1021262	11
1021262	12
1021262	16
1021262	17
1021262	18
1021262	19
1021262	20
1021262	21
1021262	22
1021262	24
1021262	27
1021262	28
1021262	30
1019906	2
1019906	3
1019906	5
1019906	6
1019906	8
1019906	9
1019906	10
1019906	11
1019906	18
1019906	22
1019906	23
1019906	24
1019906	29
1019727	2
1019727	3
1019727	4
1019727	5
1019727	8
1019727	9
1019727	10
1019727	11
1019727	13
1019727	18
1019727	19
1019727	20
1019727	22
1019727	24
1019727	28
1017968	2
1017968	3
1017968	4
1017968	5
1017968	6
1017968	8
1017968	9
1017968	10
1017968	11
1017968	12
1017968	13
1017968	17
1017968	18
1017968	19
1017968	22
1017968	24
1017968	27
1017968	30
1008607	2
1008607	3
1008607	4
1008607	5
1008607	6
1008607	7
1008607	8
1008607	9
1008607	10
1008607	11
1008607	12
1008607	13
1008607	16
1008607	17
1008607	21
1008607	22
1008607	23
1008607	24
1008607	25
1008607	27
1008607	30
1021311	1
1021311	2
1021311	3
1021311	5
1021311	6
1021311	8
1021311	9
1021311	10
1021311	11
1021311	12
1021311	13
1021311	16
1021311	17
1021311	18
1021311	19
1021311	20
1021311	21
1021311	22
1021311	24
1021311	25
1021311	27
1021311	28
1021311	30
1019218	2
1019218	4
1019218	6
1019218	8
1019218	9
1019218	10
1019218	11
1019218	15
1019218	16
1019218	18
1019218	19
1019218	22
1019218	23
1019218	24
1019218	26
1019218	28
1008953	1
1008953	2
1008953	4
1008953	5
1008953	6
1008953	8
1008953	9
1008953	10
1008953	11
1008953	12
1008953	13
1008953	16
1008953	17
1008953	18
1008953	19
1008953	22
1008953	23
1008953	24
1008953	26
1008953	27
1000843	1
1000843	2
1000843	3
1000843	5
1000843	6
1000843	7
1000843	8
1000843	9
1000843	10
1000843	11
1000843	13
1000843	15
1000843	16
1000843	17
1000843	18
1000843	19
1000843	20
1000843	23
1000843	24
1000843	26
1000843	27
1019492	1
1019492	2
1019492	3
1019492	5
1019492	6
1019492	7
1019492	8
1019492	9
1019492	10
1019492	11
1019492	13
1019492	15
1019492	16
1019492	17
1019492	18
1019492	22
1019492	24
1019492	26
1019492	28
1021524	2
1021524	4
1021524	5
1021524	6
1021524	8
1021524	9
1021524	10
1021524	11
1021524	13
1021524	17
1021524	18
1021524	19
1021524	22
1021524	24
1019965	1
1019965	2
1019965	3
1019965	4
1019965	5
1019965	6
1019965	7
1019965	8
1019965	9
1019965	10
1019965	11
1019965	12
1019965	13
1019965	15
1019965	16
1019965	17
1019965	18
1019965	19
1019965	21
1019965	22
1019965	23
1019965	24
1019965	26
1019965	27
1019965	28
1019965	29
1019965	30
1021728	1
1021728	4
1021728	5
1021728	6
1021728	8
1021728	9
1021728	10
1021728	11
1021728	13
1021728	19
1021728	20
1021728	22
1021728	24
1021728	30
1002567	1
1002567	2
1002567	4
1002567	5
1002567	6
1002567	8
1002567	9
1002567	10
1002567	11
1002567	15
1002567	16
1002567	19
1002567	23
1002567	24
1001362	1
1001362	2
1001362	3
1001362	4
1001362	5
1001362	6
1001362	7
1001362	8
1001362	9
1001362	10
1001362	11
1001362	15
1001362	16
1001362	17
1001362	19
1001362	20
1001362	22
1001362	24
1001362	25
1001362	28
1001362	30
1021238	1
1021238	2
1021238	5
1021238	6
1021238	7
1021238	8
1021238	9
1021238	10
1021238	11
1021238	13
1021238	15
1021238	16
1021238	17
1021238	18
1021238	19
1021238	21
1021238	22
1021238	24
1021238	25
1021238	26
1021238	27
1021238	28
1021238	29
1021238	30
1021614	2
1021614	9
1021614	24
1020089	2
1020089	5
1020089	6
1020089	9
1020089	10
1020089	11
1020089	16
1020089	24
1004927	2
1004927	3
1004927	4
1004927	6
1004927	7
1004927	8
1004927	9
1004927	10
1004927	11
1004927	18
1004927	19
1004927	22
1004927	24
1004927	26
1004927	28
1019922	2
1019922	4
1019922	5
1019922	6
1019922	8
1019922	9
1019922	10
1019922	11
1019922	16
1019922	19
1019922	20
1019922	21
1019922	22
1019922	24
1019978	1
1019978	2
1019978	5
1019978	6
1019978	8
1019978	9
1019978	10
1019978	13
1019978	17
1019978	20
1019978	24
1018263	1
1018263	2
1018263	3
1018263	4
1018263	5
1018263	6
1018263	7
1018263	8
1018263	9
1018263	10
1018263	11
1018263	12
1018263	13
1018263	17
1018263	18
1018263	19
1018263	21
1018263	22
1018263	23
1018263	24
1019980	2
1019980	4
1019980	5
1019980	9
1019980	10
1019980	11
1019980	12
1019980	16
1019980	18
1019980	19
1019980	24
1020188	1
1020188	2
1020188	3
1020188	4
1020188	5
1020188	6
1020188	7
1020188	8
1020188	9
1020188	10
1020188	11
1020188	13
1020188	15
1020188	17
1020188	18
1020188	19
1020188	20
1020188	21
1020188	22
1020188	23
1020188	24
1020188	26
1020188	27
1020188	29
1020188	30
1018459	1
1018459	2
1018459	4
1018459	5
1018459	6
1018459	8
1018459	9
1018459	10
1018459	11
1018459	13
1018459	16
1018459	17
1018459	18
1018459	21
1018459	24
1019997	1
1019997	2
1019997	4
1019997	5
1019997	6
1019997	7
1019997	8
1019997	9
1019997	10
1019997	11
1019997	13
1019997	15
1019997	16
1019997	18
1019997	19
1019997	20
1019997	22
1019997	24
1019997	28
1020160	1
1020160	2
1020160	3
1020160	5
1020160	6
1020160	7
1020160	8
1020160	9
1020160	10
1020160	11
1020160	13
1020160	15
1020160	17
1020160	18
1020160	22
1020160	23
1020160	24
1020160	25
1020160	26
1020160	27
1020183	1
1020183	2
1020183	3
1020183	5
1020183	6
1020183	7
1020183	8
1020183	9
1020183	10
1020183	11
1020183	13
1020183	15
1020183	17
1020183	18
1020183	19
1020183	20
1020183	22
1020183	24
1020183	26
1020183	27
1002674	1
1002674	2
1002674	3
1002674	5
1002674	6
1002674	7
1002674	8
1002674	9
1002674	10
1002674	11
1002674	13
1002674	15
1002674	17
1002674	18
1002674	19
1002674	20
1002674	22
1002674	23
1002674	24
1002674	25
1002674	26
1002674	27
1002674	30
1021575	1
1021575	2
1021575	4
1021575	5
1021575	8
1021575	9
1021575	10
1021575	11
1021575	19
1021575	24
1020117	2
1020117	8
1020117	9
1020117	11
1020117	24
1020118	2
1020118	5
1020118	6
1020118	8
1020118	9
1020118	11
1020118	22
1020118	24
1020118	25
1020119	2
1020119	5
1020119	6
1020119	8
1020119	9
1020119	11
1020119	24
1020184	1
1020184	2
1020184	3
1020184	4
1020184	5
1020184	6
1020184	7
1020184	8
1020184	9
1020184	10
1020184	11
1020184	13
1020184	15
1020184	17
1020184	18
1020184	19
1020184	20
1020184	21
1020184	22
1020184	23
1020184	24
1020184	26
1020184	27
1020184	28
1020184	29
1020184	30
1009034	1
1009034	2
1009034	3
1009034	4
1009034	5
1009034	6
1009034	8
1009034	9
1009034	10
1009034	11
1009034	12
1009034	13
1009034	16
1009034	17
1009034	18
1009034	19
1009034	20
1009034	21
1009034	22
1009034	24
1009034	26
1009034	28
1009034	30
1019810	1
1019810	2
1019810	3
1019810	5
1019810	6
1019810	8
1019810	9
1019810	10
1019810	11
1019810	12
1019810	18
1019810	19
1019810	20
1019810	22
1019810	23
1019810	24
1019810	26
1019810	27
1019810	28
1019810	30
1021202	2
1021202	4
1021202	6
1021202	8
1021202	9
1021202	11
1021202	13
1021202	16
1021202	17
1021202	18
1021202	19
1021202	21
1021202	24
1012038	1
1012038	2
1012038	3
1012038	4
1012038	5
1012038	6
1012038	7
1012038	8
1012038	9
1012038	10
1012038	13
1012038	15
1012038	17
1012038	18
1012038	19
1012038	20
1012038	22
1012038	23
1012038	24
1012038	25
1012038	26
1019772	1
1019772	2
1019772	3
1019772	4
1019772	5
1019772	6
1019772	8
1019772	9
1019772	10
1019772	11
1019772	12
1019772	13
1019772	16
1019772	17
1019772	18
1019772	19
1019772	22
1019772	24
1019772	25
1019772	26
1019772	27
1021435	2
1021435	3
1021435	4
1021435	5
1021435	6
1021435	8
1021435	9
1021435	10
1021435	11
1021435	12
1021435	13
1021435	15
1021435	16
1021435	17
1021435	18
1021435	19
1021435	20
1021435	22
1021435	24
1021435	27
1021435	28
1021294	1
1021294	2
1021294	3
1021294	4
1021294	5
1021294	6
1021294	7
1021294	8
1021294	9
1021294	10
1021294	11
1021294	12
1021294	13
1021294	16
1021294	17
1021294	18
1021294	19
1021294	20
1021294	22
1021294	23
1021294	24
1021294	26
1021294	27
1021294	28
1021294	29
1021294	30
1021655	2
1021655	4
1021655	5
1021655	6
1021655	8
1021655	9
1021655	10
1021655	11
1021655	12
1021655	13
1021655	15
1021655	16
1021655	17
1021655	18
1021655	19
1021655	22
1021655	24
1021655	27
1021655	28
1021655	30
1011930	2
1011930	4
1011930	5
1011930	6
1011930	8
1011930	9
1011930	11
1011930	17
1011930	19
1011930	24
1018359	2
1018359	5
1018359	6
1018359	8
1018359	9
1018359	10
1018359	11
1018359	15
1018359	16
1018359	18
1018359	22
1018359	24
1018359	25
1018359	26
1018359	28
1018359	29
1008450	1
1008450	2
1008450	3
1008450	5
1008450	6
1008450	8
1008450	9
1008450	10
1008450	11
1008450	15
1008450	16
1008450	17
1008450	20
1008450	24
1006651	1
1006651	2
1006651	3
1006651	5
1006651	6
1006651	7
1006651	8
1006651	9
1006651	10
1006651	11
1006651	13
1006651	15
1006651	16
1006651	17
1006651	18
1006651	19
1006651	21
1006651	22
1006651	24
1006651	28
1006651	30
1019417	2
1019417	3
1019417	6
1019417	8
1019417	9
1019417	10
1019417	11
1019417	17
1019417	18
1019417	19
1019417	22
1019417	24
1021269	1
1021269	2
1021269	3
1021269	4
1021269	5
1021269	6
1021269	7
1021269	8
1021269	9
1021269	10
1021269	11
1021269	13
1021269	15
1021269	17
1021269	18
1021269	19
1021269	20
1021269	21
1021269	22
1021269	24
1021269	25
1021269	27
1008322	1
1008322	2
1008322	4
1008322	6
1008322	8
1008322	9
1008322	10
1008322	11
1008322	16
1008322	18
1008322	24
1021213	1
1021213	2
1021213	4
1021213	5
1021213	6
1021213	7
1021213	8
1021213	9
1021213	10
1021213	11
1021213	13
1021213	15
1021213	16
1021213	17
1021213	18
1021213	19
1021213	20
1021213	22
1021213	24
1021213	26
1021213	28
1021213	30
1020071	2
1020071	6
1020071	9
1020071	10
1020071	11
1020071	17
1020071	24
1020074	2
1020074	8
1020074	9
1020074	10
1020074	11
1020074	17
1020074	19
1020074	24
1012093	2
1012093	4
1012093	5
1012093	6
1012093	7
1012093	8
1012093	9
1012093	10
1012093	11
1012093	13
1012093	16
1012093	17
1012093	19
1012093	20
1012093	22
1012093	24
1021740	1
1021740	2
1021740	3
1021740	4
1021740	5
1021740	6
1021740	7
1021740	8
1021740	9
1021740	10
1021740	11
1021740	17
1021740	18
1021740	19
1021740	22
1021740	24
1021740	26
1021740	27
1008276	5
1008276	6
1008276	8
1008276	9
1008276	10
1008276	11
1008276	24
1019159	2
1019159	4
1019159	5
1019159	6
1019159	8
1019159	9
1019159	11
1019159	13
1019159	18
1019159	19
1019159	20
1019159	24
1021242	2
1021242	4
1021242	5
1021242	6
1021242	8
1021242	9
1021242	10
1021242	11
1021242	16
1021242	18
1021242	19
1021242	24
1021242	27
1012484	2
1012484	4
1012484	5
1012484	6
1012484	8
1012484	9
1012484	10
1012484	11
1012484	13
1012484	15
1012484	16
1012484	17
1012484	18
1012484	19
1012484	20
1012484	22
1012484	23
1012484	24
1019842	1
1019842	2
1019842	3
1019842	4
1019842	5
1019842	6
1019842	7
1019842	8
1019842	9
1019842	10
1019842	11
1019842	12
1019842	13
1019842	16
1019842	17
1019842	18
1019842	19
1019842	22
1019842	23
1019842	24
1019842	25
1019842	26
1019842	27
1019842	30
1021362	2
1021362	4
1021362	6
1021362	8
1021362	9
1021362	10
1021362	11
1021362	12
1021362	13
1021362	16
1021362	17
1021362	18
1021362	19
1021362	21
1021362	24
1021362	28
1018734	2
1018734	3
1018734	4
1018734	6
1018734	8
1018734	9
1018734	10
1018734	11
1018734	13
1018734	17
1018734	18
1018734	19
1018734	21
1018734	22
1018734	24
1018734	26
1018734	27
1018734	28
1021226	1
1021226	6
1021226	8
1021226	9
1021226	10
1021226	11
1021226	15
1021226	24
1021226	26
1019907	8
1019907	9
1019907	24
1019618	2
1019618	4
1019618	6
1019618	8
1019618	9
1019618	10
1019618	11
1019618	13
1019618	16
1019618	19
1019618	21
1019618	22
1019618	24
1019618	30
1020142	2
1020142	3
1020142	5
1020142	6
1020142	7
1020142	8
1020142	9
1020142	10
1020142	11
1020142	13
1020142	16
1020142	17
1020142	18
1020142	19
1020142	20
1020142	22
1020142	24
1020142	26
1020142	27
1020141	2
1020141	3
1020141	5
1020141	6
1020141	7
1020141	8
1020141	9
1020141	10
1020141	11
1020141	13
1020141	16
1020141	17
1020141	18
1020141	19
1020141	20
1020141	22
1020141	24
1020141	26
1020141	27
1020058	1
1020058	2
1020058	3
1020058	4
1020058	5
1020058	7
1020058	8
1020058	9
1020058	10
1020058	11
1020058	15
1020058	16
1020058	18
1020058	19
1020058	20
1020058	22
1020058	24
1020058	26
1020058	27
1020057	1
1020057	2
1020057	4
1020057	5
1020057	7
1020057	8
1020057	9
1020057	10
1020057	11
1020057	15
1020057	18
1020057	19
1020057	22
1020057	24
1020057	26
1020057	27
1020056	1
1020056	2
1020056	4
1020056	5
1020056	7
1020056	8
1020056	9
1020056	10
1020056	11
1020056	15
1020056	16
1020056	18
1020056	19
1020056	20
1020056	22
1020056	24
1020056	26
1020056	27
1019225	2
1019225	3
1019225	4
1019225	5
1019225	6
1019225	7
1019225	8
1019225	9
1019225	10
1019225	16
1019225	18
1019225	19
1019225	20
1019225	22
1019225	24
1019225	25
1019225	30
1021267	1
1021267	2
1021267	4
1021267	5
1021267	6
1021267	8
1021267	9
1021267	10
1021267	11
1021267	12
1021267	13
1021267	16
1021267	17
1021267	18
1021267	21
1021267	24
1021564	1
1021564	2
1021564	4
1021564	5
1021564	6
1021564	8
1021564	9
1021564	10
1021564	11
1021564	12
1021564	13
1021564	16
1021564	17
1021564	18
1021564	19
1021564	21
1021564	22
1021564	24
1021564	27
1018886	2
1018886	3
1018886	4
1018886	5
1018886	6
1018886	7
1018886	8
1018886	9
1018886	10
1018886	11
1018886	12
1018886	13
1018886	16
1018886	17
1018886	19
1018886	22
1018886	24
1018886	26
1018886	27
1017995	2
1017995	4
1017995	9
1017995	10
1017995	16
1017995	18
1017995	19
1017995	22
1017995	24
1021741	1
1021741	2
1021741	5
1021741	6
1021741	7
1021741	9
1021741	10
1021741	13
1021741	17
1021741	18
1021741	19
1021741	22
1021741	24
1021741	30
1011689	2
1011689	3
1011689	4
1011689	5
1011689	6
1011689	7
1011689	8
1011689	9
1011689	10
1011689	11
1011689	12
1011689	13
1011689	15
1011689	16
1011689	17
1011689	18
1011689	19
1011689	20
1011689	21
1011689	22
1011689	23
1011689	24
1011689	25
1011689	26
1011689	27
1011689	28
1011689	30
1005834	1
1005834	2
1005834	3
1005834	5
1005834	6
1005834	7
1005834	8
1005834	9
1005834	10
1005834	11
1005834	12
1005834	13
1005834	16
1005834	17
1005834	19
1005834	20
1005834	21
1005834	22
1005834	24
1005834	26
1005834	27
1019881	9
1019881	24
1004754	2
1004754	3
1004754	4
1004754	5
1004754	6
1004754	8
1004754	9
1004754	10
1004754	11
1004754	12
1004754	13
1004754	16
1004754	17
1004754	18
1004754	19
1004754	22
1004754	24
1004754	26
1004754	27
1008606	2
1008606	4
1008606	6
1008606	7
1008606	9
1008606	10
1008606	11
1008606	12
1008606	17
1008606	19
1008606	22
1008606	24
1008606	27
1021310	1
1021310	2
1021310	3
1021310	5
1021310	6
1021310	7
1021310	9
1021310	10
1021310	11
1021310	13
1021310	16
1021310	17
1021310	18
1021310	19
1021310	20
1021310	21
1021310	22
1021310	24
1021310	27
1021310	28
1020128	1
1020128	2
1020128	3
1020128	4
1020128	5
1020128	6
1020128	7
1020128	8
1020128	9
1020128	10
1020128	11
1020128	13
1020128	16
1020128	17
1020128	18
1020128	19
1020128	20
1020128	21
1020128	22
1020128	23
1020128	24
1020128	25
1020128	26
1020128	27
1020128	29
1020129	1
1020129	2
1020129	3
1020129	5
1020129	6
1020129	8
1020129	9
1020129	10
1020129	11
1020129	13
1020129	15
1020129	16
1020129	17
1020129	18
1020129	22
1020129	23
1020129	24
1020129	25
1020129	26
1020129	27
1020127	1
1020127	2
1020127	4
1020127	5
1020127	6
1020127	9
1020127	10
1020127	11
1020127	18
1020127	22
1020127	24
1020127	26
1001763	1
1001763	2
1001763	6
1001763	9
1001763	10
1001763	11
1001763	13
1001763	15
1001763	16
1001763	23
1001763	24
1001763	27
1019104	2
1019104	5
1019104	9
1019104	13
1019104	24
1008409	2
1008409	3
1008409	5
1008409	6
1008409	8
1008409	9
1008409	10
1008409	11
1008409	12
1008409	13
1008409	17
1008409	18
1008409	24
1021237	4
1021237	5
1021237	8
1021237	9
1021237	10
1021237	11
1021237	15
1021237	19
1021237	23
1021237	24
1021237	28
1004360	1
1004360	2
1004360	5
1004360	6
1004360	8
1004360	9
1004360	10
1004360	11
1004360	15
1004360	16
1004360	20
1004360	24
1021653	2
1021653	3
1021653	4
1021653	6
1021653	9
1021653	10
1021653	11
1021653	13
1021653	17
1021653	19
1021653	24
1019141	1
1019141	2
1019141	3
1019141	4
1019141	5
1019141	6
1019141	7
1019141	8
1019141	9
1019141	10
1019141	11
1019141	12
1019141	13
1019141	15
1019141	16
1019141	17
1019141	18
1019141	19
1019141	20
1019141	22
1019141	23
1019141	24
1019141	25
1019141	26
1019141	27
1019141	28
1019141	30
1005250	5
1005250	8
1005250	9
1005250	15
1005250	23
1005250	24
1005250	27
1021199	4
1021199	6
1021199	8
1021199	9
1021199	10
1021199	11
1021199	15
1021199	16
1021199	18
1021199	19
1021199	20
1021199	22
1021199	24
1021199	26
1019717	1
1019717	2
1019717	3
1019717	4
1019717	5
1019717	6
1019717	8
1019717	9
1019717	10
1019717	11
1019717	12
1019717	13
1019717	15
1019717	17
1019717	19
1019717	22
1019717	24
1019717	25
1019717	26
1019717	27
1019717	29
1019717	30
1004255	1
1004255	2
1004255	3
1004255	4
1004255	5
1004255	6
1004255	8
1004255	9
1004255	10
1004255	11
1004255	12
1004255	13
1004255	17
1004255	18
1004255	19
1004255	21
1004255	22
1004255	23
1004255	24
1004255	25
1004255	27
1004255	28
1004255	29
1004255	30
1017956	2
1017956	3
1017956	4
1017956	5
1017956	6
1017956	8
1017956	9
1017956	10
1017956	11
1017956	12
1017956	13
1017956	17
1017956	18
1017956	19
1017956	22
1017956	24
1017956	27
1017956	28
1017956	30
1017930	2
1017930	9
1017930	10
1017930	18
1017930	24
1000303	2
1000303	3
1000303	5
1000303	8
1000303	9
1000303	10
1000303	11
1000303	12
1000303	15
1000303	16
1000303	18
1000303	19
1000303	24
1021433	1
1021433	2
1021433	8
1021433	9
1021433	10
1021433	12
1021433	16
1021433	18
1021433	19
1021433	20
1021433	24
1021420	2
1021420	4
1021420	9
1021420	10
1021420	18
1021420	19
1021420	24
1021420	27
1006460	1
1006460	2
1006460	3
1006460	5
1006460	6
1006460	7
1006460	8
1006460	9
1006460	10
1006460	11
1006460	12
1006460	13
1006460	16
1006460	17
1006460	18
1006460	24
1006460	25
1006460	26
1006460	27
1006460	28
1006460	30
1005940	1
1005940	2
1005940	3
1005940	5
1005940	8
1005940	9
1005940	11
1005940	13
1005940	16
1005940	17
1005940	18
1005940	19
1005940	24
1005940	27
1005941	1
1005941	2
1005941	9
1005941	10
1005941	11
1005941	24
1019206	1
1019206	2
1019206	3
1019206	6
1019206	9
1019206	10
1019206	11
1019206	12
1019206	13
1019206	17
1019206	18
1019206	19
1019206	22
1019206	24
1019206	27
1019206	28
1005943	1
1005943	2
1005943	3
1005943	5
1005943	6
1005943	7
1005943	8
1005943	9
1005943	10
1005943	11
1005943	12
1005943	13
1005943	16
1005943	17
1005943	18
1005943	19
1005943	22
1005943	24
1005943	27
1005943	28
1002106	1
1002106	2
1002106	3
1002106	4
1002106	5
1002106	6
1002106	7
1002106	8
1002106	9
1002106	10
1002106	13
1002106	15
1002106	16
1002106	17
1002106	18
1002106	19
1002106	20
1002106	24
1002106	25
1002106	26
1002106	27
1002106	30
1019061	2
1019061	3
1019061	4
1019061	5
1019061	6
1019061	9
1019061	10
1019061	11
1019061	12
1019061	13
1019061	16
1019061	17
1019061	18
1019061	19
1019061	22
1019061	24
1000579	2
1000579	3
1000579	4
1000579	5
1000579	6
1000579	8
1000579	9
1000579	10
1000579	11
1000579	12
1000579	13
1000579	16
1000579	17
1000579	18
1000579	19
1000579	20
1000579	21
1000579	22
1000579	24
1000579	26
1000579	28
1019840	2
1019840	4
1019840	5
1019840	6
1019840	8
1019840	9
1019840	10
1019840	11
1019840	18
1019840	19
1019840	21
1019840	22
1019840	24
1019840	25
1019840	28
1021441	2
1021441	3
1021441	4
1021441	5
1021441	6
1021441	8
1021441	9
1021441	10
1021441	11
1021441	13
1021441	16
1021441	18
1021441	19
1021441	24
1021441	28
1019110	2
1019110	3
1019110	4
1019110	6
1019110	8
1019110	9
1019110	10
1019110	11
1019110	12
1019110	13
1019110	17
1019110	18
1019110	19
1019110	22
1019110	24
1019110	28
1019741	2
1019741	3
1019741	4
1019741	6
1019741	9
1019741	10
1019741	11
1019741	13
1019741	16
1019741	17
1019741	24
1019704	2
1019704	3
1019704	5
1019704	6
1019704	7
1019704	8
1019704	9
1019704	10
1019704	11
1019704	12
1019704	18
1019704	19
1019704	22
1019704	24
1018381	2
1018381	5
1018381	6
1018381	9
1018381	10
1018381	11
1018381	12
1018381	13
1018381	18
1018381	24
1018381	26
1019823	1
1019823	2
1019823	3
1019823	4
1019823	5
1019823	6
1019823	8
1019823	9
1019823	10
1019823	11
1019823	12
1019823	13
1019823	15
1019823	16
1019823	17
1019823	18
1019823	19
1019823	20
1019823	22
1019823	23
1019823	24
1019823	27
1019823	28
1019823	30
1019763	1
1019763	2
1019763	3
1019763	5
1019763	6
1019763	7
1019763	8
1019763	9
1019763	10
1019763	11
1019763	12
1019763	13
1019763	15
1019763	16
1019763	17
1019763	18
1019763	22
1019763	24
1019763	25
1019763	27
1000549	1
1000549	2
1000549	4
1000549	5
1000549	8
1000549	9
1000549	10
1000549	11
1000549	15
1000549	16
1000549	19
1002808	2
1002808	3
1002808	5
1002808	6
1002808	8
1002808	9
1002808	10
1002808	11
1002808	15
1002808	17
1002808	18
1002808	22
1002808	24
1002808	26
1019474	2
1019474	3
1019474	5
1019474	6
1019474	8
1019474	9
1019474	10
1019474	11
1019474	12
1019474	15
1019474	16
1019474	17
1019474	18
1019474	19
1019474	21
1019474	23
1019474	24
1018969	1
1018969	2
1018969	3
1018969	4
1018969	6
1018969	7
1018969	9
1018969	10
1018969	11
1018969	12
1018969	13
1018969	17
1018969	18
1018969	19
1018969	22
1018969	24
1018969	26
1018969	27
1019821	1
1019821	2
1019821	4
1019821	5
1019821	6
1019821	7
1019821	8
1019821	9
1019821	10
1019821	11
1019821	12
1019821	13
1019821	15
1019821	16
1019821	17
1019821	18
1019821	19
1019821	22
1019821	24
1019821	25
1019821	26
1019821	27
1019821	28
1019821	29
1020135	1
1020135	2
1020135	3
1020135	5
1020135	6
1020135	7
1020135	8
1020135	9
1020135	10
1020135	11
1020135	13
1020135	15
1020135	16
1020135	17
1020135	18
1020135	20
1020135	23
1020135	24
1020135	25
1020135	26
1020135	27
1020135	29
1020137	1
1020137	2
1020137	3
1020137	5
1020137	6
1020137	7
1020137	8
1020137	9
1020137	10
1020137	11
1020137	13
1020137	15
1020137	16
1020137	17
1020137	18
1020137	20
1020137	22
1020137	23
1020137	24
1020137	25
1020137	26
1020137	27
1020137	29
1020137	30
1021232	1
1021232	2
1021232	3
1021232	4
1021232	5
1021232	6
1021232	8
1021232	9
1021232	10
1021232	11
1021232	15
1021232	16
1021232	18
1021232	19
1021232	20
1021232	21
1021232	22
1021232	24
1021232	27
1001290	1
1001290	2
1001290	3
1001290	5
1001290	6
1001290	8
1001290	9
1001290	10
1001290	11
1001290	12
1001290	13
1001290	16
1001290	19
1001290	21
1001290	24
1001290	26
1000210	2
1000210	3
1000210	4
1000210	5
1000210	6
1000210	7
1000210	8
1000210	9
1000210	10
1000210	11
1000210	13
1000210	16
1000210	17
1000210	18
1000210	19
1000210	21
1000210	22
1000210	23
1000210	24
1000210	26
1000210	28
1009656	1
1009656	2
1009656	3
1009656	4
1009656	5
1009656	6
1009656	7
1009656	8
1009656	9
1009656	10
1009656	11
1009656	13
1009656	17
1009656	18
1009656	19
1009656	22
1009656	23
1009656	24
1009656	26
1009656	27
1018196	2
1018196	4
1018196	5
1018196	6
1018196	7
1018196	8
1018196	9
1018196	10
1018196	11
1018196	13
1018196	16
1018196	17
1018196	18
1018196	19
1018196	22
1018196	24
1018196	27
1018196	28
1019790	1
1019790	2
1019790	3
1019790	4
1019790	5
1019790	6
1019790	7
1019790	8
1019790	9
1019790	10
1019790	11
1019790	13
1019790	15
1019790	16
1019790	17
1019790	18
1019790	19
1019790	20
1019790	22
1019790	23
1019790	24
1019790	26
1019790	27
1019790	30
1010758	1
1010758	2
1010758	3
1010758	4
1010758	5
1010758	6
1010758	7
1010758	8
1010758	9
1010758	10
1010758	11
1010758	12
1010758	13
1010758	15
1010758	16
1010758	17
1010758	18
1010758	19
1010758	20
1010758	22
1010758	23
1010758	24
1010758	25
1010758	26
1010758	27
1019483	2
1019483	4
1019483	5
1019483	6
1019483	8
1019483	9
1019483	10
1019483	11
1019483	13
1019483	16
1019483	17
1019483	18
1019483	19
1019483	22
1019483	23
1019483	24
1019483	26
1019483	28
1019199	1
1019199	2
1019199	4
1019199	5
1019199	6
1019199	8
1019199	9
1019199	10
1019199	11
1019199	13
1019199	15
1019199	16
1019199	17
1019199	18
1019199	19
1019199	24
1019199	27
1019199	28
1020124	2
1020124	4
1020124	5
1020124	6
1020124	8
1020124	9
1020124	10
1020124	11
1020124	13
1020124	15
1020124	16
1020124	17
1020124	19
1020124	20
1020124	24
1020124	27
1011003	6
1011003	9
1011003	10
1011003	11
1011003	16
1011003	19
1011003	24
1021541	2
1021541	4
1021541	8
1021541	9
1021541	11
1021541	16
1021541	24
1019592	2
1019592	9
1019592	11
1019592	16
1019042	2
1019042	3
1019042	4
1019042	5
1019042	6
1019042	8
1019042	9
1019042	10
1019042	11
1019042	12
1019042	13
1019042	16
1019042	19
1019042	24
1012030	2
1012030	3
1012030	4
1012030	5
1012030	6
1012030	7
1012030	8
1012030	9
1012030	10
1012030	11
1012030	13
1012030	15
1012030	17
1012030	18
1012030	19
1012030	22
1012030	24
1012030	26
1021396	2
1021396	4
1021396	5
1021396	6
1021396	8
1021396	9
1021396	10
1021396	11
1021396	13
1021396	16
1021396	17
1021396	18
1021396	19
1021396	24
1021396	28
1006766	1
1006766	2
1006766	3
1006766	4
1006766	5
1006766	6
1006766	8
1006766	9
1006766	10
1006766	11
1006766	13
1006766	15
1006766	16
1006766	17
1006766	18
1006766	19
1006766	20
1006766	22
1006766	24
1006766	27
1006766	28
1006766	30
1018190	2
1018190	4
1018190	5
1018190	6
1018190	9
1018190	10
1018190	11
1018190	13
1018190	16
1018190	18
1018190	19
1018190	24
1021639	2
1021639	3
1021639	4
1021639	6
1021639	7
1021639	8
1021639	9
1021639	10
1021639	11
1021639	13
1021639	15
1021639	16
1021639	17
1021639	18
1021639	21
1021639	22
1021639	24
1021639	26
1012666	2
1012666	3
1012666	4
1012666	5
1012666	6
1012666	8
1012666	9
1012666	10
1012666	11
1012666	13
1012666	15
1012666	16
1012666	17
1012666	18
1012666	19
1012666	21
1012666	22
1012666	23
1012666	24
1012666	26
1012666	27
1012666	28
1012666	30
1008959	2
1008959	4
1008959	5
1008959	6
1008959	8
1008959	9
1008959	10
1008959	11
1008959	13
1008959	16
1008959	17
1008959	18
1008959	19
1008959	22
1008959	23
1008959	24
1021691	1
1021691	2
1021691	3
1021691	5
1021691	6
1021691	7
1021691	8
1021691	9
1021691	10
1021691	11
1021691	13
1021691	15
1021691	16
1021691	17
1021691	18
1021691	19
1021691	20
1021691	22
1021691	23
1021691	24
1021691	25
1021691	27
1021691	30
1018629	1
1018629	3
1018629	4
1018629	5
1018629	9
1018629	13
1018629	18
1018629	19
1018629	20
1018629	21
1018629	24
1018629	26
1018629	29
1010975	1
1010975	6
1010975	9
1010975	10
1010975	15
1010975	16
1010975	19
1010975	24
1004382	1
1004382	2
1004382	3
1004382	5
1004382	6
1004382	8
1004382	9
1004382	10
1004382	11
1004382	13
1004382	15
1004382	16
1004382	17
1004382	18
1004382	19
1004382	20
1004382	22
1004382	23
1004382	24
1004382	25
1004382	26
1004382	27
1004382	30
1018221	1
1018221	2
1018221	3
1018221	4
1018221	5
1018221	6
1018221	9
1018221	10
1018221	11
1018221	13
1018221	16
1018221	17
1018221	18
1018221	19
1018221	20
1018221	22
1018221	23
1018221	24
1018221	26
1018221	27
1000368	1
1000368	2
1000368	3
1000368	4
1000368	5
1000368	6
1000368	7
1000368	8
1000368	9
1000368	10
1000368	11
1000368	12
1000368	13
1000368	16
1000368	17
1000368	18
1000368	19
1000368	20
1000368	22
1000368	24
1000368	25
1000368	27
1000368	30
1019530	2
1019530	3
1019530	5
1019530	6
1019530	8
1019530	9
1019530	10
1019530	11
1019530	13
1019530	15
1019530	19
1019530	22
1019530	24
1019530	27
1019529	1
1019529	2
1019529	3
1019529	4
1019529	5
1019529	6
1019529	8
1019529	9
1019529	10
1019529	11
1019529	12
1019529	13
1019529	15
1019529	16
1019529	17
1019529	18
1019529	19
1019529	22
1019529	23
1019529	24
1019529	25
1019529	26
1019529	27
1019529	28
1019531	2
1019531	3
1019531	5
1019531	6
1019531	9
1019531	10
1019531	11
1019531	13
1019531	15
1019531	16
1019531	18
1019531	22
1019531	24
1019531	26
1019531	28
1019258	1
1019258	2
1019258	3
1019258	4
1019258	5
1019258	6
1019258	8
1019258	9
1019258	10
1019258	11
1019258	12
1019258	13
1019258	15
1019258	17
1019258	18
1019258	19
1019258	22
1019258	23
1019258	24
1019258	25
1019258	26
1019258	27
1019258	28
1019325	1
1019325	2
1019325	3
1019325	4
1019325	5
1019325	6
1019325	7
1019325	8
1019325	9
1019325	10
1019325	11
1019325	12
1019325	13
1019325	15
1019325	16
1019325	17
1019325	18
1019325	19
1019325	20
1019325	21
1019325	22
1019325	24
1019325	26
1019325	27
1019325	28
1019296	2
1019296	5
1019296	6
1019296	8
1019296	9
1019296	10
1019296	11
1019296	13
1019296	15
1019296	16
1019296	17
1019296	18
1019296	19
1019296	21
1019296	22
1019296	24
1019296	26
1012552	2
1012552	3
1012552	5
1012552	6
1012552	8
1012552	9
1012552	10
1012552	11
1012552	13
1012552	15
1012552	16
1012552	17
1012552	18
1012552	19
1012552	22
1012552	24
1012552	27
1012552	28
1009993	1
1009993	2
1009993	9
1009993	10
1009993	11
1009993	18
1009993	22
1009993	24
1019130	1
1019130	24
1021330	2
1021330	4
1021330	5
1021330	6
1021330	8
1021330	9
1021330	10
1021330	11
1021330	12
1021330	13
1021330	15
1021330	16
1021330	17
1021330	18
1021330	19
1021330	22
1021330	24
1021331	2
1021331	4
1021331	6
1021331	8
1021331	9
1021331	10
1021331	11
1021331	12
1021331	13
1021331	15
1021331	17
1021331	18
1021331	19
1021331	22
1021331	24
1021331	26
1021227	1
1021227	2
1021227	6
1021227	8
1021227	9
1021227	10
1021227	11
1021227	15
1021227	24
1021227	26
1019260	1
1019260	2
1019260	3
1019260	5
1019260	6
1019260	7
1019260	8
1019260	9
1019260	10
1019260	11
1019260	13
1019260	15
1019260	16
1019260	17
1019260	18
1019260	20
1019260	22
1019260	23
1019260	24
1019260	25
1019260	26
1019260	27
1019260	28
1019260	29
1019260	30
1019261	1
1019261	2
1019261	6
1019261	7
1019261	8
1019261	9
1019261	10
1019261	11
1019261	18
1019261	24
1019262	1
1019262	2
1019262	3
1019262	5
1019262	6
1019262	7
1019262	8
1019262	9
1019262	10
1019262	11
1019262	13
1019262	15
1019262	16
1019262	17
1019262	18
1019262	20
1019262	22
1019262	23
1019262	24
1019262	25
1019262	26
1019262	27
1019262	28
1019262	29
1019262	30
1002470	2
1002470	3
1002470	4
1002470	5
1002470	6
1002470	8
1002470	9
1002470	10
1002470	11
1002470	12
1002470	13
1002470	16
1002470	18
1002470	19
1002470	20
1002470	22
1002470	24
1002470	26
1002470	28
1021391	2
1021391	4
1021391	9
1021391	10
1021391	11
1021391	19
1012365	1
1012365	2
1012365	4
1012365	5
1012365	6
1012365	8
1012365	9
1012365	10
1012365	11
1012365	13
1012365	16
1012365	18
1012365	22
1012365	24
1012365	25
1012365	26
1001869	2
1001869	3
1001869	5
1001869	6
1001869	7
1001869	8
1001869	9
1001869	10
1001869	11
1001869	12
1001869	13
1001869	16
1001869	17
1001869	18
1001869	20
1001869	24
1001869	25
1001869	27
1021346	1
1021346	2
1021346	3
1021346	5
1021346	6
1021346	7
1021346	8
1021346	9
1021346	10
1021346	11
1021346	15
1021346	16
1021346	18
1021346	23
1021346	24
1021346	25
1021346	26
1021346	27
1021346	29
1019701	1
1019701	2
1019701	4
1019701	5
1019701	6
1019701	8
1019701	9
1019701	10
1019701	11
1019701	12
1019701	13
1019701	15
1019701	16
1019701	17
1019701	18
1019701	19
1019701	24
1019701	30
1019702	1
1019702	2
1019702	4
1019702	5
1019702	6
1019702	8
1019702	9
1019702	10
1019702	11
1019702	12
1019702	13
1019702	15
1019702	17
1019702	18
1019702	19
1019702	24
1020109	2
1020109	5
1020109	6
1020109	8
1020109	9
1020109	11
1020109	12
1020109	17
1020109	19
1020109	24
1021387	2
1021387	3
1021387	4
1021387	5
1021387	6
1021387	8
1021387	9
1021387	10
1021387	11
1021387	12
1021387	13
1021387	16
1021387	19
1021387	24
1021387	27
1021387	28
1019539	2
1019539	3
1019539	4
1019539	6
1019539	8
1019539	9
1019539	10
1019539	11
1019539	15
1019539	18
1019539	19
1019539	22
1019539	24
1019539	25
1019539	26
1019539	28
1019539	30
1021408	2
1021408	4
1021408	9
1021408	10
1021408	11
1004516	2
1004516	6
1004516	8
1004516	9
1004516	10
1004516	11
1004516	12
1004516	16
1004516	18
1004516	23
1004516	24
1004516	27
1004516	28
1019163	1
1019163	2
1019163	4
1019163	5
1019163	6
1019163	8
1019163	9
1019163	10
1019163	11
1019163	13
1019163	16
1019163	18
1019163	19
1019163	24
1019163	25
1019163	28
1012505	2
1012505	4
1012505	5
1012505	6
1012505	9
1012505	10
1012505	11
1012505	12
1012505	16
1012505	19
1018157	2
1018157	5
1018157	6
1018157	9
1018157	10
1018157	11
1018157	16
1018157	18
1018157	24
1018157	28
1019880	2
1019880	6
1019880	9
1019880	10
1019880	11
1019880	24
1012254	2
1012254	5
1012254	6
1012254	9
1012254	10
1012254	11
1012254	24
1019100	2
1019100	4
1019100	5
1019100	6
1019100	7
1019100	8
1019100	9
1019100	10
1019100	11
1019100	13
1019100	16
1019100	17
1019100	18
1019100	19
1019100	22
1019100	24
1019100	28
1021457	2
1021457	4
1021457	5
1021457	6
1021457	8
1021457	9
1021457	10
1021457	11
1021457	13
1021457	16
1021457	17
1021457	19
1021457	20
1021457	22
1021457	24
1021457	25
1021457	27
1018945	1
1018945	2
1018945	3
1018945	4
1018945	5
1018945	6
1018945	7
1018945	8
1018945	9
1018945	10
1018945	11
1018945	12
1018945	16
1018945	17
1018945	18
1018945	19
1018945	22
1018945	24
1018945	25
1018945	26
1018945	27
1018945	28
1018945	29
1018945	30
1019970	2
1019970	3
1019970	6
1019970	7
1019970	9
1019970	10
1019970	11
1019970	13
1019970	17
1019970	18
1019970	19
1019970	22
1019970	24
1019970	28
1021570	1
1021570	2
1021570	4
1021570	5
1021570	6
1021570	8
1021570	9
1021570	10
1021570	11
1021570	12
1021570	16
1021570	18
1021570	19
1021570	20
1021570	21
1021570	23
1021570	24
1021570	26
1021570	27
1021570	30
1012296	1
1012296	2
1012296	3
1012296	4
1012296	5
1012296	6
1012296	8
1012296	9
1012296	10
1012296	11
1012296	12
1012296	13
1012296	16
1012296	17
1012296	18
1012296	19
1012296	20
1012296	24
1012296	27
1011103	2
1011103	4
1011103	5
1011103	8
1011103	9
1011103	10
1011103	11
1011103	15
1011103	16
1011103	18
1011103	19
1011103	20
1011103	21
1011103	22
1011103	24
1011103	25
1011103	26
1011103	30
1002536	1
1002536	5
1002536	6
1002536	8
1002536	9
1002536	11
1002536	15
1002536	16
1002536	17
1002536	20
1002536	24
1020061	1
1020061	2
1020061	4
1020061	6
1020061	9
1020061	10
1020061	11
1020061	13
1020061	18
1020061	19
1020061	22
1020061	24
1018416	2
1018416	3
1018416	4
1018416	5
1018416	6
1018416	7
1018416	8
1018416	9
1018416	10
1018416	11
1018416	13
1018416	15
1018416	16
1018416	17
1018416	18
1018416	19
1018416	20
1018416	21
1018416	22
1018416	24
1018416	26
1018416	28
1019308	1
1019308	2
1019308	3
1019308	4
1019308	5
1019308	6
1019308	7
1019308	8
1019308	9
1019308	12
1019308	13
1019308	16
1019308	17
1019308	18
1019308	19
1019308	20
1019308	21
1019308	22
1019308	24
1019308	25
1019308	27
1019308	28
1020191	2
1020191	3
1020191	5
1020191	6
1020191	7
1020191	8
1020191	9
1020191	10
1020191	11
1020191	13
1020191	17
1020191	18
1020191	19
1020191	22
1020191	24
1020191	26
1020191	27
1020191	28
1020191	30
1021591	2
1021591	5
1021591	8
1021591	9
1021591	10
1021591	11
1021591	18
1021591	24
1021591	26
1021649	1
1021649	2
1021649	3
1021649	4
1021649	5
1021649	6
1021649	8
1021649	9
1021649	10
1021649	11
1021649	13
1021649	17
1021649	18
1021649	19
1021649	22
1021649	24
1021649	26
1021649	27
1021649	28
1007255	1
1007255	2
1007255	3
1007255	4
1007255	5
1007255	6
1007255	7
1007255	8
1007255	9
1007255	10
1007255	11
1007255	13
1007255	15
1007255	16
1007255	17
1007255	18
1007255	19
1007255	20
1007255	21
1007255	22
1007255	23
1007255	24
1007255	25
1007255	28
1003628	2
1003628	3
1003628	4
1003628	5
1003628	6
1003628	7
1003628	8
1003628	9
1003628	10
1003628	11
1003628	12
1003628	16
1003628	17
1003628	19
1003628	22
1003628	23
1003628	24
1003628	27
1021318	2
1021318	4
1021318	5
1021318	6
1021318	8
1021318	9
1021318	10
1021318	11
1021318	13
1021318	17
1021318	18
1021318	19
1021318	20
1021318	21
1021318	24
1021318	27
1021318	28
1021261	19
1018958	1
1019458	2
1019458	3
1019458	4
1019458	5
1019458	6
1019458	7
1019458	8
1019458	9
1019458	10
1019458	11
1019458	12
1019458	13
1019458	16
1019458	17
1019458	18
1019458	19
1019458	23
1019458	24
1019458	26
1018816	2
1018816	4
1018816	5
1018816	6
1018816	8
1018816	9
1018816	10
1018816	11
1018816	15
1018816	16
1018816	18
1018816	19
1018816	24
1019742	2
1019742	3
1019742	4
1019742	5
1019742	6
1019742	9
1019742	10
1019742	11
1019742	13
1019742	16
1019742	17
1019742	19
1019742	22
1019742	24
1019439	2
1019439	5
1019439	6
1019439	8
1019439	9
1019439	10
1019439	11
1019439	16
1019439	19
1019439	22
1019439	23
1019439	24
1019439	30
1019964	1
1019964	2
1019964	4
1019964	6
1019964	8
1019964	9
1019964	10
1019964	11
1019964	17
1019964	19
1019964	22
1019964	24
1018706	1
1018706	8
1018706	9
1018706	24
1020111	2
1020111	5
1020111	6
1020111	9
1020111	10
1020111	11
1020111	16
1020111	17
1020111	18
1020111	19
1020111	22
1020111	24
1003046	2
1003046	4
1003046	5
1003046	8
1003046	9
1003046	10
1003046	11
1003046	16
1003046	18
1003046	19
1003046	22
1003046	24
1003046	30
1009829	1
1009829	2
1009829	3
1009829	4
1009829	5
1009829	6
1009829	8
1009829	9
1009829	10
1009829	11
1009829	12
1009829	13
1009829	16
1009829	18
1009829	19
1009829	21
1009829	22
1009829	24
1009829	26
1009894	1
1009894	2
1009894	3
1009894	5
1009894	6
1009894	7
1009894	8
1009894	9
1009894	10
1009894	11
1009894	12
1009894	13
1009894	15
1009894	16
1009894	17
1009894	18
1009894	21
1009894	22
1009894	23
1009894	24
1009894	25
1009894	26
1009894	27
1009894	29
1021296	1
1021296	2
1021296	3
1021296	5
1021296	6
1021296	7
1021296	8
1021296	9
1021296	10
1021296	11
1021296	12
1021296	13
1021296	16
1021296	17
1021296	18
1021296	21
1021296	22
1021296	24
1021296	26
1021296	27
1010954	1
1010954	2
1010954	3
1010954	4
1010954	5
1010954	6
1010954	7
1010954	8
1010954	9
1010954	10
1010954	11
1010954	12
1010954	13
1010954	15
1010954	16
1010954	17
1010954	18
1010954	19
1010954	21
1010954	22
1010954	23
1010954	24
1010954	25
1010954	26
1010954	27
1010954	28
1016793	1
1016793	2
1016793	3
1016793	6
1016793	7
1016793	8
1016793	9
1016793	10
1016793	11
1016793	12
1016793	13
1016793	15
1016793	17
1016793	18
1016793	21
1016793	22
1016793	23
1016793	24
1016793	25
1016793	26
1016793	27
1010969	1
1010969	2
1010969	3
1010969	5
1010969	6
1010969	7
1010969	8
1010969	9
1010969	10
1010969	11
1010969	12
1010969	13
1010969	16
1010969	17
1010969	18
1010969	21
1010969	22
1010969	24
1010969	26
1010969	27
1010969	29
1010972	1
1010972	2
1010972	3
1010972	5
1010972	6
1010972	7
1010972	8
1010972	9
1010972	10
1010972	11
1010972	12
1010972	13
1010972	16
1010972	17
1010972	18
1010972	19
1010972	21
1010972	22
1010972	24
1010972	26
1010972	27
1010958	1
1010958	2
1010958	5
1010958	6
1010958	7
1010958	8
1010958	9
1010958	10
1010958	11
1010958	12
1010958	13
1010958	15
1010958	16
1010958	17
1010958	18
1010958	21
1010958	22
1010958	23
1010958	24
1010958	25
1010958	26
1010958	27
1016792	1
1016792	2
1016792	3
1016792	4
1016792	5
1016792	6
1016792	7
1016792	8
1016792	9
1016792	10
1016792	11
1016792	12
1016792	13
1016792	15
1016792	16
1016792	17
1016792	18
1016792	19
1016792	21
1016792	22
1016792	23
1016792	24
1016792	25
1016792	26
1016792	27
1009895	1
1009895	2
1009895	3
1009895	5
1009895	6
1009895	7
1009895	8
1009895	9
1009895	10
1009895	11
1009895	12
1009895	13
1009895	15
1009895	16
1009895	17
1009895	18
1009895	19
1009895	21
1009895	22
1009895	23
1009895	24
1009895	25
1009895	26
1009895	27
1009895	29
1009895	30
1010982	6
1010982	8
1010982	9
1010982	10
1010982	16
1010982	24
1010960	1
1010960	2
1010960	3
1010960	4
1010960	5
1010960	6
1010960	7
1010960	8
1010960	9
1010960	10
1010960	11
1010960	12
1010960	13
1010960	15
1010960	16
1010960	17
1010960	18
1010960	19
1010960	21
1010960	22
1010960	23
1010960	24
1010960	25
1010960	26
1010960	27
1010960	28
1016867	2
1016867	3
1016867	4
1016867	5
1016867	6
1016867	8
1016867	9
1016867	10
1016867	11
1016867	12
1016867	13
1016867	17
1016867	19
1016867	21
1016867	22
1016867	24
1016867	25
1016867	26
1016867	27
1016867	28
1019667	1
1019667	2
1019667	3
1019667	6
1019667	8
1019667	9
1019667	10
1019667	11
1019667	13
1019667	16
1019667	17
1019667	18
1019667	20
1019667	22
1019667	24
1019667	26
1019667	27
1019667	28
1019667	30
1009043	2
1009043	3
1009043	4
1009043	5
1009043	8
1009043	9
1009043	10
1009043	11
1009043	16
1009043	18
1009043	20
1009043	24
1009043	28
1003643	1
1003643	2
1003643	3
1003643	4
1003643	5
1003643	6
1003643	7
1003643	8
1003643	9
1003643	10
1003643	11
1003643	12
1003643	13
1003643	15
1003643	16
1003643	17
1003643	18
1003643	19
1003643	20
1003643	21
1003643	22
1003643	23
1003643	24
1003643	25
1003643	26
1003643	27
1003643	28
1003643	30
1020064	1
1020064	2
1020064	3
1020064	5
1020064	6
1020064	7
1020064	8
1020064	9
1020064	10
1020064	11
1020064	13
1020064	15
1020064	17
1020064	18
1020064	20
1020064	21
1020064	22
1020064	23
1020064	24
1020064	25
1020064	26
1020064	27
1020064	28
1020064	30
1020000	1
1020000	2
1020000	4
1020000	5
1020000	6
1020000	8
1020000	9
1020000	10
1020000	11
1020000	12
1020000	13
1020000	16
1020000	17
1020000	19
1020000	22
1020000	24
1020000	25
1020001	1
1020001	2
1020001	6
1020001	8
1020001	9
1020001	10
1020001	11
1020001	12
1020001	13
1020001	17
1020001	19
1020001	24
1020001	25
1019370	1
1019370	2
1019370	6
1019370	8
1019370	9
1019370	10
1019370	11
1019370	12
1019370	13
1019370	16
1019370	17
1019370	18
1019370	19
1019370	20
1019370	22
1019370	24
1019370	25
1019370	26
1019370	30
1019944	2
1019944	4
1019944	5
1019944	6
1019944	8
1019944	9
1019944	10
1019944	11
1019944	13
1019944	15
1019944	16
1019944	18
1019944	19
1019944	20
1019944	21
1019944	22
1019944	24
1019944	27
1019944	30
1021401	2
1021401	4
1021401	5
1021401	6
1021401	8
1021401	9
1021401	11
1021401	13
1021401	16
1021401	17
1021401	18
1021401	19
1021401	24
1021401	27
1000841	2
1000841	4
1000841	5
1000841	6
1000841	8
1000841	9
1000841	10
1000841	11
1000841	13
1000841	15
1000841	16
1000841	19
1000841	24
1019401	1
1019401	2
1019401	4
1019401	5
1019401	6
1019401	9
1019401	10
1019401	11
1019401	13
1019401	17
1019401	18
1019401	19
1019401	22
1019401	24
1019401	27
1019401	30
1021631	1
1021631	2
1021631	3
1021631	5
1021631	6
1021631	8
1021631	9
1021631	10
1021631	11
1021631	12
1021631	13
1021631	16
1021631	17
1021631	18
1021631	19
1021631	20
1021631	22
1021631	24
1021631	27
1021631	29
1008853	2
1008853	4
1008853	5
1008853	8
1008853	9
1008853	10
1008853	11
1008853	13
1008853	16
1008853	17
1008853	18
1008853	19
1008853	22
1008853	24
1008853	26
1008853	27
1008853	30
1002400	1
1002400	2
1002400	4
1002400	5
1002400	6
1002400	7
1002400	8
1002400	9
1002400	10
1002400	11
1002400	13
1002400	16
1002400	17
1002400	18
1002400	19
1002400	20
1002400	22
1002400	24
1002400	26
1002400	27
1002400	28
1019032	1
1019032	2
1019032	4
1019032	5
1019032	6
1019032	8
1019032	9
1019032	10
1019032	11
1019032	13
1019032	16
1019032	18
1019032	19
1019032	24
1019856	1
1019856	2
1019856	4
1019856	5
1019856	6
1019856	8
1019856	9
1019856	10
1019856	11
1019856	12
1019856	13
1019856	15
1019856	16
1019856	17
1019856	18
1019856	19
1019856	20
1019856	22
1019856	24
1019856	26
1019856	27
1019216	1
1019216	2
1019216	3
1019216	5
1019216	6
1019216	7
1019216	8
1019216	9
1019216	10
1019216	11
1019216	12
1019216	13
1019216	15
1019216	16
1019216	17
1019216	18
1019216	19
1019216	20
1019216	22
1019216	24
1019216	26
1019216	27
1019216	28
1012243	2
1012243	3
1012243	4
1012243	5
1012243	6
1012243	7
1012243	8
1012243	9
1012243	10
1012243	11
1012243	12
1012243	13
1012243	16
1012243	17
1012243	18
1012243	19
1012243	20
1012243	22
1012243	23
1012243	24
1012243	25
1012243	26
1012243	27
1012243	28
1012256	2
1012256	4
1012256	5
1012256	6
1012256	9
1012256	10
1012256	11
1012256	12
1012256	13
1012256	16
1012256	17
1012256	18
1012256	22
1012256	23
1012256	24
1012256	25
1019654	1
1019654	2
1019654	3
1019654	4
1019654	5
1019654	6
1019654	7
1019654	8
1019654	9
1019654	10
1019654	11
1019654	12
1019654	13
1019654	16
1019654	17
1019654	18
1019654	19
1019654	22
1019654	24
1019654	26
1019654	27
1019654	28
1019341	2
1019341	4
1019341	5
1019341	6
1019341	8
1019341	9
1019341	10
1019341	11
1019341	12
1019341	13
1019341	16
1019341	17
1019341	18
1019341	19
1019341	22
1019341	24
1019341	30
1019083	2
1019083	5
1019083	8
1019083	9
1019083	10
1019083	16
1019083	19
1019083	22
1019083	24
1009757	2
1009757	3
1009757	4
1009757	5
1009757	6
1009757	7
1009757	8
1009757	9
1009757	10
1009757	11
1009757	13
1009757	15
1009757	18
1009757	19
1009757	22
1009757	24
1018930	1
1018930	2
1018930	4
1018930	5
1018930	6
1018930	7
1018930	8
1018930	9
1018930	10
1018930	11
1018930	12
1018930	13
1018930	16
1018930	17
1018930	18
1018930	19
1018930	21
1018930	22
1018930	23
1018930	24
1018930	27
1018930	30
1003977	2
1003977	4
1003977	9
1003977	11
1003977	16
1018621	1
1018621	2
1018621	3
1018621	4
1018621	5
1018621	6
1018621	7
1018621	8
1018621	9
1018621	10
1018621	11
1018621	15
1018621	16
1018621	18
1018621	19
1018621	20
1018621	21
1018621	22
1018621	23
1018621	24
1018621	25
1018621	26
1018621	27
1018621	29
1019721	1
1019721	2
1019721	3
1019721	5
1019721	6
1019721	7
1019721	8
1019721	9
1019721	10
1019721	11
1019721	13
1019721	15
1019721	16
1019721	17
1019721	18
1019721	19
1019721	20
1019721	21
1019721	22
1019721	23
1019721	24
1019721	25
1019721	26
1019721	27
1021716	1
1021716	2
1021716	3
1021716	4
1021716	5
1021716	6
1021716	7
1021716	8
1021716	9
1021716	10
1021716	11
1021716	13
1021716	15
1021716	16
1021716	18
1021716	19
1021716	22
1021716	23
1021716	24
1021716	25
1021716	26
1021716	27
1021716	28
1021716	30
1021411	2
1021411	4
1021411	5
1021411	6
1021411	9
1021411	10
1021411	11
1021411	13
1021411	15
1021411	17
1021411	19
1021411	27
1005281	1
1005281	2
1005281	3
1005281	5
1005281	6
1005281	7
1005281	8
1005281	9
1005281	10
1005281	11
1005281	13
1005281	15
1005281	16
1005281	17
1005281	18
1005281	19
1005281	21
1005281	22
1005281	23
1005281	24
1005281	26
1005281	27
1019525	1
1019525	2
1019525	3
1019525	4
1019525	5
1019525	6
1019525	8
1019525	9
1019525	10
1019525	11
1019525	13
1019525	18
1019525	19
1019525	21
1019525	22
1019525	24
1019525	27
1019729	1
1019729	2
1019729	3
1019729	4
1019729	5
1019729	6
1019729	7
1019729	8
1019729	9
1019729	10
1019729	11
1019729	12
1019729	13
1019729	15
1019729	16
1019729	17
1019729	18
1019729	19
1019729	20
1019729	22
1019729	24
1019729	27
1019729	30
1004676	1
1004676	2
1004676	4
1004676	6
1004676	8
1004676	9
1004676	10
1004676	11
1004676	15
1004676	16
1004676	18
1004676	19
1004676	21
1004676	24
1004676	26
1005358	1
1005358	2
1005358	3
1005358	5
1005358	6
1005358	9
1005358	10
1005358	11
1005358	15
1005358	18
1005358	19
1005358	24
1005358	27
1005358	29
1005197	1
1005197	2
1005197	3
1005197	4
1005197	5
1005197	6
1005197	7
1005197	8
1005197	9
1005197	10
1005197	11
1005197	12
1005197	13
1005197	15
1005197	16
1005197	17
1005197	18
1005197	19
1005197	20
1005197	21
1005197	22
1005197	24
1005197	25
1005197	26
1005197	27
1005197	28
1005197	30
1019994	2
1019994	4
1019994	5
1019994	6
1019994	8
1019994	9
1019994	10
1019994	12
1019994	24
1019994	27
1018953	1
1018953	2
1018953	3
1018953	4
1018953	5
1018953	6
1018953	7
1018953	8
1018953	9
1018953	10
1018953	11
1018953	13
1018953	16
1018953	17
1018953	18
1018953	19
1018953	20
1018953	21
1018953	22
1018953	23
1018953	24
1018953	25
1018953	26
1018953	27
1018953	29
1018953	30
1000312	1
1000312	2
1000312	3
1000312	4
1000312	5
1000312	6
1000312	8
1000312	9
1000312	10
1000312	11
1000312	13
1000312	15
1000312	16
1000312	17
1000312	18
1000312	19
1000312	20
1000312	21
1000312	22
1000312	23
1000312	24
1000312	25
1000312	26
1000312	27
1000312	29
1000312	30
1009830	1
1009830	2
1009830	3
1009830	4
1009830	5
1009830	6
1009830	8
1009830	9
1009830	10
1009830	11
1009830	12
1009830	13
1009830	18
1009830	22
1009830	24
1009830	26
1012345	1
1012345	2
1012345	3
1012345	4
1012345	5
1012345	6
1012345	8
1012345	9
1012345	10
1012345	11
1012345	13
1012345	17
1012345	18
1012345	19
1012345	21
1012345	22
1012345	23
1012345	24
1012345	26
1012345	27
1012345	30
1019082	1
1019082	2
1019082	4
1019082	9
1019082	10
1019082	11
1019082	18
1019082	19
1019082	22
1019082	24
1019870	9
1019870	24
1021275	1
1021275	2
1021275	6
1021275	7
1021275	8
1021275	9
1021275	10
1021275	11
1021275	13
1021275	17
1021275	18
1021275	19
1021275	22
1021275	24
1021275	26
1021275	27
1021275	28
1021275	30
1018159	1
1018159	2
1018159	3
1018159	5
1018159	6
1018159	8
1018159	9
1018159	10
1018159	11
1018159	13
1018159	17
1018159	18
1018159	19
1018159	20
1018159	24
1018159	25
1018159	27
1018159	28
1018159	30
1021303	1
1021303	2
1021303	3
1021303	6
1021303	7
1021303	8
1021303	9
1021303	10
1021303	13
1021303	17
1021303	18
1021303	23
1021303	24
1021303	25
1021303	26
1021303	27
1021303	29
1021414	1
1021414	2
1021414	3
1021414	6
1021414	9
1021414	10
1021414	11
1021414	13
1021414	17
1021414	18
1021414	19
1021414	23
1021414	24
1021414	25
1021414	26
1021414	27
1021414	29
1011673	2
1011673	3
1011673	4
1011673	5
1011673	6
1011673	7
1011673	8
1011673	9
1011673	10
1011673	11
1011673	13
1011673	15
1011673	16
1011673	17
1011673	18
1011673	19
1011673	21
1011673	22
1011673	24
1011673	26
1011673	27
1011673	28
1019079	2
1019079	3
1019079	6
1019079	9
1019079	10
1019079	11
1019079	12
1019079	15
1019079	18
1019079	19
1019079	20
1019079	21
1019079	24
1019079	28
1020133	6
1020133	9
1020133	10
1020133	16
1020133	18
1020133	24
1011113	1
1011113	2
1011113	3
1011113	4
1011113	5
1011113	6
1011113	7
1011113	8
1011113	9
1011113	10
1011113	11
1011113	13
1011113	15
1011113	16
1011113	17
1011113	18
1011113	19
1011113	22
1011113	24
1011113	25
1011113	26
1011113	27
1011113	28
1019510	1
1019510	2
1019510	5
1019510	9
1019510	10
1019510	11
1019510	15
1019510	18
1019510	19
1019510	24
1019510	25
1019510	26
1019510	27
1020172	1
1020172	9
1020172	10
1020172	24
1012717	1
1012717	2
1012717	4
1012717	5
1012717	6
1012717	8
1012717	9
1012717	10
1012717	11
1012717	13
1012717	15
1012717	16
1012717	17
1012717	18
1012717	19
1012717	22
1012717	23
1012717	24
1012717	26
1012717	30
1019094	2
1019094	3
1019094	4
1019094	6
1019094	9
1019094	10
1019094	11
1019094	12
1019094	13
1019094	16
1019094	17
1019094	18
1019094	19
1019094	24
1019094	27
1021300	2
1021300	4
1021300	5
1021300	6
1021300	7
1021300	8
1021300	9
1021300	10
1021300	11
1021300	13
1021300	16
1021300	18
1021300	19
1021300	22
1021300	24
1021300	28
1019125	1
1019125	2
1019125	3
1019125	4
1019125	5
1019125	6
1019125	8
1019125	9
1019125	10
1019125	11
1019125	12
1019125	13
1019125	16
1019125	17
1019125	18
1019125	19
1019125	21
1019125	22
1019125	24
1019125	27
1019125	28
1019125	29
1021698	2
1021698	3
1021698	5
1021698	6
1021698	8
1021698	9
1021698	10
1021698	11
1021698	12
1021698	13
1021698	16
1021698	17
1021698	18
1021698	19
1021698	21
1021698	24
1021698	26
1021698	27
1021698	28
1021698	30
1009867	1
1009867	2
1009867	3
1009867	4
1009867	5
1009867	6
1009867	8
1009867	9
1009867	10
1009867	11
1009867	13
1009867	16
1009867	17
1009867	18
1009867	19
1009867	21
1009867	22
1009867	24
1009867	25
1009867	26
1009867	27
1009867	28
1009867	29
1009867	30
1019624	2
1019624	4
1019624	5
1019624	8
1019624	9
1019624	10
1019624	13
1019624	16
1019624	17
1019624	18
1019624	19
1019624	20
1019624	22
1019624	24
1021710	2
1021710	5
1021710	6
1021710	8
1021710	9
1021710	10
1021710	11
1021710	12
1021710	13
1021710	16
1021710	17
1021710	18
1021710	19
1021710	22
1021710	24
1021228	1
1021228	2
1021228	3
1021228	5
1021228	6
1021228	8
1021228	9
1021228	10
1021228	11
1021228	17
1021228	24
1021228	29
1012783	2
1012783	3
1012783	4
1012783	5
1012783	6
1012783	7
1012783	8
1012783	9
1012783	10
1012783	11
1012783	13
1012783	15
1012783	16
1012783	17
1012783	18
1012783	19
1012783	22
1012783	24
1012783	27
1012160	1
1012160	2
1012160	3
1012160	4
1012160	5
1012160	6
1012160	7
1012160	8
1012160	9
1012160	10
1012160	11
1012160	13
1012160	15
1012160	16
1012160	17
1012160	18
1012160	19
1012160	20
1012160	21
1012160	22
1012160	23
1012160	24
1012160	26
1012160	27
1019118	2
1019118	4
1019118	8
1019118	9
1019118	11
1019118	16
1019118	19
1019118	22
1019118	24
1021652	5
1021652	9
1021652	24
1021574	1
1021574	2
1021574	5
1021574	6
1021574	7
1021574	8
1021574	9
1021574	10
1021574	11
1021574	13
1021574	15
1021574	17
1021574	19
1021574	21
1021574	22
1021574	24
1021574	26
1021574	28
1019936	2
1019936	3
1019936	4
1019936	5
1019936	6
1019936	8
1019936	9
1019936	10
1019936	11
1019936	15
1019936	18
1019936	19
1019936	22
1019936	24
1019936	25
1019936	26
1019936	27
1012634	2
1012634	4
1012634	5
1012634	8
1012634	9
1012634	11
1012634	16
1012634	24
1019921	2
1019921	4
1019921	5
1019921	6
1019921	8
1019921	9
1019921	10
1019921	11
1019921	13
1019921	15
1019921	16
1019921	17
1019921	18
1019921	19
1019921	22
1019921	24
1021587	2
1021587	4
1021587	5
1021587	6
1021587	8
1021587	9
1021587	18
1021587	19
1021587	24
1021587	25
1018900	2
1018900	3
1018900	4
1018900	5
1018900	6
1018900	7
1018900	8
1018900	9
1018900	10
1018900	11
1018900	12
1018900	13
1018900	15
1018900	16
1018900	17
1018900	18
1018900	19
1018900	20
1018900	22
1018900	24
1018900	26
1018900	27
1018900	28
1018898	2
1018898	3
1018898	4
1018898	6
1018898	7
1018898	8
1018898	9
1018898	10
1018898	11
1018898	12
1018898	13
1018898	15
1018898	17
1018898	18
1018898	19
1018898	24
1018898	27
1018898	28
1020112	5
1020112	6
1020112	9
1020112	10
1020112	24
1018717	1
1018717	2
1018717	3
1018717	6
1018717	8
1018717	9
1018717	10
1018717	11
1018717	13
1018717	16
1018717	17
1018717	18
1018717	19
1018717	22
1018717	24
1018717	26
1018717	28
1021207	1
1021207	2
1021207	3
1021207	5
1021207	6
1021207	7
1021207	9
1021207	10
1021207	12
1021207	13
1021207	16
1021207	17
1021207	19
1021207	20
1021207	21
1021207	22
1021207	24
1021207	27
1002657	1
1002657	2
1002657	3
1002657	5
1002657	6
1002657	8
1002657	9
1002657	10
1002657	11
1002657	12
1002657	13
1002657	16
1002657	17
1002657	18
1002657	21
1002657	22
1002657	24
1002657	27
1002657	28
1002657	30
1002769	1
1002769	2
1002769	3
1002769	4
1002769	5
1002769	6
1002769	8
1002769	9
1002769	10
1002769	11
1002769	12
1002769	16
1002769	19
1002769	20
1002769	24
1002769	27
1019398	1
1019398	2
1019398	3
1019398	4
1019398	5
1019398	6
1019398	8
1019398	9
1019398	10
1019398	11
1019398	13
1019398	15
1019398	16
1019398	17
1019398	18
1019398	19
1019398	21
1019398	22
1019398	24
1019398	27
1012045	1
1012045	2
1012045	3
1012045	4
1012045	5
1012045	6
1012045	7
1012045	8
1012045	9
1012045	10
1012045	11
1012045	13
1012045	15
1012045	17
1012045	18
1012045	19
1012045	20
1012045	22
1012045	24
1012045	26
1012045	29
1018940	2
1018940	5
1018940	6
1018940	8
1018940	9
1018940	10
1018940	11
1018940	12
1019684	1
1019684	2
1019684	4
1019684	5
1019684	6
1019684	9
1019684	10
1019684	13
1019684	19
1019684	20
1019684	22
1019684	24
1018765	2
1018765	4
1018765	5
1018765	6
1018765	8
1018765	9
1018765	10
1018765	11
1018765	12
1018765	13
1018765	15
1018765	16
1018765	18
1018765	19
1018765	20
1018765	22
1018765	23
1018765	24
1018765	25
1018765	28
1019687	2
1019687	3
1019687	4
1019687	5
1019687	6
1019687	7
1019687	9
1019687	10
1019687	11
1019687	18
1019687	21
1019687	22
1019687	24
1019687	26
1006678	1
1006678	2
1006678	5
1006678	6
1006678	8
1006678	9
1006678	10
1006678	11
1006678	13
1006678	15
1006678	16
1006678	17
1006678	18
1006678	19
1006678	23
1006678	24
1006678	30
1020053	1
1020053	2
1020053	4
1020053	5
1020053	6
1020053	8
1020053	9
1020053	11
1020053	13
1020053	16
1020053	19
1020053	24
1020053	25
1019954	1
1019954	2
1019954	3
1019954	4
1019954	5
1019954	6
1019954	8
1019954	9
1019954	11
1019954	13
1019954	16
1019954	18
1019954	19
1019954	24
1019954	27
1010195	2
1010195	4
1010195	5
1010195	6
1010195	9
1010195	10
1010195	11
1010195	12
1010195	13
1010195	16
1010195	19
1010195	24
1005267	9
1005267	15
1005267	23
1005267	24
1005267	27
1007798	1
1007798	2
1007798	3
1007798	4
1007798	5
1007798	6
1007798	7
1007798	8
1007798	9
1007798	10
1007798	11
1007798	12
1007798	13
1007798	16
1007798	17
1007798	18
1007798	19
1007798	21
1007798	22
1007798	23
1007798	24
1007798	26
1007798	27
1019081	2
1019081	4
1019081	6
1019081	9
1019081	10
1019081	11
1019081	12
1019081	16
1019081	17
1019081	24
1018622	1
1018622	2
1018622	3
1018622	4
1018622	5
1018622	6
1018622	8
1018622	9
1018622	10
1018622	11
1018622	13
1018622	15
1018622	16
1018622	17
1018622	18
1018622	19
1018622	20
1018622	21
1018622	22
1018622	23
1018622	24
1018622	25
1018622	26
1018622	27
1018622	28
1018622	29
1019186	2
1019186	3
1019186	4
1019186	5
1019186	6
1019186	7
1019186	8
1019186	9
1019186	10
1019186	11
1019186	13
1019186	16
1019186	17
1019186	18
1019186	19
1019186	22
1019186	24
1019186	26
1019186	28
1019049	2
1019049	4
1019049	5
1019049	6
1019049	8
1019049	9
1019049	10
1019049	11
1019049	13
1019049	19
1019049	20
1019049	21
1019049	22
1019049	24
1019049	30
1018562	1
1018562	2
1018562	3
1018562	4
1018562	5
1018562	6
1018562	8
1018562	9
1018562	10
1018562	11
1018562	13
1018562	15
1018562	16
1018562	18
1018562	19
1018562	21
1018562	22
1018562	24
1018562	27
1018562	28
1018562	30
1019457	1
1019457	2
1019457	4
1019457	5
1019457	6
1019457	8
1019457	9
1019457	10
1019457	11
1019457	12
1019457	13
1019457	15
1019457	17
1019457	18
1019457	22
1019457	24
1019457	26
1019457	27
1019457	30
1010889	1
1010889	2
1010889	3
1010889	5
1010889	6
1010889	8
1010889	9
1010889	10
1010889	11
1010889	13
1010889	16
1010889	17
1010889	18
1010889	19
1010889	20
1010889	22
1010889	24
1010889	27
1010889	28
1019841	1
1019841	3
1019841	6
1019841	9
1019841	10
1019841	13
1019841	17
1019841	19
1019841	22
1019841	24
1021514	2
1021514	3
1021514	4
1021514	5
1021514	6
1021514	7
1021514	8
1021514	9
1021514	10
1021514	11
1021514	13
1021514	17
1021514	18
1021514	19
1021514	21
1021514	24
1021514	25
1021514	26
1021514	27
1019499	1
1019499	5
1019499	9
1019523	1
1019523	2
1019523	4
1019523	6
1019523	8
1019523	9
1019523	10
1019523	11
1019523	13
1019523	15
1019523	18
1019523	19
1019523	20
1019523	22
1019523	24
1018937	2
1018937	4
1018937	6
1018937	9
1018937	10
1018937	11
1018937	17
1018937	19
1018937	21
1018937	22
1018937	24
1018937	28
1019436	2
1019436	5
1019436	6
1019436	9
1019436	10
1019436	11
1019436	16
1019436	20
1019436	22
1019436	24
1019436	27
1021666	2
1021666	4
1021666	5
1021666	6
1021666	9
1021666	11
1021666	18
1021666	19
1021666	24
1021734	2
1021734	4
1021734	5
1021734	6
1021734	9
1021734	10
1021734	11
1021734	12
1021734	17
1021734	18
1021734	19
1021734	24
1018131	2
1018131	4
1018131	6
1018131	7
1018131	8
1018131	9
1018131	10
1018131	11
1018131	13
1018131	18
1018131	19
1018131	22
1018131	24
1018131	26
1018131	27
1020104	2
1020104	4
1020104	5
1020104	6
1020104	8
1020104	9
1020104	10
1020104	11
1020104	13
1020104	16
1020104	18
1020104	22
1020104	24
1020104	28
1021388	2
1021388	3
1021388	4
1021388	5
1021388	6
1021388	8
1021388	9
1021388	10
1021388	11
1021388	12
1021388	13
1021388	16
1021388	17
1021388	18
1021388	19
1021388	22
1021388	24
1021388	27
1021388	28
1019705	2
1019705	4
1019705	6
1019705	7
1019705	9
1019705	10
1019705	11
1019705	18
1019705	19
1019705	22
1019705	23
1019705	24
1019705	26
1019705	28
1005069	1
1005069	2
1005069	3
1005069	5
1005069	6
1005069	7
1005069	8
1005069	9
1005069	10
1005069	11
1005069	13
1005069	15
1005069	16
1005069	17
1005069	18
1005069	20
1005069	22
1005069	23
1005069	24
1005069	25
1005069	27
1005069	28
1021404	2
1021404	4
1021404	5
1021404	6
1021404	8
1021404	9
1021404	10
1021404	11
1021404	13
1021404	16
1021404	20
1021404	24
1021620	2
1021620	4
1021620	5
1021620	6
1021620	8
1021620	9
1021620	10
1021620	11
1021620	13
1021620	17
1021620	18
1021620	19
1021620	24
1021620	28
1005159	1
1005159	2
1005159	3
1005159	4
1005159	5
1005159	6
1005159	7
1005159	8
1005159	9
1005159	10
1005159	13
1005159	15
1005159	16
1005159	17
1005159	18
1005159	19
1005159	21
1005159	22
1005159	24
1005159	25
1005159	26
1005159	27
1005159	30
1021538	1
1021538	2
1021538	3
1021538	4
1021538	5
1021538	6
1021538	8
1021538	9
1021538	10
1021538	11
1021538	12
1021538	13
1021538	15
1021538	18
1021538	19
1021538	22
1021538	24
1021538	26
1021538	27
1021538	30
1021581	2
1021581	4
1021581	5
1021581	6
1021581	8
1021581	9
1021581	10
1021581	11
1021581	13
1021581	16
1021581	17
1021581	18
1021581	19
1021581	22
1021581	24
1021581	26
1021581	28
1019993	2
1019993	3
1019993	4
1019993	5
1019993	6
1019993	8
1019993	9
1019993	10
1019993	11
1019993	13
1019993	16
1019993	18
1019993	19
1019993	20
1019993	24
1020079	2
1020079	4
1020079	5
1020079	6
1020079	8
1020079	9
1020079	10
1020079	11
1020079	13
1020079	16
1020079	17
1020079	19
1020079	20
1020079	23
1020079	24
1020080	2
1020080	4
1020080	5
1020080	6
1020080	8
1020080	9
1020080	10
1020080	11
1020080	13
1020080	16
1020080	17
1020080	19
1020080	20
1020080	23
1020080	24
1021595	2
1021595	3
1021595	4
1021595	5
1021595	6
1021595	7
1021595	9
1021595	10
1021595	11
1021595	13
1021595	16
1021595	17
1021595	18
1021595	19
1021595	20
1021595	21
1021595	22
1021595	24
1021595	26
1021595	28
1019862	1
1019862	2
1019862	3
1019862	5
1019862	6
1019862	7
1019862	8
1019862	9
1019862	10
1019862	11
1019862	12
1019862	13
1019862	17
1019862	18
1019862	19
1019862	20
1019862	21
1019862	22
1019862	23
1019862	24
1019862	26
1019862	27
1018427	2
1018427	8
1018427	9
1018427	11
1018427	13
1018427	16
1018427	20
1018427	24
1016870	1
1016870	2
1016870	3
1016870	4
1016870	5
1016870	6
1016870	7
1016870	8
1016870	9
1016870	10
1016870	11
1016870	15
1016870	16
1016870	18
1016870	19
1016870	20
1016870	22
1016870	24
1016870	26
1016870	30
1021460	2
1021460	4
1021460	5
1021460	6
1021460	8
1021460	9
1021460	10
1021460	11
1021460	13
1021460	16
1021460	19
1021460	20
1021460	24
1019800	2
1019800	3
1019800	4
1019800	5
1019800	6
1019800	8
1019800	9
1019800	10
1019800	11
1019800	12
1019800	13
1019800	16
1019800	17
1019800	19
1019800	22
1019800	24
1012627	1
1012627	2
1012627	3
1012627	5
1012627	6
1012627	8
1012627	9
1012627	10
1012627	11
1012627	13
1012627	16
1012627	17
1012627	18
1012627	19
1012627	21
1012627	23
1012627	24
1012627	26
1012627	27
1012627	28
1012627	30
1002721	1
1002721	2
1002721	5
1002721	6
1002721	7
1002721	8
1002721	9
1002721	10
1002721	11
1002721	13
1002721	15
1002721	16
1002721	17
1002721	18
1002721	19
1002721	20
1002721	21
1002721	22
1002721	24
1002721	26
1018973	1
1018973	2
1018973	4
1018973	5
1018973	6
1018973	8
1018973	9
1018973	10
1018973	16
1018973	18
1018973	19
1018973	21
1018973	22
1018973	24
1018973	25
1021676	2
1021676	4
1021676	5
1021676	6
1021676	9
1021676	10
1021676	13
1021676	16
1021676	17
1021676	18
1021676	19
1021676	24
1021676	27
1021676	30
1021665	2
1021665	4
1021665	5
1021665	6
1021665	8
1021665	9
1021665	10
1021665	11
1021665	13
1021665	15
1021665	17
1021665	18
1021665	19
1021665	22
1021665	24
1021665	27
1021665	28
1021665	30
1020193	1
1020193	2
1020193	3
1020193	5
1020193	6
1020193	7
1020193	8
1020193	9
1020193	10
1020193	11
1020193	13
1020193	15
1020193	17
1020193	18
1020193	21
1020193	22
1020193	23
1020193	24
1020193	25
1020193	26
1020193	27
1020193	29
1012308	2
1012308	3
1012308	4
1012308	5
1012308	6
1012308	8
1012308	9
1012308	10
1012308	11
1012308	12
1012308	13
1012308	16
1012308	17
1012308	19
1012308	24
1019771	2
1019771	3
1019771	6
1019771	8
1019771	9
1019771	10
1019771	11
1019771	12
1019771	13
1019771	17
1019771	18
1019771	19
1019771	21
1019771	22
1019771	24
1019771	26
1018193	2
1018193	4
1018193	6
1018193	8
1018193	9
1018193	10
1018193	11
1018193	16
1018193	19
1018193	20
1018193	24
1020008	2
1020008	4
1020008	5
1020008	6
1020008	8
1020008	9
1020008	10
1020008	11
1020008	16
1020008	19
1020008	22
1020008	24
1020008	26
1020008	30
1019677	2
1019677	3
1019677	5
1019677	6
1019677	8
1019677	9
1019677	10
1019677	11
1019677	13
1019677	17
1019677	18
1019677	19
1019677	20
1019677	24
1019677	25
1019677	28
1004377	1
1004377	2
1004377	4
1004377	5
1004377	8
1004377	9
1004377	10
1004377	11
1004377	16
1004377	19
1004377	20
1004377	24
1019914	2
1019914	5
1019914	6
1019914	7
1019914	8
1019914	9
1019914	10
1019914	16
1019914	18
1019914	19
1019914	22
1019914	24
1019914	25
1019914	28
1019914	29
1019897	2
1019897	4
1019897	5
1019897	6
1019897	8
1019897	9
1019897	10
1019897	11
1019897	13
1019897	16
1019897	19
1019897	24
1020091	2
1020091	4
1020091	5
1020091	6
1020091	8
1020091	9
1020091	10
1020091	12
1020091	16
1020091	18
1020091	19
1020091	20
1020091	24
1020091	30
1020065	2
1020065	3
1020065	4
1020065	5
1020065	8
1020065	9
1020065	10
1020065	11
1020065	12
1020065	13
1020065	16
1020065	22
1020065	24
1020065	28
1021453	2
1021453	4
1021453	5
1021453	6
1021453	8
1021453	9
1021453	10
1021453	11
1021453	16
1021453	17
1021453	18
1021453	19
1021453	22
1021453	24
1021453	26
1019123	2
1019123	3
1019123	4
1019123	6
1019123	8
1019123	9
1019123	10
1019123	11
1019123	12
1019123	13
1019123	17
1019123	18
1019123	19
1019123	21
1019123	22
1019123	24
1019123	26
1019123	27
1000958	2
1000958	3
1000958	4
1000958	5
1000958	6
1000958	7
1000958	8
1000958	9
1000958	10
1000958	11
1000958	13
1000958	16
1000958	17
1000958	18
1000958	19
1000958	20
1000958	21
1000958	22
1000958	24
1000958	27
1000958	28
1021638	1
1021638	2
1021638	3
1021638	4
1021638	5
1021638	6
1021638	7
1021638	8
1021638	9
1021638	10
1021638	11
1021638	13
1021638	15
1021638	16
1021638	17
1021638	18
1021638	19
1021638	21
1021638	22
1021638	23
1021638	24
1021638	26
1021638	28
1021638	30
1021504	2
1021504	5
1021504	6
1021504	8
1021504	9
1021504	10
1021504	11
1021504	13
1021504	16
1021504	17
1021504	18
1021504	24
1002803	2
1002803	4
1002803	5
1002803	6
1002803	8
1002803	9
1002803	10
1002803	11
1002803	12
1002803	13
1002803	15
1002803	16
1002803	17
1002803	19
1002803	20
1002803	22
1002803	24
1018989	1
1018989	2
1018989	4
1018989	5
1018989	6
1018989	7
1018989	9
1018989	10
1018989	11
1018989	12
1018989	13
1018989	16
1018989	17
1018989	18
1018989	19
1018989	22
1018989	24
1018989	27
1018989	29
1021680	1
1021680	2
1021680	4
1021680	5
1021680	6
1021680	8
1021680	9
1021680	10
1021680	11
1021680	13
1021680	16
1021680	17
1021680	18
1021680	19
1021680	20
1021680	22
1021680	23
1021680	24
1021680	26
1021680	27
1021680	28
1018505	2
1018505	4
1018505	6
1018505	8
1018505	9
1018505	10
1018505	11
1018505	15
1018505	16
1018505	19
1018505	24
1018505	28
1019101	6
1019101	7
1019101	9
1019101	13
1019101	17
1019101	24
1002880	1
1002880	2
1002880	3
1002880	4
1002880	5
1002880	6
1002880	7
1002880	8
1002880	9
1002880	10
1002880	11
1002880	12
1002880	13
1002880	15
1002880	16
1002880	17
1002880	18
1002880	19
1002880	21
1002880	22
1002880	23
1002880	24
1002880	25
1002880	26
1002880	27
1002880	28
1002880	29
1002880	30
1019298	1
1019298	2
1019298	3
1019298	4
1019298	5
1019298	6
1019298	7
1019298	8
1019298	9
1019298	10
1019298	11
1019298	13
1019298	16
1019298	17
1019298	18
1019298	19
1019298	20
1019298	21
1019298	22
1019298	24
1019298	25
1019298	26
1019298	27
1019298	30
1019147	1
1019147	2
1019147	3
1019147	4
1019147	5
1019147	6
1019147	8
1019147	9
1019147	11
1019147	13
1019147	15
1019147	16
1019147	17
1019147	18
1019147	19
1019147	22
1019147	24
1019147	26
1019147	30
1021654	2
1021654	3
1021654	5
1021654	6
1021654	8
1021654	9
1021654	10
1021654	11
1021654	12
1021654	13
1021654	16
1021654	17
1021654	18
1021654	19
1021654	22
1021654	24
1021654	27
1020092	2
1020092	4
1020092	9
1020092	24
1020007	2
1020007	3
1020007	4
1020007	5
1020007	6
1020007	8
1020007	9
1020007	11
1020007	12
1020007	13
1020007	16
1020007	17
1020007	18
1020007	19
1020007	22
1020007	24
1020007	25
1020007	26
1020007	28
1020007	30
1021565	2
1021565	4
1021565	5
1021565	6
1021565	8
1021565	9
1021565	10
1021565	11
1021565	13
1021565	15
1021565	16
1021565	17
1021565	18
1021565	19
1021565	20
1021565	22
1021565	24
1021565	26
1021565	30
1012429	1
1012429	2
1012429	3
1012429	5
1012429	6
1012429	7
1012429	8
1012429	9
1012429	10
1012429	11
1012429	13
1012429	15
1012429	16
1012429	17
1012429	18
1012429	20
1012429	22
1012429	23
1012429	24
1012429	25
1012429	26
1012429	27
1012429	29
1012429	30
1018415	2
1018415	5
1018415	6
1018415	9
1018415	10
1018415	11
1018415	13
1018415	17
1018415	24
1021353	1
1021353	2
1021353	3
1021353	4
1021353	5
1021353	6
1021353	7
1021353	8
1021353	9
1021353	10
1021353	11
1021353	12
1021353	13
1021353	15
1021353	16
1021353	17
1021353	18
1021353	19
1021353	21
1021353	22
1021353	23
1021353	24
1021353	25
1021353	26
1021353	27
1021353	28
1021353	29
1021353	30
1019600	2
1019600	4
1019600	5
1019600	6
1019600	9
1019600	10
1019600	11
1019600	13
1019600	16
1019600	18
1019600	19
1019600	21
1019600	22
1019600	24
1019600	26
1019404	8
1019404	9
1019404	23
1019404	24
1012466	6
1012466	8
1012466	9
1012466	10
1012466	23
1012466	24
1012466	25
1018671	1
1018671	2
1018671	3
1018671	5
1018671	6
1018671	7
1018671	8
1018671	9
1018671	10
1018671	11
1018671	12
1018671	13
1018671	16
1018671	17
1018671	18
1018671	19
1018671	21
1018671	22
1018671	24
1018671	26
1018671	27
1018671	30
1011730	1
1011730	2
1011730	6
1011730	7
1011730	8
1011730	9
1011730	10
1011730	11
1011730	13
1011730	15
1011730	16
1011730	17
1011730	18
1011730	19
1011730	20
1011730	22
1011730	24
1011730	25
1011730	26
1011730	27
1011730	28
1021552	1
1021552	2
1021552	3
1021552	5
1021552	6
1021552	9
1021552	10
1021552	11
1021552	13
1021552	16
1021552	17
1021552	18
1021552	19
1021552	21
1021552	22
1021552	24
1021552	28
1019762	1
1019762	2
1019762	3
1019762	4
1019762	5
1019762	6
1019762	8
1019762	9
1019762	10
1019762	12
1019762	13
1019762	16
1019762	17
1019762	18
1019762	19
1019762	21
1019762	22
1019762	24
1019762	25
1019762	26
1019762	27
1019762	28
1019762	30
1019285	1
1019285	2
1019285	3
1019285	4
1019285	5
1019285	6
1019285	8
1019285	9
1019285	10
1019285	11
1019285	12
1019285	13
1019285	16
1019285	17
1019285	18
1019285	19
1019285	20
1019285	21
1019285	22
1019285	24
1019285	25
1019285	26
1019285	27
1019285	28
1019998	2
1019998	3
1019998	4
1019998	5
1019998	6
1019998	7
1019998	8
1019998	9
1019998	10
1019998	11
1019998	13
1019998	15
1019998	16
1019998	17
1019998	18
1019998	19
1019998	20
1019998	21
1019998	22
1019998	23
1019998	24
1019998	25
1019998	26
1019998	27
1019998	28
1019998	29
1019998	30
1018121	1
1018121	2
1018121	5
1018121	6
1018121	8
1018121	9
1018121	10
1018121	11
1018121	13
1018121	15
1018121	16
1018121	18
1018121	24
1019949	1
1019949	2
1019949	3
1019949	6
1019949	7
1019949	8
1019949	9
1019949	10
1019949	11
1019949	12
1019949	13
1019949	17
1019949	18
1019949	21
1019949	22
1019949	24
1019949	25
1019949	26
1019949	27
1019949	28
1006661	1
1006661	2
1006661	3
1006661	4
1006661	5
1006661	6
1006661	7
1006661	8
1006661	9
1006661	10
1006661	11
1006661	12
1006661	13
1006661	16
1006661	17
1006661	18
1006661	19
1006661	20
1006661	21
1006661	22
1006661	23
1006661	24
1006661	25
1006661	26
1006661	27
1006661	30
1021590	2
1021590	4
1021590	5
1021590	6
1021590	8
1021590	9
1021590	10
1021590	11
1021590	15
1021590	17
1021590	18
1021590	19
1021590	23
1021590	24
1021444	2
1021444	4
1021444	6
1021444	8
1021444	9
1021444	10
1021444	11
1021444	15
1021444	16
1021444	19
1021444	24
1021444	25
1021730	2
1021730	4
1021730	6
1021730	8
1021730	9
1021730	10
1021730	11
1021730	16
1021730	19
1021730	20
1021730	24
1019630	2
1019630	4
1019630	6
1019630	8
1019630	9
1019630	10
1019630	11
1019630	13
1019630	16
1019630	17
1019630	19
1019630	22
1019630	24
1011814	1
1011814	2
1011814	3
1011814	4
1011814	5
1011814	6
1011814	7
1011814	8
1011814	9
1011814	10
1011814	11
1011814	12
1011814	13
1011814	15
1011814	16
1011814	18
1011814	19
1011814	20
1011814	22
1011814	23
1011814	24
1011814	25
1011814	26
1011814	30
1018970	2
1018970	4
1018970	5
1018970	6
1018970	9
1018970	10
1018970	11
1018970	16
1018970	19
1018970	20
1018970	24
1018831	1
1018831	2
1018831	4
1018831	5
1018831	6
1018831	8
1018831	9
1018831	10
1018831	11
1018831	13
1018831	15
1018831	16
1018831	17
1018831	19
1018831	24
1018831	25
1018831	26
1018831	28
1019728	1
1019728	2
1019728	3
1019728	4
1019728	5
1019728	6
1019728	8
1019728	9
1019728	10
1019728	11
1019728	12
1019728	13
1019728	15
1019728	16
1019728	17
1019728	18
1019728	19
1019728	20
1019728	22
1019728	23
1019728	24
1019728	25
1019728	26
1019728	27
1019728	28
1019728	29
1019728	30
1021662	2
1021662	4
1021662	8
1021662	9
1021662	10
1021662	11
1021662	15
1021662	16
1021662	18
1021662	19
1021662	24
1021662	26
1020095	6
1020095	9
1019587	2
1019587	4
1019587	5
1019587	9
1019587	11
1019587	13
1019587	18
1019587	24
1021677	1
1021677	2
1021677	4
1021677	5
1021677	6
1021677	8
1021677	9
1021677	10
1021677	11
1021677	13
1021677	16
1021677	17
1021677	19
1021677	24
1021416	2
1021416	3
1021416	4
1021416	5
1021416	6
1021416	8
1021416	9
1021416	10
1021416	11
1021416	12
1021416	18
1021416	19
1021416	22
1021416	24
1021416	26
1021416	27
1021416	30
1012033	2
1012033	3
1012033	4
1012033	5
1012033	6
1012033	7
1012033	8
1012033	10
1012033	11
1012033	13
1012033	15
1012033	17
1012033	18
1012033	19
1012033	22
1012033	24
1012033	26
1019602	9
1019602	24
1019603	9
1019603	24
1019604	9
1019604	24
1019605	9
1019605	24
1019606	9
1019606	24
1019607	9
1019607	24
1019608	9
1019608	24
1021461	1
1021461	2
1021461	3
1021461	4
1021461	5
1021461	6
1021461	7
1021461	8
1021461	9
1021461	10
1021461	11
1021461	12
1021461	13
1021461	15
1021461	16
1021461	17
1021461	18
1021461	19
1021461	20
1021461	21
1021461	22
1021461	23
1021461	24
1021461	25
1021461	26
1021461	27
1021461	28
1021461	29
1021461	30
1021284	1
1021284	2
1021284	3
1021284	4
1021284	5
1021284	6
1021284	7
1021284	8
1021284	9
1021284	10
1021284	11
1021284	12
1021284	13
1021284	17
1021284	18
1021284	19
1021284	22
1021284	24
1021284	27
1021284	30
1008573	2
1008573	4
1008573	5
1008573	6
1008573	8
1008573	9
1008573	10
1008573	11
1008573	13
1008573	16
1008573	23
1008573	24
1002767	1
1002767	2
1002767	3
1002767	4
1002767	5
1002767	6
1002767	8
1002767	9
1002767	10
1002767	11
1002767	12
1002767	13
1002767	15
1002767	16
1002767	17
1002767	18
1002767	19
1002767	22
1002767	23
1002767	24
1002767	27
1005588	16
1005588	24
1019710	1
1019710	2
1019710	3
1019710	4
1019710	6
1019710	7
1019710	8
1019710	9
1019710	10
1019710	11
1019710	12
1019710	13
1019710	17
1019710	18
1019710	19
1019710	22
1019710	23
1019710	24
1019710	26
1019710	27
1019710	28
1019710	30
1019414	1
1019414	2
1019414	3
1019414	5
1019414	6
1019414	7
1019414	8
1019414	9
1019414	10
1019414	11
1019414	12
1019414	13
1019414	16
1019414	17
1019414	19
1019414	23
1019414	24
1019414	25
1019414	26
1019414	27
1019414	29
1021364	1
1021364	2
1021364	5
1021364	6
1021364	8
1021364	9
1021364	10
1021364	11
1021364	13
1021364	18
1021364	19
1021364	22
1021364	24
1021364	28
1020050	2
1020050	5
1020050	6
1020050	9
1020050	10
1020050	19
1020050	22
1020050	24
1020050	27
1019833	2
1019833	4
1019833	5
1019833	6
1019833	9
1019833	10
1019833	11
1019833	13
1019833	17
1019833	19
1019833	22
1019833	24
1021350	2
1021350	3
1021350	4
1021350	5
1021350	6
1021350	8
1021350	9
1021350	10
1021350	11
1021350	13
1021350	16
1021350	19
1021350	22
1021350	24
1021350	25
1021308	2
1021308	5
1021308	6
1021308	9
1021308	10
1021308	11
1021308	16
1021308	17
1021308	20
1021308	24
1012253	2
1012253	3
1012253	6
1012253	7
1012253	8
1012253	9
1012253	10
1012253	11
1012253	12
1012253	13
1012253	16
1012253	17
1012253	19
1012253	21
1012253	22
1012253	24
1012253	27
1012253	28
1021392	2
1021392	4
1021392	9
1021392	24
1005937	2
1005937	4
1005937	5
1005937	6
1005937	7
1005937	8
1005937	9
1005937	10
1005937	11
1005937	12
1005937	13
1005937	16
1005937	17
1005937	18
1005937	19
1005937	22
1005937	23
1005937	24
1005937	25
1005937	27
1005937	30
1017947	2
1017947	3
1017947	4
1017947	5
1017947	6
1017947	7
1017947	8
1017947	9
1017947	10
1017947	11
1017947	12
1017947	13
1017947	15
1017947	16
1017947	17
1017947	18
1017947	19
1017947	20
1017947	22
1017947	23
1017947	24
1017947	25
1017947	26
1017947	27
1017947	28
1017947	30
1021484	1
1021484	2
1021484	3
1021484	4
1021484	5
1021484	6
1021484	7
1021484	8
1021484	9
1021484	10
1021484	11
1021484	13
1021484	15
1021484	16
1021484	17
1021484	18
1021484	19
1021484	21
1021484	22
1021484	24
1021484	25
1021484	26
1021484	27
1021484	28
1021484	29
1021484	30
1019989	2
1019989	6
1019989	9
1019989	10
1019989	11
1019989	24
1009808	2
1009808	4
1009808	5
1009808	6
1009808	8
1009808	9
1009808	10
1009808	11
1009808	12
1009808	13
1009808	16
1009808	18
1009808	19
1009808	24
1009808	27
1021456	2
1021456	4
1021456	5
1021456	6
1021456	8
1021456	9
1021456	10
1021456	16
1021456	18
1021456	19
1021456	22
1021456	24
1006059	1
1006059	2
1006059	3
1006059	4
1006059	5
1006059	6
1006059	8
1006059	9
1006059	10
1006059	11
1006059	12
1006059	13
1006059	15
1006059	16
1006059	17
1006059	18
1006059	19
1006059	20
1006059	21
1006059	22
1006059	24
1006059	27
1006059	28
1021289	2
1021289	3
1021289	4
1021289	5
1021289	6
1021289	8
1021289	9
1021289	10
1021289	11
1021289	13
1021289	16
1021289	17
1021289	18
1021289	19
1021289	20
1021289	22
1021289	23
1021289	24
1021289	26
1021289	27
1021289	30
1021319	1
1021319	2
1021319	3
1021319	5
1021319	6
1021319	7
1021319	8
1021319	9
1021319	10
1021319	11
1021319	12
1021319	13
1021319	15
1021319	17
1021319	18
1021319	19
1021319	22
1021319	23
1021319	24
1021319	25
1021319	26
1021319	27
1021319	28
1021319	29
1021319	30
1021320	1
1021320	2
1021320	3
1021320	5
1021320	6
1021320	7
1021320	8
1021320	9
1021320	10
1021320	11
1021320	13
1021320	17
1021320	18
1021320	22
1021320	24
1021320	26
1021320	27
1021320	30
1004849	1
1004849	2
1004849	3
1004849	4
1004849	5
1004849	6
1004849	8
1004849	9
1004849	10
1004849	11
1004849	13
1004849	15
1004849	16
1004849	17
1004849	18
1004849	19
1004849	22
1004849	24
1004849	26
1004849	27
1004849	28
1004849	30
1006997	1
1006997	2
1006997	4
1006997	5
1006997	6
1006997	8
1006997	9
1006997	10
1006997	11
1006997	12
1006997	13
1006997	16
1006997	17
1006997	18
1006997	19
1006997	20
1006997	22
1006997	24
1006997	25
1006997	26
1006997	27
1006997	30
1019805	1
1019805	2
1019805	3
1019805	5
1019805	6
1019805	7
1019805	8
1019805	9
1019805	10
1019805	11
1019805	13
1019805	15
1019805	16
1019805	17
1019805	18
1019805	19
1019805	21
1019805	22
1019805	24
1019805	26
1019805	27
1019132	2
1019132	3
1019132	5
1019132	6
1019132	8
1019132	9
1019132	10
1019132	11
1019132	13
1019132	16
1019132	18
1019132	19
1019132	22
1019132	24
1018472	1
1018472	2
1018472	4
1018472	5
1018472	6
1018472	7
1018472	8
1018472	9
1018472	10
1018472	11
1018472	13
1018472	15
1018472	16
1018472	18
1018472	19
1018472	20
1018472	22
1018472	23
1018472	24
1018472	25
1018472	26
1018472	28
1021382	2
1021382	4
1021382	5
1021382	6
1021382	9
1021382	10
1021382	11
1021382	13
1021382	16
1021382	17
1021382	18
1021382	19
1021382	24
1021382	27
1021382	30
1021536	2
1021536	5
1021536	7
1021536	8
1021536	9
1021536	10
1021536	11
1021536	13
1021536	17
1021536	18
1021536	22
1021536	24
1021536	26
1019088	2
1019088	9
1019088	10
1019088	11
1019088	15
1019088	18
1019088	19
1019088	24
1019088	25
1019088	26
1019088	27
1019088	29
1019088	30
1021247	1
1021247	5
1021247	9
1021247	19
1021247	20
1021247	26
1018619	2
1018619	4
1018619	5
1018619	6
1018619	7
1018619	8
1018619	9
1018619	10
1018619	11
1018619	12
1018619	13
1018619	16
1018619	19
1018619	24
1018619	27
1005265	8
1005265	9
1005265	15
1005265	24
1005265	27
1001804	2
1001804	4
1001804	6
1001804	8
1001804	9
1001804	10
1001804	11
1001804	12
1001804	15
1001804	17
1001804	18
1001804	19
1001804	23
1001804	24
1001804	25
1001804	30
1021584	1
1021584	2
1021584	3
1021584	5
1021584	6
1021584	7
1021584	9
1021584	11
1021584	13
1021584	15
1021584	16
1021584	17
1021584	18
1021584	22
1021584	24
1019673	2
1019673	4
1019673	5
1019673	6
1019673	9
1019673	10
1019673	11
1019673	16
1019673	19
1019673	22
1019673	24
1018774	2
1018774	9
1018774	24
1019738	1
1019738	2
1019738	3
1019738	4
1019738	5
1019738	6
1019738	8
1019738	9
1019738	10
1019738	11
1019738	12
1019738	13
1019738	16
1019738	17
1019738	18
1019738	19
1019738	22
1019738	24
1019738	27
1019209	1
1019209	2
1019209	3
1019209	5
1019209	6
1019209	7
1019209	8
1019209	9
1019209	10
1019209	11
1019209	13
1019209	16
1019209	17
1019209	18
1019209	19
1019209	21
1019209	22
1019209	24
1019209	25
1019209	28
1001597	2
1001597	4
1001597	6
1001597	8
1001597	9
1001597	10
1001597	11
1001597	16
1001597	24
1021583	1
1021583	2
1021583	3
1021583	4
1021583	5
1021583	6
1021583	7
1021583	8
1021583	9
1021583	10
1021583	11
1021583	13
1021583	15
1021583	16
1021583	17
1021583	18
1021583	19
1021583	20
1021583	22
1021583	24
1021583	26
1021583	27
1021583	30
1006425	2
1006425	3
1006425	4
1006425	5
1006425	6
1006425	8
1006425	9
1006425	10
1006425	11
1006425	15
1006425	17
1006425	18
1006425	19
1006425	22
1006425	24
1006425	26
1006425	27
1006425	30
1019065	2
1019065	4
1019065	5
1019065	8
1019065	9
1019065	10
1019065	11
1019065	12
1019065	13
1019065	15
1019065	16
1019065	17
1019065	18
1019065	19
1019065	20
1019065	22
1019065	24
1019065	26
1019065	27
1019065	28
1019148	2
1019148	3
1019148	4
1019148	6
1019148	8
1019148	9
1019148	10
1019148	11
1019148	13
1019148	17
1019148	18
1019148	19
1019148	21
1019148	22
1019148	24
1019533	1
1019533	2
1019533	4
1019533	9
1019533	10
1019533	11
1019533	12
1019533	19
1019533	22
1019533	24
1019770	1
1019770	2
1019770	4
1019770	5
1019770	9
1019770	10
1019770	11
1019770	12
1019770	16
1019770	18
1019770	24
1019154	2
1019154	4
1019154	5
1019154	6
1019154	9
1019154	10
1019154	11
1019154	16
1019154	24
1018380	2
1018380	4
1018380	6
1018380	8
1018380	9
1018380	10
1018380	11
1018380	13
1018380	15
1018380	17
1018380	18
1018380	19
1018380	22
1018380	24
1018380	25
1018380	26
1018380	28
1021696	2
1021696	3
1021696	4
1021696	5
1021696	6
1021696	7
1021696	9
1021696	10
1021696	11
1021696	13
1021696	16
1021696	17
1021696	18
1021696	19
1021696	22
1021696	24
1021696	26
1021696	28
1021555	2
1021555	4
1021555	6
1021555	9
1021555	10
1021555	18
1021555	19
1021555	24
1020122	2
1020122	4
1020122	5
1020122	6
1020122	8
1020122	9
1020122	10
1020122	11
1020122	16
1020122	17
1020122	19
1020122	24
1020125	2
1020125	4
1020125	5
1020125	9
1020125	10
1020125	11
1020125	16
1020125	19
1020125	24
1020107	2
1020107	4
1020107	9
1020107	10
1020107	11
1020107	24
1011782	4
1011782	5
1011782	8
1011782	9
1011782	10
1011782	19
1011782	22
1011782	24
1019383	2
1019383	9
1019383	24
1019373	9
1019373	24
1019374	9
1019374	24
1019366	2
1019366	9
1019366	10
1019366	11
1019366	24
1019375	2
1019375	9
1019375	10
1019375	11
1019375	12
1019375	24
1019380	9
1019380	24
1019381	2
1019381	9
1019381	10
1019381	11
1019381	12
1019381	24
1019377	9
1019377	24
1019378	2
1019378	9
1019378	10
1019378	11
1019378	24
1019376	9
1019376	24
1019382	9
1019382	24
1002339	2
1002339	9
1002339	10
1002339	11
1002339	18
1002339	22
1002339	24
1002335	2
1002335	9
1002335	10
1002335	11
1002335	24
1005332	2
1005332	9
1005332	11
1005332	24
1019379	9
1019379	24
1002345	9
1002345	24
1009660	5
1009660	8
1009660	9
1009660	15
1009660	23
1009660	24
1009660	27
1018282	1
1018282	2
1018282	3
1018282	4
1018282	5
1018282	6
1018282	8
1018282	9
1018282	10
1018282	11
1018282	12
1018282	13
1018282	15
1018282	16
1018282	17
1018282	18
1018282	19
1018282	20
1018282	22
1018282	24
1018282	26
1018282	27
1018282	28
1020044	1
1020044	2
1020044	3
1020044	4
1020044	5
1020044	6
1020044	8
1020044	9
1020044	10
1020044	11
1020044	12
1020044	13
1020044	15
1020044	16
1020044	17
1020044	18
1020044	19
1020044	20
1020044	22
1020044	24
1020044	26
1020044	27
1020044	28
1021431	2
1021431	3
1021431	5
1021431	6
1021431	8
1021431	9
1021431	10
1021431	11
1021431	12
1021431	13
1021431	17
1021431	19
1021431	22
1021431	24
1021431	28
1021671	2
1021671	3
1021671	4
1021671	5
1021671	6
1021671	8
1021671	9
1021671	10
1021671	11
1021671	12
1021671	13
1021671	16
1021671	17
1021671	18
1021671	19
1021671	21
1021671	22
1021671	24
1021671	27
1021671	28
1021672	2
1021672	3
1021672	4
1021672	6
1021672	9
1021672	10
1021672	11
1021672	12
1021672	13
1021672	17
1021672	18
1021672	19
1021672	21
1021672	22
1021672	24
1021672	28
1021211	2
1021211	4
1021211	5
1021211	7
1021211	9
1021211	11
1021211	13
1021211	15
1021211	18
1021211	19
1021211	24
1019786	2
1019786	4
1019786	5
1019786	9
1019786	10
1019786	11
1019786	12
1019786	16
1019786	24
1019757	1
1019757	2
1019757	3
1019757	6
1019757	7
1019757	8
1019757	9
1019757	10
1019757	11
1019757	15
1019757	18
1019757	22
1019757	24
1019757	26
1019192	2
1019192	4
1019192	5
1019192	6
1019192	8
1019192	9
1019192	10
1019192	11
1019192	15
1019192	16
1019192	17
1019192	19
1019192	20
1019192	24
1019192	27
1019895	9
1019895	24
1021286	2
1021286	5
1021286	6
1021286	8
1021286	9
1021286	10
1021286	16
1021286	17
1021286	24
1019802	1
1019802	2
1019802	3
1019802	4
1019802	5
1019802	6
1019802	8
1019802	9
1019802	10
1019802	11
1019802	13
1019802	16
1019802	17
1019802	18
1019802	19
1019802	22
1019802	24
1019802	27
1019802	30
1021282	1
1021282	2
1021282	6
1021282	9
1021282	10
1021282	13
1021282	17
1021282	22
1021282	23
1021282	24
1021282	25
1021282	27
1020174	2
1020174	4
1020174	5
1020174	6
1020174	8
1020174	9
1020174	10
1020174	11
1020174	12
1020174	19
1020174	24
1020174	27
1020174	30
1003684	1
1003684	2
1003684	3
1003684	4
1003684	5
1003684	6
1003684	7
1003684	8
1003684	10
1003684	11
1003684	12
1003684	13
1003684	15
1003684	16
1003684	17
1003684	18
1003684	19
1003684	22
1003684	23
1003684	24
1003684	25
1019234	2
1019234	4
1019234	6
1019234	8
1019234	9
1019234	10
1019234	11
1019234	13
1019234	16
1019234	18
1019234	19
1019234	22
1019234	23
1019234	24
1019234	27
1019234	30
1006285	2
1006285	3
1006285	4
1006285	5
1006285	6
1006285	8
1006285	9
1006285	10
1006285	11
1006285	13
1006285	15
1006285	16
1006285	18
1006285	19
1006285	20
1006285	22
1006285	23
1006285	24
1006285	25
1006285	26
1006285	27
1006285	28
1019486	2
1019486	5
1019486	6
1019486	8
1019486	9
1019486	10
1019486	11
1019486	16
1019486	18
1019486	24
1019486	26
1021355	1
1021355	2
1021355	3
1021355	4
1021355	5
1021355	6
1021355	8
1021355	9
1021355	10
1021355	11
1021355	16
1021355	18
1021355	19
1021355	22
1021355	24
1021355	26
1021355	29
1021355	30
1020026	2
1020026	4
1020026	9
1020026	10
1020026	11
1020026	12
1020026	19
1020026	24
1019224	1
1019224	2
1019224	3
1019224	4
1019224	5
1019224	6
1019224	7
1019224	8
1019224	9
1019224	10
1019224	11
1019224	13
1019224	15
1019224	17
1019224	18
1019224	19
1019224	22
1019224	24
1019224	28
1019220	2
1019220	3
1019220	4
1019220	5
1019220	6
1019220	7
1019220	8
1019220	9
1019220	10
1019220	11
1019220	13
1019220	16
1019220	17
1019220	18
1019220	19
1019220	20
1019220	22
1019220	24
1019220	28
1012260	2
1012260	3
1012260	4
1012260	5
1012260	6
1012260	7
1012260	8
1012260	9
1012260	10
1012260	11
1012260	12
1012260	13
1012260	15
1012260	16
1012260	17
1012260	18
1012260	19
1012260	20
1012260	22
1012260	23
1012260	24
1012260	27
1012260	28
1012260	29
1012260	30
1006831	1
1006831	2
1006831	3
1006831	4
1006831	5
1006831	6
1006831	7
1006831	8
1006831	9
1006831	10
1006831	11
1006831	12
1006831	13
1006831	16
1006831	17
1006831	18
1006831	19
1006831	24
1006831	27
1021327	2
1021327	4
1021327	6
1021327	7
1021327	8
1021327	9
1021327	10
1021327	11
1021327	13
1021327	15
1021327	16
1021327	17
1021327	18
1021327	19
1021327	22
1021327	23
1021327	24
1021327	26
1021327	27
1021327	30
1018951	2
1018951	3
1018951	4
1018951	6
1018951	7
1018951	9
1018951	10
1018951	11
1018951	12
1018951	15
1018951	16
1018951	17
1018951	19
1018951	24
1018951	26
1019688	2
1019688	9
1019688	10
1019688	11
1019688	13
1019688	16
1019688	17
1019688	19
1019688	20
1019688	24
1019688	26
1019688	27
1019959	2
1019959	4
1019959	5
1019959	8
1019959	9
1019959	11
1019959	13
1019959	15
1019959	16
1019959	18
1019959	19
1019959	21
1019959	23
1019959	24
1019959	26
1019959	27
1019959	28
1019962	1
1019962	2
1019962	3
1019962	4
1019962	5
1019962	6
1019962	8
1019962	9
1019962	10
1019962	11
1019962	13
1019962	15
1019962	16
1019962	17
1019962	18
1019962	19
1019962	21
1019962	24
1019962	25
1019962	26
1019962	28
1021249	1
1021249	2
1021249	3
1021249	5
1021249	6
1021249	7
1021249	8
1021249	9
1021249	10
1021249	11
1021249	13
1021249	15
1021249	16
1021249	17
1021249	20
1021249	22
1021249	23
1021249	24
1021249	25
1021249	26
1021249	27
1021249	30
1019669	2
1019669	3
1019669	4
1019669	5
1019669	6
1019669	7
1019669	8
1019669	9
1019669	10
1019669	11
1019669	15
1019669	16
1019669	18
1019669	19
1019669	24
1008020	2
1008020	3
1008020	4
1008020	5
1008020	6
1008020	7
1008020	8
1008020	9
1008020	10
1008020	11
1008020	12
1008020	13
1008020	16
1008020	17
1008020	18
1008020	19
1008020	20
1008020	21
1008020	22
1008020	24
1008020	26
1008020	27
1005076	1
1005076	2
1005076	3
1005076	5
1005076	6
1005076	7
1005076	8
1005076	9
1005076	10
1005076	11
1005076	13
1005076	16
1005076	17
1005076	18
1005076	19
1005076	21
1005076	22
1005076	23
1005076	24
1019330	2
1019330	4
1019330	5
1019330	6
1019330	8
1019330	9
1019330	10
1019330	11
1019330	13
1019330	16
1019330	17
1019330	19
1019330	22
1019330	23
1019330	24
1019330	27
1021208	1
1021208	2
1021208	3
1021208	5
1021208	6
1021208	7
1021208	9
1021208	10
1021208	11
1021208	12
1021208	16
1021208	17
1021208	22
1021208	24
1021208	26
1021208	27
1010937	2
1010937	4
1010937	5
1010937	6
1010937	8
1010937	9
1010937	10
1010937	11
1010937	12
1010937	16
1010937	18
1010937	19
1010937	22
1010937	23
1010937	24
1010937	30
1021533	1
1021533	2
1021533	3
1021533	4
1021533	5
1021533	6
1021533	8
1021533	9
1021533	10
1021533	11
1021533	12
1021533	13
1021533	16
1021533	17
1021533	18
1021533	19
1021533	20
1021533	22
1021533	24
1021533	25
1021533	28
1021533	29
1021511	2
1021511	5
1021511	6
1021511	8
1021511	9
1021511	10
1021511	16
1021511	17
1021511	18
1021511	19
1021511	24
1021511	28
1021512	1
1021512	2
1021512	3
1021512	5
1021512	6
1021512	8
1021512	9
1021512	10
1021512	11
1021512	16
1021512	17
1021512	18
1021512	19
1021512	20
1021512	22
1021512	23
1021512	24
1021512	26
1021512	27
1021512	28
1021516	1
1021516	2
1021516	3
1021516	5
1021516	6
1021516	7
1021516	8
1021516	9
1021516	10
1021516	11
1021516	13
1021516	16
1021516	17
1021516	19
1021516	22
1021516	24
1021516	27
1011761	2
1011761	3
1011761	4
1011761	5
1011761	6
1011761	7
1011761	8
1011761	9
1011761	10
1011761	11
1011761	13
1011761	15
1011761	16
1011761	17
1011761	18
1011761	19
1011761	20
1011761	24
1011761	25
1011761	27
1011761	28
1018972	2
1018972	3
1018972	4
1018972	5
1018972	6
1018972	8
1018972	9
1018972	10
1018972	11
1018972	13
1018972	16
1018972	17
1018972	18
1018972	19
1018972	22
1018972	24
1018972	28
1008980	2
1008980	4
1008980	9
1008980	11
1008980	16
1008980	18
1008980	19
1008980	24
1008980	28
1008980	30
1021547	2
1021547	4
1021547	5
1021547	6
1021547	8
1021547	9
1021547	10
1021547	11
1021547	13
1021547	17
1021547	18
1021547	19
1021547	21
1021547	22
1021547	24
1021547	26
1021547	27
1021547	28
1019302	2
1019302	4
1019302	5
1019302	6
1019302	8
1019302	9
1019302	10
1019302	11
1019302	12
1019302	13
1019302	16
1019302	17
1019302	18
1019302	19
1019302	24
1019302	30
1018853	2
1018853	3
1018853	4
1018853	5
1018853	6
1018853	7
1018853	8
1018853	9
1018853	10
1018853	11
1018853	12
1018853	13
1018853	15
1018853	16
1018853	17
1018853	18
1018853	19
1018853	20
1018853	21
1018853	22
1018853	24
1018853	26
1018853	27
1018853	28
1021229	1
1021229	2
1021229	3
1021229	5
1021229	6
1021229	7
1021229	8
1021229	9
1021229	10
1021229	11
1021229	13
1021229	15
1021229	17
1021229	20
1021229	22
1021229	23
1021229	24
1021229	25
1021229	26
1021229	27
1021229	29
1018458	1
1018458	2
1018458	3
1018458	4
1018458	5
1018458	6
1018458	8
1018458	9
1018458	10
1018458	11
1018458	13
1018458	16
1018458	17
1018458	19
1018458	21
1018458	22
1018458	24
1007267	2
1007267	4
1007267	5
1007267	6
1007267	7
1007267	8
1007267	9
1007267	10
1007267	11
1007267	16
1007267	17
1007267	18
1007267	19
1007267	20
1007267	22
1007267	24
1007267	25
1007267	26
1007267	27
1007267	28
1007267	30
1009663	2
1009663	3
1009663	4
1009663	5
1009663	8
1009663	9
1009663	10
1009663	11
1009663	16
1009663	18
1009663	19
1009663	21
1009663	22
1009663	24
1009663	26
1009663	27
1012076	1
1012076	2
1012076	3
1012076	4
1012076	5
1012076	6
1012076	7
1012076	8
1012076	9
1012076	10
1012076	11
1012076	13
1012076	17
1012076	18
1012076	19
1012076	20
1012076	21
1012076	22
1012076	24
1012076	26
1012076	27
1012076	28
1012076	29
1012076	30
1019819	1
1019819	4
1019819	5
1019819	6
1019819	8
1019819	9
1019819	10
1019819	11
1019819	12
1019819	13
1019819	17
1019819	19
1019819	22
1019819	24
1019819	27
1019819	30
1021705	2
1021705	3
1021705	5
1021705	9
1021705	10
1021705	11
1021705	15
1021705	17
1021705	18
1021705	19
1021705	21
1021705	22
1021705	24
1021705	26
1021711	1
1021711	2
1021711	3
1021711	5
1021711	6
1021711	7
1021711	8
1021711	9
1021711	10
1021711	11
1021711	12
1021711	13
1021711	16
1021711	17
1021711	18
1021711	22
1021711	24
1021711	26
1021711	27
1021711	28
1021711	30
1012041	1
1012041	2
1012041	3
1012041	4
1012041	6
1012041	7
1012041	9
1012041	10
1012041	11
1012041	12
1012041	13
1012041	17
1012041	18
1012041	19
1012041	22
1012041	24
1012041	25
1012041	26
1012041	28
1012041	30
1020100	2
1020100	3
1020100	4
1020100	5
1020100	6
1020100	8
1020100	9
1020100	10
1020100	11
1020100	12
1020100	13
1020100	17
1020100	18
1020100	19
1020100	21
1020100	24
1020100	27
1008366	1
1008366	2
1008366	3
1008366	6
1008366	8
1008366	9
1008366	10
1008366	12
1008366	13
1008366	17
1008366	18
1008366	24
1019313	2
1019313	4
1019313	5
1019313	6
1019313	8
1019313	9
1019313	10
1019313	11
1019313	18
1019313	24
1018200	2
1018200	4
1018200	6
1018200	7
1018200	8
1018200	9
1018200	10
1018200	11
1018200	13
1018200	15
1018200	16
1018200	17
1018200	18
1018200	19
1018200	20
1018200	21
1018200	22
1018200	23
1018200	24
1018200	26
1018200	27
1018200	28
1018200	30
1005674	1
1005674	2
1005674	3
1005674	4
1005674	5
1005674	6
1005674	7
1005674	8
1005674	9
1005674	10
1005674	11
1005674	12
1005674	13
1005674	15
1005674	16
1005674	17
1005674	18
1005674	19
1005674	21
1005674	22
1005674	23
1005674	24
1005674	25
1005674	26
1005674	27
1005674	30
1018152	2
1018152	4
1018152	6
1018152	7
1018152	8
1018152	9
1018152	10
1018152	11
1018152	17
1018152	18
1018152	19
1018152	21
1018152	24
1018152	28
1019990	2
1019990	4
1019990	6
1019990	7
1019990	9
1019990	10
1019990	11
1019990	17
1019990	18
1019990	19
1019990	24
1021610	1
1021610	2
1021610	4
1021610	5
1021610	6
1021610	7
1021610	8
1021610	9
1021610	10
1021610	11
1021610	13
1021610	15
1021610	16
1021610	17
1021610	19
1021610	22
1021610	24
1021610	27
1021610	28
1021610	30
1021612	2
1021612	4
1021612	5
1021612	6
1021612	8
1021612	9
1021612	10
1021612	11
1021612	16
1021612	19
1021612	24
1021612	30
1019056	1
1019056	2
1019056	3
1019056	5
1019056	6
1019056	8
1019056	9
1019056	10
1019056	11
1019056	13
1019056	17
1019056	18
1019056	19
1019056	20
1019056	21
1019056	22
1019056	24
1019056	27
1019056	28
1010598	1
1010598	2
1010598	3
1010598	5
1010598	6
1010598	8
1010598	9
1010598	10
1010598	11
1010598	13
1010598	16
1010598	17
1010598	18
1010598	19
1010598	21
1010598	24
1010598	27
1010598	30
1021268	2
1021268	4
1021268	5
1021268	6
1021268	7
1021268	8
1021268	9
1021268	10
1021268	11
1021268	12
1021268	13
1021268	16
1021268	17
1021268	19
1021268	22
1021268	24
1021268	27
1019586	1
1019586	2
1019586	3
1019586	4
1019586	5
1019586	6
1019586	9
1019586	10
1019586	11
1019586	13
1019586	16
1019586	17
1019586	18
1019586	19
1019586	24
1019586	28
1021635	2
1021635	9
1021635	10
1021635	11
1021635	15
1021635	16
1021635	20
1021635	22
1021635	23
1021635	24
1021635	28
1011325	2
1011325	3
1011325	6
1011325	8
1011325	9
1011325	10
1011325	11
1011325	13
1011325	17
1011325	19
1011325	22
1011325	24
1011325	27
1011325	30
1021703	1
1021703	2
1021703	3
1021703	5
1021703	6
1021703	8
1021703	9
1021703	10
1021703	11
1021703	12
1021703	13
1021703	16
1021703	17
1021703	18
1021703	19
1021703	22
1021703	23
1021703	24
1021703	25
1021703	26
1021703	27
1021703	28
1021703	29
1012621	2
1012621	4
1012621	6
1012621	9
1012621	10
1012621	11
1012621	15
1012621	19
1012621	21
1012621	24
1006417	13
1006417	18
1006417	19
1005080	2
1005080	4
1005080	6
1005080	9
1005080	10
1005080	11
1005080	12
1005080	16
1005080	17
1005080	18
1005080	19
1005080	22
1005080	24
1020136	1
1020136	2
1020136	4
1020136	6
1020136	7
1020136	9
1020136	10
1020136	11
1020136	16
1020136	24
1019011	2
1019011	4
1019011	5
1019011	6
1019011	8
1019011	9
1019011	10
1019011	11
1019011	15
1019011	16
1019011	18
1019011	19
1019011	24
1019236	2
1019236	4
1019236	5
1019236	6
1019236	9
1019236	10
1019236	11
1019236	13
1019236	15
1019236	16
1019236	19
1019236	24
1018772	1
1018772	2
1018772	3
1018772	4
1018772	5
1018772	6
1018772	8
1018772	9
1018772	10
1018772	11
1018772	12
1018772	13
1018772	15
1018772	16
1018772	17
1018772	22
1018772	24
1018772	27
1018772	28
1019861	2
1019861	5
1019861	6
1019861	8
1019861	9
1019861	10
1019861	11
1019861	12
1019861	13
1019861	17
1019861	19
1019861	24
1019861	25
1004384	2
1004384	5
1004384	9
1004384	10
1004384	12
1004384	16
1004384	19
1004384	24
1012626	2
1012626	4
1012626	5
1012626	6
1012626	8
1012626	9
1012626	11
1012626	16
1012626	19
1012626	24
1019340	2
1019340	5
1019340	6
1019340	9
1019340	10
1019340	11
1019340	24
1003680	1
1003680	2
1003680	3
1003680	4
1003680	5
1003680	6
1003680	7
1003680	8
1003680	9
1003680	10
1003680	11
1003680	13
1003680	15
1003680	16
1003680	17
1003680	18
1003680	19
1003680	20
1003680	21
1003680	22
1003680	24
1003680	26
1001641	2
1001641	3
1001641	4
1001641	6
1001641	8
1001641	9
1001641	10
1001641	11
1001641	12
1001641	13
1001641	16
1001641	24
1004380	5
1004380	8
1004380	9
1004380	16
1006376	2
1006376	4
1006376	6
1006376	9
1006376	10
1006376	11
1006376	18
1006376	19
1006376	22
1006376	24
1018907	2
1018907	4
1018907	6
1018907	8
1018907	9
1018907	10
1018907	11
1018907	12
1018907	15
1018907	16
1018907	19
1018907	24
1018343	1
1018343	2
1018343	3
1018343	4
1018343	5
1018343	6
1018343	8
1018343	9
1018343	10
1018343	11
1018343	12
1018343	13
1018343	17
1018343	19
1018343	24
1020106	2
1020106	9
1020106	10
1020106	24
1020108	9
1020108	24
1019263	2
1019263	3
1019263	4
1019263	5
1019263	6
1019263	7
1019263	8
1019263	9
1019263	10
1019263	12
1019263	13
1019263	15
1019263	16
1019263	17
1019263	18
1019263	19
1019263	20
1019263	22
1019263	24
1019263	27
1018978	2
1018978	3
1018978	4
1018978	5
1018978	6
1018978	8
1018978	9
1018978	10
1018978	13
1018978	17
1018978	19
1018978	22
1018978	27
1021281	2
1021281	3
1021281	4
1021281	5
1021281	6
1021281	8
1021281	9
1021281	10
1021281	11
1021281	12
1021281	13
1021281	16
1021281	17
1021281	18
1021281	19
1021281	20
1021281	24
1009970	1
1009970	2
1009970	3
1009970	4
1009970	5
1009970	6
1009970	8
1009970	9
1009970	10
1009970	11
1009970	12
1009970	13
1009970	16
1009970	17
1009970	18
1009970	19
1009970	20
1009970	22
1009970	24
1009970	26
1009970	27
1008299	2
1008299	3
1008299	4
1008299	5
1008299	6
1008299	8
1008299	9
1008299	10
1008299	11
1008299	12
1008299	13
1008299	15
1008299	16
1008299	17
1008299	18
1008299	19
1008299	20
1008299	22
1008299	24
1021306	2
1021306	5
1021306	9
1021306	10
1021306	16
1021306	18
1021306	20
1021306	24
1020192	2
1020192	4
1020192	5
1020192	6
1020192	8
1020192	9
1020192	10
1020192	11
1020192	12
1020192	13
1020192	17
1020192	18
1020192	19
1020192	21
1020192	22
1020192	24
1020192	26
1020192	28
1020090	2
1020090	4
1020090	5
1020090	6
1020090	8
1020090	9
1020090	10
1020090	11
1020090	12
1020090	16
1020090	18
1020090	19
1020090	20
1020090	24
1002907	1
1002907	2
1002907	3
1002907	4
1002907	5
1002907	6
1002907	7
1002907	8
1002907	9
1002907	10
1002907	11
1002907	13
1002907	15
1002907	17
1002907	19
1002907	22
1002907	24
1002907	26
1002907	27
1002907	28
1018242	1
1018242	2
1018242	4
1018242	5
1018242	7
1018242	8
1018242	9
1018242	11
1018242	16
1018242	18
1018242	19
1018242	20
1018242	22
1018242	24
1018242	27
1018242	28
1018242	30
1005270	2
1005270	5
1005270	8
1005270	9
1005270	11
1005270	23
1005270	24
1005270	27
1008375	1
1008375	2
1008375	3
1008375	5
1008375	6
1008375	8
1008375	9
1008375	10
1008375	11
1008375	15
1008375	18
1008375	19
1008375	20
1008375	24
1008375	26
1019774	1
1019774	2
1019774	3
1019774	4
1019774	5
1019774	6
1019774	7
1019774	8
1019774	9
1019774	10
1019774	11
1019774	12
1019774	13
1019774	15
1019774	16
1019774	17
1019774	18
1019774	19
1019774	21
1019774	22
1019774	23
1019774	24
1019774	25
1019774	26
1019774	27
1019774	28
1019774	29
1019774	30
1005252	2
1005252	5
1005252	8
1005252	9
1005252	15
1005252	23
1005252	24
1005252	27
1008118	2
1008118	5
1008118	6
1008118	9
1008118	10
1008118	23
1008118	24
1008118	27
1021264	1
1021264	2
1021264	4
1021264	5
1021264	6
1021264	7
1021264	8
1021264	9
1021264	10
1021264	11
1021264	13
1021264	15
1021264	16
1021264	18
1021264	19
1021264	20
1021264	22
1021264	24
1021264	26
1021264	28
1021264	29
1005253	8
1005253	11
1005253	24
1005253	27
1005254	8
1005254	9
1005254	10
1005254	15
1005254	24
1005254	27
1005255	2
1005255	5
1005255	9
1005255	15
1005255	16
1005255	23
1005255	24
1005255	27
1021748	2
1021748	4
1021748	5
1021748	9
1021748	10
1021748	11
1021748	18
1021748	19
1021748	22
1019003	1
1019003	2
1019003	3
1019003	4
1019003	5
1019003	6
1019003	8
1019003	9
1019003	10
1019003	11
1019003	13
1019003	15
1019003	16
1019003	17
1019003	18
1019003	19
1019003	22
1019003	23
1019003	24
1019003	27
1019003	28
1019003	29
1021369	2
1021369	3
1021369	4
1021369	5
1021369	6
1021369	7
1021369	8
1021369	9
1021369	10
1021369	11
1021369	12
1021369	13
1021369	15
1021369	17
1021369	18
1021369	19
1021369	21
1021369	22
1021369	24
1021369	26
1021369	27
1021369	28
1021369	29
1021369	30
1021743	1
1021743	2
1021743	3
1021743	4
1021743	5
1021743	6
1021743	7
1021743	8
1021743	9
1021743	10
1021743	11
1021743	12
1021743	13
1021743	15
1021743	16
1021743	17
1021743	18
1021743	19
1021743	22
1021743	23
1021743	24
1021743	25
1021743	26
1021743	27
1021743	28
1021743	30
1021349	2
1021349	3
1021349	4
1021349	5
1021349	6
1021349	7
1021349	8
1021349	9
1021349	10
1021349	11
1021349	12
1021349	13
1021349	15
1021349	17
1021349	18
1021349	19
1021349	21
1021349	22
1021349	24
1021349	25
1021349	26
1021349	27
1021349	28
1021349	29
1021349	30
1020011	1
1020011	2
1020011	3
1020011	5
1020011	6
1020011	7
1020011	9
1020011	10
1020011	13
1020011	16
1020011	17
1020011	18
1020011	21
1020011	22
1020011	24
1020011	26
1020011	27
1020011	29
1020011	30
1021742	1
1021742	2
1021742	3
1021742	4
1021742	5
1021742	6
1021742	9
1021742	10
1021742	11
1021742	12
1021742	13
1021742	17
1021742	19
1021742	22
1021742	24
1021742	27
1021742	30
1021567	1
1021567	2
1021567	3
1021567	4
1021567	5
1021567	6
1021567	9
1021567	10
1021567	11
1021567	13
1021567	15
1021567	16
1021567	17
1021567	18
1021567	19
1021567	20
1021567	22
1021567	24
1021567	26
1021567	28
1010636	2
1010636	4
1010636	5
1010636	6
1010636	8
1010636	9
1010636	10
1010636	11
1010636	13
1010636	16
1010636	17
1010636	19
1010636	20
1010636	24
1010636	30
1019120	2
1019120	4
1019120	5
1019120	6
1019120	7
1019120	8
1019120	9
1019120	10
1019120	11
1019120	13
1019120	16
1019120	18
1019120	19
1019120	22
1019120	24
1019120	26
1003269	1
1003269	2
1003269	3
1003269	4
1003269	5
1003269	6
1003269	7
1003269	8
1003269	9
1003269	10
1003269	11
1003269	12
1003269	13
1003269	15
1003269	16
1003269	17
1003269	18
1003269	19
1003269	20
1003269	21
1003269	22
1003269	24
1003269	25
1003269	26
1003269	27
1003269	28
1003269	30
1019491	2
1019491	3
1019491	6
1019491	8
1019491	9
1019491	10
1019491	11
1019491	13
1019491	16
1019491	17
1019491	18
1019491	22
1019491	24
1019491	26
1020032	1
1020032	13
1020032	18
1020032	19
1020032	30
1019266	2
1019266	4
1019266	5
1019266	6
1019266	8
1019266	9
1019266	10
1019266	11
1019266	13
1019266	16
1019266	17
1019266	18
1019266	19
1019266	20
1019266	24
1019266	26
1019212	6
1019212	9
1019212	18
1019212	24
1011117	1
1011117	2
1011117	3
1011117	4
1011117	5
1011117	6
1011117	7
1011117	8
1011117	9
1011117	10
1011117	11
1011117	12
1011117	13
1011117	16
1011117	17
1011117	18
1011117	19
1011117	22
1011117	23
1011117	24
1011117	26
1011117	27
1011117	28
1011117	30
1021332	2
1021332	4
1021332	5
1021332	6
1021332	8
1021332	9
1021332	10
1021332	11
1021332	16
1021332	18
1021332	19
1021332	24
1020075	2
1020075	3
1020075	4
1020075	6
1020075	9
1020075	10
1020075	11
1020075	16
1020075	19
1020075	24
1021633	2
1021633	4
1021633	9
1021633	10
1021633	11
1021633	18
1021633	19
1021633	22
1021633	24
1021633	26
1021633	28
1021244	1
1021244	2
1021244	3
1021244	6
1021244	9
1021244	10
1021244	11
1021244	12
1021244	13
1021244	17
1021244	18
1021244	19
1021244	21
1021244	22
1021244	25
1021244	27
1021250	2
1021250	5
1021250	6
1021250	9
1021250	10
1021250	20
1021250	22
1021250	26
1021345	1
1021345	2
1021345	3
1021345	6
1021345	7
1021345	8
1021345	9
1021345	10
1021345	11
1021345	15
1021345	18
1021345	22
1021345	24
1021345	26
1003343	2
1003343	5
1003343	6
1003343	8
1003343	9
1003343	10
1003343	11
1003343	24
1003343	26
1019986	2
1019986	6
1019986	9
1019986	24
1020123	2
1020123	3
1020123	4
1020123	5
1020123	6
1020123	7
1020123	8
1020123	9
1020123	10
1020123	11
1020123	13
1020123	16
1020123	17
1020123	18
1020123	19
1020123	20
1020123	21
1020123	23
1020123	24
1020123	27
1020123	28
1019506	2
1019506	4
1019506	5
1019506	6
1019506	7
1019506	8
1019506	9
1019506	10
1019506	11
1019506	12
1019506	13
1019506	16
1019506	17
1019506	18
1019506	19
1019506	20
1019506	21
1019506	22
1019506	23
1019506	24
1019506	26
1019649	2
1019649	3
1019649	5
1019649	6
1019649	8
1019649	9
1019649	10
1019649	11
1019649	13
1019649	16
1019649	17
1019649	19
1019649	20
1019649	21
1019649	24
1019649	25
1019649	26
1019649	28
1019409	5
1019409	6
1019409	9
1019409	10
1019409	16
1019409	19
1019409	24
1019103	2
1019103	9
1019103	10
1019103	24
1019103	26
1019103	28
1003863	1
1003863	2
1003863	3
1003863	4
1003863	5
1003863	6
1003863	7
1003863	8
1003863	9
1003863	10
1003863	11
1003863	13
1003863	15
1003863	16
1003863	17
1003863	18
1003863	19
1003863	20
1003863	21
1003863	22
1003863	24
1003863	26
1003863	27
1003863	30
1012206	1
1012206	2
1012206	3
1012206	4
1012206	5
1012206	6
1012206	9
1012206	10
1012206	11
1012206	12
1012206	13
1012206	17
1012206	18
1012206	19
1012206	22
1012206	24
1012206	26
1012206	27
1012206	30
1019850	1
1019850	2
1019850	4
1019850	5
1019850	6
1019850	8
1019850	9
1019850	10
1019850	11
1019850	12
1019850	13
1019850	16
1019850	19
1019850	20
1019850	24
1019851	1
1019851	2
1019851	4
1019851	5
1019851	6
1019851	8
1019851	9
1019851	10
1019851	11
1019851	12
1019851	13
1019851	16
1019851	19
1019851	20
1019851	24
1019198	2
1019198	3
1019198	4
1019198	5
1019198	6
1019198	7
1019198	8
1019198	9
1019198	10
1019198	11
1019198	13
1019198	16
1019198	17
1019198	18
1019198	19
1019198	20
1019198	24
1019198	26
1002021	2
1002021	3
1002021	4
1002021	5
1002021	6
1002021	7
1002021	8
1002021	9
1002021	10
1002021	11
1002021	12
1002021	13
1002021	15
1002021	16
1002021	17
1002021	18
1002021	19
1002021	20
1002021	21
1002021	22
1002021	24
1002021	26
1002021	27
1002021	28
1002521	2
1002521	3
1002521	4
1002521	5
1002521	6
1002521	8
1002521	9
1002521	10
1002521	11
1002521	12
1002521	13
1002521	15
1002521	17
1002521	18
1002521	19
1002521	22
1002521	23
1002521	24
1002521	25
1019427	1
1019427	2
1019427	4
1019427	5
1019427	6
1019427	9
1019427	10
1019427	11
1019427	12
1019427	13
1019427	17
1019427	19
1019427	20
1019427	24
1019427	26
1019427	27
1019427	30
1020051	2
1020051	5
1020051	6
1020051	9
1020051	10
1020051	19
1020051	22
1020051	24
1020051	27
1019035	4
1019035	5
1019035	6
1019035	8
1019035	9
1019035	10
1019035	13
1019035	24
1019035	27
1021683	2
1021683	3
1021683	4
1021683	9
1021683	10
1021683	11
1021683	12
1021683	16
1021683	18
1021683	19
1021683	24
1019852	2
1019852	3
1019852	4
1019852	5
1019852	6
1019852	9
1019852	10
1019852	11
1019852	12
1019852	13
1019852	16
1019852	17
1019852	19
1019852	22
1019852	24
1019852	26
1019852	28
1019352	2
1019352	3
1019352	5
1019352	6
1019352	8
1019352	9
1019352	10
1019352	11
1019352	13
1019352	15
1019352	17
1019352	22
1019352	23
1019352	24
1019352	25
1019352	26
1019352	27
1005352	1
1005352	2
1005352	3
1005352	4
1005352	5
1005352	7
1005352	8
1005352	9
1005352	10
1005352	11
1005352	13
1005352	15
1005352	19
1005352	21
1005352	22
1005352	23
1005352	24
1005352	25
1005352	26
1005352	27
1005352	29
1005352	30
1009803	1
1009803	2
1009803	3
1009803	5
1009803	6
1009803	7
1009803	8
1009803	9
1009803	10
1009803	11
1009803	13
1009803	15
1009803	16
1009803	17
1009803	18
1009803	19
1009803	20
1009803	21
1009803	22
1009803	23
1009803	24
1009803	25
1009803	26
1009803	27
1009803	30
1019756	1
1019756	2
1019756	3
1019756	5
1019756	6
1019756	7
1019756	8
1019756	9
1019756	10
1019756	11
1019756	12
1019756	13
1019756	17
1019756	18
1019756	19
1019756	20
1019756	22
1019756	24
1019756	25
1019756	26
1019756	27
1019756	28
1019756	30
1021291	1
1021291	2
1021291	3
1021291	4
1021291	5
1021291	6
1021291	8
1021291	9
1021291	10
1021291	11
1021291	13
1021291	16
1021291	17
1021291	18
1021291	19
1021291	21
1021291	22
1021291	23
1021291	24
1021291	25
1021291	27
1021291	28
1021291	29
1021661	2
1021661	3
1021661	4
1021661	5
1021661	6
1021661	8
1021661	9
1021661	11
1021661	13
1021661	16
1021661	17
1021661	18
1021661	19
1021661	20
1021661	22
1021661	24
1021661	26
1012344	1
1012344	2
1012344	3
1012344	5
1012344	6
1012344	8
1012344	9
1012344	10
1012344	11
1012344	13
1012344	16
1012344	17
1012344	18
1012344	19
1012344	22
1012344	24
1012344	26
1019030	2
1019030	3
1019030	4
1019030	5
1019030	6
1019030	8
1019030	9
1019030	10
1019030	11
1019030	15
1019030	16
1019030	18
1019030	19
1019030	22
1019030	24
1019030	26
1019030	30
1018834	2
1018834	5
1018834	6
1018834	8
1018834	9
1018834	10
1018834	12
1018834	13
1018834	20
1018834	24
1021324	1
1021324	2
1021324	3
1021324	4
1021324	5
1021324	6
1021324	8
1021324	9
1021324	10
1021324	11
1021324	13
1021324	15
1021324	16
1021324	17
1021324	18
1021324	19
1021324	21
1021324	22
1021324	23
1021324	24
1021324	25
1021324	26
1021324	27
1021324	30
1021325	1
1021325	2
1021325	3
1021325	4
1021325	5
1021325	6
1021325	8
1021325	9
1021325	10
1021325	11
1021325	13
1021325	15
1021325	16
1021325	17
1021325	18
1021325	19
1021325	21
1021325	22
1021325	23
1021325	24
1021325	25
1021325	26
1021325	27
1021325	30
1019450	2
1019450	3
1019450	5
1019450	6
1019450	8
1019450	9
1019450	10
1019450	11
1019450	12
1019450	13
1019450	17
1019450	18
1019450	19
1019450	21
1019450	22
1019450	24
1019450	26
1019450	27
1019450	30
1021647	1
1021647	2
1021647	3
1021647	5
1021647	6
1021647	8
1021647	9
1021647	10
1021647	11
1021647	13
1021647	15
1021647	16
1021647	17
1021647	19
1021647	22
1021647	24
1021647	25
1021647	27
1016810	2
1016810	3
1016810	4
1016810	5
1016810	6
1016810	8
1016810	9
1016810	10
1016810	11
1016810	12
1016810	16
1016810	17
1016810	18
1016810	19
1016810	21
1016810	22
1016810	24
1016810	27
1018113	1
1018113	2
1018113	3
1018113	4
1018113	5
1018113	6
1018113	8
1018113	9
1018113	10
1018113	12
1018113	13
1018113	16
1018113	17
1018113	18
1018113	19
1018113	21
1018113	22
1018113	24
1018113	26
1019158	2
1019158	3
1019158	4
1019158	6
1019158	9
1019158	10
1019158	11
1019158	13
1019158	15
1019158	19
1019158	22
1019158	24
1019158	28
1006652	1
1006652	2
1006652	4
1006652	5
1006652	6
1006652	7
1006652	8
1006652	9
1006652	10
1006652	11
1006652	13
1006652	16
1006652	18
1006652	19
1006652	22
1006652	24
1006652	25
1006652	26
1006652	27
1006652	28
1002768	1
1002768	2
1002768	4
1002768	5
1002768	8
1002768	9
1002768	11
1002768	12
1002768	15
1002768	18
1002768	19
1002768	24
1019512	2
1019512	3
1019512	4
1019512	5
1019512	6
1019512	8
1019512	9
1019512	10
1019512	11
1019512	13
1019512	15
1019512	16
1019512	17
1019512	18
1019512	19
1019512	20
1019512	21
1019512	22
1019512	23
1019512	24
1019512	25
1019512	27
1010483	2
1010483	4
1010483	6
1010483	9
1010483	10
1010483	11
1010483	18
1010483	19
1010483	24
1016916	2
1016916	3
1016916	4
1016916	5
1016916	6
1016916	8
1016916	9
1016916	10
1016916	11
1016916	12
1016916	13
1016916	16
1016916	17
1016916	18
1016916	19
1016916	23
1016916	24
1016916	25
1016916	28
1004651	2
1004651	3
1004651	9
1004651	10
1004651	12
1004651	24
1019503	1
1019503	2
1019503	3
1019503	4
1019503	5
1019503	6
1019503	7
1019503	8
1019503	9
1019503	10
1019503	11
1019503	12
1019503	13
1019503	15
1019503	16
1019503	17
1019503	18
1019503	19
1019503	22
1019503	23
1019503	24
1019503	25
1019503	26
1019503	27
1019503	28
1019808	1
1019808	2
1019808	3
1019808	4
1019808	5
1019808	6
1019808	8
1019808	9
1019808	10
1019808	11
1019808	12
1019808	13
1019808	16
1019808	17
1019808	18
1019808	19
1019808	20
1019808	22
1019808	23
1019808	24
1019808	25
1019808	26
1019808	27
1019808	29
1019808	30
1019726	1
1019726	2
1019726	3
1019726	4
1019726	5
1019726	6
1019726	8
1019726	9
1019726	10
1019726	11
1019726	12
1019726	13
1019726	15
1019726	17
1019726	18
1019726	19
1019726	20
1019726	22
1019726	23
1019726	24
1019726	25
1019726	26
1019726	27
1019726	29
1019726	30
1021470	1
1021470	2
1021470	4
1021470	5
1021470	6
1021470	7
1021470	8
1021470	9
1021470	10
1021470	11
1021470	12
1021470	13
1021470	16
1021470	17
1021470	19
1021470	21
1021470	22
1021470	24
1021470	27
1019346	2
1019346	4
1019346	6
1019346	7
1019346	8
1019346	9
1019346	10
1019346	11
1019346	12
1019346	13
1019346	17
1019346	18
1019346	19
1019346	24
1019650	2
1019650	3
1019650	4
1019650	5
1019650	6
1019650	9
1019650	10
1019650	11
1019650	13
1019650	17
1019650	18
1019650	19
1019650	22
1019650	24
1019650	28
1019650	30
1018927	1
1018927	2
1018927	3
1018927	4
1018927	5
1018927	6
1018927	8
1018927	9
1018927	10
1018927	11
1018927	12
1018927	13
1018927	15
1018927	16
1018927	17
1018927	18
1018927	19
1018927	20
1018927	21
1018927	22
1018927	24
1018927	26
1018927	27
1018927	28
1018927	30
1021361	2
1021361	4
1021361	5
1021361	6
1021361	7
1021361	8
1021361	9
1021361	10
1021361	11
1021361	13
1021361	15
1021361	16
1021361	18
1021361	19
1021361	22
1021361	24
1021361	26
1021361	28
1004848	1
1004848	2
1004848	6
1004848	8
1004848	9
1004848	10
1004848	11
1004848	24
1011300	1
1011300	2
1011300	4
1011300	6
1011300	8
1011300	9
1011300	10
1011300	15
1011300	18
1011300	19
1011300	20
1011300	22
1011300	24
1011300	26
1011300	29
1020132	1
1020132	2
1020132	4
1020132	6
1020132	9
1020132	10
1020132	11
1020132	18
1020132	19
1020132	22
1020132	24
1020132	26
1019304	2
1019304	4
1019304	5
1019304	6
1019304	8
1019304	9
1019304	10
1019304	11
1019304	16
1019304	18
1019304	19
1019304	22
1019304	24
1021198	3
1021198	4
1021198	6
1021198	8
1021198	9
1021198	10
1021198	11
1021198	13
1021198	16
1021198	17
1021198	18
1021198	20
1021198	22
1021198	24
1021198	26
1019167	2
1019167	4
1019167	5
1019167	6
1019167	8
1019167	9
1019167	10
1019167	11
1019167	12
1019167	13
1019167	15
1019167	16
1019167	17
1019167	18
1019167	19
1019167	21
1019167	22
1019167	24
1019167	27
1019167	30
1019678	1
1019678	2
1019678	3
1019678	5
1019678	6
1019678	8
1019678	9
1019678	10
1019678	11
1019678	12
1019678	13
1019678	16
1019678	17
1019678	19
1019678	22
1019678	24
1019678	27
1019679	1
1019679	2
1019679	3
1019679	6
1019679	8
1019679	9
1019679	10
1019679	11
1019679	12
1019679	13
1019679	17
1019679	19
1019679	22
1019679	24
1019679	27
1019631	2
1019631	4
1019631	5
1019631	6
1019631	8
1019631	9
1019631	10
1019631	11
1019631	16
1019631	18
1019631	19
1019631	22
1019631	24
1019631	27
1019207	2
1019207	4
1019207	5
1019207	9
1019207	10
1019207	19
1019207	24
1019995	1
1019995	2
1019995	3
1019995	4
1019995	5
1019995	6
1019995	7
1019995	8
1019995	9
1019995	10
1019995	11
1019995	13
1019995	15
1019995	16
1019995	17
1019995	18
1019995	19
1019995	22
1019995	23
1019995	24
1019995	25
1019995	26
1019995	27
1019995	28
1019995	29
1021390	2
1021390	9
1021390	11
1021390	24
1012027	2
1012027	6
1012027	9
1012027	10
1012027	18
1012027	19
1012027	24
1019538	1
1019538	2
1019538	3
1019538	4
1019538	5
1019538	6
1019538	7
1019538	8
1019538	9
1019538	10
1019538	11
1019538	12
1019538	13
1019538	15
1019538	16
1019538	17
1019538	18
1019538	19
1019538	20
1019538	21
1019538	22
1019538	23
1019538	24
1019538	25
1019538	26
1019538	27
1019538	28
1019538	29
1019538	30
1018418	2
1018418	4
1018418	9
1018418	10
1018418	11
1018418	18
1018418	19
1018418	24
1018901	2
1018901	4
1018901	6
1018901	8
1018901	9
1018901	10
1018901	11
1018901	13
1018901	17
1018901	18
1018901	19
1018901	22
1020094	2
1020094	4
1020094	5
1020094	6
1020094	8
1020094	9
1020094	10
1020094	11
1020094	13
1020094	16
1020094	19
1020094	20
1020094	24
1019494	2
1019494	3
1019494	6
1019494	8
1019494	9
1019494	10
1019494	13
1019494	17
1019494	18
1019494	22
1019494	24
1019494	26
1005431	1
1005431	2
1005431	3
1005431	4
1005431	5
1005431	6
1005431	7
1005431	8
1005431	9
1005431	10
1005431	11
1005431	13
1005431	15
1005431	16
1005431	18
1005431	19
1005431	20
1005431	22
1005431	23
1005431	24
1005431	25
1005431	26
1005431	27
1005431	28
1005431	30
1018919	2
1018919	4
1018919	5
1018919	6
1018919	8
1018919	9
1018919	10
1018919	11
1018919	12
1018919	15
1018919	16
1018919	18
1018919	19
1018919	24
1018919	26
1000462	1
1000462	2
1000462	3
1000462	5
1000462	6
1000462	8
1000462	9
1000462	10
1000462	11
1000462	13
1000462	15
1000462	16
1000462	17
1000462	18
1000462	19
1000462	22
1000462	24
1000462	26
1000462	27
1000462	28
1016820	2
1016820	3
1016820	5
1016820	6
1016820	9
1016820	10
1016820	11
1016820	13
1016820	15
1016820	17
1016820	22
1016820	24
1016820	27
1016820	30
1021727	2
1021727	3
1021727	4
1021727	5
1021727	6
1021727	9
1021727	10
1021727	11
1021727	12
1021727	17
1021727	19
1021727	24
1011233	2
1011233	4
1011233	5
1011233	6
1011233	8
1011233	9
1011233	11
1011233	13
1011233	15
1011233	16
1011233	17
1011233	19
1011233	24
1018922	1
1018922	2
1018922	3
1018922	4
1018922	5
1018922	6
1018922	8
1018922	9
1018922	10
1018922	11
1018922	12
1018922	13
1018922	16
1018922	17
1018922	18
1018922	19
1018922	20
1018922	21
1018922	22
1018922	24
1018922	27
1018922	28
1011800	5
1011800	8
1011800	9
1011800	16
1011800	23
1021257	2
1021257	3
1021257	5
1021257	6
1021257	8
1021257	9
1021257	10
1021257	11
1021257	12
1021257	16
1021257	17
1021257	18
1021257	20
1021257	21
1021257	24
1019622	1
1019622	2
1019622	4
1019622	5
1019622	6
1019622	8
1019622	9
1019622	11
1019622	13
1019622	15
1019622	19
1019622	24
1019177	1
1019177	2
1019177	3
1019177	4
1019177	5
1019177	6
1019177	7
1019177	8
1019177	9
1019177	10
1019177	11
1019177	13
1019177	15
1019177	16
1019177	17
1019177	18
1019177	19
1019177	20
1019177	21
1019177	22
1019177	24
1019177	25
1019177	26
1019177	27
1019177	28
1019177	30
1019175	1
1019175	2
1019175	3
1019175	4
1019175	5
1019175	6
1019175	8
1019175	9
1019175	10
1019175	11
1019175	12
1019175	13
1019175	15
1019175	16
1019175	17
1019175	18
1019175	19
1019175	20
1019175	21
1019175	22
1019175	24
1019175	26
1019175	28
1019175	30
1019176	1
1019176	2
1019176	3
1019176	4
1019176	5
1019176	6
1019176	8
1019176	9
1019176	10
1019176	11
1019176	13
1019176	17
1019176	18
1019176	19
1019176	22
1019176	24
1019176	25
1019176	28
1019940	2
1019940	3
1019940	4
1019940	5
1019940	6
1019940	7
1019940	8
1019940	9
1019940	10
1019940	11
1019940	12
1019940	13
1019940	16
1019940	17
1019940	18
1019940	19
1019940	20
1019940	22
1019940	24
1019940	25
1019940	26
1019940	27
1019435	1
1019435	2
1019435	4
1019435	5
1019435	6
1019435	8
1019435	9
1019435	10
1019435	13
1019435	16
1019435	17
1019435	18
1019435	19
1019435	22
1019435	24
1011538	2
1011538	6
1011538	8
1011538	9
1011538	10
1011538	11
1011538	24
1000481	1
1000481	2
1000481	4
1000481	5
1000481	6
1000481	8
1000481	9
1000481	10
1000481	11
1000481	13
1000481	15
1000481	16
1000481	17
1000481	19
1000481	22
1000481	24
1012249	2
1012249	5
1012249	6
1012249	9
1012249	10
1012249	11
1012249	24
1005201	2
1005201	3
1005201	5
1005201	6
1005201	8
1005201	9
1005201	10
1005201	11
1005201	12
1005201	13
1005201	15
1005201	17
1005201	18
1005201	19
1005201	21
1005201	24
1005201	26
1005201	27
1012046	2
1012046	4
1012046	6
1012046	10
1012046	11
1012046	18
1012046	19
1012046	22
1021339	1
1021339	2
1021339	3
1021339	4
1021339	5
1021339	6
1021339	7
1021339	8
1021339	9
1021339	10
1021339	11
1021339	12
1021339	13
1021339	15
1021339	17
1021339	18
1021339	19
1021339	21
1021339	22
1021339	23
1021339	24
1021339	25
1021339	26
1021339	27
1021339	30
1019360	1
1019360	2
1019360	3
1019360	4
1019360	6
1019360	7
1019360	9
1019360	10
1019360	11
1019360	12
1019360	13
1019360	17
1019360	18
1019360	22
1019360	23
1019360	24
1019360	25
1019360	27
1021197	2
1021197	3
1021197	4
1021197	6
1021197	7
1021197	8
1021197	9
1021197	10
1021197	11
1021197	12
1021197	16
1021197	19
1021197	20
1021197	23
1021197	24
1021197	28
1018407	2
1018407	4
1018407	5
1018407	6
1018407	9
1018407	10
1018407	13
1018407	15
1018407	18
1018407	19
1018407	22
1018407	24
1018407	28
1005528	2
1005528	3
1005528	5
1005528	6
1005528	8
1005528	9
1005528	10
1005528	11
1005528	12
1005528	13
1005528	16
1005528	17
1005528	18
1005528	21
1005528	22
1005528	24
1005528	25
1005528	26
1006837	1
1006837	2
1006837	4
1006837	5
1006837	6
1006837	7
1006837	8
1006837	9
1006837	10
1006837	11
1006837	13
1006837	15
1006837	16
1006837	17
1006837	18
1006837	19
1006837	21
1006837	23
1006837	24
1006837	26
1011119	2
1011119	4
1011119	6
1011119	8
1011119	9
1011119	10
1011119	11
1011119	13
1011119	16
1011119	17
1011119	18
1011119	19
1011119	22
1011119	24
1019706	1
1019706	2
1019706	6
1019706	8
1019706	9
1019706	10
1019706	12
1019706	13
1019706	15
1019706	17
1019706	18
1019706	24
1019706	27
1019706	28
1021624	2
1021624	3
1021624	4
1021624	5
1021624	6
1021624	8
1021624	9
1021624	10
1021624	11
1021624	13
1021624	15
1021624	16
1021624	17
1021624	18
1021624	19
1021624	20
1021624	22
1021624	23
1021624	24
1021624	27
1021624	30
1019752	2
1019752	3
1019752	4
1019752	5
1019752	8
1019752	9
1019752	10
1019752	11
1019752	12
1019752	13
1019752	16
1019752	20
1019752	22
1019752	24
1019752	28
1019501	1
1019501	2
1019501	3
1019501	5
1019501	6
1019501	7
1019501	8
1019501	9
1019501	10
1019501	11
1019501	13
1019501	15
1019501	16
1019501	17
1019501	18
1019501	19
1019501	22
1019501	24
1019501	26
1019501	27
1019501	28
1005256	9
1005256	24
1005256	27
1019969	2
1019969	6
1019969	8
1019969	9
1019969	10
1019969	11
1019969	12
1019969	13
1019969	18
1019969	24
1019969	29
1003980	1
1003980	2
1003980	4
1003980	5
1003980	6
1003980	8
1003980	9
1003980	10
1003980	11
1003980	13
1003980	18
1003980	19
1003980	24
1018217	1
1018217	2
1018217	3
1018217	4
1018217	5
1018217	6
1018217	8
1018217	9
1018217	10
1018217	11
1018217	12
1018217	16
1018217	17
1018217	18
1018217	19
1018217	20
1018217	21
1018217	22
1018217	24
1018217	27
1018217	28
1018998	2
1018998	5
1018998	6
1018998	7
1018998	9
1018998	10
1018998	11
1018998	12
1018998	13
1018998	21
1018998	24
1005257	8
1005257	9
1005257	15
1005257	24
1005257	27
1019111	2
1019111	3
1019111	4
1019111	6
1019111	8
1019111	9
1019111	10
1019111	11
1019111	13
1019111	16
1019111	18
1019111	19
1019111	20
1019111	22
1019111	23
1019111	24
1019111	25
1010286	1
1010286	2
1010286	4
1010286	5
1010286	8
1010286	9
1010286	10
1010286	11
1010286	15
1010286	16
1010286	19
1010286	24
1018310	2
1018310	6
1018310	9
1018310	10
1018310	11
1018310	21
1018310	24
1005218	2
1005218	3
1005218	4
1005218	5
1005218	6
1005218	7
1005218	8
1005218	9
1005218	10
1005218	11
1005218	13
1005218	15
1005218	17
1005218	18
1005218	19
1005218	21
1005218	22
1005218	24
1005218	26
1005218	27
1005218	30
1016799	1
1016799	2
1016799	3
1016799	5
1016799	6
1016799	8
1016799	9
1016799	10
1016799	11
1016799	13
1016799	15
1016799	19
1016799	21
1016799	22
1016799	24
1016799	27
1016799	28
1003238	1
1003238	2
1003238	3
1003238	5
1003238	6
1003238	7
1003238	8
1003238	9
1003238	10
1003238	11
1003238	13
1003238	15
1003238	16
1003238	17
1003238	18
1003238	19
1003238	20
1003238	23
1003238	24
1003238	25
1003238	26
1003238	27
1003238	28
1003238	30
1021358	1
1021358	2
1021358	4
1021358	8
1021358	9
1021358	10
1021358	24
1021358	27
1021713	2
1021713	4
1021713	5
1021713	8
1021713	9
1021713	10
1021713	11
1021713	13
1021713	16
1021713	17
1021713	18
1021713	19
1021713	24
1021713	28
1021713	30
1019058	2
1019058	4
1019058	6
1019058	9
1019058	10
1019058	11
1019058	12
1019058	18
1019058	19
1019058	24
1019482	2
1019482	3
1019482	4
1019482	5
1019482	6
1019482	8
1019482	9
1019482	10
1019482	11
1019482	13
1019482	16
1019482	17
1019482	18
1019482	19
1019482	21
1019482	23
1019482	24
1019482	28
1019368	1
1019368	2
1019368	3
1019368	4
1019368	5
1019368	6
1019368	8
1019368	9
1019368	10
1019368	11
1019368	13
1019368	15
1019368	16
1019368	17
1019368	18
1019368	19
1019368	21
1019368	22
1019368	24
1019368	26
1019368	27
1019368	28
1012031	2
1012031	3
1012031	4
1012031	5
1012031	6
1012031	7
1012031	9
1012031	10
1012031	11
1012031	13
1012031	15
1012031	17
1012031	18
1012031	19
1012031	22
1012031	24
1012031	26
1000242	2
1000242	4
1000242	5
1000242	6
1000242	7
1000242	9
1000242	10
1000242	11
1000242	16
1000242	18
1000242	19
1000242	20
1000242	22
1000242	24
1000242	30
1019022	1
1019022	2
1019022	3
1019022	4
1019022	6
1019022	8
1019022	9
1019022	10
1019022	11
1019022	12
1019022	13
1019022	17
1019022	18
1019022	22
1019022	24
1019022	27
1000616	2
1000616	7
1000616	9
1000616	11
1000616	19
1000616	22
1000616	24
1019185	1
1019185	2
1019185	3
1019185	6
1019185	8
1019185	9
1019185	10
1019185	11
1019185	13
1019185	18
1019185	19
1019185	22
1019185	24
1019185	26
1019185	27
1019185	28
1019185	29
1019866	5
1019866	6
1019866	8
1019866	9
1019866	11
1019866	16
1019806	2
1019806	3
1019806	4
1019806	5
1019806	6
1019806	9
1019806	10
1019806	11
1019806	13
1019806	17
1019806	18
1019806	19
1019806	22
1019806	24
1019806	28
1011972	2
1011972	4
1011972	5
1011972	6
1011972	7
1011972	8
1011972	9
1011972	10
1011972	11
1011972	12
1011972	13
1011972	16
1011972	17
1011972	18
1011972	19
1011972	21
1011972	24
1011972	27
1011972	28
1021341	2
1021341	3
1021341	5
1021341	6
1021341	8
1021341	9
1021341	10
1021341	11
1021341	12
1021341	19
1021341	24
1021341	25
1021341	27
1019876	9
1019876	24
1019189	1
1019189	2
1019189	3
1019189	4
1019189	5
1019189	6
1019189	8
1019189	9
1019189	10
1019189	11
1019189	12
1019189	13
1019189	15
1019189	16
1019189	17
1019189	18
1019189	19
1019189	20
1019189	22
1019189	23
1019189	24
1019189	25
1019189	26
1019189	27
1019189	28
1019189	30
1019924	1
1019924	2
1019924	3
1019924	4
1019924	5
1019924	6
1019924	7
1019924	8
1019924	9
1019924	10
1019924	11
1019924	12
1019924	13
1019924	16
1019924	17
1019924	18
1019924	19
1019924	20
1019924	22
1019924	24
1019924	26
1019843	1
1019843	2
1019843	3
1019843	4
1019843	5
1019843	6
1019843	8
1019843	9
1019843	10
1019843	11
1019843	12
1019843	13
1019843	16
1019843	17
1019843	18
1019843	19
1019843	22
1019843	23
1019843	24
1019843	28
1020190	2
1020190	4
1020190	5
1020190	6
1020190	9
1020190	10
1020190	11
1020190	12
1020190	15
1020190	19
1020190	24
1002929	1
1002929	2
1002929	3
1002929	4
1002929	5
1002929	6
1002929	7
1002929	8
1002929	9
1002929	10
1002929	11
1002929	12
1002929	13
1002929	15
1002929	16
1002929	17
1002929	18
1002929	19
1002929	22
1002929	23
1002929	24
1002929	25
1002929	26
1002929	28
1002929	30
1019659	2
1019659	4
1019659	9
1019659	11
1019659	18
1018976	2
1018976	5
1018976	6
1018976	8
1018976	9
1018976	10
1018976	11
1018976	13
1018976	16
1018976	17
1018976	19
1018976	24
1018976	28
1011139	2
1011139	3
1011139	5
1011139	6
1011139	7
1011139	8
1011139	9
1011139	10
1011139	11
1011139	13
1011139	16
1011139	18
1011139	19
1011139	20
1011139	24
1019902	1
1019902	2
1019902	4
1019902	6
1019902	9
1019902	11
1019902	13
1019902	17
1019902	19
1019902	24
1001281	2
1001281	4
1001281	5
1001281	8
1001281	9
1001281	10
1001281	11
1001281	12
1001281	18
1001281	19
1001281	23
1001281	24
1005642	1
1005642	2
1005642	5
1005642	6
1005642	7
1005642	9
1005642	10
1005642	11
1005642	13
1005642	17
1005642	18
1005642	19
1005642	24
1005642	27
1005642	30
1003199	4
1003199	9
1003199	10
1003199	11
1003199	12
1003199	16
1003199	20
1003199	24
1003199	28
1019300	1
1019300	2
1019300	3
1019300	4
1019300	6
1019300	7
1019300	8
1019300	9
1019300	10
1019300	11
1019300	13
1019300	15
1019300	17
1019300	18
1019300	19
1019300	21
1019300	22
1019300	24
1019300	26
1019300	28
1019968	2
1019968	4
1019968	6
1019968	9
1019968	10
1019968	11
1019968	12
1019968	13
1019968	16
1019968	19
1019968	24
1020145	2
1020145	4
1020145	5
1020145	6
1020145	9
1020145	10
1020145	11
1020145	13
1020145	16
1020145	24
1020145	30
1019487	2
1019487	3
1019487	5
1019487	6
1019487	7
1019487	8
1019487	9
1019487	10
1019487	11
1019487	13
1019487	18
1019487	22
1019487	24
1019487	26
1020134	1
1020134	5
1020134	6
1020134	7
1020134	8
1020134	9
1020134	10
1020134	11
1020134	13
1020134	16
1020134	17
1020134	18
1020134	19
1020134	20
1020134	23
1020134	24
1019490	2
1019490	3
1019490	6
1019490	8
1019490	9
1019490	10
1019490	11
1019490	13
1019490	16
1019490	17
1019490	18
1019490	24
1019490	26
1020081	2
1020081	4
1020081	5
1020081	6
1020081	8
1020081	9
1020081	10
1020081	11
1020081	13
1020081	16
1020081	19
1020081	24
1020081	25
1019634	2
1019634	4
1019634	5
1019634	6
1019634	8
1019634	9
1019634	10
1019634	11
1019634	12
1019634	13
1019634	15
1019634	16
1019634	17
1019634	18
1019634	21
1019634	22
1019634	24
1021314	1
1021314	2
1021314	3
1021314	5
1021314	6
1021314	8
1021314	9
1021314	10
1021314	11
1021314	13
1021314	16
1021314	17
1021314	18
1021314	19
1021314	21
1021314	24
1021314	27
1021314	28
1018908	2
1018908	9
1018908	11
1018908	16
1019858	1
1019858	2
1019858	3
1019858	5
1019858	6
1019858	8
1019858	9
1019858	10
1019858	12
1019858	13
1019858	15
1019858	18
1019858	19
1019858	22
1019858	24
1019858	26
1019759	1
1019759	2
1019759	4
1019759	5
1019759	6
1019759	8
1019759	9
1019759	10
1019759	11
1019759	16
1019759	19
1019759	22
1019759	24
1021209	1
1021209	2
1021209	4
1021209	5
1021209	6
1021209	7
1021209	8
1021209	9
1021209	10
1021209	11
1021209	13
1021209	16
1021209	17
1021209	18
1021209	19
1021209	20
1021209	22
1021209	24
1021209	25
1021209	26
1021209	27
1021209	28
1020199	2
1020199	4
1020199	5
1020199	6
1020199	8
1020199	9
1020199	11
1020199	13
1020199	16
1020199	17
1020199	19
1020199	23
1020199	24
1002905	1
1002905	2
1002905	3
1002905	5
1002905	6
1002905	7
1002905	8
1002905	9
1002905	10
1002905	11
1002905	13
1002905	15
1002905	16
1002905	17
1002905	19
1002905	23
1002905	24
1002905	25
1002905	26
1002905	27
1019816	1
1019816	2
1019816	4
1019816	6
1019816	7
1019816	8
1019816	9
1019816	10
1019816	11
1019816	12
1019816	19
1019816	24
1021357	1
1021357	2
1021357	4
1021357	6
1021357	7
1021357	9
1021357	10
1021357	12
1021357	24
1021357	27
1018093	4
1018093	5
1018093	6
1018093	8
1018093	9
1018093	10
1018093	11
1018093	16
1018093	18
1018093	19
1018093	24
1018093	28
1019464	2
1019464	4
1019464	5
1019464	6
1019464	9
1019464	10
1019464	11
1019464	13
1019464	17
1019464	18
1019464	19
1019464	21
1019464	22
1019464	25
1019464	28
1021458	2
1021458	3
1021458	5
1021458	6
1021458	8
1021458	9
1021458	10
1021458	11
1021458	12
1021458	13
1021458	15
1021458	16
1021458	17
1021458	24
1021458	27
1019137	2
1019137	4
1019137	5
1019137	6
1019137	8
1019137	9
1019137	10
1019137	16
1019137	19
1019137	24
1019137	27
1000021	2
1000021	5
1000021	6
1000021	8
1000021	9
1000021	10
1000021	11
1000021	13
1000021	16
1000021	18
1000021	19
1000021	22
1000021	24
1011076	2
1011076	3
1011076	4
1011076	5
1011076	6
1011076	8
1011076	9
1011076	10
1011076	11
1011076	12
1011076	13
1011076	16
1011076	17
1011076	18
1011076	19
1011076	23
1011076	24
1011076	26
1020087	1
1020087	6
1020087	9
1020087	10
1020087	11
1020087	13
1020087	16
1020087	24
1020087	27
1019683	1
1019683	2
1019683	3
1019683	4
1019683	5
1019683	6
1019683	8
1019683	9
1019683	10
1019683	11
1019683	13
1019683	16
1019683	17
1019683	18
1019683	19
1019683	21
1019683	24
1019683	28
1019777	1
1019777	2
1019777	3
1019777	5
1019777	6
1019777	7
1019777	8
1019777	9
1019777	10
1019777	11
1019777	12
1019777	13
1019777	16
1019777	17
1019777	18
1019777	19
1019777	20
1019777	21
1019777	22
1019777	23
1019777	24
1019777	27
1012786	1
1012786	2
1012786	3
1012786	4
1012786	5
1012786	6
1012786	7
1012786	8
1012786	9
1012786	10
1012786	11
1012786	13
1012786	15
1012786	16
1012786	17
1012786	18
1012786	19
1012786	20
1012786	22
1012786	24
1012786	26
1012786	27
1012786	28
1012786	30
1005633	2
1005633	4
1005633	5
1005633	6
1005633	8
1005633	9
1005633	10
1005633	11
1005633	16
1005633	18
1005633	19
1005633	24
1006681	2
1006681	4
1006681	5
1006681	6
1006681	8
1006681	9
1006681	10
1006681	11
1006681	12
1006681	13
1006681	16
1006681	17
1006681	18
1006681	19
1006681	20
1006681	22
1006681	24
1006681	26
1006681	27
1009658	2
1009658	5
1009658	8
1009658	9
1009658	15
1009658	23
1009658	24
1009658	27
1020034	2
1020034	3
1020034	5
1020034	6
1020034	8
1020034	9
1020034	10
1020034	11
1020034	12
1020034	13
1020034	15
1020034	16
1020034	17
1020034	18
1020034	19
1020034	22
1020034	24
1020034	26
1020035	2
1020035	3
1020035	4
1020035	5
1020035	6
1020035	8
1020035	9
1020035	10
1020035	11
1020035	12
1020035	13
1020035	15
1020035	16
1020035	17
1020035	18
1020035	19
1020035	22
1020035	24
1020035	26
1020038	1
1020038	2
1020038	3
1020038	4
1020038	5
1020038	6
1020038	8
1020038	9
1020038	10
1020038	11
1020038	12
1020038	13
1020038	15
1020038	16
1020038	17
1020038	18
1020038	19
1020038	21
1020038	22
1020038	24
1020038	26
1020038	28
1012523	1
1012523	2
1012523	3
1012523	4
1012523	5
1012523	6
1012523	7
1012523	8
1012523	9
1012523	10
1012523	11
1012523	12
1012523	13
1012523	15
1012523	16
1012523	17
1012523	18
1012523	19
1012523	20
1012523	22
1012523	23
1012523	24
1012523	25
1012523	26
1012523	27
1012523	28
1012523	29
1012523	30
1010485	1
1010485	2
1010485	4
1010485	8
1010485	9
1010485	10
1010485	11
1010485	15
1010485	19
1010485	24
1018486	2
1018486	3
1018486	5
1018486	6
1018486	7
1018486	8
1018486	9
1018486	10
1018486	11
1018486	13
1018486	18
1018486	19
1018486	21
1018486	24
1018486	28
1021454	1
1021454	2
1021454	3
1021454	6
1021454	8
1021454	9
1021454	10
1021454	11
1021454	12
1021454	13
1021454	15
1021454	17
1021454	18
1021454	19
1021454	22
1021454	23
1021454	24
1021454	25
1021454	27
1021454	28
1021454	30
1019239	2
1019239	4
1019239	5
1019239	6
1019239	8
1019239	9
1019239	10
1019239	11
1019239	13
1019239	16
1019239	17
1019239	18
1019239	19
1019239	22
1019239	23
1019239	24
1019239	26
1019716	1
1019716	2
1019716	3
1019716	4
1019716	5
1019716	6
1019716	8
1019716	9
1019716	10
1019716	11
1019716	12
1019716	13
1019716	16
1019716	17
1019716	18
1019716	19
1019716	22
1019716	24
1019716	25
1019716	26
1006069	2
1006069	3
1006069	4
1006069	6
1006069	7
1006069	9
1006069	10
1006069	11
1006069	15
1006069	18
1006069	19
1006069	22
1006069	24
1020195	1
1020195	2
1020195	3
1020195	4
1020195	5
1020195	6
1020195	7
1020195	8
1020195	9
1020195	10
1020195	11
1020195	13
1020195	15
1020195	17
1020195	18
1020195	19
1020195	20
1020195	23
1020195	24
1020195	26
1020195	27
1020195	28
1016862	2
1016862	4
1016862	5
1016862	9
1016862	10
1016862	11
1016862	13
1016862	19
1016862	24
1021493	9
1021493	24
1018939	1
1018939	2
1018939	3
1018939	5
1018939	6
1018939	8
1018939	9
1018939	10
1018939	11
1018939	12
1018939	13
1018939	16
1018939	18
1018939	19
1018939	21
1018939	22
1018939	24
1018939	26
1018939	27
1018939	30
1010037	1
1010037	6
1010037	9
1010037	10
1010037	15
1010037	18
1010037	24
1001104	2
1001104	5
1001104	6
1001104	8
1001104	9
1001104	10
1001104	15
1001104	16
1001104	24
1006547	2
1006547	4
1006547	5
1006547	6
1006547	8
1006547	9
1006547	10
1006547	11
1006547	12
1006547	13
1006547	15
1006547	16
1006547	17
1006547	19
1006547	20
1006547	24
1012314	2
1012314	4
1012314	5
1012314	6
1012314	8
1012314	9
1012314	10
1012314	11
1012314	12
1012314	13
1012314	16
1012314	17
1012314	18
1012314	19
1012314	24
1019844	1
1019844	2
1019844	3
1019844	5
1019844	6
1019844	8
1019844	9
1019844	10
1019844	11
1019844	13
1019844	15
1019844	16
1019844	17
1019844	18
1019844	21
1019844	22
1019844	23
1019844	24
1019844	25
1019844	26
1019844	27
1019844	28
1019844	30
1020166	1
1020166	2
1020166	3
1020166	4
1020166	5
1020166	6
1020166	7
1020166	8
1020166	9
1020166	10
1020166	11
1020166	12
1020166	13
1020166	15
1020166	16
1020166	17
1020166	18
1020166	19
1020166	20
1020166	21
1020166	22
1020166	23
1020166	24
1020166	25
1020166	26
1020166	27
1020166	28
1020166	29
1020166	30
1004297	2
1004297	4
1004297	5
1004297	6
1004297	8
1004297	9
1004297	10
1004297	11
1004297	15
1004297	18
1004297	19
1004297	24
1020085	1
1020085	2
1020085	4
1020085	5
1020085	6
1020085	8
1020085	9
1020085	10
1020085	11
1020085	16
1020085	17
1020085	19
1020085	24
1021377	2
1021377	4
1021377	7
1021377	8
1021377	9
1021377	10
1021377	11
1021377	15
1021377	16
1021377	18
1021377	19
1021377	24
1011901	1
1011901	2
1011901	3
1011901	5
1011901	6
1011901	8
1011901	9
1011901	10
1011901	11
1011901	12
1011901	13
1011901	16
1011901	17
1011901	18
1011901	21
1011901	22
1011901	24
1011901	27
1011901	30
1019507	2
1019507	3
1019507	4
1019507	5
1019507	6
1019507	8
1019507	9
1019507	10
1019507	11
1019507	13
1019507	15
1019507	16
1019507	17
1019507	18
1019507	19
1019507	20
1019507	22
1019507	23
1019507	24
1019507	25
1019507	26
1019507	27
1019507	28
1021430	2
1021430	3
1021430	4
1021430	5
1021430	6
1021430	8
1021430	9
1021430	10
1021430	11
1021430	12
1021430	16
1021430	18
1021430	19
1021430	24
1021430	26
1021430	27
1019480	1
1019480	2
1019480	5
1019480	6
1019480	7
1019480	8
1019480	9
1019480	10
1019480	11
1019480	13
1019480	15
1019480	17
1019480	18
1019480	19
1019480	21
1019480	22
1019480	24
1019480	27
1019480	28
1018573	2
1018573	4
1018573	9
1018573	16
1018573	24
1018314	2
1018314	3
1018314	4
1018314	5
1018314	6
1018314	8
1018314	9
1018314	10
1018314	11
1018314	12
1018314	13
1018314	16
1018314	17
1018314	18
1018314	19
1018314	20
1018314	22
1018314	24
1018314	25
1018317	2
1018317	3
1018317	4
1018317	5
1018317	6
1018317	8
1018317	9
1018317	10
1018317	11
1018317	12
1018317	13
1018317	16
1018317	17
1018317	18
1018317	19
1018317	22
1018317	24
1018317	25
1018317	28
1021252	2
1021252	4
1021252	6
1021252	8
1021252	9
1021252	10
1021252	11
1021252	12
1021252	13
1021252	17
1021252	18
1021252	19
1021252	22
1021252	25
1021252	28
1012560	2
1012560	4
1012560	5
1012560	6
1012560	9
1012560	10
1012560	11
1012560	13
1012560	17
1012560	18
1012560	19
1012560	22
1012560	24
1012560	27
1012560	30
1021656	1
1021656	2
1021656	3
1021656	5
1021656	6
1021656	7
1021656	8
1021656	9
1021656	10
1021656	13
1021656	15
1021656	17
1021656	18
1021656	19
1021656	22
1021656	24
1021656	25
1021656	26
1021656	27
1021656	30
1021467	1
1021467	2
1021467	3
1021467	4
1021467	5
1021467	6
1021467	7
1021467	8
1021467	9
1021467	10
1021467	11
1021467	12
1021467	13
1021467	17
1021467	18
1021467	19
1021467	22
1021467	24
1021467	25
1021467	26
1021467	27
1021467	29
1021467	30
1020162	1
1020162	2
1020162	3
1020162	4
1020162	5
1020162	6
1020162	7
1020162	8
1020162	9
1020162	10
1020162	11
1020162	13
1020162	15
1020162	17
1020162	18
1020162	19
1020162	21
1020162	22
1020162	23
1020162	24
1020162	25
1020162	26
1020162	27
1020162	28
1018926	1
1018926	2
1018926	3
1018926	4
1018926	5
1018926	6
1018926	8
1018926	9
1018926	10
1018926	11
1018926	13
1018926	15
1018926	16
1018926	17
1018926	18
1018926	19
1018926	20
1018926	21
1018926	24
1018926	25
1018926	26
1018926	27
1018926	28
1018926	30
1005559	2
1005559	3
1005559	4
1005559	5
1005559	6
1005559	8
1005559	9
1005559	10
1005559	11
1005559	12
1005559	16
1005559	17
1005559	19
1005559	20
1005559	22
1005559	24
1005559	27
1005499	2
1005499	4
1005499	5
1005499	6
1005499	8
1005499	9
1005499	10
1005499	11
1005499	13
1005499	15
1005499	16
1005499	18
1005499	19
1005499	24
1018991	1
1018991	2
1018991	3
1018991	5
1018991	6
1018991	9
1018991	10
1018991	11
1018991	13
1018991	18
1018991	19
1018991	22
1018991	24
1018991	27
1018991	28
1018991	30
1004717	1
1004717	2
1004717	5
1004717	6
1004717	7
1004717	8
1004717	9
1004717	10
1004717	11
1004717	13
1004717	16
1004717	17
1004717	18
1004717	20
1004717	22
1004717	24
1018995	2
1018995	3
1018995	5
1018995	6
1018995	8
1018995	9
1018995	10
1018995	11
1018995	12
1018995	13
1018995	16
1018995	17
1018995	18
1018995	22
1018995	24
1018995	26
1018995	27
1000585	2
1000585	3
1000585	4
1000585	5
1000585	6
1000585	8
1000585	9
1000585	10
1000585	11
1000585	12
1000585	13
1000585	15
1000585	16
1000585	18
1000585	19
1000585	20
1000585	23
1000585	24
1000585	25
1000585	27
1000585	28
1000585	30
1021307	2
1021307	5
1021307	9
1021307	10
1021307	11
1021307	24
1021288	2
1021288	4
1021288	5
1021288	6
1021288	9
1021288	10
1021288	11
1021288	12
1021288	13
1021288	19
1021288	22
1021288	24
1021288	27
1021287	2
1021287	3
1021287	4
1021287	5
1021287	6
1021287	7
1021287	8
1021287	9
1021287	10
1021287	11
1021287	12
1021287	13
1021287	16
1021287	17
1021287	18
1021287	19
1021287	22
1021287	23
1021287	24
1021287	27
1021571	2
1021571	5
1021571	6
1021571	9
1021571	10
1021571	11
1021571	18
1021571	19
1021571	24
1010316	1
1010316	2
1010316	3
1010316	4
1010316	5
1010316	6
1010316	7
1010316	8
1010316	9
1010316	10
1010316	11
1010316	13
1010316	15
1010316	16
1010316	17
1010316	18
1010316	19
1010316	24
1010316	25
1010316	27
1010316	28
1012725	2
1012725	4
1012725	5
1012725	6
1012725	7
1012725	8
1012725	9
1012725	10
1012725	11
1012725	16
1012725	18
1012725	19
1012725	22
1012725	24
1018924	1
1018924	2
1018924	4
1018924	5
1018924	6
1018924	8
1018924	9
1018924	10
1018924	11
1018924	16
1018924	18
1018924	19
1018924	20
1018924	22
1018924	24
1018924	27
1018924	28
1018931	2
1018931	4
1018931	5
1018931	6
1018931	8
1018931	9
1018931	10
1018931	11
1018931	12
1018931	16
1018931	18
1018931	19
1018931	21
1018931	23
1018931	24
1018931	27
1018931	30
1019857	1
1019857	2
1019857	5
1019857	6
1019857	8
1019857	9
1019857	10
1019857	11
1019857	12
1019857	13
1019857	16
1019857	17
1019857	18
1019857	19
1019857	20
1019857	21
1019857	24
1019857	25
1018903	1
1018903	2
1018903	3
1018903	4
1018903	5
1018903	6
1018903	7
1018903	8
1018903	9
1018903	10
1018903	11
1018903	16
1018903	19
1018903	22
1018903	24
1019682	2
1019682	3
1019682	4
1019682	5
1019682	6
1019682	8
1019682	9
1019682	10
1019682	11
1019682	13
1019682	16
1019682	17
1019682	18
1019682	19
1019682	21
1019682	24
1019682	30
1011535	1
1011535	2
1011535	3
1011535	4
1011535	5
1011535	6
1011535	7
1011535	8
1011535	9
1011535	10
1011535	11
1011535	13
1011535	15
1011535	16
1011535	17
1011535	18
1011535	19
1011535	20
1011535	22
1011535	24
1011535	26
1011535	27
1011535	28
1020055	2
1020055	3
1020055	5
1020055	6
1020055	9
1020055	10
1020055	11
1020055	13
1020055	18
1020055	21
1020055	24
1020055	27
1003081	2
1003081	3
1003081	4
1003081	5
1003081	6
1003081	7
1003081	8
1003081	9
1003081	10
1003081	11
1003081	12
1003081	13
1003081	15
1003081	16
1003081	17
1003081	18
1003081	19
1003081	20
1003081	21
1003081	22
1003081	24
1003081	25
1003081	27
1003081	30
1020017	2
1020017	3
1020017	4
1020017	6
1020017	7
1020017	8
1020017	9
1020017	10
1020017	11
1020017	12
1020017	13
1020017	15
1020017	17
1020017	19
1020017	22
1020017	24
1020017	27
1020017	30
1021715	5
1021715	6
1021715	9
1021715	10
1021715	19
1021715	24
1021642	1
1021642	2
1021642	3
1021642	4
1021642	5
1021642	6
1021642	7
1021642	8
1021642	9
1021642	10
1021642	11
1021642	13
1021642	17
1021642	18
1021642	19
1021642	21
1021642	22
1021642	23
1021642	24
1021642	26
1021642	27
1021642	28
1021642	29
1021642	30
1018702	2
1018702	4
1018702	5
1018702	6
1018702	7
1018702	8
1018702	9
1018702	10
1018702	11
1018702	12
1018702	15
1018702	16
1018702	22
1018702	24
1018702	27
1019737	2
1019737	3
1019737	4
1019737	5
1019737	6
1019737	8
1019737	9
1019737	10
1019737	13
1019737	16
1019737	17
1019737	18
1019737	19
1019737	20
1019737	22
1019737	24
1019737	26
1021634	1
1021634	2
1021634	3
1021634	4
1021634	5
1021634	6
1021634	8
1021634	9
1021634	10
1021634	11
1021634	12
1021634	15
1021634	16
1021634	17
1021634	18
1021634	19
1021634	24
1021634	27
1021634	28
1021634	30
1019908	8
1019908	9
1019908	24
1019725	2
1019725	4
1019725	5
1019725	6
1019725	8
1019725	9
1019725	10
1019725	11
1019725	12
1019725	16
1019725	18
1019725	19
1019725	22
1019725	24
1019725	26
1019725	27
1019725	28
1019725	30
1012739	2
1012739	5
1012739	6
1012739	7
1012739	8
1012739	9
1012739	10
1012739	11
1012739	13
1012739	17
1012739	18
1012739	19
1012739	24
1012738	8
1012738	9
1012738	19
1012738	24
1019348	2
1019348	3
1019348	5
1019348	6
1019348	7
1019348	8
1019348	9
1019348	10
1019348	11
1019348	12
1019348	13
1019348	16
1019348	17
1019348	18
1019348	19
1019348	24
1012737	2
1012737	3
1012737	5
1012737	6
1012737	7
1012737	9
1012737	10
1012737	11
1012737	12
1012737	13
1012737	17
1012737	18
1012737	19
1012737	24
1012737	27
1021478	9
1021478	24
1021601	2
1021601	4
1021601	5
1021601	6
1021601	8
1021601	9
1021601	10
1021601	11
1021601	12
1021601	18
1021601	19
1021601	24
1021601	27
1021601	28
1021601	30
1019227	2
1019227	4
1019227	5
1019227	6
1019227	8
1019227	9
1019227	10
1019227	11
1019227	12
1019227	13
1019227	17
1019227	19
1019227	22
1019227	23
1019227	24
1019227	28
1019879	9
1019879	24
1021632	2
1021632	4
1021632	5
1021632	6
1021632	8
1021632	9
1021632	10
1021632	11
1021632	12
1021632	16
1021632	18
1021632	19
1021632	24
1021632	28
1020043	2
1020043	5
1020043	6
1020043	8
1020043	9
1020043	10
1020043	13
1020043	16
1020043	19
1020043	24
1020043	26
1005939	1
1005939	2
1005939	3
1005939	5
1005939	8
1005939	9
1005939	11
1005939	18
1005939	22
1005939	24
1005991	1
1005991	2
1005991	3
1005991	4
1005991	5
1005991	6
1005991	8
1005991	9
1005991	10
1005991	11
1005991	13
1005991	16
1005991	17
1005991	18
1005991	19
1005991	20
1005991	24
1005991	26
1021336	2
1021336	4
1021336	5
1021336	8
1021336	9
1021336	11
1021336	16
1021336	24
1021549	1
1021549	2
1021549	4
1021549	5
1021549	6
1021549	9
1021549	10
1021549	11
1021549	12
1021549	13
1021549	18
1021549	19
1021549	21
1021549	22
1021549	24
1021708	2
1021708	3
1021708	4
1021708	6
1021708	9
1021708	10
1021708	11
1021708	13
1021708	17
1021708	22
1021708	24
1012044	1
1012044	2
1012044	4
1012044	5
1012044	6
1012044	7
1012044	8
1012044	9
1012044	11
1012044	12
1012044	13
1012044	16
1012044	17
1012044	18
1012044	19
1012044	22
1012044	24
1012044	27
1012044	30
1019240	1
1019240	2
1019240	4
1019240	5
1019240	6
1019240	9
1019240	10
1019240	11
1019240	15
1019240	16
1019240	18
1019240	19
1019240	20
1019240	22
1019240	24
1019240	26
1019294	2
1019294	4
1019294	5
1019294	6
1019294	8
1019294	9
1019294	10
1019294	11
1019294	16
1019294	22
1019294	24
1019294	25
1019294	26
1019883	9
1019883	24
1010614	1
1010614	13
1010614	18
1010614	19
1010614	21
1021279	1
1021279	2
1021279	3
1021279	4
1021279	5
1021279	6
1021279	8
1021279	9
1021279	10
1021279	11
1021279	13
1021279	15
1021279	17
1021279	19
1021279	22
1021279	23
1021279	24
1021279	25
1021279	26
1021279	27
1020066	1
1020066	2
1020066	5
1020066	6
1020066	7
1020066	8
1020066	9
1020066	10
1020066	13
1020066	15
1020066	17
1020066	18
1020066	24
1020066	26
1020066	27
1021518	2
1021518	4
1021518	5
1021518	6
1021518	8
1021518	9
1021518	10
1021518	11
1021518	12
1021518	16
1021518	18
1021518	20
1021518	24
1021243	2
1021243	3
1021243	4
1021243	6
1021243	9
1021243	10
1021243	11
1021243	12
1021243	13
1021243	15
1021243	16
1021243	17
1021243	18
1021243	19
1021243	22
1021243	24
1021243	25
1021243	27
1021243	28
1021434	2
1021434	4
1021434	5
1021434	6
1021434	8
1021434	9
1021434	10
1021434	11
1021434	12
1021434	13
1021434	15
1021434	16
1021434	17
1021434	18
1021434	19
1021434	20
1021434	22
1021434	24
1021434	27
1021434	28
1019407	1
1019407	2
1019407	3
1019407	4
1019407	6
1019407	9
1019407	10
1019407	11
1019407	12
1019407	13
1019407	17
1019407	18
1019407	19
1019407	21
1019407	22
1019407	24
1019407	27
1019407	30
1018875	1
1018875	2
1018875	3
1018875	4
1018875	5
1018875	8
1018875	9
1018875	10
1018875	11
1018875	12
1018875	13
1018875	19
1018875	24
1018875	26
1021344	2
1021344	3
1021344	9
1021344	10
1021344	11
1021344	17
1021344	24
1018184	1
1018184	2
1018184	4
1018184	5
1018184	6
1018184	8
1018184	9
1018184	10
1018184	11
1018184	13
1018184	16
1018184	17
1018184	18
1018184	19
1018184	24
1018550	2
1018550	5
1018550	6
1018550	9
1018550	10
1018550	11
1018550	12
1018550	16
1018550	19
1018550	24
1018550	27
1001059	2
1001059	3
1001059	4
1001059	5
1001059	6
1001059	7
1001059	8
1001059	9
1001059	10
1001059	11
1001059	13
1001059	15
1001059	17
1001059	18
1001059	19
1001059	20
1001059	22
1001059	24
1001059	26
1004865	1
1004865	2
1004865	4
1004865	5
1004865	6
1004865	8
1004865	9
1004865	10
1004865	11
1004865	16
1004865	19
1004865	24
1004865	25
1009884	2
1009884	3
1009884	4
1009884	5
1009884	6
1009884	8
1009884	9
1009884	10
1009884	11
1009884	12
1009884	13
1009884	16
1009884	17
1009884	18
1009884	19
1009884	21
1009884	24
1009884	27
1009884	30
1018455	2
1018455	4
1018455	5
1018455	6
1018455	9
1018455	10
1018455	11
1018455	16
1018455	18
1018455	19
1018455	20
1018455	21
1018455	23
1018455	24
1019640	2
1019640	4
1019640	5
1019640	8
1019640	9
1019640	10
1019640	11
1019640	16
1019640	17
1019640	18
1019640	21
1019640	24
1003694	2
1003694	3
1003694	5
1003694	6
1003694	8
1003694	9
1003694	10
1003694	11
1003694	13
1003694	16
1003694	17
1003694	19
1003694	24
1006780	1
1006780	2
1006780	3
1006780	4
1006780	5
1006780	6
1006780	7
1006780	8
1006780	9
1006780	10
1006780	11
1006780	12
1006780	13
1006780	15
1006780	16
1006780	17
1006780	18
1006780	19
1006780	20
1006780	22
1006780	24
1006780	25
1006780	26
1006780	27
1006780	28
1006780	30
1010755	1
1010755	2
1010755	3
1010755	4
1010755	5
1010755	6
1010755	8
1010755	9
1010755	10
1010755	11
1010755	13
1010755	16
1010755	17
1010755	18
1010755	19
1010755	21
1010755	24
1010755	30
1002764	1
1002764	2
1002764	3
1002764	4
1002764	5
1002764	6
1002764	8
1002764	9
1002764	10
1002764	11
1002764	12
1002764	13
1002764	16
1002764	18
1002764	19
1002764	20
1002764	22
1002764	24
1002764	27
1002764	28
1018728	1
1018728	2
1018728	3
1018728	4
1018728	5
1018728	6
1018728	8
1018728	9
1018728	10
1018728	12
1018728	13
1018728	15
1018728	17
1018728	18
1018728	19
1018728	20
1018728	24
1018728	26
1019815	2
1019815	5
1019815	6
1019815	8
1019815	9
1019815	10
1019815	12
1019815	13
1019815	16
1019815	17
1019815	18
1019815	19
1019815	22
1019815	24
1019815	27
1021379	1
1021379	2
1021379	3
1021379	4
1021379	5
1021379	6
1021379	7
1021379	8
1021379	9
1021379	10
1021379	11
1021379	12
1021379	13
1021379	16
1021379	17
1021379	18
1021379	19
1021379	22
1021379	24
1021379	26
1021379	27
1021379	28
1021379	30
1021554	1
1021554	2
1021554	3
1021554	4
1021554	5
1021554	6
1021554	7
1021554	8
1021554	9
1021554	11
1021554	13
1021554	17
1021554	20
1021554	22
1021554	24
1021554	26
1021554	27
1019008	1
1019008	2
1019008	3
1019008	5
1019008	6
1019008	8
1019008	9
1019008	10
1019008	12
1019008	13
1019008	17
1019008	18
1019008	19
1019008	23
1019008	24
1019008	25
1019008	30
1019345	1
1019345	2
1019345	4
1019345	5
1019345	6
1019345	8
1019345	9
1019345	10
1019345	11
1019345	12
1019345	13
1019345	16
1019345	17
1019345	18
1019345	19
1019345	22
1019345	24
1019345	26
1019345	28
1020054	1
1020054	2
1020054	3
1020054	5
1020054	6
1020054	7
1020054	8
1020054	9
1020054	10
1020054	11
1020054	13
1020054	15
1020054	16
1020054	17
1020054	18
1020054	19
1020054	22
1020054	24
1020054	25
1020054	27
1020054	30
1019127	2
1019127	3
1019127	5
1019127	6
1019127	8
1019127	9
1019127	10
1019127	11
1019127	13
1019127	15
1019127	17
1019127	18
1019127	19
1019127	22
1019127	24
1019127	26
1019828	1
1019828	2
1019828	3
1019828	4
1019828	5
1019828	6
1019828	7
1019828	8
1019828	9
1019828	10
1019828	11
1019828	12
1019828	13
1019828	15
1019828	16
1019828	17
1019828	18
1019828	19
1019828	20
1019828	21
1019828	22
1019828	23
1019828	24
1019828	25
1019828	26
1019828	27
1019828	28
1019828	29
1019828	30
1021566	1
1021566	2
1021566	3
1021566	4
1021566	5
1021566	6
1021566	8
1021566	9
1021566	10
1021566	11
1021566	12
1021566	15
1021566	18
1021566	21
1021566	22
1021566	24
1021566	26
1019488	2
1019488	3
1019488	5
1019488	6
1019488	8
1019488	9
1019488	10
1019488	11
1019488	13
1019488	16
1019488	18
1019488	24
1019488	26
1018829	2
1018829	3
1018829	4
1018829	6
1018829	7
1018829	8
1018829	9
1018829	10
1018829	11
1018829	12
1018829	13
1018829	16
1018829	17
1018829	18
1018829	19
1018829	21
1018829	22
1018829	24
1019223	2
1019223	4
1019223	6
1019223	9
1019223	18
1019223	19
1019223	24
1019223	26
1019971	2
1019971	3
1019971	4
1019971	5
1019971	6
1019971	9
1019971	10
1019971	11
1019971	13
1019971	16
1019971	21
1019971	22
1019971	24
1019353	2
1019353	3
1019353	4
1019353	5
1019353	6
1019353	7
1019353	9
1019353	10
1019353	11
1019353	12
1019353	16
1019353	17
1019353	18
1019353	19
1019353	22
1019353	23
1019353	24
1001839	1
1001839	2
1001839	3
1001839	4
1001839	5
1001839	6
1001839	7
1001839	8
1001839	9
1001839	10
1001839	11
1001839	12
1001839	13
1001839	15
1001839	16
1001839	17
1001839	18
1001839	19
1001839	24
1006250	1
1006250	2
1006250	3
1006250	4
1006250	5
1006250	6
1006250	7
1006250	8
1006250	9
1006250	10
1006250	11
1006250	13
1006250	15
1006250	16
1006250	18
1006250	19
1006250	20
1006250	22
1006250	24
1006250	26
1006250	27
1006250	28
1019200	1
1019200	2
1019200	3
1019200	4
1019200	5
1019200	6
1019200	7
1019200	8
1019200	9
1019200	10
1019200	11
1019200	12
1019200	13
1019200	15
1019200	16
1019200	17
1019200	18
1019200	19
1019200	20
1019200	21
1019200	22
1019200	23
1019200	24
1019200	25
1019200	26
1019200	27
1019200	28
1019200	29
1019200	30
1021412	2
1021412	3
1021412	4
1021412	5
1021412	6
1021412	8
1021412	9
1021412	10
1021412	11
1021412	12
1021412	13
1021412	16
1021412	17
1021412	19
1021412	22
1021412	24
1021412	28
1021413	2
1021413	3
1021413	4
1021413	6
1021413	8
1021413	9
1021413	10
1021413	11
1021413	12
1021413	13
1021413	16
1021413	17
1021413	18
1021413	19
1021413	24
1021413	28
1001271	2
1001271	4
1001271	5
1001271	6
1001271	7
1001271	8
1001271	9
1001271	10
1001271	11
1001271	13
1001271	15
1001271	16
1001271	17
1001271	18
1001271	19
1001271	20
1001271	22
1001271	24
1001271	26
1021356	2
1021356	4
1021356	5
1021356	6
1021356	7
1021356	8
1021356	9
1021356	10
1021356	11
1021356	13
1021356	15
1021356	16
1021356	17
1021356	18
1021356	19
1021356	22
1021356	24
1021356	25
1021356	28
1020130	1
1020130	2
1020130	3
1020130	6
1020130	8
1020130	9
1020130	10
1020130	11
1020130	15
1020130	16
1020130	18
1020130	20
1020130	22
1020130	24
1020130	26
1020131	1
1020131	2
1020131	3
1020131	4
1020131	6
1020131	9
1020131	10
1020131	11
1020131	15
1020131	16
1020131	18
1020131	19
1020131	20
1020131	22
1020131	24
1020131	26
1020146	1
1020146	2
1020146	3
1020146	4
1020146	5
1020146	6
1020146	7
1020146	8
1020146	9
1020146	10
1020146	11
1020146	13
1020146	15
1020146	16
1020146	17
1020146	18
1020146	19
1020146	20
1020146	21
1020146	23
1020146	24
1020146	25
1020146	26
1020146	27
1020146	28
1020146	29
1020146	30
1009659	5
1009659	9
1009659	11
1009659	15
1009659	23
1009659	24
1009659	27
1010865	2
1010865	3
1010865	4
1010865	5
1010865	6
1010865	7
1010865	8
1010865	9
1010865	10
1010865	11
1010865	13
1010865	15
1010865	16
1010865	17
1010865	18
1010865	19
1010865	21
1010865	22
1010865	23
1010865	24
1010865	27
1010865	28
1021667	1
1021667	2
1021667	3
1021667	4
1021667	5
1021667	6
1021667	7
1021667	8
1021667	9
1021667	10
1021667	11
1021667	12
1021667	13
1021667	15
1021667	16
1021667	17
1021667	18
1021667	19
1021667	20
1021667	21
1021667	22
1021667	23
1021667	24
1021667	25
1021667	26
1021667	27
1021667	28
1021667	30
1019646	1
1019646	2
1019646	3
1019646	4
1019646	5
1019646	6
1019646	7
1019646	8
1019646	9
1019646	10
1019646	11
1019646	13
1019646	15
1019646	16
1019646	17
1019646	18
1019646	19
1019646	20
1019646	21
1019646	22
1019646	23
1019646	24
1019646	27
1019646	28
1019646	30
1018655	1
1018655	2
1018655	3
1018655	4
1018655	5
1018655	6
1018655	8
1018655	9
1018655	10
1018655	11
1018655	13
1018655	15
1018655	16
1018655	17
1018655	18
1018655	19
1018655	21
1018655	22
1018655	24
1018655	27
1018655	28
1019343	1
1019343	2
1019343	3
1019343	4
1019343	5
1019343	6
1019343	8
1019343	9
1019343	10
1019343	11
1019343	13
1019343	16
1019343	17
1019343	18
1019343	19
1019343	21
1019343	22
1019343	24
1019343	27
1019343	28
1021685	2
1021685	3
1021685	4
1021685	5
1021685	6
1021685	8
1021685	9
1021685	10
1021685	11
1021685	13
1021685	15
1021685	16
1021685	17
1021685	18
1021685	19
1021685	22
1021685	24
1021685	27
1001034	1
1001034	2
1001034	4
1001034	5
1001034	6
1001034	8
1001034	9
1001034	10
1001034	11
1001034	12
1001034	13
1001034	15
1001034	16
1001034	17
1001034	18
1001034	19
1001034	24
1019317	2
1019317	4
1019317	5
1019317	6
1019317	8
1019317	9
1019317	10
1019317	11
1019317	13
1019317	16
1019317	17
1019317	18
1019317	19
1019317	22
1019317	24
1021608	1
1021608	2
1021608	3
1021608	4
1021608	5
1021608	6
1021608	7
1021608	8
1021608	9
1021608	10
1021608	11
1021608	13
1021608	15
1021608	16
1021608	17
1021608	18
1021608	19
1021608	24
1021608	25
1021608	27
1021608	28
1021608	30
1018807	1
1018807	2
1018807	4
1018807	5
1018807	6
1018807	8
1018807	9
1018807	10
1018807	11
1018807	12
1018807	13
1018807	16
1018807	18
1018807	19
1018807	22
1018807	23
1018807	24
1018807	26
1018807	28
1020114	1
1020114	2
1020114	3
1020114	4
1020114	5
1020114	6
1020114	7
1020114	8
1020114	9
1020114	10
1020114	11
1020114	15
1020114	16
1020114	17
1020114	18
1020114	20
1020114	22
1020114	23
1020114	24
1020114	26
1020114	27
1018920	2
1018920	4
1018920	6
1018920	7
1018920	8
1018920	9
1018920	10
1018920	11
1018920	12
1018920	13
1018920	16
1018920	17
1018920	18
1018920	19
1018920	22
1018920	24
1018920	27
1018920	28
1008468	2
1008468	3
1008468	4
1008468	5
1008468	6
1008468	7
1008468	9
1008468	10
1008468	11
1008468	13
1008468	15
1008468	16
1008468	17
1008468	18
1008468	19
1008468	20
1008468	21
1008468	22
1008468	23
1008468	24
1008468	26
1008468	27
1008468	30
1019202	2
1019202	4
1019202	6
1019202	8
1019202	9
1019202	10
1019202	11
1019202	13
1019202	15
1019202	18
1019202	19
1019202	24
1020198	1
1020198	2
1020198	5
1020198	6
1020198	7
1020198	8
1020198	9
1020198	10
1020198	11
1020198	15
1020198	24
1020198	27
1008360	2
1008360	3
1008360	4
1008360	6
1008360	8
1008360	9
1008360	10
1008360	11
1008360	16
1008360	18
1008360	19
1008360	20
1008360	24
1019416	2
1019416	3
1019416	4
1019416	5
1019416	6
1019416	8
1019416	9
1019416	10
1019416	11
1019416	13
1019416	15
1019416	16
1019416	18
1019416	19
1019416	24
1019019	1
1019019	2
1019019	3
1019019	4
1019019	5
1019019	6
1019019	7
1019019	8
1019019	9
1019019	10
1019019	11
1019019	12
1019019	13
1019019	15
1019019	16
1019019	17
1019019	18
1019019	19
1019019	22
1019019	24
1019019	26
1019019	27
1019023	1
1019023	2
1019023	3
1019023	4
1019023	5
1019023	6
1019023	7
1019023	8
1019023	9
1019023	10
1019023	11
1019023	12
1019023	13
1019023	15
1019023	16
1019023	17
1019023	18
1019023	19
1019023	22
1019023	24
1019023	27
1019025	1
1019025	2
1019025	3
1019025	4
1019025	6
1019025	8
1019025	9
1019025	10
1019025	11
1019025	12
1019025	13
1019025	15
1019025	16
1019025	17
1019025	18
1019025	19
1019025	22
1019025	27
1021699	2
1021699	3
1021699	4
1021699	5
1021699	6
1021699	7
1021699	9
1021699	10
1021699	11
1021699	13
1021699	15
1021699	16
1021699	17
1021699	18
1021699	19
1021699	24
1021699	26
1021699	27
1021699	28
1021215	1
1021215	2
1021215	6
1021215	9
1021215	10
1021215	22
1021215	24
1020023	2
1020023	4
1020023	5
1020023	6
1020023	9
1020023	10
1020023	11
1020023	12
1020023	24
1021384	1
1021384	2
1021384	4
1021384	5
1021384	6
1021384	8
1021384	9
1021384	10
1021384	11
1021384	12
1021384	16
1021384	17
1021384	18
1021384	19
1021384	24
1021384	27
1021384	28
1021384	30
1004212	2
1004212	4
1004212	5
1004212	6
1004212	8
1004212	9
1004212	10
1004212	11
1004212	15
1004212	16
1004212	20
1004212	24
1021335	1
1021335	2
1021335	4
1021335	5
1021335	6
1021335	8
1021335	9
1021335	10
1021335	11
1021335	12
1021335	13
1021335	15
1021335	16
1021335	17
1021335	18
1021335	19
1021335	20
1021335	21
1021335	22
1021335	24
1021335	26
1021335	27
1021335	28
1012777	1
1012777	2
1012777	5
1012777	6
1012777	8
1012777	9
1012777	10
1012777	15
1012777	16
1012777	18
1012777	20
1012777	24
1008946	1
1008946	2
1008946	4
1008946	5
1008946	6
1008946	7
1008946	8
1008946	9
1008946	10
1008946	11
1008946	13
1008946	16
1008946	17
1008946	18
1008946	19
1008946	20
1008946	22
1008946	24
1008946	30
1021721	1
1021721	2
1021721	4
1021721	5
1021721	6
1021721	8
1021721	9
1021721	10
1021721	11
1021721	12
1021721	13
1021721	15
1021721	16
1021721	17
1021721	18
1021721	19
1021721	20
1021721	22
1021721	24
1021721	25
1021721	26
1021721	27
1021721	28
1021722	1
1021722	2
1021722	4
1021722	5
1021722	6
1021722	8
1021722	9
1021722	10
1021722	11
1021722	12
1021722	13
1021722	15
1021722	16
1021722	17
1021722	18
1021722	19
1021722	20
1021722	22
1021722	24
1021722	25
1021722	26
1021722	27
1021722	28
1021599	2
1021599	4
1021599	5
1021599	6
1021599	9
1021599	10
1021599	11
1021599	15
1021599	16
1021599	19
1021599	24
1021599	28
1021200	1
1021200	2
1021200	4
1021200	5
1021200	6
1021200	9
1021200	15
1021200	16
1021200	18
1021200	20
1021200	24
1021200	27
1019723	2
1019723	3
1019723	4
1019723	6
1019723	7
1019723	9
1019723	10
1019723	11
1019723	13
1019723	16
1019723	18
1019723	22
1019723	24
1019723	27
1019723	28
1021648	2
1021648	3
1021648	4
1021648	5
1021648	6
1021648	7
1021648	8
1021648	9
1021648	10
1021648	11
1021648	13
1021648	16
1021648	17
1021648	18
1021648	19
1021648	21
1021648	22
1021648	24
1021648	26
1021648	27
1021648	28
1021648	29
1021648	30
1019102	9
1019102	11
1019102	18
1019102	24
1019102	26
1019102	29
1005248	5
1005248	8
1005248	9
1005248	15
1005248	23
1005248	24
1005248	27
1018687	2
1018687	4
1018687	7
1018687	9
1018687	10
1018687	11
1018687	12
1018687	13
1018687	15
1018687	17
1018687	18
1018687	19
1018687	22
1018687	23
1018687	24
1018687	25
1011995	1
1011995	2
1011995	3
1011995	4
1011995	5
1011995	6
1011995	7
1011995	8
1011995	9
1011995	10
1011995	11
1011995	13
1011995	15
1011995	16
1011995	17
1011995	18
1011995	19
1011995	20
1011995	22
1011995	23
1011995	24
1011995	26
1021491	2
1021491	5
1021491	6
1021491	8
1021491	9
1021491	10
1021491	13
1021491	16
1021491	17
1021491	19
1021491	24
1021491	30
1021398	2
1021398	4
1021398	8
1021398	9
1021398	10
1021398	11
1021398	16
1021398	19
1021398	24
1021398	28
1019755	2
1019755	3
1019755	6
1019755	7
1019755	8
1019755	9
1019755	10
1019755	11
1019755	13
1019755	15
1019755	16
1019755	17
1019755	18
1019755	22
1019755	24
1019755	27
1019755	29
1019761	1
1019761	2
1019761	3
1019761	6
1019761	7
1019761	8
1019761	9
1019761	10
1019761	11
1019761	13
1019761	15
1019761	16
1019761	17
1019761	18
1019761	22
1019761	24
1019761	27
1006927	2
1006927	4
1006927	5
1006927	6
1006927	8
1006927	9
1006927	10
1006927	11
1006927	13
1006927	16
1006927	18
1006927	19
1006927	22
1006927	24
1006927	30
1019939	1
1019939	2
1019939	3
1019939	4
1019939	5
1019939	6
1019939	8
1019939	9
1019939	10
1019939	11
1019939	13
1019939	15
1019939	16
1019939	17
1019939	18
1019939	19
1019939	20
1019939	21
1019939	22
1019939	24
1019939	27
1021417	2
1021417	3
1021417	4
1021417	6
1021417	8
1021417	9
1021417	10
1021417	11
1021417	13
1021417	16
1021417	18
1021417	24
1021417	27
1019674	1
1019674	2
1019674	3
1019674	4
1019674	5
1019674	6
1019674	8
1019674	9
1019674	10
1019674	11
1019674	12
1019674	13
1019674	17
1019674	19
1019674	21
1019674	22
1019674	24
1019674	27
1019674	28
1019910	3
1019910	9
1019910	10
1019910	11
1019910	23
1019910	24
1019910	29
1018944	1
1018944	2
1018944	3
1018944	6
1018944	7
1018944	8
1018944	9
1018944	10
1018944	11
1018944	12
1018944	13
1018944	15
1018944	16
1018944	17
1018944	18
1018944	19
1018944	22
1018944	23
1018944	24
1018944	25
1018944	26
1018944	27
1018944	28
1018944	29
1021735	1
1021735	2
1021735	3
1021735	4
1021735	5
1021735	7
1021735	8
1021735	9
1021735	10
1021735	11
1021735	13
1021735	15
1021735	18
1021735	19
1021735	22
1021735	24
1019068	2
1019068	4
1019068	9
1019068	24
1021389	2
1021389	3
1021389	4
1021389	5
1021389	6
1021389	7
1021389	8
1021389	9
1021389	10
1021389	11
1021389	13
1021389	15
1021389	18
1021389	19
1021389	22
1021389	24
1021389	26
1021389	27
1021389	28
1021718	2
1021718	4
1021718	5
1021718	6
1021718	8
1021718	9
1021718	10
1021718	11
1021718	12
1021718	13
1021718	16
1021718	18
1021718	22
1021718	24
1021718	27
1021718	28
1021718	30
1020175	2
1020175	3
1020175	4
1020175	5
1020175	6
1020175	8
1020175	9
1020175	10
1020175	11
1020175	13
1020175	15
1020175	16
1020175	17
1020175	18
1020175	19
1020175	22
1020175	23
1020175	24
1020175	26
1020175	27
1019685	2
1019685	4
1019685	5
1019685	6
1019685	8
1019685	9
1019685	11
1019685	16
1019685	22
1019685	24
1018466	2
1018466	3
1018466	4
1018466	9
1018466	11
1018466	12
1018466	13
1018466	17
1018466	18
1018466	24
1019454	2
1019454	4
1019454	5
1019454	6
1019454	7
1019454	8
1019454	9
1019454	10
1019454	11
1019454	13
1019454	16
1019454	17
1019454	19
1019454	24
1019454	25
1019454	28
1019454	30
1020072	2
1020072	4
1020072	5
1020072	6
1020072	7
1020072	8
1020072	9
1020072	10
1020072	11
1020072	12
1020072	13
1020072	15
1020072	16
1020072	17
1020072	18
1020072	19
1020072	20
1020072	21
1020072	22
1020072	24
1020072	25
1020072	26
1020072	27
1020072	30
1021688	2
1021688	4
1021688	5
1021688	6
1021688	8
1021688	9
1021688	10
1021688	11
1021688	12
1021688	15
1021688	19
1021688	22
1021688	24
1019854	1
1019854	2
1019854	4
1019854	5
1019854	6
1019854	8
1019854	9
1019854	10
1019854	11
1019854	12
1019854	13
1019854	17
1019854	19
1019854	21
1019854	22
1019854	24
1019854	26
1019854	27
1021746	2
1021746	3
1021746	4
1021746	6
1021746	8
1021746	9
1021746	10
1021746	11
1021746	13
1021746	19
1021746	24
1019822	2
1019822	5
1019822	6
1019822	8
1019822	9
1019822	10
1019822	11
1019822	13
1019822	16
1019822	17
1019822	19
1019822	24
1019822	28
1018626	1
1018626	2
1018626	5
1018626	8
1018626	9
1018626	11
1018626	18
1018626	19
1018626	21
1018626	22
1018626	24
1018626	28
1018626	29
1018627	1
1018627	2
1018627	3
1018627	4
1018627	5
1018627	6
1018627	7
1018627	8
1018627	9
1018627	10
1018627	11
1018627	13
1018627	15
1018627	17
1018627	18
1018627	19
1018627	22
1018627	23
1018627	24
1018627	25
1018627	26
1018627	27
1018627	28
1018627	29
1012060	2
1012060	4
1012060	5
1012060	6
1012060	8
1012060	9
1012060	10
1012060	11
1012060	12
1012060	16
1012060	17
1012060	19
1012060	27
1010839	2
1010839	3
1010839	4
1010839	5
1010839	6
1010839	8
1010839	9
1010839	10
1010839	11
1010839	13
1010839	17
1010839	18
1010839	19
1010839	22
1010839	24
1010839	26
1019128	1
1019128	2
1019128	4
1019128	5
1019128	6
1019128	8
1019128	9
1019128	10
1019128	11
1019128	13
1019128	16
1019128	19
1019128	20
1019128	22
1019128	24
1019128	27
1019128	30
1001260	1
1001260	2
1001260	4
1001260	5
1001260	6
1001260	8
1001260	9
1001260	10
1001260	11
1001260	13
1001260	15
1001260	16
1001260	17
1001260	18
1001260	19
1001260	22
1001260	24
1001260	27
1001260	28
1001260	30
1020126	2
1020126	4
1020126	5
1020126	6
1020126	7
1020126	8
1020126	9
1020126	10
1020126	11
1020126	15
1020126	16
1020126	18
1020126	19
1020126	20
1020126	22
1020126	24
1002060	1
1002060	2
1002060	3
1002060	4
1002060	5
1002060	6
1002060	8
1002060	9
1002060	10
1002060	11
1002060	12
1002060	13
1002060	16
1002060	17
1002060	18
1002060	19
1002060	24
1020177	1
1020177	2
1020177	3
1020177	5
1020177	6
1020177	8
1020177	9
1020177	10
1020177	11
1020177	13
1020177	17
1020177	24
1020177	27
1021494	9
1021494	24
1007245	1
1007245	2
1007245	3
1007245	4
1007245	5
1007245	6
1007245	7
1007245	8
1007245	9
1007245	10
1007245	11
1007245	12
1007245	13
1007245	15
1007245	16
1007245	17
1007245	18
1007245	19
1007245	20
1007245	21
1007245	22
1007245	23
1007245	24
1007245	25
1007245	26
1007245	27
1007245	28
1007245	30
1010408	1
1010408	2
1010408	3
1010408	5
1010408	6
1010408	7
1010408	8
1010408	9
1010408	10
1010408	11
1010408	13
1010408	15
1010408	16
1010408	17
1010408	18
1010408	19
1010408	20
1010408	21
1010408	22
1010408	24
1010408	25
1010408	27
1010408	28
1010408	30
1021731	2
1021731	5
1021731	6
1021731	8
1021731	9
1021731	11
1021731	19
1021731	24
1020165	2
1020165	3
1020165	4
1020165	5
1020165	6
1020165	8
1020165	9
1020165	10
1020165	11
1020165	12
1020165	13
1020165	15
1020165	16
1020165	18
1020165	19
1020165	23
1020165	24
1020165	25
1020165	27
1021380	2
1021380	4
1021380	5
1021380	6
1021380	8
1021380	9
1021380	10
1021380	11
1021380	12
1021380	13
1021380	17
1021380	19
1021380	22
1021380	24
1010638	1
1010638	2
1010638	3
1010638	4
1010638	5
1010638	6
1010638	7
1010638	8
1010638	9
1010638	10
1010638	11
1010638	13
1010638	15
1010638	16
1010638	17
1010638	18
1010638	19
1010638	20
1010638	22
1010638	23
1010638	24
1010638	26
1010638	27
1010638	28
1010638	29
1016803	5
1016803	8
1016803	9
1016803	24
1016803	27
1021641	2
1021641	3
1021641	4
1021641	5
1021641	6
1021641	8
1021641	9
1021641	10
1021641	11
1021641	13
1021641	16
1021641	17
1021641	18
1021641	19
1021641	22
1021641	24
1021641	26
1021641	27
1018921	2
1018921	3
1018921	6
1018921	8
1018921	9
1018921	10
1018921	15
1018921	16
1018921	24
1020005	2
1020005	5
1020005	6
1020005	8
1020005	9
1020005	10
1020005	16
1020005	18
1020005	19
1020005	24
1021572	1
1021572	2
1021572	4
1021572	5
1021572	7
1021572	8
1021572	9
1021572	10
1021572	13
1021572	15
1021572	19
1021572	20
1021572	21
1021572	22
1021572	24
1019328	2
1019328	4
1019328	5
1019328	6
1019328	9
1019328	10
1019328	11
1019328	12
1019328	16
1019328	19
1019328	22
1019328	24
1019885	9
1019885	24
1012268	1
1012268	2
1012268	3
1012268	4
1012268	5
1012268	6
1012268	8
1012268	9
1012268	10
1012268	11
1012268	12
1012268	13
1012268	17
1012268	18
1012268	19
1012268	21
1012268	22
1012268	24
1012268	28
1019344	2
1019344	3
1019344	4
1019344	6
1019344	10
1019344	11
1019344	12
1019344	17
1019344	18
1019344	19
1019344	21
1019478	2
1019478	4
1019478	5
1019478	6
1019478	8
1019478	9
1019478	10
1019478	11
1019478	13
1019478	16
1019478	19
1019478	22
1019478	24
1019616	13
1019616	18
1019616	19
1019615	2
1019615	4
1019615	6
1019615	8
1019615	10
1019615	11
1019615	12
1019615	13
1019615	15
1019615	18
1019615	19
1019615	22
1019615	26
1019615	28
1019884	9
1019884	24
1020019	1
1020019	2
1020019	3
1020019	4
1020019	5
1020019	6
1020019	7
1020019	8
1020019	9
1020019	10
1020019	11
1020019	13
1020019	15
1020019	16
1020019	17
1020019	18
1020019	19
1020019	20
1020019	22
1020019	24
1020019	26
1020019	29
1008213	2
1008213	4
1008213	6
1008213	8
1008213	9
1008213	10
1008213	13
1008213	16
1008213	24
1021455	1
1021455	2
1021455	3
1021455	4
1021455	5
1021455	6
1021455	7
1021455	8
1021455	9
1021455	10
1021455	11
1021455	12
1021455	13
1021455	16
1021455	17
1021455	18
1021455	19
1021455	21
1021455	22
1021455	24
1021455	25
1021455	26
1021455	27
1021455	28
1021455	30
1004602	1
1004602	2
1004602	3
1004602	5
1004602	6
1004602	8
1004602	9
1004602	10
1004602	11
1004602	12
1004602	13
1004602	16
1004602	17
1004602	19
1004602	20
1004602	24
1011146	2
1011146	3
1011146	4
1011146	5
1011146	6
1011146	8
1011146	9
1011146	10
1011146	11
1011146	12
1011146	13
1011146	16
1011146	17
1011146	19
1011146	21
1011146	24
1011146	27
1011146	28
1005259	8
1005259	9
1005259	23
1005259	24
1005259	27
1021485	2
1021485	3
1021485	4
1021485	8
1021485	9
1021485	10
1021485	11
1021485	15
1021485	16
1021485	18
1021485	19
1021485	21
1021485	22
1021485	24
1021485	25
1021485	26
1021485	29
1021462	2
1021462	4
1021462	5
1021462	8
1021462	9
1021462	10
1021462	19
1021462	24
1019027	1
1019027	2
1019027	3
1019027	6
1019027	7
1019027	8
1019027	9
1019027	10
1019027	11
1019027	12
1019027	13
1019027	15
1019027	17
1019027	18
1019027	22
1019027	24
1019027	26
1019027	27
1019027	28
1018986	1
1018986	2
1018986	4
1018986	6
1018986	8
1018986	9
1018986	10
1018986	11
1018986	12
1018986	16
1018986	17
1018986	19
1018986	24
1020037	1
1020037	2
1020037	3
1020037	4
1020037	5
1020037	6
1020037	7
1020037	8
1020037	9
1020037	10
1020037	11
1020037	13
1020037	16
1020037	17
1020037	18
1020037	19
1020037	20
1020037	21
1020037	22
1020037	23
1020037	24
1020037	25
1020037	27
1020037	30
1018474	1
1018474	5
1018474	6
1018474	8
1018474	9
1018474	10
1018474	11
1018474	13
1018474	16
1018474	21
1018474	23
1018474	24
1018477	1
1018477	2
1018477	3
1018477	5
1018477	6
1018477	7
1018477	8
1018477	9
1018477	10
1018477	11
1018477	13
1018477	15
1018477	16
1018477	17
1018477	18
1018477	20
1018477	21
1018477	22
1018477	24
1018477	27
1018477	30
1018478	2
1018478	5
1018478	6
1018478	7
1018478	8
1018478	9
1018478	10
1018478	11
1018478	13
1018478	18
1018478	21
1018478	22
1018478	24
1018482	1
1018482	2
1018482	3
1018482	5
1018482	6
1018482	7
1018482	8
1018482	9
1018482	10
1018482	11
1018482	13
1018482	15
1018482	17
1018482	18
1018482	19
1018482	20
1018482	21
1018482	22
1018482	23
1018482	24
1018482	25
1018482	26
1018482	27
1018482	29
1018482	30
1018483	1
1018483	2
1018483	3
1018483	5
1018483	7
1018483	8
1018483	9
1018483	10
1018483	11
1018483	13
1018483	15
1018483	16
1018483	18
1018483	21
1018483	22
1018483	23
1018483	24
1018483	27
1018483	30
1007797	1
1007797	2
1007797	3
1007797	4
1007797	5
1007797	6
1007797	7
1007797	8
1007797	9
1007797	10
1007797	11
1007797	12
1007797	13
1007797	16
1007797	17
1007797	18
1007797	19
1007797	21
1007797	22
1007797	24
1007797	26
1007797	27
1007797	28
1018963	1
1018963	2
1018963	3
1018963	4
1018963	5
1018963	6
1018963	8
1018963	9
1018963	10
1018963	12
1018963	16
1018963	18
1018963	19
1018963	24
1019807	2
1019807	6
1019807	9
1019807	10
1019807	11
1019807	12
1019807	17
1019807	22
1019807	24
1019807	26
1021263	2
1021263	3
1021263	4
1021263	5
1021263	6
1021263	8
1021263	9
1021263	10
1021263	11
1021263	13
1021263	15
1021263	16
1021263	17
1021263	18
1021263	19
1021263	22
1021263	23
1021263	24
1021263	27
1021263	30
1021501	2
1021501	3
1021501	4
1021501	5
1021501	6
1021501	8
1021501	9
1021501	10
1021501	11
1021501	12
1021501	13
1021501	17
1021501	18
1021501	19
1021501	21
1021501	22
1021501	24
1021501	25
1021501	27
1021501	28
1019149	2
1019149	4
1019149	5
1019149	6
1019149	8
1019149	9
1019149	10
1019149	11
1019149	16
1019149	19
1019149	24
1019793	2
1019793	3
1019793	4
1019793	5
1019793	6
1019793	9
1019793	10
1019793	11
1019793	12
1019793	15
1019793	16
1019793	18
1019793	19
1019793	22
1019793	24
1019793	27
1019793	28
1019793	30
1020086	1
1020086	2
1020086	4
1020086	6
1020086	9
1020086	10
1020086	11
1020086	13
1020086	16
1020086	19
1020086	22
1020086	24
1020086	27
1018215	2
1018215	9
1018215	10
1018215	11
1018215	23
1018215	24
1018215	25
1021617	2
1021617	4
1021617	6
1021617	7
1021617	8
1021617	9
1021617	10
1021617	11
1021617	13
1021617	19
1021617	24
1021617	26
1019868	2
1019868	3
1019868	4
1019868	5
1019868	6
1019868	8
1019868	9
1019868	10
1019868	11
1019868	12
1019868	13
1019868	16
1019868	17
1019868	19
1019868	22
1019868	24
1019868	26
1019868	28
1021266	1
1021266	2
1021266	4
1021266	5
1021266	6
1021266	8
1021266	9
1021266	10
1021266	11
1021266	12
1021266	16
1021266	17
1021266	18
1021266	19
1021266	22
1021266	23
1021266	24
1021266	27
1011596	1
1011596	2
1011596	4
1011596	6
1011596	8
1011596	9
1011596	10
1011596	11
1011596	12
1011596	13
1011596	17
1011596	18
1011596	19
1011596	22
1011596	24
1011596	27
1003402	1
1003402	2
1003402	3
1003402	4
1003402	5
1003402	6
1003402	7
1003402	8
1003402	9
1003402	10
1003402	11
1003402	13
1003402	15
1003402	16
1003402	17
1003402	18
1003402	19
1003402	20
1003402	21
1003402	22
1003402	23
1003402	24
1003402	26
1003402	27
1003402	28
1003402	30
1021618	1
1021618	2
1021618	3
1021618	4
1021618	5
1021618	8
1021618	9
1021618	10
1021618	11
1021618	16
1021618	17
1021618	20
1021618	22
1021618	24
1021618	27
1019477	2
1019477	3
1019477	4
1019477	5
1019477	6
1019477	8
1019477	9
1019477	10
1019477	11
1019477	13
1019477	15
1019477	18
1019477	19
1019477	21
1019477	22
1019477	23
1019477	24
1019477	25
1019477	27
1010145	1
1010145	2
1010145	3
1010145	5
1010145	6
1010145	7
1010145	8
1010145	9
1010145	10
1010145	11
1010145	13
1010145	17
1010145	18
1010145	21
1010145	22
1010145	23
1010145	24
1010145	26
1010145	27
1005260	5
1005260	8
1005260	9
1005260	11
1005260	23
1005260	24
1019122	2
1019122	4
1019122	5
1019122	7
1019122	9
1019122	18
1019122	19
1019122	24
1019315	1
1019315	2
1019315	3
1019315	4
1019315	5
1019315	6
1019315	8
1019315	9
1019315	10
1019315	11
1019315	13
1019315	16
1019315	18
1019315	19
1019315	24
1019315	28
1021579	1
1021579	2
1021579	3
1021579	4
1021579	5
1021579	6
1021579	8
1021579	9
1021579	10
1021579	11
1021579	13
1021579	15
1021579	16
1021579	17
1021579	18
1021579	19
1021579	20
1021579	22
1021579	23
1021579	24
1021579	25
1021579	26
1021579	27
1021579	28
1021579	30
1011310	1
1011310	2
1011310	5
1011310	6
1011310	9
1011310	10
1011310	11
1011310	16
1011310	24
1019204	2
1019204	5
1019204	6
1019204	8
1019204	9
1019204	11
1019204	24
1020093	2
1020093	4
1020093	6
1020093	9
1020093	10
1020093	11
1020093	23
1020093	24
1019500	2
1019500	5
1019500	7
1019500	8
1019500	9
1019500	10
1019500	13
1019500	22
1019500	24
1001766	2
1001766	4
1001766	6
1001766	8
1001766	9
1001766	10
1001766	11
1001766	24
1020024	2
1020024	6
1020024	9
1020024	11
1020024	24
1020024	27
1021277	1
1021277	2
1021277	3
1021277	5
1021277	6
1021277	7
1021277	8
1021277	9
1021277	10
1021277	11
1021277	13
1021277	15
1021277	16
1021277	17
1021277	18
1021277	20
1021277	22
1021277	24
1021277	25
1021277	26
1021277	27
1021277	30
1003610	1
1003610	2
1003610	3
1003610	5
1003610	6
1003610	7
1003610	8
1003610	9
1003610	10
1003610	11
1003610	13
1003610	15
1003610	16
1003610	17
1003610	18
1003610	19
1003610	20
1003610	24
1003610	25
1003610	27
1003610	30
1019410	1
1019410	2
1019410	3
1019410	4
1019410	5
1019410	6
1019410	8
1019410	9
1019410	10
1019410	11
1019410	15
1019410	16
1019410	18
1019410	19
1019410	20
1019410	21
1019410	22
1019410	24
1019410	26
1019410	27
1019410	30
1019411	1
1019411	2
1019411	3
1019411	4
1019411	5
1019411	6
1019411	8
1019411	9
1019411	10
1019411	11
1019411	15
1019411	16
1019411	18
1019411	19
1019411	20
1019411	22
1019411	24
1019411	26
1019411	27
1019411	30
1004750	2
1004750	3
1004750	4
1004750	5
1004750	6
1004750	8
1004750	9
1004750	10
1004750	15
1004750	16
1004750	18
1004750	19
1004750	20
1004750	22
1004750	24
1004751	1
1004751	2
1004751	3
1004751	5
1004751	6
1004751	8
1004751	9
1004751	10
1004751	11
1004751	15
1004751	16
1004751	18
1004751	20
1004751	24
1000712	2
1000712	3
1000712	4
1000712	5
1000712	6
1000712	7
1000712	8
1000712	9
1000712	10
1000712	11
1000712	12
1000712	13
1000712	15
1000712	16
1000712	17
1000712	18
1000712	19
1000712	20
1000712	22
1000712	23
1000712	24
1000712	25
1000712	26
1000712	27
1000712	28
1000712	29
1019235	2
1019235	4
1019235	9
1019235	24
1021615	2
1021615	4
1021615	5
1021615	6
1021615	9
1021615	13
1021615	19
1021615	22
1021615	24
1009020	2
1009020	4
1009020	5
1009020	6
1009020	8
1009020	9
1009020	10
1009020	11
1009020	13
1009020	16
1009020	18
1009020	19
1009020	22
1009020	24
1019493	2
1019493	3
1019493	5
1019493	6
1019493	7
1019493	9
1019493	10
1019493	11
1019493	13
1019493	15
1019493	16
1019493	18
1019493	24
1019493	26
1002843	2
1002843	4
1002843	5
1002843	6
1002843	8
1002843	9
1002843	10
1002843	11
1002843	16
1002843	18
1002843	19
1002843	24
1002843	25
1018549	2
1018549	3
1018549	4
1018549	5
1018549	6
1018549	8
1018549	9
1018549	10
1018549	11
1018549	12
1018549	13
1018549	16
1018549	17
1018549	18
1018549	19
1018549	22
1018549	24
1018549	28
1021272	2
1021272	3
1021272	4
1021272	5
1021272	6
1021272	9
1021272	10
1021272	11
1021272	12
1021272	13
1021272	17
1021272	19
1021272	22
1021272	23
1021272	27
1021272	28
1021272	30
1019930	2
1019930	3
1019930	4
1019930	5
1019930	6
1019930	9
1019930	10
1019930	11
1019930	12
1019930	13
1019930	16
1019930	17
1019930	18
1019930	19
1019930	22
1019930	24
1019930	25
1019930	27
1019930	28
1019930	30
1019142	9
1019142	24
1019145	6
1019145	9
1019145	24
1005060	1
1005060	2
1005060	3
1005060	4
1005060	5
1005060	6
1005060	8
1005060	9
1005060	10
1005060	11
1005060	12
1005060	13
1005060	16
1005060	17
1005060	18
1005060	19
1005060	24
1021312	2
1021312	3
1021312	4
1021312	5
1021312	6
1021312	7
1021312	8
1021312	9
1021312	10
1021312	11
1021312	13
1021312	16
1021312	17
1021312	18
1021312	19
1021312	20
1021312	21
1021312	22
1021312	24
1021312	25
1021312	27
1021312	28
1021312	30
1021302	1
1021302	2
1021302	5
1021302	6
1021302	9
1021302	10
1021302	11
1021302	17
1021302	18
1021302	21
1021302	24
1019419	2
1019419	4
1019419	5
1019419	6
1019419	7
1019419	8
1019419	9
1019419	10
1019419	11
1019419	13
1019419	15
1019419	16
1019419	17
1019419	18
1019419	19
1019419	20
1019419	21
1019419	22
1019419	24
1019419	26
1019419	27
1019419	28
1019419	30
1019312	2
1019312	4
1019312	6
1019312	9
1019312	10
1019312	11
1019312	24
1004073	1
1004073	2
1004073	3
1004073	4
1004073	5
1004073	6
1004073	7
1004073	8
1004073	9
1004073	10
1004073	13
1004073	16
1004073	17
1004073	18
1004073	19
1004073	21
1004073	24
1004073	26
1004073	27
1004073	28
1004073	30
1019418	2
1019418	3
1019418	4
1019418	5
1019418	6
1019418	7
1019418	8
1019418	9
1019418	10
1019418	11
1019418	13
1019418	15
1019418	16
1019418	17
1019418	18
1019418	19
1019418	21
1019418	22
1019418	24
1019418	27
1019418	28
1019418	30
1018284	2
1018284	3
1018284	4
1018284	5
1018284	6
1018284	8
1018284	9
1018284	10
1018284	11
1018284	12
1018284	13
1018284	15
1018284	16
1018284	17
1018284	18
1018284	19
1018284	20
1018284	21
1018284	22
1018284	24
1018284	25
1018284	26
1018284	28
1018284	29
1021409	2
1021409	3
1021409	5
1021409	9
1021409	11
1021409	16
1021409	19
1021409	24
1000194	2
1000194	5
1000194	6
1000194	7
1000194	8
1000194	9
1000194	10
1000194	11
1000194	12
1000194	13
1000194	16
1000194	17
1000194	18
1000194	19
1000194	20
1000194	22
1000194	24
1019259	2
1019259	3
1019259	4
1019259	5
1019259	6
1019259	7
1019259	8
1019259	9
1019259	10
1019259	11
1019259	13
1019259	16
1019259	17
1019259	18
1019259	19
1019259	22
1019259	24
1019259	26
1019259	27
1019259	30
1019927	2
1019927	3
1019927	6
1019927	7
1019927	8
1019927	9
1019927	10
1019927	11
1019927	12
1019927	13
1019927	15
1019927	16
1019927	17
1019927	24
1019635	2
1019635	4
1019635	5
1019635	6
1019635	8
1019635	9
1019635	10
1019635	11
1019635	13
1019635	16
1019635	18
1019635	19
1019635	20
1019635	24
1019635	26
1019635	27
1019070	2
1019070	4
1019070	5
1019070	9
1019070	13
1019070	16
1019070	18
1019070	19
1019070	22
1019899	2
1019899	4
1019899	6
1019899	9
1019899	11
1019899	24
1020173	2
1020173	4
1020173	5
1020173	6
1020173	8
1020173	9
1020173	10
1020173	11
1020173	15
1020173	16
1020173	18
1020173	19
1020173	22
1020173	24
1020173	25
1020173	28
1020173	30
1019033	1
1019033	2
1019033	3
1019033	4
1019033	5
1019033	6
1019033	8
1019033	9
1019033	10
1019033	11
1019033	13
1019033	15
1019033	16
1019033	17
1019033	19
1019033	20
1019033	22
1019033	24
1019033	26
1019033	27
1019033	28
1012576	2
1012576	3
1012576	5
1012576	6
1012576	8
1012576	9
1012576	10
1012576	11
1012576	13
1012576	16
1012576	17
1012576	18
1012576	19
1012576	21
1012576	22
1012576	24
1012576	26
1012576	27
1012576	28
1021623	1
1021623	2
1021623	5
1021623	6
1021623	9
1021623	10
1021623	13
1021623	15
1021623	17
1021623	18
1021623	19
1021623	21
1021623	22
1021623	24
1021623	26
1021606	1
1021606	2
1021606	3
1021606	4
1021606	6
1021606	9
1021606	10
1021606	11
1021606	13
1021606	16
1021606	17
1021606	18
1021606	19
1021606	24
1021606	26
1019048	2
1019048	4
1019048	5
1019048	6
1019048	8
1019048	9
1019048	10
1019048	11
1019048	17
1019048	22
1019048	24
1011286	2
1011286	4
1011286	5
1011286	6
1011286	8
1011286	9
1011286	10
1011286	11
1011286	13
1011286	16
1011286	17
1011286	18
1011286	19
1011286	20
1019747	2
1019747	4
1019747	5
1019747	6
1019747	8
1019747	9
1019747	10
1019747	11
1019747	13
1019747	16
1019747	17
1019747	18
1019747	19
1019747	20
1019747	22
1019747	24
1019747	26
1019747	27
1019747	28
1003969	1
1003969	3
1003969	4
1003969	5
1003969	6
1003969	7
1003969	8
1003969	9
1003969	10
1003969	11
1003969	13
1003969	15
1003969	16
1003969	17
1003969	18
1003969	19
1003969	20
1003969	22
1003969	24
1003969	25
1003969	26
1003969	27
1003969	28
1003969	29
1003969	30
1003970	1
1003970	2
1003970	3
1003970	4
1003970	5
1003970	6
1003970	7
1003970	8
1003970	9
1003970	10
1003970	11
1003970	13
1003970	15
1003970	16
1003970	17
1003970	18
1003970	19
1003970	20
1003970	21
1003970	22
1003970	24
1003970	25
1003970	26
1003970	27
1003970	28
1003970	29
1003970	30
1003971	1
1003971	2
1003971	3
1003971	4
1003971	5
1003971	6
1003971	7
1003971	8
1003971	9
1003971	10
1003971	11
1003971	15
1003971	16
1003971	17
1003971	19
1003971	20
1003971	21
1003971	24
1003971	26
1003971	30
1018637	1
1018637	2
1018637	3
1018637	4
1018637	5
1018637	6
1018637	8
1018637	9
1018637	11
1018637	15
1018637	18
1018637	19
1018637	21
1018637	22
1018637	24
1018637	26
1011778	2
1011778	4
1011778	5
1011778	7
1011778	8
1011778	9
1011778	10
1011778	11
1011778	13
1011778	15
1011778	16
1011778	18
1011778	19
1011778	22
1011778	24
1011778	27
1011778	28
1019479	2
1019479	3
1019479	4
1019479	5
1019479	6
1019479	8
1019479	9
1019479	10
1019479	11
1019479	16
1019479	18
1019479	24
1019479	26
1018349	1
1018349	5
1018349	9
1018349	10
1018349	12
1018349	24
1018349	26
1019973	8
1019973	9
1019973	22
1019973	24
1010821	2
1010821	3
1010821	4
1010821	5
1010821	6
1010821	8
1010821	9
1010821	10
1010821	11
1010821	13
1010821	15
1010821	16
1010821	17
1010821	18
1010821	19
1010821	20
1010821	21
1010821	22
1010821	24
1010821	26
1010821	28
1010821	30
1019194	4
1019194	13
1019194	17
1019194	18
1019194	19
1019194	21
1019194	27
1019791	2
1019791	3
1019791	4
1019791	6
1019791	8
1019791	9
1019791	10
1019791	11
1019791	12
1019791	13
1019791	16
1019791	17
1019791	18
1019791	19
1019791	22
1019791	24
1019791	26
1019791	28
1021535	1
1021535	2
1021535	4
1021535	5
1021535	6
1021535	8
1021535	9
1021535	10
1021535	11
1021535	12
1021535	13
1021535	15
1021535	16
1021535	17
1021535	18
1021535	19
1021535	20
1021535	21
1021535	22
1021535	24
1021535	26
1021535	27
1021535	28
1021535	29
1021218	2
1021218	4
1021218	6
1021218	8
1021218	9
1021218	10
1021218	11
1021218	19
1021218	24
1021218	26
1021218	27
1005261	8
1005261	9
1005261	23
1005261	24
1019119	2
1019119	4
1019119	5
1019119	6
1019119	8
1019119	9
1019119	10
1019119	11
1019119	13
1019119	15
1019119	18
1019119	22
1019119	24
1019119	28
1021451	1
1021451	2
1021451	4
1021451	6
1021451	7
1021451	8
1021451	9
1021451	10
1021451	11
1021451	15
1021451	16
1021451	18
1021451	19
1021451	20
1021451	22
1021451	24
1021451	26
1021451	27
1021451	28
1003915	2
1003915	3
1003915	4
1003915	5
1003915	6
1003915	8
1003915	9
1003915	10
1003915	11
1003915	12
1003915	13
1003915	16
1003915	17
1003915	19
1003915	22
1003915	24
1003915	27
1019620	1
1019620	2
1019620	3
1019620	4
1019620	5
1019620	6
1019620	8
1019620	9
1019620	10
1019620	11
1019620	13
1019620	15
1019620	16
1019620	17
1019620	18
1019620	19
1019620	20
1019620	22
1019620	24
1019620	28
1019620	29
1021646	1
1021646	2
1021646	4
1021646	9
1021646	13
1021646	24
1021503	2
1021503	4
1021503	5
1021503	6
1021503	8
1021503	9
1021503	10
1021503	11
1021503	13
1021503	16
1021503	18
1021503	19
1021503	24
1021503	28
1018975	2
1018975	4
1018975	5
1018975	6
1018975	8
1018975	9
1018975	10
1018975	11
1018975	13
1018975	16
1018975	18
1018975	19
1018975	20
1018975	22
1018975	23
1018975	24
1018975	26
1018975	30
1019715	2
1019715	3
1019715	4
1019715	5
1019715	6
1019715	8
1019715	9
1019715	11
1019715	13
1019715	16
1019715	17
1019715	18
1019715	19
1019715	24
1019715	27
1019825	2
1019825	3
1019825	4
1019825	5
1019825	6
1019825	8
1019825	9
1019825	10
1019825	11
1019825	13
1019825	17
1019825	19
1019825	22
1019825	24
1019825	26
1019825	28
1019734	2
1019734	3
1019734	4
1019734	9
1019734	10
1019734	12
1019734	16
1019734	24
1002062	2
1002062	4
1002062	5
1002062	6
1002062	8
1002062	9
1002062	10
1002062	11
1002062	12
1002062	13
1002062	16
1002062	17
1002062	18
1002062	19
1002062	24
1005214	2
1005214	5
1005214	6
1005214	9
1005214	10
1005214	11
1005214	12
1005214	13
1005214	16
1005214	17
1005214	18
1005214	19
1005214	24
1021613	1
1021613	2
1021613	5
1021613	6
1021613	7
1021613	9
1021613	10
1021613	11
1021613	12
1021613	17
1021613	18
1021613	19
1021613	21
1021613	22
1021613	24
1019211	2
1019211	3
1019211	4
1019211	6
1019211	7
1019211	8
1019211	9
1019211	10
1019211	11
1019211	12
1019211	13
1019211	15
1019211	17
1019211	18
1019211	19
1019211	22
1019211	24
1019211	28
1021546	1
1021546	2
1021546	3
1021546	4
1021546	5
1021546	6
1021546	9
1021546	10
1021546	11
1021546	15
1021546	16
1021546	18
1021546	19
1021546	20
1021546	22
1021546	23
1021546	24
1021546	26
1021546	27
1004988	2
1004988	3
1004988	4
1004988	5
1004988	6
1004988	8
1004988	9
1004988	10
1004988	11
1004988	12
1004988	13
1004988	16
1004988	17
1004988	18
1004988	19
1004988	20
1004988	22
1004988	24
1004990	2
1004990	3
1004990	6
1004990	7
1004990	8
1004990	9
1004990	10
1004990	12
1004990	13
1004990	17
1004990	18
1004990	19
1004990	22
1021724	2
1021724	4
1021724	5
1021724	6
1021724	9
1021724	10
1021724	11
1021724	12
1021724	13
1021724	16
1021724	17
1021724	18
1021724	19
1021724	22
1021724	24
1021724	28
1002485	1
1002485	2
1002485	4
1002485	5
1002485	6
1002485	9
1002485	10
1002485	11
1002485	15
1002485	16
1002485	18
1002485	19
1002485	22
1002485	24
1002485	27
1019428	1
1019428	2
1019428	4
1019428	5
1019428	6
1019428	8
1019428	9
1019428	10
1019428	11
1019428	12
1019428	17
1019428	22
1019428	24
1005262	2
1005262	5
1005262	8
1005262	9
1005262	15
1005262	16
1005262	24
1005262	27
1021468	4
1021468	6
1021468	8
1021468	9
1021468	10
1021468	24
1009080	1
1009080	2
1009080	3
1009080	5
1009080	6
1009080	8
1009080	9
1009080	10
1009080	15
1009080	18
1009080	22
1009080	24
1009080	26
1009080	27
1018449	2
1018449	3
1018449	4
1018449	5
1018449	6
1018449	8
1018449	9
1018449	11
1018449	12
1018449	13
1018449	19
1018449	21
1018449	24
1018449	26
1018449	27
1019913	8
1019913	9
1019913	24
1020185	1
1020185	2
1020185	3
1020185	4
1020185	5
1020185	6
1020185	7
1020185	8
1020185	9
1020185	10
1020185	11
1020185	13
1020185	15
1020185	17
1020185	18
1020185	19
1020185	20
1020185	21
1020185	22
1020185	23
1020185	24
1020185	26
1020185	27
1020185	29
1020185	30
1021645	1
1021645	2
1021645	3
1021645	4
1021645	5
1021645	6
1021645	7
1021645	8
1021645	9
1021645	10
1021645	11
1021645	13
1021645	15
1021645	16
1021645	17
1021645	18
1021645	19
1021645	20
1021645	21
1021645	22
1021645	23
1021645	24
1021645	26
1021645	27
1021645	28
1021645	30
1018625	1
1018625	2
1018625	3
1018625	4
1018625	5
1018625	6
1018625	7
1018625	8
1018625	9
1018625	10
1018625	11
1018625	13
1018625	15
1018625	16
1018625	17
1018625	18
1018625	19
1018625	20
1018625	22
1018625	23
1018625	24
1018625	25
1018625	26
1018625	27
1018625	28
1018625	29
1018315	1
1018315	2
1018315	3
1018315	4
1018315	5
1018315	6
1018315	8
1018315	9
1018315	10
1018315	11
1018315	13
1018315	16
1018315	18
1018315	19
1018315	21
1018315	22
1018315	24
1018315	26
1018315	27
1018315	30
1011160	2
1011160	3
1011160	4
1011160	6
1011160	9
1011160	10
1011160	11
1011160	15
1011160	16
1011160	17
1011160	18
1011160	19
1011160	20
1011160	22
1011160	24
1011160	28
1011160	30
1007261	1
1007261	2
1007261	3
1007261	5
1007261	6
1007261	7
1007261	8
1007261	9
1007261	10
1007261	11
1007261	12
1007261	13
1007261	15
1007261	16
1007261	17
1007261	18
1007261	19
1007261	20
1007261	22
1007261	24
1007261	25
1007261	26
1007261	27
1007261	28
1007261	30
1008303	2
1008303	4
1008303	6
1008303	8
1008303	9
1008303	10
1008303	11
1008303	12
1008303	19
1008303	24
1012203	2
1012203	3
1012203	4
1012203	5
1012203	6
1012203	9
1012203	10
1012203	11
1012203	12
1012203	13
1012203	15
1012203	16
1012203	18
1012203	19
1012203	21
1012203	22
1012203	24
1012203	26
1012203	27
1021577	1
1021577	2
1021577	3
1021577	4
1021577	5
1021577	6
1021577	8
1021577	9
1021577	10
1021577	11
1021577	12
1021577	13
1021577	15
1021577	16
1021577	18
1021577	19
1021577	20
1021577	21
1021577	22
1021577	24
1021577	26
1021577	27
1007250	2
1007250	3
1007250	5
1007250	6
1007250	8
1007250	9
1007250	10
1007250	11
1007250	12
1007250	13
1007250	16
1007250	17
1007250	18
1007250	19
1007250	20
1007250	21
1007250	22
1007250	24
1007250	26
1007250	29
1021558	2
1021558	4
1021558	6
1021558	7
1021558	8
1021558	9
1021558	13
1021558	17
1021558	19
1021558	27
1021707	2
1021707	4
1021707	5
1021707	6
1021707	7
1021707	8
1021707	9
1021707	10
1021707	11
1021707	13
1021707	16
1021707	17
1021707	18
1021707	19
1021707	22
1021707	24
1021707	28
1012037	1
1012037	2
1012037	3
1012037	5
1012037	6
1012037	7
1012037	8
1012037	9
1012037	10
1012037	11
1012037	12
1012037	13
1012037	15
1012037	17
1012037	18
1012037	22
1012037	24
1012037	25
1012037	26
1012037	27
1019627	2
1019627	4
1019627	5
1019627	6
1019627	8
1019627	9
1019627	10
1019627	11
1019627	12
1019627	13
1019627	16
1019627	17
1019627	19
1019627	22
1019627	24
1020088	1
1020088	2
1020088	3
1020088	4
1020088	5
1020088	8
1020088	9
1020088	10
1020088	11
1020088	13
1020088	16
1020088	17
1020088	19
1020088	24
1019515	2
1019515	3
1019515	5
1019515	6
1019515	8
1019515	9
1019515	10
1019515	11
1019515	13
1019515	17
1019515	18
1019515	19
1019515	24
1019445	2
1019445	4
1019445	8
1019445	9
1019445	10
1019445	11
1019445	19
1019445	24
1019445	27
1018167	1
1018167	2
1018167	3
1018167	6
1018167	9
1018167	10
1018167	11
1018167	12
1018167	13
1018167	17
1018167	18
1018167	19
1018167	21
1018167	22
1018167	23
1018167	24
1018167	26
1018167	27
1018172	1
1018172	2
1018172	3
1018172	6
1018172	9
1018172	10
1018172	11
1018172	12
1018172	13
1018172	17
1018172	18
1018172	19
1018172	21
1018172	22
1018172	23
1018172	24
1018172	26
1018172	27
1019237	2
1019237	4
1019237	6
1019237	8
1019237	9
1019237	10
1019237	11
1019237	13
1019237	17
1019237	18
1019237	19
1019237	22
1019237	24
1021693	2
1021693	4
1021693	5
1021693	6
1021693	8
1021693	9
1021693	10
1021693	11
1021693	15
1021693	16
1021693	19
1021693	24
1021693	27
1021693	28
1021693	30
1021664	2
1021664	3
1021664	4
1021664	5
1021664	6
1021664	8
1021664	9
1021664	10
1021664	11
1021664	18
1021664	19
1021664	21
1021664	22
1021664	24
1021664	28
1021233	1
1021233	2
1021233	4
1021233	5
1021233	6
1021233	8
1021233	9
1021233	10
1021233	11
1021233	13
1021233	15
1021233	16
1021233	17
1021233	18
1021233	19
1021233	20
1021233	22
1021233	24
1021233	26
1021233	27
1018773	2
1018773	4
1018773	5
1018773	6
1018773	8
1018773	9
1018773	10
1018773	11
1018773	13
1018773	16
1018773	17
1018773	18
1018773	19
1018773	22
1018773	23
1018773	24
1018773	25
1018773	26
1018773	27
1018773	28
1018773	30
1019610	5
1019610	6
1019610	8
1019610	9
1019610	10
1019610	11
1019610	13
1019610	17
1019610	24
1019610	27
1019442	2
1019442	3
1019442	4
1019442	5
1019442	6
1019442	9
1019442	10
1019442	11
1019442	12
1019442	13
1019442	16
1019442	17
1019442	18
1019442	19
1019442	22
1019442	24
1019442	28
1019395	2
1019395	4
1019395	5
1019395	6
1019395	8
1019395	9
1019395	10
1019395	11
1019395	13
1019395	16
1019395	19
1019395	24
1021700	2
1021700	4
1021700	5
1021700	6
1021700	8
1021700	9
1021700	10
1021700	11
1021700	12
1021700	13
1021700	16
1021700	18
1021700	19
1021700	24
1010838	2
1010838	4
1010838	5
1010838	6
1010838	8
1010838	9
1010838	10
1010838	11
1010838	15
1010838	16
1010838	18
1010838	19
1010838	20
1010838	24
1010838	28
1019455	2
1019455	3
1019455	4
1019455	5
1019455	6
1019455	7
1019455	8
1019455	9
1019455	10
1019455	11
1019455	12
1019455	13
1019455	16
1019455	18
1019455	19
1019455	24
1019455	26
1019455	27
1021429	2
1021429	4
1021429	5
1021429	9
1021429	10
1021429	11
1021429	16
1021429	19
1021429	24
1001280	2
1001280	6
1001280	8
1001280	9
1001280	10
1001280	11
1001280	20
1001280	24
1019976	2
1019976	4
1019976	6
1019976	9
1019976	10
1019976	11
1019976	13
1019976	16
1019976	18
1019976	19
1019976	22
1019976	24
1019976	26
1020103	1
1020103	2
1020103	4
1020103	5
1020103	6
1020103	9
1020103	10
1020103	11
1020103	13
1020103	16
1020103	24
1018988	2
1018988	3
1018988	4
1018988	5
1018988	6
1018988	8
1018988	9
1018988	10
1018988	11
1018988	12
1018988	13
1018988	16
1018988	17
1018988	18
1018988	19
1018988	22
1018988	24
1018988	26
1018988	27
1019319	1
1019319	2
1019319	3
1019319	4
1019319	5
1019319	6
1019319	8
1019319	9
1019319	10
1019319	11
1019319	13
1019319	15
1019319	17
1019319	18
1019319	19
1019319	21
1019319	22
1019319	23
1019319	24
1019319	25
1019319	26
1019319	27
1012179	1
1012179	2
1012179	3
1012179	5
1012179	6
1012179	7
1012179	8
1012179	9
1012179	10
1012179	11
1012179	12
1012179	13
1012179	16
1012179	17
1012179	18
1012179	19
1012179	22
1012179	24
1012179	25
1012179	26
1012179	27
1012179	30
1020004	2
1020004	3
1020004	4
1020004	5
1020004	6
1020004	7
1020004	8
1020004	9
1020004	10
1020004	11
1020004	12
1020004	13
1020004	15
1020004	16
1020004	17
1020004	18
1020004	19
1020004	20
1020004	22
1020004	23
1020004	24
1020004	25
1020004	26
1020004	27
1020004	28
1020004	29
1020004	30
1021397	2
1021397	4
1021397	5
1021397	6
1021397	9
1021397	11
1021397	13
1021397	16
1021397	17
1021397	19
1021397	22
1018771	2
1018771	3
1018771	4
1018771	5
1018771	6
1018771	8
1018771	9
1018771	10
1018771	11
1018771	13
1018771	15
1018771	16
1018771	18
1018771	19
1018771	20
1018771	24
1018771	26
1021219	2
1021219	6
1021219	8
1021219	9
1021219	10
1021219	11
1021219	13
1021219	15
1021219	24
1011044	1
1011044	2
1011044	3
1011044	4
1011044	5
1011044	6
1011044	7
1011044	8
1011044	9
1011044	10
1011044	11
1011044	12
1011044	15
1011044	16
1011044	18
1011044	19
1011044	22
1011044	24
1011044	26
1011044	29
1011044	30
1016822	2
1016822	3
1016822	4
1016822	5
1016822	6
1016822	9
1016822	18
1016822	19
1016822	21
1016822	22
1016822	24
1016822	26
1018601	1
1018601	2
1018601	3
1018601	5
1018601	6
1018601	8
1018601	9
1018601	10
1018601	11
1018601	16
1018601	17
1018601	18
1018601	19
1018601	21
1018601	24
1018601	27
1018601	30
1011811	1
1011811	2
1011811	3
1011811	4
1011811	5
1011811	6
1011811	8
1011811	9
1011811	10
1011811	11
1011811	15
1011811	18
1011811	19
1011811	22
1011811	24
1010560	1
1010560	2
1010560	3
1010560	4
1010560	5
1010560	6
1010560	8
1010560	9
1010560	10
1010560	11
1010560	13
1010560	16
1010560	17
1010560	18
1010560	19
1010560	21
1010560	22
1010560	24
1010560	26
1010560	27
1010560	28
1003169	5
1003169	8
1003169	9
1003169	24
1018814	5
1018814	6
1018814	8
1018814	9
1018814	10
1018814	11
1018814	15
1018814	19
1018814	23
1018814	24
1019869	2
1019869	4
1019869	5
1019869	6
1019869	8
1019869	9
1019869	10
1019869	11
1019869	13
1019869	16
1019869	17
1019869	18
1019869	19
1019869	21
1019869	22
1019869	24
1019869	26
1019869	27
1019869	28
1019869	30
1020163	2
1020163	5
1020163	6
1020163	8
1020163	9
1020163	10
1020163	11
1020163	13
1020163	17
1020163	18
1020163	19
1020163	24
1020163	26
1010014	1
1010014	2
1010014	5
1010014	6
1010014	9
1010014	10
1010014	11
1010014	13
1010014	16
1010014	19
1010014	20
1010014	24
1021675	1
1021675	2
1021675	3
1021675	4
1021675	6
1021675	7
1021675	8
1021675	9
1021675	10
1021675	11
1021675	12
1021675	13
1021675	15
1021675	18
1021675	19
1021675	21
1021675	22
1021675	23
1021675	24
1021675	25
1021675	26
1021675	27
1021675	30
1020022	1
1020022	2
1020022	3
1020022	5
1020022	6
1020022	9
1020022	10
1020022	11
1020022	13
1020022	15
1020022	16
1020022	17
1020022	18
1020022	19
1020022	20
1020022	24
1020022	26
1020022	28
1019926	2
1019926	3
1019926	5
1019926	8
1019926	9
1019926	10
1019926	11
1019926	16
1019926	18
1019926	19
1019926	24
1020159	1
1020159	2
1020159	3
1020159	4
1020159	5
1020159	6
1020159	7
1020159	8
1020159	9
1020159	10
1020159	11
1020159	12
1020159	13
1020159	16
1020159	17
1020159	18
1020159	19
1020159	20
1020159	21
1020159	22
1020159	24
1020159	25
1003836	1
1003836	2
1003836	3
1003836	4
1003836	5
1003836	6
1003836	7
1003836	8
1003836	9
1003836	10
1003836	11
1003836	13
1003836	15
1003836	16
1003836	17
1003836	18
1003836	19
1003836	22
1003836	24
1003836	26
1003836	27
1003836	28
1003836	30
1019829	1
1019829	2
1019829	4
1019829	5
1019829	6
1019829	8
1019829	9
1019829	10
1019829	11
1019829	17
1019829	18
1019829	19
1019829	22
1019829	27
1019829	30
1019671	2
1019671	5
1019671	6
1019671	8
1019671	9
1019671	11
1019671	12
1019671	13
1019671	16
1019671	17
1019671	19
1019671	21
1019671	22
1019671	24
1019671	28
1020039	9
1020039	24
1020040	9
1020040	24
1011934	1
1011934	8
1011934	9
1011934	24
1011935	8
1011935	9
1011935	24
1019803	9
1019803	11
1019803	18
1019803	19
1019803	22
1019803	24
1020067	1
1020067	2
1020067	5
1020067	6
1020067	7
1020067	8
1020067	9
1020067	10
1020067	11
1020067	13
1020067	15
1020067	17
1020067	18
1020067	23
1020067	24
1020067	25
1020067	26
1020067	27
1021697	1
1021697	2
1021697	3
1021697	4
1021697	5
1021697	7
1021697	9
1021697	10
1021697	11
1021697	15
1021697	16
1021697	18
1021697	19
1021697	22
1021697	24
1021697	27
1021697	28
1021697	30
1019385	1
1019385	2
1019385	3
1019385	4
1019385	5
1019385	8
1019385	9
1019385	10
1019385	13
1019385	15
1019385	16
1019385	17
1019385	19
1019385	22
1019385	24
1019385	26
1019385	27
1019385	30
1018138	2
1018138	4
1018138	8
1018138	9
1018138	10
1018138	11
1018138	12
1018138	15
1018138	18
1018138	19
1018138	23
1018138	24
1018138	25
1018138	26
1018138	30
1021214	1
1021214	2
1021214	3
1021214	4
1021214	5
1021214	6
1021214	7
1021214	8
1021214	9
1021214	10
1021214	11
1021214	13
1021214	17
1021214	18
1021214	19
1021214	22
1021214	24
1021214	25
1021214	27
1021214	28
1019599	2
1019599	6
1019599	8
1019599	9
1019599	10
1019599	11
1019599	13
1019599	17
1019599	18
1019599	19
1019599	22
1019599	24
1019599	26
1002526	1
1002526	2
1002526	3
1002526	4
1002526	5
1002526	6
1002526	8
1002526	9
1002526	10
1002526	11
1002526	13
1002526	16
1002526	17
1002526	18
1002526	19
1002526	20
1002526	23
1002526	24
1002526	25
1002526	27
1002526	28
1002526	30
1019915	8
1019915	9
1019915	24
1021573	1
1021573	2
1021573	4
1021573	5
1021573	7
1021573	8
1021573	9
1021573	10
1021573	11
1021573	13
1021573	15
1021573	18
1021573	19
1021573	21
1021573	22
1021573	24
1021573	26
1019511	2
1019511	3
1019511	4
1019511	5
1019511	6
1019511	8
1019511	9
1019511	10
1019511	11
1019511	13
1019511	16
1019511	17
1019511	18
1019511	19
1019511	22
1019511	24
1010997	1
1010997	2
1010997	4
1010997	5
1010997	6
1010997	7
1010997	8
1010997	9
1010997	10
1010997	11
1010997	13
1010997	15
1010997	18
1010997	19
1010997	22
1010997	24
1010997	25
1010997	26
1010997	27
1010445	1
1010445	2
1010445	3
1010445	4
1010445	5
1010445	6
1010445	8
1010445	9
1010445	10
1010445	11
1010445	13
1010445	16
1010445	17
1010445	18
1010445	19
1010445	20
1010445	22
1010445	24
1010445	26
1010445	28
1010445	30
1021553	1
1021553	2
1021553	3
1021553	5
1021553	6
1021553	7
1021553	8
1021553	9
1021553	10
1021553	12
1021553	17
1021553	18
1021553	19
1021553	24
1021553	26
1021553	27
1021553	30
1019091	1
1019091	2
1019091	3
1019091	5
1019091	6
1019091	9
1019091	10
1019091	11
1019091	12
1019091	13
1019091	16
1019091	17
1019091	18
1019091	19
1019091	22
1019091	24
1018098	2
1018098	4
1018098	5
1018098	6
1018098	8
1018098	9
1018098	10
1018098	11
1018098	15
1018098	16
1018098	18
1018098	19
1018098	24
1018098	26
1018098	27
1018098	28
1018098	30
1021563	1
1021563	2
1021563	5
1021563	6
1021563	7
1021563	8
1021563	9
1021563	10
1021563	11
1021563	13
1021563	15
1021563	18
1021563	21
1021563	24
1021563	27
1021563	30
1021589	1
1021589	2
1021589	3
1021589	4
1021589	5
1021589	6
1021589	8
1021589	9
1021589	10
1021589	11
1021589	12
1021589	13
1021589	16
1021589	18
1021589	19
1021589	22
1021589	24
1021589	28
1021589	29
1021589	30
1002063	2
1002063	4
1002063	5
1002063	6
1002063	8
1002063	9
1002063	10
1002063	11
1002063	12
1002063	16
1002063	19
1002063	24
1019979	2
1019979	4
1019979	5
1019979	8
1019979	9
1019979	10
1019979	11
1019979	16
1019979	18
1019979	19
1019979	24
1021326	1
1021326	2
1021326	3
1021326	4
1021326	5
1021326	6
1021326	7
1021326	8
1021326	9
1021326	10
1021326	11
1021326	13
1021326	15
1021326	16
1021326	19
1021326	21
1021326	22
1021326	24
1021326	27
1021326	30
1005560	2
1005560	3
1005560	4
1005560	5
1005560	6
1005560	8
1005560	9
1005560	10
1005560	11
1005560	12
1005560	15
1005560	16
1005560	18
1005560	19
1005560	23
1005560	24
1005560	25
1005560	26
1019305	2
1019305	4
1019305	5
1019305	9
1019305	10
1019305	11
1019305	18
1019305	24
1018952	9
1018952	24
1021568	2
1021568	3
1021568	4
1021568	5
1021568	6
1021568	8
1021568	9
1021568	10
1021568	11
1021568	13
1021568	15
1021568	17
1021568	18
1021568	19
1021568	22
1021568	24
1021568	27
1021568	28
1019173	1
1019173	2
1019173	3
1019173	4
1019173	5
1019173	6
1019173	8
1019173	9
1019173	10
1019173	11
1019173	12
1019173	13
1019173	16
1019173	17
1019173	18
1019173	19
1019173	22
1019173	24
1019173	26
1019173	27
1019173	30
1019784	2
1019784	6
1019784	8
1019784	9
1019784	11
1019784	13
1019784	16
1019784	18
1019784	24
1019784	28
1019452	2
1019452	3
1019452	5
1019452	6
1019452	7
1019452	8
1019452	9
1019452	10
1019452	11
1019452	13
1019452	16
1019452	17
1019452	18
1019452	19
1019452	20
1019452	22
1019452	24
1019452	26
1019452	27
1019452	28
1019452	30
1019782	2
1019782	3
1019782	5
1019782	6
1019782	7
1019782	8
1019782	9
1019782	10
1019782	11
1019782	13
1019782	16
1019782	17
1019782	18
1019782	19
1019782	20
1019782	22
1019782	24
1019782	27
1019782	28
1021394	2
1021394	4
1021394	5
1021394	6
1021394	9
1021394	10
1021394	11
1021394	16
1021394	18
1021394	19
1021394	24
1003588	2
1003588	4
1003588	5
1003588	8
1003588	9
1003588	10
1003588	11
1003588	19
1003588	24
1021670	2
1021670	3
1021670	4
1021670	5
1021670	6
1021670	9
1021670	10
1021670	11
1021670	12
1021670	16
1021670	19
1021670	22
1021670	24
1021670	26
1021670	28
1018312	1
1018312	2
1018312	3
1018312	4
1018312	5
1018312	6
1018312	7
1018312	8
1018312	9
1018312	10
1018312	11
1018312	13
1018312	15
1018312	17
1018312	18
1018312	21
1018312	22
1018312	23
1018312	24
1018312	25
1018312	27
1018312	29
1021466	2
1021466	3
1021466	4
1021466	5
1021466	6
1021466	8
1021466	9
1021466	10
1021466	11
1021466	12
1021466	13
1021466	16
1021466	17
1021466	18
1021466	19
1021466	22
1021466	23
1021466	24
1019628	2
1019628	4
1019628	5
1019628	6
1019628	9
1019628	10
1019628	11
1019628	16
1019628	19
1019628	22
1019628	24
1019628	30
1020176	1
1020176	2
1020176	3
1020176	4
1020176	5
1020176	6
1020176	8
1020176	9
1020176	10
1020176	11
1020176	12
1020176	13
1020176	15
1020176	16
1020176	17
1020176	18
1020176	19
1020176	20
1020176	21
1020176	22
1020176	23
1020176	24
1020176	28
1020176	30
1019675	1
1019675	2
1019675	3
1019675	5
1019675	6
1019675	7
1019675	8
1019675	9
1019675	10
1019675	11
1019675	13
1019675	16
1019675	17
1019675	18
1019675	21
1019675	22
1019675	23
1019675	24
1019675	27
1012278	1
1012278	2
1012278	3
1012278	4
1012278	5
1012278	6
1012278	7
1012278	8
1012278	9
1012278	10
1012278	11
1012278	13
1012278	15
1012278	16
1012278	17
1012278	18
1012278	19
1012278	20
1012278	22
1012278	24
1012278	26
1012278	27
1012278	28
1012278	30
1021483	1
1021483	4
1021483	6
1021483	7
1021483	8
1021483	9
1021483	10
1021483	11
1021483	12
1021483	19
1021483	22
1021483	24
1021483	26
1021483	27
1012766	2
1012766	3
1012766	4
1012766	5
1012766	6
1012766	8
1012766	9
1012766	10
1012766	11
1012766	12
1012766	13
1012766	16
1012766	17
1012766	18
1012766	19
1012766	20
1012766	24
1012766	27
1018211	2
1018211	3
1018211	5
1018211	6
1018211	7
1018211	8
1018211	9
1018211	10
1018211	11
1018211	13
1018211	15
1018211	18
1018211	24
1018211	27
1021526	2
1021526	3
1021526	4
1021526	5
1021526	6
1021526	8
1021526	9
1021526	10
1021526	12
1021526	13
1021526	16
1021526	17
1021526	18
1021526	19
1021526	20
1021526	22
1021526	24
1021526	27
1012100	2
1012100	4
1012100	5
1012100	8
1012100	9
1012100	10
1012100	11
1012100	12
1012100	13
1012100	16
1012100	18
1012100	19
1012100	22
1012100	24
1018918	1
1018918	2
1018918	3
1018918	4
1018918	5
1018918	6
1018918	7
1018918	8
1018918	9
1018918	10
1018918	11
1018918	12
1018918	13
1018918	16
1018918	17
1018918	18
1018918	19
1018918	21
1018918	22
1018918	24
1018918	26
1018918	27
1018918	30
1021333	2
1021333	3
1021333	4
1021333	5
1021333	6
1021333	8
1021333	9
1021333	10
1021333	11
1021333	16
1021333	19
1021333	24
1021333	30
1021334	2
1021334	3
1021334	4
1021334	5
1021334	6
1021334	9
1021334	10
1021334	11
1021334	16
1021334	19
1021334	24
1021334	30
1010057	1
1010057	2
1010057	3
1010057	4
1010057	5
1010057	6
1010057	8
1010057	9
1010057	10
1010057	11
1010057	13
1010057	16
1010057	17
1010057	19
1010057	20
1010057	22
1010057	24
1010057	25
1010057	26
1010057	27
1010057	28
1010057	30
1019526	2
1019526	4
1019526	6
1019526	8
1019526	9
1019526	10
1019526	11
1019526	12
1019526	13
1019526	16
1019526	18
1019526	19
1019526	20
1019526	22
1019526	24
1019526	28
1018451	1
1018451	2
1018451	3
1018451	4
1018451	5
1018451	6
1018451	8
1018451	9
1018451	10
1018451	11
1018451	12
1018451	13
1018451	16
1018451	17
1018451	18
1018451	19
1018451	21
1018451	22
1018451	24
1018451	26
1018451	27
1018451	30
1012116	2
1012116	3
1012116	4
1012116	5
1012116	6
1012116	7
1012116	8
1012116	9
1012116	10
1012116	11
1012116	13
1012116	16
1012116	17
1012116	18
1012116	19
1012116	20
1012116	22
1012116	24
1012116	27
1019545	1
1019545	2
1019545	4
1019545	5
1019545	9
1019545	10
1019545	11
1019545	19
1019545	22
1019545	23
1019545	24
1019036	1
1019036	2
1019036	3
1019036	4
1019036	6
1019036	7
1019036	9
1019036	10
1019036	11
1019036	13
1019036	16
1019036	17
1019036	18
1019036	19
1019036	20
1019036	23
1019036	24
1019036	26
1019112	2
1019112	3
1019112	4
1019112	5
1019112	6
1019112	8
1019112	9
1019112	10
1019112	11
1019112	13
1019112	15
1019112	17
1019112	18
1019112	19
1019112	21
1019112	22
1019112	23
1019112	24
1019112	25
1019112	26
1019112	28
1007271	1
1007271	2
1007271	3
1007271	4
1007271	5
1007271	6
1007271	8
1007271	9
1007271	10
1007271	11
1007271	13
1007271	15
1007271	16
1007271	17
1007271	18
1007271	19
1007271	20
1007271	21
1007271	22
1007271	24
1007271	25
1007271	26
1007271	27
1020186	1
1020186	2
1020186	3
1020186	4
1020186	5
1020186	6
1020186	7
1020186	8
1020186	9
1020186	10
1020186	11
1020186	13
1020186	15
1020186	17
1020186	18
1020186	19
1020186	20
1020186	21
1020186	22
1020186	23
1020186	24
1020186	26
1020186	27
1020186	29
1020186	30
1021432	2
1021432	5
1021432	6
1021432	9
1021432	10
1021432	11
1021432	19
1021432	20
1021432	23
1021432	24
1009707	2
1009707	3
1009707	4
1009707	5
1009707	6
1009707	7
1009707	8
1009707	9
1009707	10
1009707	11
1009707	12
1009707	13
1009707	15
1009707	17
1009707	18
1009707	19
1009707	20
1009707	22
1009707	23
1009707	24
1009707	26
1009707	28
1008173	2
1008173	3
1008173	4
1008173	6
1008173	7
1008173	8
1008173	9
1008173	10
1008173	11
1008173	13
1008173	17
1008173	18
1008173	19
1008173	24
1008173	26
1008173	27
1008173	28
1020149	2
1020149	4
1020149	5
1020149	6
1020149	8
1020149	9
1020149	10
1020149	11
1020149	13
1020149	19
1020149	20
1020149	24
1020149	28
1019481	1
1019481	2
1019481	3
1019481	4
1019481	5
1019481	10
1019481	11
1019481	12
1019481	16
1019481	18
1019481	19
1019481	28
1021643	1
1021643	2
1021643	3
1021643	4
1021643	5
1021643	6
1021643	8
1021643	9
1021643	10
1021643	11
1021643	13
1021643	15
1021643	17
1021643	18
1021643	19
1021643	22
1021643	24
1021643	25
1021643	26
1021643	27
1021643	28
1021643	29
1021644	1
1021644	2
1021644	3
1021644	4
1021644	5
1021644	6
1021644	8
1021644	9
1021644	10
1021644	11
1021644	13
1021644	15
1021644	17
1021644	18
1021644	19
1021644	22
1021644	24
1021644	25
1021644	26
1021644	27
1021644	28
1021644	29
1002765	1
1002765	2
1002765	3
1002765	4
1002765	5
1002765	6
1002765	8
1002765	9
1002765	10
1002765	11
1002765	12
1002765	13
1002765	15
1002765	16
1002765	17
1002765	18
1002765	19
1002765	20
1002765	22
1002765	24
1002765	27
1019981	2
1019981	5
1019981	6
1019981	8
1019981	9
1019981	10
1019981	11
1019981	13
1019981	16
1019981	17
1019981	18
1019981	19
1019981	20
1019981	22
1019981	24
1019981	26
1019981	27
1021313	2
1021313	3
1021313	4
1021313	5
1021313	6
1021313	8
1021313	9
1021313	10
1021313	11
1021313	12
1021313	13
1021313	16
1021313	17
1021313	18
1021313	19
1021313	20
1021313	21
1021313	22
1021313	24
1021313	27
1021313	28
1018923	1
1018923	2
1018923	3
1018923	4
1018923	5
1018923	6
1018923	8
1018923	9
1018923	10
1018923	11
1018923	12
1018923	16
1018923	18
1018923	19
1018923	20
1018923	22
1018923	24
1018923	25
1018923	26
1018923	27
1018923	29
1018923	30
1019015	1
1019015	2
1019015	3
1019015	4
1019015	5
1019015	7
1019015	8
1019015	9
1019015	10
1019015	11
1019015	13
1019015	15
1019015	17
1019015	18
1019015	19
1019015	21
1019015	22
1019015	24
1019015	26
1019015	27
1019015	30
1020036	1
1020036	2
1020036	4
1020036	6
1020036	7
1020036	8
1020036	9
1020036	10
1020036	15
1020036	16
1020036	17
1020036	18
1020036	19
1020036	24
1018476	2
1018476	3
1018476	5
1018476	6
1018476	7
1018476	8
1018476	9
1018476	10
1018476	11
1018476	13
1018476	15
1018476	16
1018476	18
1018476	19
1018476	22
1018476	23
1018476	24
1018476	25
1018476	26
1018476	27
1018476	30
1020073	2
1020073	4
1020073	5
1020073	6
1020073	9
1020073	10
1020073	11
1020073	13
1020073	16
1020073	18
1020073	19
1020073	24
1011738	1
1011738	2
1011738	3
1011738	4
1011738	5
1011738	6
1011738	7
1011738	8
1011738	9
1011738	10
1011738	11
1011738	13
1011738	16
1011738	17
1011738	18
1011738	19
1011738	20
1011738	22
1011738	24
1011738	25
1011738	26
1011738	27
1011738	28
1011738	29
1019138	2
1019138	3
1019138	4
1019138	5
1019138	6
1019138	9
1019138	10
1019138	11
1019138	12
1019138	17
1019138	18
1019138	19
1019138	21
1019138	24
1003982	1
1003982	2
1003982	4
1003982	5
1003982	6
1003982	7
1003982	8
1003982	9
1003982	10
1003982	11
1003982	13
1003982	16
1003982	17
1003982	18
1003982	19
1003982	22
1003982	24
1003982	26
1003982	27
1003982	29
1003982	30
1020147	1
1020147	2
1020147	3
1020147	4
1020147	5
1020147	6
1020147	7
1020147	8
1020147	9
1020147	10
1020147	11
1020147	12
1020147	13
1020147	15
1020147	16
1020147	17
1020147	18
1020147	19
1020147	20
1020147	21
1020147	22
1020147	23
1020147	24
1020147	25
1020147	26
1020147	27
1020147	28
1020147	29
1020147	30
1019075	2
1019075	6
1019075	9
1019075	10
1019075	11
1019075	13
1019075	17
1019075	22
1019075	24
1019075	27
1019075	30
1021694	2
1021694	4
1021694	5
1021694	8
1021694	9
1021694	10
1021694	11
1021694	13
1021694	16
1021694	17
1021694	18
1021694	19
1021694	20
1021694	24
1018994	2
1018994	3
1018994	4
1018994	5
1018994	6
1018994	9
1018994	10
1018994	12
1018994	13
1018994	17
1018994	18
1018994	19
1018994	21
1018994	22
1018994	24
1018994	26
1018994	27
1018994	28
1010998	1
1010998	2
1010998	3
1010998	4
1010998	5
1010998	6
1010998	8
1010998	9
1010998	10
1010998	11
1010998	12
1010998	13
1010998	15
1010998	16
1010998	17
1010998	18
1010998	19
1010998	20
1010998	22
1010998	23
1010998	24
1010998	25
1010998	26
1010998	27
1010998	28
1010998	30
1000710	1
1000710	2
1000710	3
1000710	4
1000710	5
1000710	6
1000710	7
1000710	8
1000710	9
1000710	10
1000710	11
1000710	13
1000710	15
1000710	16
1000710	17
1000710	18
1000710	19
1000710	20
1000710	21
1000710	22
1000710	23
1000710	24
1000710	25
1000710	26
1000710	27
1000710	28
1000710	29
1000710	30
1021616	1
1021616	2
1021616	3
1021616	4
1021616	5
1021616	6
1021616	7
1021616	8
1021616	9
1021616	10
1021616	11
1021616	13
1021616	15
1021616	16
1021616	17
1021616	18
1021616	19
1021616	20
1021616	21
1021616	22
1021616	24
1021616	26
1021616	27
1021616	28
1021616	29
1021616	30
1018279	1
1018279	2
1018279	3
1018279	4
1018279	5
1018279	6
1018279	7
1018279	8
1018279	9
1018279	10
1018279	11
1018279	12
1018279	13
1018279	15
1018279	16
1018279	17
1018279	18
1018279	19
1018279	20
1018279	21
1018279	22
1018279	23
1018279	24
1018279	25
1018279	26
1018279	28
1021235	2
1021235	3
1021235	4
1021235	5
1021235	6
1021235	8
1021235	9
1021235	10
1021235	11
1021235	13
1021235	16
1021235	17
1021235	19
1021235	20
1021235	21
1021235	22
1021235	24
1021235	26
1021235	27
1021235	28
1021235	30
1021204	2
1021204	4
1021204	5
1021204	6
1021204	8
1021204	9
1021204	11
1021204	16
1021204	22
1021204	24
1020049	2
1020049	3
1020049	4
1020049	6
1020049	7
1020049	8
1020049	9
1020049	10
1020049	11
1020049	13
1020049	16
1020049	18
1020049	19
1020049	22
1020049	24
1019047	2
1019047	4
1019047	5
1019047	6
1019047	7
1019047	8
1019047	9
1019047	10
1019047	11
1019047	12
1019047	16
1019047	18
1019047	20
1019047	22
1019047	24
1019933	1
1019933	2
1019933	3
1019933	4
1019933	5
1019933	6
1019933	7
1019933	8
1019933	9
1019933	10
1019933	11
1019933	16
1019933	18
1019933	19
1019933	21
1019933	22
1019933	24
1019933	27
1019933	30
1021203	2
1021203	4
1021203	6
1021203	9
1021203	10
1021203	11
1021203	15
1021203	18
1021203	22
1021203	24
1019596	4
1019596	8
1019596	9
1019596	18
1019596	19
1019596	24
1019596	26
1018959	1
1018959	2
1018959	4
1018959	5
1018959	6
1018959	8
1018959	9
1018959	10
1018959	11
1018959	13
1018959	15
1018959	16
1018959	17
1018959	18
1018959	19
1018959	24
1018959	25
1018959	26
1018959	27
1018959	28
1018959	30
1021254	1
1021254	2
1021254	3
1021254	4
1021254	5
1021254	6
1021254	8
1021254	9
1021254	10
1021254	11
1021254	12
1021254	13
1021254	16
1021254	17
1021254	19
1021254	20
1021254	22
1021254	23
1021254	24
1021254	25
1021254	26
1021254	27
1021254	28
1021254	29
1021254	30
1019181	1
1019181	2
1019181	3
1019181	5
1019181	6
1019181	9
1019181	10
1019181	11
1019181	13
1019181	18
1019181	19
1019181	22
1019181	24
1019303	1
1019303	2
1019303	3
1019303	4
1019303	5
1019303	6
1019303	8
1019303	9
1019303	11
1019303	13
1019303	18
1019303	19
1019303	24
1019303	25
1019303	27
1019544	2
1019544	3
1019544	4
1019544	5
1019544	6
1019544	8
1019544	9
1019544	10
1019544	11
1019544	13
1019544	16
1019544	17
1019544	18
1019544	19
1019544	20
1019544	22
1019544	24
1019544	26
1019544	27
1019544	28
1019775	2
1019775	3
1019775	4
1019775	6
1019775	8
1019775	9
1019775	10
1019775	11
1019775	17
1019775	19
1019775	21
1019775	22
1019775	24
1019775	26
1019775	27
1019775	28
1019931	2
1019931	4
1019931	5
1019931	6
1019931	8
1019931	9
1019931	11
1019931	22
1019931	24
1019948	1
1019948	2
1019948	3
1019948	6
1019948	9
1019948	10
1019948	11
1019948	12
1019948	13
1019948	15
1019948	22
1019948	24
1019948	27
1019948	28
1019948	30
1019166	2
1019166	3
1019166	4
1019166	5
1019166	6
1019166	8
1019166	9
1019166	10
1019166	11
1019166	13
1019166	16
1019166	17
1019166	18
1019166	19
1019166	21
1019166	22
1019166	24
1019166	26
1019166	27
1019626	2
1019626	3
1019626	5
1019626	6
1019626	7
1019626	8
1019626	9
1019626	11
1019626	12
1019626	13
1019626	17
1019626	22
1019626	24
1019751	2
1019751	3
1019751	4
1019751	5
1019751	6
1019751	8
1019751	9
1019751	10
1019751	11
1019751	12
1019751	13
1019751	17
1019751	18
1019751	19
1019751	22
1019751	24
1019751	27
1019751	28
1019751	30
1021304	2
1021304	5
1021304	6
1021304	8
1021304	9
1021304	10
1021304	18
1021304	24
1019697	1
1019697	9
1019697	18
1019697	24
1019697	26
1019700	1
1019700	9
1019700	24
1019700	26
1019699	1
1019699	9
1019699	24
1019699	26
1019698	1
1019698	9
1019698	24
1019698	26
1019696	9
1019696	24
1019696	26
1021276	1
1021276	2
1021276	5
1021276	6
1021276	7
1021276	8
1021276	9
1021276	10
1021276	11
1021276	13
1021276	15
1021276	16
1021276	17
1021276	18
1021276	19
1021276	21
1021276	22
1021276	24
1021276	25
1021276	26
1021276	27
1021276	28
1021276	30
1021619	2
1021619	4
1021619	5
1021619	6
1021619	8
1021619	9
1021619	10
1021619	11
1021619	13
1021619	16
1021619	17
1021619	19
1021619	22
1021619	24
1012357	2
1012357	4
1012357	9
1012357	10
1012357	11
1012357	15
1012357	18
1012357	19
1012357	22
1012357	24
1012357	25
1012357	26
1012357	29
1019001	2
1019001	4
1019001	6
1019001	9
1019001	10
1019001	11
1019001	12
1019001	13
1019001	24
1019001	30
1021659	2
1021659	3
1021659	5
1021659	6
1021659	8
1021659	9
1021659	10
1021659	11
1021659	12
1021659	15
1021659	17
1021659	18
1021659	19
1021659	22
1021659	24
1021659	26
1021659	28
1019504	2
1019504	3
1019504	4
1019504	5
1019504	6
1019504	8
1019504	9
1019504	10
1019504	11
1019504	15
1019504	16
1019504	18
1019504	19
1019504	21
1019504	24
1019504	25
1019966	2
1019966	4
1019966	6
1019966	8
1019966	9
1019966	10
1019966	11
1019966	13
1019966	15
1019966	17
1019966	18
1019966	19
1019966	22
1019966	24
1019966	25
1019966	26
1019966	28
1019966	30
1018422	1
1018422	2
1018422	4
1018422	5
1018422	8
1018422	9
1018422	10
1018422	11
1018422	12
1018422	13
1018422	16
1018422	18
1018422	19
1018422	21
1018422	23
1018422	24
1018422	26
1018422	27
1021702	1
1021702	2
1021702	3
1021702	4
1021702	5
1021702	6
1021702	8
1021702	9
1021702	10
1021702	11
1021702	16
1021702	17
1021702	18
1021702	22
1021702	24
1021702	26
1021702	28
1016917	2
1016917	5
1016917	7
1016917	9
1016917	11
1016917	18
1016917	19
1016917	22
1016917	30
1019928	2
1019928	4
1019928	5
1019928	6
1019928	7
1019928	9
1019928	10
1019928	11
1019928	13
1019928	17
1019928	22
1019928	24
1019928	27
1011497	2
1011497	3
1011497	4
1011497	5
1011497	6
1011497	7
1011497	8
1011497	9
1011497	10
1011497	11
1011497	12
1011497	13
1011497	15
1011497	16
1011497	17
1011497	18
1011497	19
1011497	21
1011497	22
1011497	23
1011497	24
1011497	25
1011497	26
1011497	27
1011497	28
1019517	2
1019517	3
1019517	5
1019517	6
1019517	7
1019517	8
1019517	9
1019517	10
1019517	11
1019517	12
1019517	18
1019517	19
1019517	21
1019517	24
1002101	2
1002101	3
1002101	4
1002101	5
1002101	6
1002101	8
1002101	9
1002101	11
1002101	12
1002101	13
1002101	16
1002101	18
1002101	24
1002101	26
1019739	2
1019739	3
1019739	4
1019739	9
1019739	10
1019739	11
1019739	13
1019739	15
1019739	19
1019739	24
1019826	2
1019826	3
1019826	4
1019826	5
1019826	6
1019826	7
1019826	8
1019826	9
1019826	10
1019826	11
1019826	12
1019826	13
1019826	15
1019826	16
1019826	17
1019826	18
1019826	19
1019826	20
1019826	21
1019826	22
1019826	23
1019826	24
1019826	25
1019826	26
1019826	27
1019826	28
1019826	30
1019975	2
1019975	3
1019975	4
1019975	5
1019975	6
1019975	8
1019975	9
1019975	10
1019975	11
1019975	13
1019975	16
1019975	17
1019975	19
1019975	22
1019975	23
1019975	24
1019975	27
1018628	1
1018628	2
1018628	3
1018628	4
1018628	5
1018628	6
1018628	7
1018628	8
1018628	9
1018628	10
1018628	11
1018628	13
1018628	15
1018628	16
1018628	17
1018628	18
1018628	19
1018628	20
1018628	22
1018628	23
1018628	24
1018628	25
1018628	26
1018628	27
1018628	28
1018628	29
1018624	1
1018624	2
1018624	8
1018624	9
1018624	13
1018624	18
1018624	19
1018624	22
1018624	24
1018624	29
1021499	2
1021499	4
1021499	5
1021499	6
1021499	8
1021499	9
1021499	10
1021499	11
1021499	12
1021499	16
1021499	19
1021499	24
1000278	2
1000278	4
1000278	6
1000278	8
1000278	9
1000278	10
1000278	11
1000278	24
1000278	27
1020015	1
1020015	2
1020015	3
1020015	5
1020015	6
1020015	8
1020015	9
1020015	10
1020015	15
1020015	18
1020015	19
1020015	22
1020015	24
1020015	27
1020015	28
1020015	29
1020015	30
1010798	1
1010798	2
1010798	4
1010798	5
1010798	6
1010798	7
1010798	8
1010798	9
1010798	10
1010798	11
1010798	15
1010798	17
1010798	19
1010798	22
1010798	24
1012799	1
1012799	2
1012799	3
1012799	4
1012799	5
1012799	6
1012799	8
1012799	9
1012799	10
1012799	11
1012799	12
1012799	13
1012799	16
1012799	17
1012799	18
1012799	19
1012799	20
1012799	22
1012799	23
1012799	24
1012799	25
1012799	26
1012799	27
1012799	30
1021586	1
1021586	2
1021586	3
1021586	5
1021586	6
1021586	7
1021586	8
1021586	9
1021586	10
1021586	13
1021586	16
1021586	17
1021586	24
1021586	27
1021586	30
1008826	1
1008826	2
1008826	4
1008826	5
1008826	6
1008826	7
1008826	8
1008826	9
1008826	10
1008826	11
1008826	13
1008826	18
1008826	19
1008826	24
1008826	25
1008827	1
1008827	2
1008827	5
1008827	6
1008827	8
1008827	9
1008827	10
1008827	11
1008827	16
1008827	18
1008827	24
1019228	2
1019228	4
1019228	6
1019228	9
1019228	10
1019228	11
1019228	16
1019228	19
1019228	22
1019228	24
1017961	1
1017961	2
1017961	3
1017961	5
1017961	6
1017961	7
1017961	8
1017961	9
1017961	10
1017961	11
1017961	12
1017961	13
1017961	15
1017961	17
1017961	18
1017961	20
1017961	22
1017961	23
1017961	24
1017961	25
1017961	26
1017961	27
1017961	30
1009802	2
1009802	4
1009802	5
1009802	6
1009802	9
1009802	10
1009802	11
1009802	13
1009802	15
1009802	17
1009802	18
1009802	19
1009802	21
1009802	24
1009802	27
1021562	2
1021562	5
1021562	6
1021562	8
1021562	9
1021562	10
1021562	11
1021562	12
1021562	13
1021562	16
1021562	17
1021562	20
1021562	24
1021562	26
1021744	1
1021744	2
1021744	3
1021744	4
1021744	5
1021744	6
1021744	7
1021744	8
1021744	9
1021744	10
1021744	11
1021744	13
1021744	16
1021744	17
1021744	18
1021744	19
1021744	20
1021744	21
1021744	24
1021744	26
1021744	28
1021744	29
1021744	30
1021447	1
1021447	2
1021447	4
1021447	5
1021447	6
1021447	8
1021447	9
1021447	10
1021447	11
1021447	16
1021447	18
1021447	19
1021447	22
1021447	24
1021447	28
1021447	30
1019963	2
1019963	3
1019963	4
1019963	5
1019963	6
1019963	8
1019963	9
1019963	10
1019963	19
1019963	24
1021490	1
1021490	2
1021490	3
1021490	4
1021490	5
1021490	8
1021490	9
1021490	10
1021490	11
1021490	12
1021490	13
1021490	16
1021490	17
1021490	18
1021490	19
1021490	22
1021490	23
1021490	24
1021490	25
1021490	27
1021490	30
1019393	2
1019393	4
1019393	5
1019393	6
1019393	7
1019393	8
1019393	9
1019393	11
1019393	16
1019393	18
1019393	24
1019393	28
1019213	2
1019213	4
1019213	6
1019213	9
1019213	10
1019213	11
1019213	16
1019213	17
1019213	19
1019213	24
1006324	2
1006324	4
1006324	5
1006324	6
1006324	8
1006324	9
1006324	10
1006324	11
1006324	12
1006324	13
1006324	16
1006324	17
1006324	18
1006324	19
1006324	22
1006324	24
1006324	26
1006324	27
1006324	30
1021745	1
1021745	2
1021745	3
1021745	4
1021745	5
1021745	6
1021745	7
1021745	8
1021745	9
1021745	10
1021745	11
1021745	12
1021745	13
1021745	16
1021745	17
1021745	18
1021745	19
1021745	21
1021745	22
1021745	23
1021745	24
1021745	26
1021745	27
1021745	28
1019638	2
1019638	3
1019638	4
1019638	5
1019638	6
1019638	8
1019638	9
1019638	10
1019638	11
1019638	12
1019638	13
1019638	15
1019638	16
1019638	17
1019638	18
1019638	19
1019638	21
1019638	22
1019638	24
1019638	28
1021343	2
1021343	3
1021343	4
1021343	5
1021343	6
1021343	8
1021343	9
1021343	10
1021343	11
1021343	16
1021343	17
1021343	18
1021343	19
1021343	22
1021343	23
1021343	24
1021343	25
1018933	2
1018933	4
1018933	5
1018933	6
1018933	8
1018933	9
1018933	10
1018933	11
1018933	16
1018933	19
1018933	24
1020002	1
1020002	2
1020002	3
1020002	5
1020002	6
1020002	7
1020002	8
1020002	9
1020002	10
1020002	11
1020002	12
1020002	13
1020002	15
1020002	16
1020002	17
1020002	18
1020002	19
1020002	20
1020002	21
1020002	22
1020002	24
1020002	25
1020002	26
1020002	27
1020002	28
1020002	29
1020002	30
1019632	2
1019632	4
1019632	5
1019632	6
1019632	8
1019632	9
1019632	11
1019632	13
1019632	16
1019632	17
1019632	19
1019632	23
1019632	24
1019632	28
1018397	1
1018397	2
1018397	3
1018397	4
1018397	5
1018397	6
1018397	7
1018397	8
1018397	9
1018397	10
1018397	11
1018397	12
1018397	13
1018397	15
1018397	16
1018397	17
1018397	18
1018397	19
1018397	20
1018397	22
1018397	23
1018397	24
1018397	25
1018397	28
1018397	30
1021576	1
1021576	2
1021576	4
1021576	5
1021576	6
1021576	8
1021576	9
1021576	10
1021576	11
1021576	12
1021576	15
1021576	16
1021576	18
1021576	19
1021576	20
1021576	22
1021576	24
1021576	27
1018283	2
1018283	5
1018283	8
1018283	9
1018283	10
1018283	11
1018283	15
1018283	16
1018283	18
1018283	19
1018283	22
1018283	24
1018283	27
1019349	1
1019349	2
1019349	4
1019349	5
1019349	6
1019349	7
1019349	8
1019349	9
1019349	10
1019349	11
1019349	13
1019349	15
1019349	16
1019349	17
1019349	18
1019349	19
1019349	20
1019349	22
1019349	24
1019349	26
1019349	27
1019349	28
1019349	30
1012573	2
1012573	4
1012573	5
1012573	6
1012573	8
1012573	9
1012573	10
1012573	11
1012573	12
1012573	13
1012573	15
1012573	16
1012573	17
1012573	19
1012573	20
1012573	22
1012573	24
1012573	25
1005493	2
1005493	3
1005493	4
1005493	5
1005493	6
1005493	8
1005493	9
1005493	10
1005493	11
1005493	12
1005493	13
1005493	16
1005493	17
1005493	18
1005493	19
1005493	22
1005493	24
1005493	27
1005493	28
1006169	4
1006169	6
1006169	9
1006169	10
1006169	11
1006169	12
1006169	19
1006169	24
1018968	2
1018968	4
1018968	5
1018968	6
1018968	9
1018968	10
1018968	11
1018968	13
1018968	19
1018968	22
1018968	24
1018968	26
1019215	1
1019215	2
1019215	3
1019215	4
1019215	5
1019215	6
1019215	8
1019215	9
1019215	10
1019215	11
1019215	13
1019215	15
1019215	16
1019215	18
1019215	19
1019215	20
1019215	22
1019215	24
1019215	25
1019215	27
1019215	28
1019925	2
1019925	3
1019925	4
1019925	5
1019925	6
1019925	9
1019925	10
1019925	11
1019925	12
1019925	13
1019925	16
1019925	18
1019925	19
1019925	20
1019925	24
1019925	26
1019925	27
1010158	1
1010158	2
1010158	3
1010158	4
1010158	5
1010158	6
1010158	8
1010158	9
1010158	12
1010158	13
1010158	17
1010158	19
1010158	20
1010158	23
1010158	24
1019540	1
1019540	2
1019540	3
1019540	5
1019540	6
1019540	7
1019540	8
1019540	9
1019540	10
1019540	11
1019540	12
1019540	13
1019540	15
1019540	16
1019540	17
1019540	18
1019540	19
1019540	21
1019540	22
1019540	23
1019540	24
1019540	25
1019540	26
1019540	27
1019540	28
1019540	29
1019540	30
1018634	1
1018634	2
1018634	3
1018634	4
1018634	5
1018634	6
1018634	7
1018634	8
1018634	9
1018634	10
1018634	11
1018634	13
1018634	15
1018634	16
1018634	17
1018634	18
1018634	22
1018634	24
1018634	26
1018634	27
1018634	28
1021305	2
1021305	6
1021305	9
1021305	10
1021305	11
1021305	16
1021305	18
1021305	24
1019764	1
1019764	2
1019764	5
1019764	6
1019764	7
1019764	9
1019764	10
1019764	11
1019764	13
1019764	16
1019764	17
1019764	22
1019764	24
1021726	2
1021726	3
1021726	5
1021726	6
1021726	8
1021726	9
1021726	10
1021726	11
1021726	12
1021726	13
1021726	15
1021726	17
1021726	18
1021726	22
1021726	23
1021726	24
1021726	26
1021726	27
1021726	28
1001886	2
1001886	4
1001886	5
1001886	6
1001886	8
1001886	9
1001886	10
1001886	11
1001886	13
1001886	17
1001886	18
1001886	19
1001886	21
1001886	22
1001886	24
1001886	26
1001886	28
1019105	1
1019105	2
1019105	3
1019105	4
1019105	6
1019105	8
1019105	9
1019105	13
1019105	17
1019105	19
1019105	22
1019105	24
1019448	2
1019448	3
1019448	5
1019448	6
1019448	7
1019448	8
1019448	9
1019448	10
1019448	11
1019448	12
1019448	13
1019448	16
1019448	17
1019448	24
1019342	1
1019342	2
1019342	3
1019342	5
1019342	6
1019342	7
1019342	8
1019342	9
1019342	10
1019342	11
1019342	13
1019342	15
1019342	16
1019342	17
1019342	18
1019342	19
1019342	20
1019342	21
1019342	22
1019342	23
1019342	24
1019342	26
1019342	27
1019342	28
1019342	29
1018852	2
1018852	4
1018852	5
1018852	6
1018852	9
1018852	11
1018852	16
1018852	19
1018852	24
1019498	2
1019498	4
1019498	5
1019498	6
1019498	8
1019498	9
1019498	10
1019498	11
1019498	13
1019498	16
1019498	17
1019498	18
1019498	19
1019498	22
1019498	24
1019498	28
1005631	2
1005631	3
1005631	5
1005631	6
1005631	8
1005631	9
1005631	10
1005631	11
1005631	13
1005631	16
1005631	17
1005631	18
1005631	22
1005631	24
1005631	25
1005631	26
1001999	2
1001999	6
1001999	9
1001999	10
1001999	11
1001999	12
1001999	24
1018535	1
1018535	2
1018535	4
1018535	5
1018535	6
1018535	8
1018535	9
1018535	10
1018535	11
1018535	13
1018535	15
1018535	16
1018535	18
1018535	19
1018535	20
1018535	24
1018535	26
1018535	27
1018535	28
1018535	30
1019692	1
1019692	2
1019692	3
1019692	4
1019692	5
1019692	6
1019692	7
1019692	8
1019692	9
1019692	10
1019692	11
1019692	12
1019692	15
1019692	18
1019692	19
1019692	22
1019692	24
1019692	25
1019692	26
1019692	28
1019692	30
1012325	1
1012325	2
1012325	3
1012325	4
1012325	5
1012325	6
1012325	7
1012325	8
1012325	9
1012325	10
1012325	11
1012325	13
1012325	15
1012325	16
1012325	17
1012325	18
1012325	19
1012325	20
1012325	21
1012325	22
1012325	23
1012325	24
1012325	27
1018597	1
1018597	2
1018597	3
1018597	4
1018597	5
1018597	6
1018597	8
1018597	9
1018597	10
1018597	11
1018597	13
1018597	16
1018597	17
1018597	18
1018597	19
1018597	23
1018597	24
1018597	25
1018598	1
1018598	2
1018598	3
1018598	4
1018598	5
1018598	6
1018598	8
1018598	9
1018598	10
1018598	11
1018598	13
1018598	16
1018598	17
1018598	18
1018598	19
1018598	22
1018598	23
1018598	24
1018598	25
1019078	1
1019078	2
1019078	3
1019078	4
1019078	5
1019078	6
1019078	8
1019078	9
1019078	10
1019078	11
1019078	12
1019078	13
1019078	16
1019078	17
1019078	18
1019078	19
1019078	21
1019078	22
1019078	23
1019078	24
1019078	26
1019078	27
1019078	28
1019078	30
1019080	2
1019080	3
1019080	4
1019080	6
1019080	8
1019080	9
1019080	10
1019080	11
1019080	12
1019080	13
1019080	17
1019080	18
1019080	19
1019080	21
1019080	22
1019080	23
1019080	24
1019080	26
1019080	27
1019080	28
1019080	30
1019182	2
1019182	5
1019182	6
1019182	8
1019182	9
1019182	10
1019182	11
1019182	13
1019182	16
1019182	17
1019182	19
1019182	24
1019182	28
1019952	2
1019952	7
1019952	8
1019952	9
1019952	10
1019952	11
1019952	13
1019952	15
1019952	17
1019952	18
1019952	19
1019952	22
1019952	24
1020048	2
1020048	5
1020048	6
1020048	8
1020048	9
1020048	10
1020048	11
1020048	13
1020048	16
1020048	22
1020048	24
1012247	13
1012247	17
1012247	18
1012247	19
1012247	21
1019513	2
1019513	4
1019513	6
1019513	8
1019513	9
1019513	10
1019513	11
1019513	13
1019513	15
1019513	16
1019513	17
1019513	18
1019513	19
1019513	20
1019513	21
1019513	22
1019513	24
1019513	25
1012297	2
1012297	8
1012297	9
1012297	10
1012297	11
1012297	16
1012297	24
1018155	2
1018155	3
1018155	4
1018155	5
1018155	6
1018155	9
1018155	10
1018155	11
1018155	12
1018155	16
1018155	24
1019645	2
1019645	4
1019645	6
1019645	7
1019645	9
1019645	10
1019645	11
1019645	13
1019645	17
1019645	18
1019645	19
1019645	22
1019645	24
1019645	27
1019156	2
1019156	3
1019156	5
1019156	6
1019156	7
1019156	8
1019156	9
1019156	10
1019156	11
1019156	12
1019156	13
1019156	16
1019156	17
1019156	18
1019156	20
1019156	22
1019156	24
1019156	25
1019156	27
1019156	30
1006342	2
1006342	3
1006342	4
1006342	5
1006342	6
1006342	7
1006342	8
1006342	9
1006342	10
1006342	11
1006342	12
1006342	13
1006342	16
1006342	18
1006342	19
1006342	20
1006342	22
1006342	24
1006342	25
1006342	27
1006342	30
1021297	2
1021297	3
1021297	4
1021297	5
1021297	6
1021297	8
1021297	9
1021297	10
1021297	11
1021297	13
1021297	16
1021297	17
1021297	18
1021297	19
1021297	20
1021297	21
1021297	22
1021297	24
1021297	25
1021297	26
1021297	28
1018214	1
1018214	2
1018214	3
1018214	5
1018214	6
1018214	8
1018214	9
1018214	10
1018214	11
1018214	13
1018214	15
1018214	16
1018214	18
1018214	22
1018214	24
1018214	25
1018214	26
1018214	27
1021487	2
1021487	4
1021487	5
1021487	6
1021487	8
1021487	9
1021487	10
1021487	11
1021487	15
1021487	19
1021487	24
1021487	25
1021487	26
1021251	1
1021251	2
1021251	6
1021251	7
1021251	9
1021251	10
1021251	13
1021251	18
1021251	19
1021251	22
1021251	24
1021251	26
1021251	27
1021251	28
1021251	29
1018504	2
1018504	4
1018504	6
1018504	8
1018504	9
1018504	10
1018504	11
1018504	13
1018504	17
1018504	18
1018504	19
1018504	24
1001925	2
1001925	5
1001925	6
1001925	8
1001925	9
1001925	10
1001925	12
1001925	16
1001925	18
1001925	19
1001925	22
1001925	24
1010394	1
1010394	2
1010394	4
1010394	5
1010394	6
1010394	8
1010394	9
1010394	10
1010394	11
1010394	12
1010394	13
1010394	16
1010394	17
1010394	18
1010394	19
1010394	22
1010394	24
1010394	30
1019155	1
1019155	2
1019155	3
1019155	4
1019155	5
1019155	6
1019155	8
1019155	9
1019155	10
1019155	11
1019155	13
1019155	15
1019155	17
1019155	18
1019155	19
1019155	21
1019155	22
1019155	24
1019155	25
1019155	26
1019155	28
1021537	1
1021537	2
1021537	3
1021537	4
1021537	5
1021537	6
1021537	9
1021537	10
1021537	11
1021537	13
1021537	18
1021537	19
1021537	21
1021537	24
1021537	27
1021537	30
1005268	2
1005268	5
1005268	9
1005268	16
1005268	24
1005268	27
1004574	2
1004574	4
1004574	6
1004574	8
1004574	9
1004574	11
1004574	16
1004574	24
1004574	28
1005263	2
1005263	5
1005263	8
1005263	9
1005263	15
1005263	16
1005263	24
1005263	27
1005269	8
1005269	9
1005269	24
1005269	27
1005264	5
1005264	8
1005264	9
1005264	15
1005264	16
1005264	24
1005264	27
1005266	2
1005266	5
1005266	9
1005266	23
1005266	24
1005266	27
1019489	2
1019489	3
1019489	6
1019489	8
1019489	9
1019489	10
1019489	11
1019489	13
1019489	16
1019489	17
1019489	18
1019489	24
1019489	26
1021340	1
1021340	2
1021340	3
1021340	4
1021340	5
1021340	6
1021340	7
1021340	8
1021340	9
1021340	10
1021340	11
1021340	12
1021340	13
1021340	15
1021340	16
1021340	17
1021340	18
1021340	19
1021340	21
1021340	22
1021340	23
1021340	24
1021340	25
1021340	26
1021340	27
1021340	30
1020197	1
1020197	2
1020197	3
1020197	4
1020197	5
1020197	6
1020197	7
1020197	9
1020197	10
1020197	11
1020197	13
1020197	15
1020197	17
1020197	18
1020197	20
1020197	21
1020197	22
1020197	24
1020197	26
1020197	27
1018219	2
1018219	4
1018219	6
1018219	8
1018219	10
1018219	11
1018219	18
1018219	19
1018219	24
1021366	2
1021366	4
1021366	5
1021366	9
1021366	10
1021366	11
1021366	13
1021366	16
1021366	18
1021366	19
1021366	20
1021366	24
1018552	1
1018552	2
1018552	4
1018552	5
1018552	6
1018552	7
1018552	8
1018552	9
1018552	10
1018552	11
1018552	13
1018552	18
1018552	19
1018552	21
1018552	22
1018552	24
1018552	26
1018552	28
1020021	2
1020021	3
1020021	4
1020021	5
1020021	6
1020021	9
1020021	10
1020021	11
1020021	12
1020021	22
1020021	24
1019394	2
1019394	3
1019394	4
1019394	5
1019394	6
1019394	8
1019394	9
1019394	10
1019394	11
1019394	16
1019394	17
1019394	19
1018319	2
1018319	4
1018319	5
1018319	6
1018319	9
1018319	10
1018319	11
1018319	18
1018319	24
1001962	2
1001962	5
1001962	6
1001962	8
1001962	9
1001962	11
1001962	21
1001962	24
1011229	2
1011229	4
1011229	5
1011229	6
1011229	8
1011229	9
1011229	10
1011229	11
1011229	13
1011229	16
1011229	17
1011229	18
1011229	19
1011229	22
1011229	24
1011229	27
1019613	2
1019613	4
1019613	6
1019613	8
1019613	9
1019613	10
1019613	11
1019613	12
1019613	16
1019613	19
1019613	24
1004499	1
1004499	2
1004499	3
1004499	5
1004499	6
1004499	7
1004499	8
1004499	9
1004499	10
1004499	11
1004499	12
1004499	13
1004499	15
1004499	17
1004499	18
1004499	21
1004499	22
1004499	23
1004499	24
1004499	25
1004499	26
1004499	27
1004499	28
1004499	29
1019016	2
1019016	3
1019016	4
1019016	5
1019016	6
1019016	8
1019016	9
1019016	10
1019016	11
1019016	13
1019016	16
1019016	18
1019016	19
1019016	20
1019016	22
1019016	23
1019016	24
1019016	26
1019016	28
1021559	1
1021559	2
1021559	4
1021559	5
1021559	6
1021559	8
1021559	9
1021559	10
1021559	11
1021559	12
1021559	13
1021559	16
1021559	17
1021559	19
1021559	24
1021559	26
1021559	27
1021559	30
1012485	2
1012485	5
1012485	8
1012485	9
1012485	10
1012485	11
1012485	16
1012485	18
1012485	22
1012485	24
1012485	26
1020047	2
1020047	3
1020047	5
1020047	6
1020047	8
1020047	9
1020047	10
1020047	11
1020047	13
1020047	16
1020047	17
1020047	19
1020047	22
1020047	24
1020047	25
1020047	27
1019124	2
1019124	5
1019124	9
1019124	10
1019124	11
1019124	12
1019124	16
1019124	18
1019124	19
1019124	21
1019124	24
1021709	2
1021709	3
1021709	4
1021709	5
1021709	6
1021709	7
1021709	8
1021709	9
1021709	10
1021709	11
1021709	12
1021709	16
1021709	17
1021709	18
1021709	19
1021709	22
1021709	23
1021709	24
1021709	29
1021452	2
1021452	4
1021452	5
1021452	6
1021452	7
1021452	8
1021452	9
1021452	10
1021452	13
1021452	15
1021452	16
1021452	17
1021452	18
1021452	19
1021452	22
1021452	24
1021452	27
1006093	2
1006093	9
1006093	10
1006093	24
1000384	2
1000384	4
1000384	5
1000384	6
1000384	9
1000384	10
1000384	11
1000384	12
1000384	13
1000384	16
1000384	24
1000384	26
1019864	2
1019864	6
1019864	9
1019864	10
1019864	11
1019864	12
1019864	17
1019864	19
1019864	24
1012212	2
1012212	4
1012212	6
1012212	8
1012212	9
1012212	10
1012212	11
1012212	18
1012212	19
1012212	24
1019641	2
1019641	3
1019641	4
1019641	5
1019641	6
1019641	8
1019641	9
1019641	10
1019641	11
1019641	16
1019641	18
1019641	19
1019641	22
1019641	24
1019114	1
1019114	2
1019114	3
1019114	4
1019114	5
1019114	6
1019114	8
1019114	9
1019114	10
1019114	11
1019114	13
1019114	16
1019114	17
1019114	18
1019114	19
1019114	20
1019114	22
1019114	24
1019114	26
1019114	27
1002890	1
1002890	2
1002890	4
1002890	5
1002890	6
1002890	8
1002890	9
1002890	10
1002890	11
1002890	15
1002890	18
1002890	19
1002890	22
1002890	24
1002890	26
1002280	4
1002280	8
1002280	9
1002280	11
1002280	15
1002280	16
1002280	19
1002280	20
1002280	24
1002280	30
1019067	2
1019067	3
1019067	4
1019067	5
1019067	6
1019067	7
1019067	8
1019067	9
1019067	10
1019067	11
1019067	12
1019067	13
1019067	15
1019067	16
1019067	17
1019067	18
1019067	19
1019067	20
1019067	22
1019067	23
1019067	24
1019067	25
1019067	26
1019067	27
1019067	28
1019067	29
1019067	30
1021569	1
1021569	9
1021569	10
1021569	19
1021569	24
1018650	1
1018650	2
1018650	3
1018650	4
1018650	5
1018650	6
1018650	8
1018650	9
1018650	10
1018650	15
1018650	18
1018650	19
1018650	20
1018650	22
1018650	24
1018650	26
1018650	30
1011203	1
1011203	2
1011203	3
1011203	4
1011203	5
1011203	6
1011203	8
1011203	9
1011203	10
1011203	11
1011203	12
1011203	13
1011203	15
1011203	16
1011203	17
1011203	18
1011203	19
1011203	21
1011203	22
1011203	23
1011203	24
1011203	25
1011203	26
1011203	27
1011203	28
1011203	30
1019424	2
1019424	4
1019424	5
1019424	6
1019424	9
1019424	10
1019424	11
1019424	13
1019424	15
1019424	18
1019424	19
1019424	24
1019424	25
1019424	26
1019424	29
1019657	1
1019657	2
1019657	4
1019657	6
1019657	8
1019657	9
1019657	10
1019657	11
1019657	16
1019657	17
1019657	19
1019657	24
1019877	9
1019877	24
1002177	1
1002177	2
1002177	3
1002177	4
1002177	6
1002177	8
1002177	9
1002177	10
1002177	11
1002177	13
1002177	17
1002177	18
1002177	19
1002177	24
1016908	1
1016908	2
1016908	3
1016908	5
1016908	6
1016908	7
1016908	8
1016908	9
1016908	10
1016908	17
1016908	19
1016908	22
1016908	24
1016908	27
1019911	8
1019911	9
1019911	24
1012204	2
1012204	3
1012204	4
1012204	5
1012204	7
1012204	8
1012204	9
1012204	10
1012204	11
1012204	15
1012204	16
1012204	18
1012204	19
1012204	20
1012204	22
1012204	24
1012204	28
1010319	2
1010319	3
1010319	6
1010319	7
1010319	8
1010319	9
1010319	10
1010319	11
1010319	13
1010319	15
1010319	16
1010319	17
1010319	18
1010319	19
1010319	21
1010319	22
1010319	24
1010319	25
1010319	26
1010319	28
1019509	2
1019509	4
1019509	9
1019509	10
1019509	11
1019509	13
1019509	17
1019509	18
1019509	19
1019509	24
1019509	28
1021367	1
1021367	2
1021367	3
1021367	5
1021367	6
1021367	7
1021367	8
1021367	9
1021367	10
1021367	11
1021367	12
1021367	13
1021367	16
1021367	18
1021367	22
1021367	24
1021367	26
1019364	2
1019364	4
1019364	5
1019364	6
1019364	8
1019364	9
1019364	10
1019364	11
1019364	12
1019364	16
1019364	18
1019364	19
1019364	24
1019444	2
1019444	4
1019444	5
1019444	6
1019444	8
1019444	9
1019444	10
1019444	11
1019444	12
1019444	13
1019444	15
1019444	16
1019444	17
1019444	18
1019444	19
1019444	22
1019444	24
1019444	25
1019444	26
1019444	27
1019444	28
1019444	30
1021274	2
1021274	3
1021274	4
1021274	5
1021274	6
1021274	9
1021274	10
1021274	11
1021274	17
1021274	24
1019797	2
1019797	4
1019797	5
1019797	6
1019797	8
1019797	9
1019797	10
1019797	11
1019797	13
1019797	17
1019797	18
1019797	19
1019797	22
1019797	24
1019797	27
1021246	2
1021246	4
1021246	6
1021246	9
1021246	10
1021246	11
1021246	12
1021246	19
1021246	24
1002816	1
1002816	2
1002816	4
1002816	5
1002816	6
1002816	8
1002816	9
1002816	10
1002816	11
1002816	12
1002816	13
1002816	16
1002816	17
1002816	18
1002816	19
1002816	24
1002816	26
1002816	28
1020070	2
1020070	4
1020070	5
1020070	6
1020070	8
1020070	9
1020070	10
1020070	11
1020070	13
1020070	16
1020070	17
1020070	19
1020070	22
1020070	24
1020070	28
1001661	1
1001661	2
1001661	3
1001661	5
1001661	6
1001661	8
1001661	9
1001661	10
1001661	11
1001661	12
1001661	13
1001661	15
1001661	16
1001661	17
1001661	18
1001661	19
1001661	20
1001661	23
1001661	24
1001661	25
1001661	26
1001661	27
1001661	28
1001661	30
1021217	1
1021217	2
1021217	3
1021217	5
1021217	6
1021217	8
1021217	9
1021217	10
1021217	11
1021217	12
1021217	13
1021217	15
1021217	16
1021217	17
1021217	20
1021217	23
1021217	24
1021217	25
1021217	26
1021217	27
1021217	28
1021217	30
1004515	2
1004515	6
1004515	8
1004515	9
1004515	10
1004515	11
1004515	12
1004515	23
1004515	24
1005280	1
1005280	2
1005280	3
1005280	5
1005280	6
1005280	7
1005280	8
1005280	9
1005280	10
1005280	11
1005280	13
1005280	15
1005280	16
1005280	17
1005280	18
1005280	19
1005280	21
1005280	22
1005280	23
1005280	24
1005280	26
1020020	1
1020020	2
1020020	4
1020020	6
1020020	8
1020020	9
1020020	10
1020020	11
1020020	15
1020020	18
1020020	22
1020020	23
1020020	24
1020020	26
1021258	2
1021258	4
1021258	5
1021258	9
1021258	10
1021258	18
1021258	19
1021258	24
1020010	2
1020010	3
1020010	4
1020010	5
1020010	6
1020010	9
1020010	10
1020010	13
1020010	17
1020010	18
1020010	19
1020010	24
1020010	28
1021488	2
1021488	3
1021488	4
1021488	5
1021488	6
1021488	8
1021488	9
1021488	10
1021488	11
1021488	13
1021488	15
1021488	16
1021488	17
1021488	18
1021488	19
1021488	22
1021488	27
1021488	30
1019955	1
1019955	2
1019955	5
1019955	6
1019955	9
1019955	11
1019955	24
1019392	2
1019392	6
1019392	8
1019392	9
1019392	10
1019392	11
1019392	22
1019392	24
1019392	25
1019392	26
1019392	30
1020157	1
1020157	2
1020157	6
1020157	9
1020157	10
1020157	11
1020157	18
1020157	19
1020157	24
1020157	26
1020156	1
1020156	2
1020156	6
1020156	8
1020156	9
1020156	10
1020156	11
1020156	18
1020156	19
1020156	24
1019221	1
1019221	2
1019221	4
1019221	5
1019221	9
1019221	10
1019221	11
1019221	12
1019221	16
1019221	18
1019221	19
1019221	22
1019221	26
1021495	9
1021495	24
1021497	9
1021497	24
1021498	9
1021498	24
1021496	9
1021496	24
1019878	9
1019878	24
1019069	2
1019069	3
1019069	4
1019069	5
1019069	6
1019069	7
1019069	8
1019069	9
1019069	10
1019069	11
1019069	12
1019069	15
1019069	16
1019069	17
1019069	18
1019069	19
1019069	22
1019069	23
1019069	24
1019069	25
1019069	30
1018274	1
1018274	2
1018274	3
1018274	4
1018274	6
1018274	8
1018274	9
1018274	10
1018274	11
1018274	13
1018274	16
1018274	17
1018274	18
1018274	19
1018274	22
1018274	24
1019652	2
1019652	5
1019652	6
1019652	9
1019652	10
1019652	11
1019652	18
1019652	19
1019652	21
1019652	24
1021720	2
1021720	3
1021720	5
1021720	6
1021720	7
1021720	8
1021720	9
1021720	10
1021720	11
1021720	13
1021720	15
1021720	17
1021720	18
1021720	19
1021720	21
1021720	22
1021720	24
1021720	25
1021720	26
1021720	27
1021720	28
1019337	2
1019337	4
1019337	6
1019337	8
1019337	9
1019337	10
1019337	11
1019337	13
1019337	19
1019337	24
1019337	27
1020187	1
1020187	2
1020187	3
1020187	4
1020187	5
1020187	6
1020187	7
1020187	8
1020187	9
1020187	10
1020187	11
1020187	13
1020187	15
1020187	17
1020187	18
1020187	19
1020187	20
1020187	21
1020187	22
1020187	23
1020187	24
1020187	26
1020187	27
1020187	28
1020187	29
1020187	30
1019433	1
1019433	2
1019433	3
1019433	4
1019433	5
1019433	6
1019433	7
1019433	8
1019433	9
1019433	10
1019433	11
1019433	12
1019433	13
1019433	16
1019433	17
1019433	18
1019433	19
1019433	22
1019433	24
1019433	26
1019433	28
1019369	1
1019369	2
1019369	4
1019369	5
1019369	6
1019369	8
1019369	9
1019369	10
1019369	15
1019369	16
1019369	18
1019369	19
1019369	20
1019369	24
1019369	26
1011274	2
1011274	3
1011274	4
1011274	5
1011274	6
1011274	8
1011274	9
1011274	10
1011274	11
1011274	13
1011274	18
1011274	19
1011274	22
1011274	24
1021231	2
1021231	4
1021231	5
1021231	8
1021231	9
1021231	10
1021231	11
1021231	13
1021231	15
1021231	18
1021231	19
1021231	22
1021231	23
1021231	24
1021231	26
1021231	27
1021231	28
1021231	29
1019229	2
1019229	3
1019229	4
1019229	5
1019229	6
1019229	8
1019229	9
1019229	10
1019229	11
1019229	13
1019229	15
1019229	16
1019229	17
1019229	18
1019229	19
1019229	24
1019229	25
1019229	26
1019229	30
1019848	2
1019848	3
1019848	4
1019848	5
1019848	6
1019848	7
1019848	8
1019848	9
1019848	10
1019848	11
1019848	13
1019848	16
1019848	17
1019848	18
1019848	19
1019848	20
1019848	22
1019848	27
1019653	1
1019653	2
1019653	3
1019653	4
1019653	6
1019653	7
1019653	9
1019653	10
1019653	11
1019653	12
1019653	13
1019653	17
1019653	18
1019653	19
1019653	22
1019653	24
1019653	26
1019653	28
1019449	2
1019449	3
1019449	4
1019449	6
1019449	8
1019449	9
1019449	10
1019449	11
1019449	17
1019449	18
1019449	19
1019449	22
1019449	26
1018925	1
1018925	2
1018925	3
1018925	4
1018925	6
1018925	7
1018925	9
1018925	10
1018925	13
1018925	17
1018925	19
1018925	22
1018925	24
1018925	27
1019463	2
1019463	3
1019463	4
1019463	5
1019463	7
1019463	8
1019463	9
1019463	10
1019463	11
1019463	12
1019463	18
1019463	19
1019463	24
1019463	27
1008231	2
1008231	4
1008231	5
1008231	6
1008231	8
1008231	9
1008231	10
1008231	11
1008231	16
1008231	18
1008231	19
1008231	24
1019845	1
1019845	2
1019845	3
1019845	4
1019845	5
1019845	6
1019845	7
1019845	8
1019845	9
1019845	10
1019845	11
1019845	12
1019845	13
1019845	15
1019845	16
1019845	17
1019845	18
1019845	19
1019845	20
1019845	21
1019845	22
1019845	23
1019845	24
1019845	25
1019845	26
1019845	27
1019845	28
1019845	29
1019845	30
1020158	9
1020158	10
1020158	24
1009027	1
1009027	2
1009027	3
1009027	5
1009027	6
1009027	7
1009027	8
1009027	9
1009027	10
1009027	11
1009027	12
1009027	13
1009027	16
1009027	17
1009027	18
1009027	19
1009027	21
1009027	22
1009027	24
1009027	26
1009027	30
1019098	2
1019098	3
1019098	4
1019098	5
1019098	6
1019098	8
1019098	9
1019098	10
1019098	11
1019098	12
1019098	13
1019098	15
1019098	16
1019098	17
1019098	18
1019098	19
1019098	22
1019098	24
1019098	30
1020138	2
1020138	4
1020138	8
1020138	9
1020138	10
1020138	11
1020138	13
1020138	16
1020138	24
1020168	1
1020168	2
1020168	4
1020168	5
1020168	6
1020168	8
1020168	9
1020168	10
1020168	11
1020168	12
1020168	13
1020168	16
1020168	17
1020168	19
1020168	20
1020168	21
1020168	24
1019038	1
1019038	2
1019038	5
1019038	6
1019038	7
1019038	8
1019038	9
1019038	10
1019038	11
1019038	12
1019038	13
1019038	16
1019038	17
1019038	18
1019038	19
1019038	24
1019038	27
1005140	2
1005140	3
1005140	5
1005140	6
1005140	7
1005140	8
1005140	9
1005140	10
1005140	11
1005140	13
1005140	16
1005140	17
1005140	18
1005140	19
1005140	22
1005140	24
1005140	25
1005140	26
1005140	27
1005140	28
1005140	30
1021317	1
1021317	2
1021317	3
1021317	4
1021317	6
1021317	8
1021317	9
1021317	10
1021317	11
1021317	13
1021317	17
1021317	19
1021317	23
1021317	24
1021317	26
1021317	27
1021317	28
1021386	1
1021386	2
1021386	3
1021386	4
1021386	5
1021386	6
1021386	8
1021386	9
1021386	10
1021386	11
1021386	13
1021386	15
1021386	16
1021386	17
1021386	18
1021386	19
1021386	20
1021386	23
1021386	24
1021386	25
1021386	26
1021386	27
1021386	28
1021385	1
1021385	2
1021385	3
1021385	4
1021385	5
1021385	6
1021385	8
1021385	9
1021385	10
1021385	11
1021385	13
1021385	15
1021385	16
1021385	17
1021385	18
1021385	19
1021385	20
1021385	23
1021385	24
1021385	25
1021385	26
1021385	27
1021385	28
1011337	2
1011337	4
1011337	5
1011337	6
1011337	8
1011337	9
1011337	10
1011337	11
1011337	13
1011337	16
1011337	17
1011337	18
1011337	19
1011337	24
1021328	1
1021328	2
1021328	3
1021328	5
1021328	6
1021328	7
1021328	8
1021328	9
1021328	10
1021328	11
1021328	12
1021328	13
1021328	17
1021328	19
1021328	22
1021328	23
1021328	24
1021328	25
1021328	27
1021328	30
1019912	8
1019912	9
1019912	24
1007309	1
1007309	2
1007309	3
1007309	4
1007309	5
1007309	6
1007309	8
1007309	9
1007309	10
1007309	11
1007309	12
1007309	13
1007309	15
1007309	16
1007309	17
1007309	18
1007309	19
1007309	21
1007309	22
1007309	24
1007309	25
1007309	26
1007309	27
1007309	28
1007309	30
1017915	2
1017915	3
1017915	4
1017915	5
1017915	6
1017915	8
1017915	9
1017915	10
1017915	11
1017915	13
1017915	16
1017915	17
1017915	18
1017915	19
1017915	22
1017915	24
1019708	1
1019708	2
1019708	3
1019708	4
1019708	5
1019708	6
1019708	9
1019708	10
1019708	11
1019708	13
1019708	17
1019708	18
1019708	19
1019708	22
1019708	24
1019708	26
1019708	27
1019708	30
1018508	2
1018508	3
1018508	4
1018508	5
1018508	6
1018508	8
1018508	9
1018508	10
1018508	11
1018508	13
1018508	16
1018508	17
1018508	18
1018508	19
1018508	22
1018508	24
1018508	26
1018508	27
1018508	28
1018508	30
1007259	1
1007259	2
1007259	3
1007259	4
1007259	5
1007259	6
1007259	8
1007259	9
1007259	10
1007259	11
1007259	12
1007259	13
1007259	16
1007259	17
1007259	19
1007259	24
1002366	1
1002366	2
1002366	3
1002366	4
1002366	5
1002366	6
1002366	7
1002366	8
1002366	9
1002366	10
1002366	11
1002366	12
1002366	13
1002366	15
1002366	16
1002366	17
1002366	18
1002366	19
1002366	20
1002366	21
1002366	22
1002366	23
1002366	24
1002366	25
1002366	26
1002366	27
1002366	28
1002366	29
1019508	2
1019508	4
1019508	5
1019508	6
1019508	9
1019508	10
1019508	11
1019508	13
1019508	15
1019508	16
1019508	18
1019508	19
1019508	22
1019508	24
1019508	26
1019508	27
1019247	1
1019247	2
1019247	4
1019247	5
1019247	6
1019247	7
1019247	8
1019247	9
1019247	10
1019247	11
1019247	12
1019247	13
1019247	15
1019247	16
1019247	17
1019247	18
1019247	19
1019247	20
1019247	21
1019247	22
1019247	24
1019247	26
1019247	28
1019247	30
1019245	1
1019245	2
1019245	4
1019245	5
1019245	6
1019245	7
1019245	8
1019245	9
1019245	10
1019245	11
1019245	12
1019245	13
1019245	15
1019245	16
1019245	18
1019245	19
1019245	20
1019245	21
1019245	22
1019245	24
1019245	25
1019245	26
1019245	28
1019245	30
1019246	1
1019246	2
1019246	4
1019246	5
1019246	6
1019246	7
1019246	8
1019246	9
1019246	10
1019246	11
1019246	12
1019246	13
1019246	15
1019246	16
1019246	17
1019246	18
1019246	19
1019246	20
1019246	21
1019246	22
1019246	24
1019246	25
1019246	26
1019246	28
1019246	30
1019250	1
1019250	2
1019250	4
1019250	5
1019250	6
1019250	7
1019250	8
1019250	9
1019250	10
1019250	11
1019250	12
1019250	13
1019250	15
1019250	17
1019250	18
1019250	19
1019250	20
1019250	21
1019250	22
1019250	23
1019250	24
1019250	25
1019250	26
1019250	28
1019250	30
1019242	2
1019242	4
1019242	5
1019242	6
1019242	7
1019242	8
1019242	9
1019242	10
1019242	11
1019242	12
1019242	13
1019242	15
1019242	16
1019242	17
1019242	18
1019242	19
1019242	20
1019242	21
1019242	22
1019242	24
1019242	26
1019242	27
1019242	28
1019242	30
1019244	1
1019244	2
1019244	4
1019244	5
1019244	6
1019244	7
1019244	8
1019244	9
1019244	10
1019244	11
1019244	12
1019244	13
1019244	15
1019244	16
1019244	17
1019244	18
1019244	19
1019244	20
1019244	21
1019244	22
1019244	24
1019244	26
1019244	28
1019244	30
1019327	1
1019327	2
1019327	3
1019327	4
1019327	5
1019327	6
1019327	7
1019327	8
1019327	9
1019327	10
1019327	11
1019327	12
1019327	13
1019327	17
1019327	18
1019327	19
1019327	22
1019327	24
1016909	2
1016909	4
1016909	5
1016909	6
1016909	8
1016909	9
1016909	10
1016909	11
1016909	16
1016909	18
1016909	24
1021545	1
1021545	2
1021545	3
1021545	4
1021545	6
1021545	7
1021545	8
1021545	9
1021545	10
1021545	11
1021545	15
1021545	18
1021545	19
1021545	22
1021545	24
1021545	26
1019863	2
1019863	4
1019863	5
1019863	6
1019863	7
1019863	8
1019863	9
1019863	10
1019863	11
1019863	13
1019863	16
1019863	17
1019863	18
1019863	19
1019863	21
1019863	24
1019863	28
1019792	2
1019792	4
1019792	5
1019792	6
1019792	9
1019792	10
1019792	11
1019792	13
1019792	16
1019792	17
1019792	18
1019792	19
1019792	21
1019792	24
1019792	26
1019792	28
\.



COPY public.market_schedules (schedule_id, season_number, season_date, season_time, fmid) FROM stdin;
1	1	06/10/2020 to 10/07/2020	Wed: 9:00 AM-1:00 PM;	1018261
2	1	06/05/2021 to 06/05/2021	Sat: 8:00 AM-11:00 AM;	1009994
3	1	06/06/2020	Sat: 8:30 AM-2:00 PM;	1000709
4	1	01/01/2020 to 01/01/2020	Sat: 8:00 AM-1:00 PM;	1019956
5	1	01/01/2018 to 05/31/2018	Thu: 11:00 AM-3:00 PM;Fri: 11:00 AM-3:00 PM;Sat: 8:00 AM-3:00 PM;	1009959
6	2	06/01/2018 to 12/31/2018	Thu: 11:00 AM-3:00 PM;Fri: 11:00 AM-3:00 PM;Sat: 8:00 AM-3:00 PM;Sun: 11:00 AM-3:00 PM;	1009959
7	1	05/12/2018 to 10/13/2018	Sat: 8:00 AM-2:00 PM;	1004950
8	2	11/09/2018 to 11/10/2018	Fri: 4:00 PM-10:00 PM;Sat: 10:00 AM-3:00 PM;	1004950
9	1	01/01/2021 to 01/01/2021	Wed: 3:00 PM-8:00 PM;Sun: 9:00 AM-8:00 PM;	1021607
10	1	05/12/2018 to 12/15/2018	Sat: 9:00 AM-2:00 PM;	1018965
11	1	01/01/2018 to 12/31/2018	Wed: 12:00 PM-6:00 PM;Sat: 11:00 AM-3:00 PM;	1009004
12	1	05/26/2019 to 09/15/2019	Sun: 10:00 AM-3:00 PM;	1019473
13	2	04/03/2021 to 04/03/2021	Tue: 3:00 PM-6:00 PM;Sat: 8:00 AM-1:00 PM;	1010487
14	3	10/02/2021 to 10/02/2021	Sat: 10:00 AM-12:00 PM;	1010487
15	1	05/08/2021 to 05/08/2021	Sat: 9:00 AM-1:00 PM;	1021442
16	1	05/18/2019 to 10/26/2019	Sat: 8:00 AM-1:00 PM;	1019676
17	1	05/18/2019 to 10/26/2019	Thu: 11:30 AM-3:30 PM;Sat: 8:00 AM-1:00 PM;	1019351
18	1	05/21/2020 to 10/22/2020	Thu: 3:00 PM-7:00 PM;	1019847
19	1	01/01/2021 to 01/01/2021	Mon: 8:00 AM-4:00 PM;Tue: 8:00 AM-4:00 PM;Wed: 8:00 AM-4:00 PM;Thu: 8:00 AM-4:00 PM;Fri: 8:00 AM-4:00 PM;Sun: 10:00 AM-4:00 PM;	1008961
20	1	08/02/2018 to 08/02/2018	Thu: 9:00 AM-5:00 PM;	1019203
21	1	05/01/2018 to 10/31/2018	Mon: 7:30 AM-5:30 PM;Tue: 7:30 AM-5:30 PM;Wed: 7:30 AM-5:30 PM;Thu: 7:30 AM-5:30 PM;Fri: 7:30 AM-5:30 PM;Sat: 7:00 AM-5:30 PM;	1012233
22	1	01/01/2019 to 12/31/2019	Mon: 10:00 AM-11:00 AM;	1005258
23	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-3:00 PM;Sun: 8:00 AM-3:00 PM;	1008054
24	1	01/01/2018 to 12/31/2018	Sun: 8:30 AM-12:00 PM;	1008612
25	1	01/01/2018 to 12/31/2018	Sun: 9:00 AM-1:00 PM;	1018304
27	1	04/16/2022 to 04/16/2022	Sat: 9:00 AM-1:00 PM;	1021689
28	2	12/10/2022 to 12/10/2022	Sat: 10:00 AM-2:00 PM;	1021689
29	1	05/05/2019 to 10/13/2019	Sun: 2:00 PM-5:00 PM;	1019371
30	1	05/01/2021 to 05/01/2021	Thu: 4:30 PM-6:30 PM;	1021578
31	1	05/23/2014 to 05/23/2014	Fri: 9:00 AM-3:00 PM;	1000519
32	1	12/01/2020 to 12/01/2020	Tue: 9:00 AM-12:00 PM;Thu: 3:00 PM-6:00 PM;Sat: 9:00 AM-12:00 PM;	1019113
33	2	05/01/2020 to 10/01/2020	Sat: 9:00 AM-12:00 PM;	1019113
34	1	01/01/2021 to 01/01/2021	Tue: 3:00 PM-6:00 PM;	1021464
35	1	07/11/2021 to 07/11/2021	Sun: 9:00 AM-12:00 PM;	1021597
36	1	04/01/2021 to 04/01/2021	Thu: 5:30 PM-7:00 PM;	1019831
37	1	04/01/2021 to 04/01/2021	Thu: 5:30 PM-7:00 PM;	1019832
38	1	05/02/2019 to 09/26/2019	Thu: 3:00 PM-7:00 PM;	1012389
39	1	07/04/2020 to 10/10/2020	Sun: 9:00 AM-12:00 PM;	1020150
40	1	05/08/2021 to 05/08/2021	Sat: 9:00 AM-12:00 PM;	1021309
41	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-12:30 PM;	1011171
42	1	05/04/2018 to 09/28/2018	Fri: 3:30 PM-7:00 PM;	1003563
43	1	05/05/2019 to 10/27/2019	Sun: 11:00 AM-2:00 PM;	1019438
44	1	07/19/2016 to 09/08/2020	Tue: 4:00 PM-7:00 PM;	1012157
45	1	05/02/2020 to 10/31/2020	Sat: 9:00 AM-2:00 PM;	1005944
46	2	11/21/2020 to 11/22/2020	Sat: 10:00 AM-4:00 PM;Sun: 10:00 AM-4:00 PM;	1005944
47	3	01/11/2020 to 04/11/2020	Sat: 9:00 AM-2:00 PM;	1005944
48	1	05/01/2019 to 05/25/2019	Sat: 10:00 AM-2:00 PM;	1019647
49	2	06/01/2019 to 11/26/2019	Tue: 8:00 AM-1:00 PM;Thu: 8:00 AM-1:00 PM;Sat: 8:00 AM-1:00 PM;	1019647
50	3	11/30/2019 to 12/21/2019	Sat: 10:00 AM-2:00 PM;	1019647
51	1	05/02/2020 to 10/31/2020	Sat: 2:00 PM-5:00 PM;	1020084
52	1	06/10/2020 to 10/21/2020	Wed: 3:00 PM-7:00 PM;	1003516
53	1	06/19/2021 to 06/19/2021	Sat: 10:00 AM-2:00 PM;	1020060
54	1	05/02/2019 to 	Thu: 8:00 AM-12:00 PM;	1019484
55	1	05/26/2018 to 10/06/2018	Sat: 8:00 AM-12:00 PM;	1019096
57	1	06/19/2021 to 06/19/2021	Sat: 8:00 AM-12:30 PM;	1000431
58	2	11/06/2021 to 11/06/2021	Sat: 9:00 AM-12:30 PM;	1000431
59	1	05/19/2021 to 05/19/2021	Wed: 2:00 PM-6:00 PM;	1021359
60	1	07/11/2022 to 07/11/2022	Mon: 2:00 PM-6:00 PM;	1021733
61	1	05/07/2022 to 05/07/2022	Sat: 9:00 AM-12:00 PM;	1021732
62	1	06/21/2019 to 09/06/2019	Fri: 4:00 PM-7:00 PM;	1019662
63	1	06/11/2020 to 10/29/2020	Thu: 3:30 PM-7:00 PM;	1019904
64	1	05/05/2018 to 10/20/2018	Sat: 8:00 AM-12:00 PM;	1019222
65	1	01/01/2019 to 12/31/2019	Fri: 6:00 PM-9:00 PM;	1019495
66	1	01/01/2020 to 12/31/2020	Thu: 12:00 PM-5:00 PM;Fri: 12:00 PM-5:00 PM;Sat: 12:00 PM-5:00 PM;	1020068
67	1	06/12/2021 to 06/12/2021	Sat: 9:00 AM-1:00 PM;	1009810
68	1	05/08/2022 to 05/08/2022	Sun: 10:00 AM-3:00 PM;	1021627
69	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-1:00 PM;	1001245
70	2	06/01/2021 to 06/01/2021	Tue: 12:00 PM-5:30 PM;Sat: 7:00 AM-1:00 PM;	1001245
71	1	05/19/2018 to 10/27/2018	Wed: 2:30 PM-5:30 PM;Sat: 8:00 AM-12:00 PM;	1002984
72	1	01/01/2021 to 12/31/2021	Wed: 9:00 AM-12:00 PM;Sat: 9:00 AM-12:00 PM;	1005086
73	1	04/15/2020 to 11/18/2020	Wed: 4:00 PM-7:00 PM;	1018033
74	1	03/21/2020 to 12/19/2020	Sat: 8:00 AM-12:00 PM;	1018032
75	1	05/07/2021 to 05/07/2021	Fri: 2:00 PM-6:00 PM;	1021450
76	1	06/15/2019 to 10/19/2019	Sat: 9:00 AM-1:00 PM;	1018330
77	1	06/07/2020 to 09/20/2020	Sun: 10:00 AM-3:00 PM;	1019789
78	1	05/29/2021 to 05/29/2021	Sat: 10:00 AM-2:00 PM;	1021329
79	1	05/05/2018 to 10/31/2018	Mon: -12:00 PM;Wed: 8:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1000559
80	2	11/01/2018 to 05/03/2019	Sat: 9:00 AM-12:00 PM;	1000559
81	1	01/01/2021 to 01/01/2021	Sun: 12:00 PM-4:00 PM;	1021534
82	1	06/04/2019 to 08/27/2019	Tue: 4:00 PM-7:00 PM;	1019396
83	1	07/02/2018 to 08/27/2018	Mon: 4:00 PM-7:00 PM;	1019126
84	1	05/22/2021 to 05/22/2021	Sat: 9:00 AM-1:00 PM;	1021528
85	1	12/04/2021 to 12/04/2021	Sat: 1:00 PM-4:00 PM;	1021530
86	1	10/30/2021 to 10/30/2021	Sat: 1:00 PM-4:00 PM;	1021529
87	1	05/16/2018 to 10/10/2018	Wed: 4:00 PM-7:00 PM;	1019044
88	1	06/05/2020 to 10/01/2020	Sat: 9:00 AM-1:00 PM;	1019076
89	1	01/01/2021 to 01/01/2021	Sun: 9:00 AM-2:00 PM;	1021338
90	1	03/01/2021 to 03/01/2021	Sat: 10:00 AM-2:00 PM;	1021521
91	1	01/01/2021 to 01/01/2021	Sun: 11:00 AM-1:30 PM;	1012081
92	1	01/01/2021 to 01/01/2021	Sun: 12:00 PM-4:00 PM;	1021582
93	1	06/17/2021 to 06/17/2021	Thu: 10:00 AM-3:00 PM;	1001604
94	1	05/02/2020 to 11/21/2020	Sat: 8:30 AM-12:30 PM;	1020029
95	1	06/21/2020 to 09/27/2020	Sun: 10:00 AM-2:00 PM;	1003335
96	1	07/01/2020 to 09/30/2020	Sat: 8:00 AM-11:00 AM;	1019871
97	1	01/01/2021 to 01/01/2021	Sat: 10:00 AM-2:00 PM;	1000436
98	1	06/05/2021 to 06/05/2021	Sat: 8:00 AM-12:00 PM;	1021540
99	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-12:00 PM;	1021265
100	2	06/30/2021 to 06/30/2021	Wed: 3:00 PM-6:00 PM;	1021265
101	1	05/05/2021 to 05/05/2021	Wed: 9:00 AM-1:00 PM;Fri: 5:00 PM-8:00 PM;	1021443
102	1	01/01/2021 to 01/01/2021	Sun: 11:00 AM-3:00 PM;	1019617
103	1	06/01/2020 to 10/31/2020	Sat: 9:00 AM-12:00 PM;	1019874
104	1	01/01/2020 to 12/01/2020	Thu: 9:00 AM-4:00 PM;Fri: 9:00 AM-4:00 PM;	1020102
105	1	02/18/2017 to 12/16/2017	Sat: 8:00 AM-11:00 AM;	1018735
106	1	06/01/2020 to 09/30/2020	Sat: 8:30 AM-12:00 PM;	1019875
107	1	05/23/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1020097
108	1	06/07/2022 to 06/07/2022	Tue: 4:00 PM-7:00 PM;	1021630
109	1	06/15/2021 to 06/15/2021	Tue: 3:00 PM-6:00 PM;	1019853
110	1	06/01/2019 to 10/26/2019	Sat: 9:00 AM-1:00 PM;	1019400
111	1	04/14/2018 to 11/17/2018	Sat: 7:00 AM-11:00 AM;	1010607
112	2	11/24/2018 to 12/22/2018	Sat: 10:00 AM-12:00 PM;	1010607
113	1	05/29/2021 to 05/29/2021	Sat: 8:00 AM-11:00 AM;	1011902
114	1	06/07/2021 to 06/07/2021	Mon: 4:00 PM-7:30 PM;	1021363
115	1	06/06/2018 to 08/29/2018	Wed: 3:00 PM-7:00 PM;	1008140
116	1	06/01/2021 to 06/01/2021	Thu: 11:00 AM-4:00 PM;	1002064
117	1	06/06/2019 to 09/26/2019	Thu: 4:00 PM-7:00 PM;	1011363
118	1	05/29/2021 to 05/29/2021	Sat: 9:00 AM-1:00 PM;	1001316
119	1	04/29/2021 to 04/29/2021	Thu: 4:00 PM-8:00 PM;	1001533
120	1	05/02/2018 to 09/26/2018	Wed: 4:00 PM-7:00 PM;	1018644
121	1	04/10/2021 to 04/10/2021	Sat: 7:30 AM-1:00 PM;	1021403
122	1	04/01/2018 to 12/09/2018	Sun: 10:00 AM-2:00 PM;	1005183
123	1	05/26/2018 to 10/31/2018	Sat: 8:00 AM-12:00 PM;	1019005
124	1	11/21/2021 to 11/21/2021	Sun: 10:00 AM-1:30 PM;	1021628
125	2	12/12/2021 to 12/12/2021	Sun: 10:00 AM-1:30 PM;	1021628
126	3	01/09/2022 to 01/09/2022	Sun: 10:00 AM-1:30 PM;	1021628
127	1	06/07/2018 to 09/27/2018	Thu: 4:00 PM-6:30 PM;	1019168
128	1	06/04/2018 to 09/24/2018	Mon: 11:00 AM-2:00 PM;	1019169
129	1	05/10/2020 to 10/11/2020	Sun: 9:00 AM-1:00 PM;	1019967
130	1	06/13/2021 to 06/13/2021	Sun: 8:00 AM-12:00 PM;	1021322
131	1	04/01/2020 to 12/31/2020	Sun: 9:00 AM-1:30 PM;	1010406
132	2	01/05/2020 to 03/29/2020	Sun: 9:30 AM-1:30 PM;	1010406
133	1	04/01/2021 to 04/01/2021	Thu: 10:00 AM-2:00 PM;	1012494
134	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-1:00 PM;	1020196
135	1	05/21/2020 to 10/29/2020	Thu: 4:00 PM-7:00 PM;	1019765
136	1	04/01/2018 to 09/25/2018	Tue: 8:30 AM-1:00 PM;	1005949
137	1	06/05/2019 to 09/25/2019	Wed: 3:00 PM-7:00 PM;	1019338
138	1	11/09/2018 to 04/12/2019	Fri: 3:00 PM-6:00 PM;	1019339
139	1	06/24/2019 to 10/07/2019	Mon: 3:00 PM-7:00 PM;	1019591
140	1	05/22/2021 to 05/22/2021	Sat: 9:00 AM-1:00 PM;	1021508
141	1	06/02/2018 to 10/20/2018	Sat: 10:00 AM-1:00 PM;	1011037
142	1	06/02/2018 to 10/27/2018	Sat: 10:00 AM-1:00 PM;	1012163
143	1	05/08/2021 to 05/08/2021	Sat: 9:00 AM-1:00 PM;	1011829
144	2	12/04/2021 to 12/04/2021	Sat: 11:00 AM-2:00 PM;	1011829
145	1	04/06/2019 to 09/28/2019	Sat: 8:00 AM-1:00 PM;	1018396
146	2	10/05/2019 to 11/30/2019	Sat: 9:00 AM-1:00 PM;	1018396
147	1	12/02/2017 to 12/02/2017	Sat: 9:00 AM-12:30 PM;	1018563
148	1	05/01/2020 to 10/17/2020	Tue: 2:00 PM-5:00 PM;Sat: 9:00 AM-2:00 PM;	1020098
149	1	05/04/2019 to 09/14/2019	Wed: 3:00 PM-6:00 PM;Sat: 9:00 AM-1:00 PM;	1019440
150	1	05/23/2020 to 11/28/2020	Sat: 9:00 AM-1:00 PM;	1018092
151	1	04/07/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1018313
152	1	11/03/2018 to 12/22/2018	Sat: 9:00 AM-2:00 PM;	1018316
153	1	05/09/2020 to 10/31/2020	Mon: 9:00 AM-5:00 PM;Tue: 9:00 AM-5:00 PM;Wed: 9:00 AM-5:00 PM;Thu: 9:00 AM-5:00 PM;Fri: 9:00 AM-5:00 PM;Sat: 9:00 AM-5:00 PM;Sun: 9:00 AM-5:00 PM;	1020101
154	1	06/06/2019 to 10/24/2019	Thu: 3:00 PM-6:00 PM;	1006833
155	1	04/06/2019 to 10/26/2019	Sat: 8:00 AM-12:00 PM;	1019318
156	1	05/01/2019 to 10/26/2019	Sat: 8:30 AM-12:30 PM;	1019693
157	1	07/08/2021 to 07/08/2021	Thu: 9:00 AM-2:00 PM;	1001526
158	2	07/07/2022 to 07/07/2022	Thu: 9:00 AM-2:00 PM;	1001526
159	3	07/06/2023 to 07/06/2023	Thu: 9:00 AM-2:00 PM;	1001526
160	1	05/20/2018 to 10/28/2018	Sun: 8:00 AM-12:00 PM;	1019165
161	1	06/04/2020 to 10/29/2020	Thu: 2:00 PM-6:00 PM;	1020096
162	1	06/06/2020 to 10/31/2020	Sat: 7:00 AM-2:00 PM;	1020099
163	1	01/01/2018 to 	Wed: 8:00 AM-12:00 PM;Sat: 8:00 AM-12:00 PM;	1019205
164	1	01/01/2020 to 12/31/2020	Wed: 3:00 PM-7:00 PM;Sat: 9:00 AM-1:00 PM;	1021248
165	1	11/01/2017 to 11/23/2019	Sat: 9:00 AM-1:00 PM;	1018227
166	2	02/02/2019 to 05/04/2019	Sat: 9:00 AM-1:00 PM;	1018227
167	1	05/04/2019 to 10/26/2019	Sat: 9:00 AM-2:00 PM;	1002407
168	1	11/03/2018 to 03/30/2019	Sat: 10:00 AM-2:00 PM;	1011075
169	1	05/20/2020 to 10/31/2020	Wed: 8:00 AM-2:00 PM;Sat: 8:00 AM-2:00 PM;	1020113
170	1	05/06/2021 to 05/06/2021	Thu: 4:00 PM-7:00 PM;	1018556
171	1	06/10/2018 to 10/21/2018	Sun: 11:00 AM-3:00 PM;	1019146
172	1	06/22/2019 to 	Sat: 4:00 PM-8:00 PM;	1018756
173	1	04/19/2014 to 10/27/2018	Sat: 9:00 AM-2:00 PM;	1005483
174	1	06/20/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1019905
175	1	05/05/2018 to 09/01/2018	Sat: 8:00 AM-1:00 PM;	1019257
176	1	07/10/2020 to 	Fri: 10:00 AM-2:00 PM;	1019984
177	1	07/02/2020 to 08/27/2020	Thu: 3:00 PM-6:00 PM;	1019794
178	1	01/01/2019 to 12/31/2019	Wed: 10:00 AM-3:00 PM;Sat: 10:00 AM-3:00 PM;	1019527
179	1	06/04/2020 to 11/19/2020	Thu: 1:30 PM-6:30 PM;	1021210
180	1	01/01/2022 to 01/01/2022	Sat: 8:00 AM-1:00 PM;	1021736
181	1	01/01/2020 to 12/31/2020	Sun: 10:00 AM-3:00 PM;	1018891
182	1	06/04/2021 to 06/04/2021	Fri: 3:30 PM-6:30 PM;	1021515
183	1	01/01/2021 to 12/31/2021	Sat: 9:00 AM-1:00 PM;	1021262
184	1	09/01/2020 to 10/28/2020	Wed: 10:30 AM-1:30 PM;	1019906
185	1	06/04/2020 to 09/03/2020	Thu: 4:00 PM-7:00 PM;	1019727
186	1	06/01/2018 to 10/26/2018	Fri: 1:00 PM-5:00 PM;	1017968
187	1	05/05/2018 to 11/03/2018	Sat: 8:30 AM-12:30 PM;	1008607
188	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1021311
189	1	05/05/2018 to 11/17/2018	Sat: 9:00 AM-1:00 PM;	1019218
190	1	05/16/2019 to 10/24/2019	Thu: 2:00 PM-5:00 PM;	1008953
191	2	01/01/2016 to 12/31/2016	Sat: 8:00 AM-12:30 PM;	1000843
192	1	04/13/2019 to 12/21/2019	Sat: 8:00 AM-12:00 PM;	1019492
193	1	07/08/2021 to 07/08/2021	Thu: 5:30 PM-7:00 PM;	1021524
194	1	06/06/2020 to 10/17/2020	Sat: 9:00 AM-1:00 PM;	1019965
195	1	06/04/2022 to 06/04/2022	Sat: 9:30 AM-12:30 PM;	1021728
196	1	05/26/2018 to 12/15/2018	Tue: 7:00 AM-12:00 PM;Thu: 7:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1002567
197	1	05/23/2020 to 10/03/2020	Sat: 8:00 AM-1:00 PM;	1001362
198	1	08/01/2021 to 08/01/2021	Sun: 9:00 AM-1:00 PM;	1021238
199	1	07/12/2021 to 07/12/2021	Sat: 11:00 AM-3:00 PM;Sun: 1:00 PM-5:00 PM;	1021614
200	2	07/03/2022 to 07/03/2022	Sat: 10:00 AM-3:00 PM;Sun: 1:00 PM-5:00 PM;	1021614
201	1	04/01/2020 to 	Wed: 7:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1020089
202	1	01/01/2018 to 12/31/2018	Fri: 9:00 AM-2:00 PM;	1004927
203	1	06/18/2020 to 10/29/2020	Thu: 4:00 PM-6:00 PM;	1019922
204	1	06/21/2020	Sun: 9:00 AM-1:00 PM;	1019978
205	1	11/07/2020 to 12/19/2020	Sat: 12:00 PM-1:00 PM;	1018263
206	1	06/04/2020 to 10/22/2020	Thu: 2:00 PM-6:00 PM;	1019980
207	1	01/05/2020 to 12/27/2020	Sun: 9:00 AM-1:00 PM;	1020188
208	1	04/21/2018 to 	Sat: 9:00 AM-1:00 PM;	1018459
209	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-12:00 PM;	1019997
210	1	01/01/2020 to 12/31/2020	Fri: 2:30 PM-5:30 PM;	1020160
211	1	05/06/2020 to 09/30/2020	Wed: 4:00 PM-8:00 PM;	1020183
212	1	01/01/2021 to 01/01/2021	Sat: 8:00 AM-12:00 PM;	1002674
213	1	05/11/2021 to 05/11/2021	Wed: 8:00 AM-12:00 PM;	1021575
214	1	05/22/2020 to 10/30/2020	Fri: 3:00 PM-6:00 PM;	1020117
215	1	05/19/2020 to 10/27/2020	Tue: 3:00 PM-6:00 PM;	1020118
216	1	05/23/2020 to 10/31/2020	Sat: 9:00 AM-12:00 PM;	1020119
217	1	01/05/2020 to 12/27/2020	Sun: 9:00 AM-1:00 PM;	1020184
218	1	01/01/2018 to 12/31/2018	Sat: 9:00 AM-12:00 PM;	1009034
219	1	05/01/2020 to 10/30/2020	Fri: 4:00 PM-7:00 PM;	1019810
220	2	06/02/2020 to 09/29/2020	Tue: 4:00 PM-7:00 PM;	1019810
221	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-2:00 PM;	1021202
222	1	01/01/2016 to 12/31/2016	Sat: 9:00 AM-1:30 PM;	1012038
223	1	05/10/2020 to 10/04/2020	Sun: 9:00 AM-1:00 PM;	1019772
224	1	06/12/2021 to 06/12/2021	Sat: 10:00 AM-1:00 PM;	1021435
225	1	01/01/2021 to 01/01/2021	Sat: 8:00 AM-1:00 PM;	1021294
226	1	05/07/2022 to 05/07/2022	Sun: 8:00 AM-12:00 PM;	1021655
227	1	06/15/2016 to 09/14/2016	Wed: 3:00 PM-6:00 PM;	1011930
228	1	05/19/2017 to 11/10/2017	Fri: 11:00 AM-3:00 PM;	1018359
229	1	05/01/2018 to 09/25/2018	Tue: 9:00 AM-1:00 PM;	1008450
230	1	05/07/2019 to 10/15/2019	Tue: 3:00 PM-7:00 PM;	1006651
231	1	01/01/2019 to 12/31/2019	Mon: 9:00 AM-6:00 PM;Tue: 9:00 AM-6:00 PM;Wed: 9:00 AM-6:00 PM;Thu: 9:00 AM-6:00 PM;Fri: 9:00 AM-6:00 PM;Sat: 9:00 AM-4:00 PM;Sun: 1:30 PM-4:30 PM;	1019417
232	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-12:00 PM;	1021269
233	2	03/17/2021 to 03/17/2021	Wed: 3:00 PM-6:00 PM;Sat: 7:00 AM-12:00 PM;	1021269
234	3	11/06/2021 to 11/06/2021	Sat: 9:00 AM-12:00 PM;	1021269
235	1	05/01/2020 to 09/30/2020	Fri: 8:00 AM-12:00 PM;	1008322
236	1	06/05/2021 to 06/05/2021	Sat: 8:30 AM-1:00 PM;	1021213
237	1	07/04/2020 to 10/03/2020	Sat: 9:00 AM-12:00 PM;	1020071
238	1	07/11/2020 to 10/10/2020	Mon: 3:00 PM-5:00 PM;Wed: 8:00 AM-11:00 AM;Sat: 8:00 AM-11:00 AM;	1020074
239	1	06/13/2021 to 06/13/2021	Sun: 12:00 PM-4:00 PM;	1012093
240	1	05/14/2022 to 05/14/2022	Sat: 8:30 AM-12:30 PM;	1021740
241	1	06/03/2021 to 06/03/2021	Thu: 10:00 AM-1:00 PM;	1008276
242	1	05/10/2018 to 10/18/2018	Thu: 3:30 PM-7:00 PM;	1019159
243	2	11/17/2018 to 11/17/2018	Sat: 9:00 AM-3:00 PM;	1019159
244	1	05/14/2022 to 05/14/2022	Sat: 8:00 AM-12:00 PM;	1021242
245	1	05/05/2018 to 10/13/2018	Sat: 9:00 AM-2:00 PM;	1012484
246	1	01/01/2021 to 12/31/2021	Sat: 9:00 AM-1:00 PM;	1019842
247	1	05/01/2021 to 05/01/2021	Sat: 9:00 AM-12:00 PM;	1021362
248	1	03/06/2020 to 11/06/2020	Fri: 6:00 PM-9:00 PM;	1018734
249	1	01/01/2020 to 12/31/2020	Thu: 10:00 AM-3:00 PM;	1021226
250	1	07/07/2020 to 10/27/2020	Wed: 3:00 PM-6:30 PM;	1019907
251	1	07/23/2019 to 10/08/2019	Tue: 3:00 PM-7:00 PM;	1019618
252	1	06/06/2020 to 09/19/2020	Sat: 8:00 AM-12:30 PM;	1020142
253	1	10/03/2020	Sat: 8:00 AM-12:30 PM;	1020141
254	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-2:00 PM;	1020058
255	1	01/01/2020 to 12/31/2020	Sat: 10:00 AM-3:00 PM;	1020057
256	1	01/01/2020 to 12/31/2020	Tue: 5:00 PM-9:00 PM;	1020056
257	1	05/26/2021 to 05/26/2021	Wed: 3:00 PM-6:00 PM;	1021267
258	1	05/22/2021 to 05/22/2021	Sat: 10:00 AM-2:00 PM;	1021564
259	1	05/02/2020 to 10/31/2020	Sat: 9:00 AM-12:00 PM;	1018886
260	1	01/13/2018 to 11/24/2018	Sat: 8:00 AM-12:00 PM;	1017995
261	1	06/24/2022 to 06/24/2022	Fri: 9:00 AM-12:30 PM;	1021741
262	1	01/01/2020 to 12/31/2020	Tue: 8:00 AM-5:00 PM;Wed: 8:00 AM-5:00 PM;Thu: 8:00 AM-5:00 PM;Fri: 8:00 AM-5:00 PM;Sat: 8:00 AM-5:00 PM;	1011689
263	1	05/19/2015 to 10/20/2015	Tue: 3:00 PM-6:00 PM;	1005834
264	1	06/01/2020 to 09/30/2020	Thu: 4:00 PM-7:00 PM;	1019881
265	1	05/21/2021 to 05/21/2021	Fri: 3:00 PM-6:00 PM;	1004754
266	1	05/06/2020 to 08/26/2020	Wed: 11:00 AM-2:00 PM;	1008606
267	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1021310
268	1	01/01/2020 to 12/31/2020	Sat: 7:30 AM-1:00 PM;	1020128
269	1	01/01/2020 to 12/31/2020	Wed: 7:30 AM-1:00 PM;	1020129
270	1	06/02/2020 to 09/29/2020	Tue: 7:30 AM-12:00 PM;	1020127
271	1	04/17/2019 to 10/31/2019	Thu: 3:00 PM-6:00 PM;	1001763
272	1	05/04/2018 to 09/28/2018	Fri: 4:00 PM-6:00 PM;	1019104
273	1	06/10/2021 to 06/10/2021	Thu: 12:00 PM-6:00 PM;	1008409
274	1	06/09/2020 to 09/29/2020	Tue: 3:00 PM-7:00 PM;	1021237
275	1	05/05/2018 to 10/27/2018	Wed: 8:00 AM-12:00 PM;Sat: 8:00 AM-12:00 PM;	1004360
276	1	01/01/2022 to 01/01/2022	Thu: 9:00 AM-1:00 PM;	1021653
277	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1019141
278	2	04/13/2021 to 04/13/2021	Tue: 4:00 PM-7:00 PM;	1019141
279	1	01/01/2019 to 12/31/2019	Mon: 11:30 AM-12:30 PM;	1005250
280	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-1:00 PM;	1021199
281	1	10/05/2019 to 10/26/2019	Sat: 8:00 AM-12:00 PM;	1019717
282	2	05/16/2020 to 08/29/2020	Sat: 8:00 AM-11:00 AM;	1019717
283	1	06/07/2020 to 09/27/2020	Sun: 9:00 AM-1:00 PM;	1004255
284	1	06/09/2018 to 10/20/2018	Sat: 9:00 AM-1:00 PM;	1017956
285	2	11/03/2018 to 05/03/2019	Sat: 9:00 AM-1:00 PM;	1017956
286	1	06/22/2017 to 09/14/2017	Wed: 3:00 PM-7:00 PM;	1017930
287	1	06/23/2021 to 06/23/2021	Wed: 2:30 PM-6:30 PM;	1000303
288	1	07/01/2021 to 07/01/2021	Thu: 4:00 PM-7:00 PM;	1021433
289	1	05/23/2021 to 05/23/2021	Thu: 5:00 PM-9:00 PM;Sun: 8:00 AM-2:00 PM;	1021420
290	1	06/25/2021 to 06/25/2021	Fri: 8:00 AM-12:00 PM;	1006460
291	1	05/06/2018 to 12/16/2018	Sun: 10:00 AM-1:00 PM;	1005940
292	1	07/05/2018 to 10/25/2018	Thu: 3:00 PM-6:00 PM;	1005941
293	1	01/01/2018 to 04/01/2018	Sat: 10:00 AM-1:00 PM;	1019206
294	1	04/07/2018 to 12/15/2018	Sat: 9:00 AM-1:00 PM;	1005943
295	1	01/01/2021 to 01/01/2021	Sun: 8:00 AM-1:00 PM;	1002106
296	1	05/26/2018 to 09/08/2018	Sat: 9:00 AM-1:00 PM;	1019061
297	1	06/01/2021 to 06/01/2021	Sat: 8:00 AM-1:00 PM;	1000579
298	1	06/06/2020 to 09/26/2020	Sat: 8:00 AM-12:00 PM;	1019840
299	1	04/17/2021 to 04/17/2021	Sat: 8:00 AM-11:30 PM;	1021441
300	1	04/07/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1019110
301	1	05/09/2020 to 10/10/2020	Sun: 8:30 AM-11:30 AM;	1019741
302	1	04/01/2021 to 04/01/2021	Sat: 9:00 AM-1:00 PM;	1019704
303	1	06/04/2018 to 10/29/2018	Mon: 2:00 PM-5:00 PM;	1018381
304	1	06/04/2020 to 10/01/2020	Thu: 10:00 AM-4:00 PM;	1019823
305	1	04/25/2020 to 11/21/2020	Sat: 9:00 AM-12:00 PM;	1019763
306	1	01/01/2015 to 12/31/2015	Wed: 10:00 AM-1:00 PM;	1000549
307	1	06/03/2021 to 06/03/2021	Thu: 10:30 AM-1:30 PM;	1002808
308	1	07/15/2019 to 11/25/2020	Mon: 12:00 PM-6:00 PM;Wed: 12:00 PM-6:00 PM;Fri: 12:00 PM-6:00 PM;	1019474
309	1	11/04/2017 to 05/05/2018	Sat: 9:00 AM-12:00 PM;	1018969
310	1	05/13/2020 to 11/07/2020	Sat: 8:30 AM-12:30 PM;	1019821
311	1	04/01/2020 to 12/19/2020	Sat: 9:00 AM-1:00 PM;	1020135
312	1	04/01/2020 to 12/23/2020	\N	1020137
313	1	05/28/2020 to 05/28/2020	Thu: 4:00 PM-7:00 PM;	1021232
314	1	06/06/2021 to 06/06/2021	Sun: 10:00 AM-1:00 PM;	1001290
315	1	06/13/2020 to 10/17/2020	Sat: 9:00 AM-1:00 PM;	1000210
316	1	06/10/2020 to 10/07/2020	Wed: 3:00 PM-7:00 PM;	1009656
317	1	04/03/2021 to 04/03/2021	Sat: 8:00 AM-12:00 PM;	1019790
318	2	11/06/2021 to 11/06/2021	Sat: 9:00 AM-12:00 PM;	1019790
319	3	06/01/2021 to 06/01/2021	Tue: 10:00 AM-1:00 PM;Thu: 3:00 AM-6:00 PM;	1019790
320	1	01/01/2018 to 12/31/2018	Wed: 11:00 AM-5:00 PM;Sat: 11:00 AM-5:00 PM;	1010758
321	1	05/04/2019 to 10/26/2019	Sat: 7:00 AM-12:00 PM;	1019483
322	1	05/20/2021 to 05/20/2021	Thu: 4:00 PM-6:30 PM;	1019199
323	1	06/04/2020 to 09/24/2020	Thu: 4:00 PM-7:00 PM;	1020124
324	1	01/01/2018 to 12/31/2018	Mon: 9:00 AM-5:30 PM;Tue: 9:00 AM-5:30 PM;Wed: 9:00 AM-5:30 PM;Thu: 9:00 AM-5:30 PM;Fri: 9:00 AM-5:30 PM;Sat: 9:00 AM-5:30 PM;Sun: 10:00 AM-4:00 PM;	1011003
325	2	01/01/2018 to 12/31/2018	Mon: 9:00 AM-5:30 PM;Tue: 9:00 AM-5:30 PM;Wed: 9:00 AM-5:30 PM;Thu: 9:00 AM-5:30 PM;Fri: 9:00 AM-6:00 PM;Sat: 9:00 AM-5:30 PM;Sun: 10:00 AM-5:00 PM;	1011003
326	1	05/03/2021 to 05/03/2021	Mon: 1:00 PM-4:00 PM;	1021541
327	1	06/01/2019 to 10/31/2019	Thu: 3:00 PM-7:00 PM;	1019592
328	1	06/12/2018 to 10/30/2018	Tue: 10:00 AM-2:00 PM;Fri: 10:00 AM-2:00 PM;	1019042
329	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-1:00 PM;	1012030
330	1	04/24/2021 to 04/24/2021	Sat: 7:00 AM-12:00 PM;	1021396
331	1	05/02/2018 to 10/31/2018	Wed: 9:00 AM-2:00 PM;	1006766
332	1	05/06/2019 to 10/07/2019	Mon: 5:00 PM-7:00 PM;	1018190
333	1	06/03/2022 to 06/03/2022	Fri: 4:00 PM-8:00 PM;	1021639
334	1	01/01/2019 to 12/31/2019	Wed: 5:00 PM-8:00 PM;	1012666
335	1	06/02/2018 to 10/27/2018	Sat: 7:30 AM-12:00 PM;	1008959
336	1	04/16/2022 to 04/16/2022	Wed: 9:00 AM-1:00 PM;Sat: 9:00 AM-1:00 PM;	1021691
337	2	12/03/2022 to 12/03/2022	Sat: 10:00 AM-2:00 PM;	1021691
338	1	06/03/2020 to 	Wed: 4:30 PM-7:30 PM;	1018629
339	1	01/17/2018 to 12/21/2019	Sat: 8:00 AM-11:00 AM;	1010975
340	1	01/01/2020 to 01/01/2020	Thu: 4:00 PM-6:00 PM;	1004382
341	2	01/01/2021 to 01/01/2021	Thu: 4:00 PM-6:00 PM;	1004382
342	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-11:00 AM;	1018221
343	1	06/20/2019 to 10/03/2019	Thu: 2:00 PM-8:00 PM;	1000368
344	1	06/06/2019 to 08/29/2019	Thu: 4:00 PM-7:00 PM;	1019530
345	1	04/20/2019 to 10/26/2019	Sat: 9:00 AM-12:00 PM;	1019529
346	1	01/01/2019 to 12/31/2019	Sun: 10:00 AM-2:00 PM;	1019531
347	1	11/03/2018 to 04/06/2019	Sat: 9:00 AM-12:00 PM;	1019258
348	1	06/02/2019 to 10/27/2019	Sun: 11:00 AM-2:00 PM;	1019325
349	1	05/05/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1019296
350	2	11/03/2018	Sat: 9:00 AM-1:00 PM;	1019296
351	1	01/01/2016 to 12/31/2016	Sat: 8:00 AM-12:00 PM;	1012552
352	2	06/01/2016 to 09/28/2016	Wed: 8:00 AM-12:00 PM;	1012552
353	1	06/23/2021 to 06/23/2021	Wed: 4:30 PM-6:30 PM;	1009993
354	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-1:00 PM;	1021330
355	1	11/27/2021 to 11/27/2021	Sat: 10:00 AM-2:00 PM;	1021331
356	1	01/01/2020 to 12/31/2020	Sat: 10:00 AM-3:00 PM;	1021227
357	1	01/01/2018 to 12/31/2018	Tue: 9:00 AM-1:00 PM;	1019260
358	1	10/17/2018 to 07/10/2019	Wed: 1:00 PM-5:00 PM;	1019261
359	1	01/01/2018 to 12/31/2018	Tue: 9:00 AM-1:00 PM;	1019262
360	1	06/19/2021 to 06/19/2021	Sat: 9:00 AM-1:00 PM;	1002470
361	1	04/18/2018 to 11/28/2018	Wed: 11:00 AM-3:00 PM;	1012365
362	1	06/05/2021 to 06/05/2021	Sat: 8:00 AM-1:00 PM;	1001869
363	1	01/01/2021 to 01/01/2021	Tue: 2:00 AM-7:00 PM;	1021346
364	1	01/01/2019 to 12/31/2019	Tue: 5:00 PM-7:00 PM;Sat: 9:00 AM-1:00 PM;	1019701
365	1	11/02/2019 to 04/18/2020	Sat: 9:00 AM-1:00 PM;	1019702
366	1	05/02/2020 to 09/26/2020	Sat: 8:00 AM-12:00 PM;	1020109
367	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-12:00 PM;	1021387
368	1	07/12/2019 to 10/04/2019	Fri: 4:00 PM-7:00 PM;	1019539
369	1	06/12/2021 to 06/12/2021	Mon: 7:00 AM-12:00 PM;Wed: 7:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1021408
370	1	05/01/2018 to 10/31/2018	Sun: 8:00 AM-12:00 PM;	1019163
371	1	05/01/2018 to 10/01/2018	Sat: 8:00 AM-12:00 PM;	1012505
372	1	06/01/2021 to 06/01/2021	Fri: 4:00 PM-6:00 PM;	1019880
373	1	07/19/2018 to 10/18/2018	Thu: 4:00 PM-6:00 PM;	1012254
374	1	06/02/2018 to 09/29/2018	Sat: 10:00 AM-1:00 PM;	1019100
375	1	04/24/2021 to 04/24/2021	Sat: 8:00 AM-12:00 PM;	1021457
376	1	06/01/2018 to 09/28/2018	Fri: 2:00 PM-7:00 PM;	1018945
377	1	05/01/2021 to 05/01/2021	Wed: 3:00 PM-6:00 PM;Sat: 8:00 AM-11:00 AM;	1021570
378	1	06/05/2018 to 10/16/2018	Tue: 3:00 PM-6:00 PM;	1012296
379	1	06/03/2021 to 06/03/2021	Thu: 10:00 AM-2:00 PM;	1011103
380	1	05/06/2018 to 09/30/2018	Sun: 8:00 AM-12:00 PM;	1002536
381	1	08/13/2020 to 09/24/2020	Thu: 5:00 PM-8:00 PM;	1020061
382	1	02/06/2021 to 02/06/2021	Sat: 9:00 AM-1:00 PM;	1018416
383	1	05/05/2018 to 12/22/2018	Sun: 9:00 AM-1:00 PM;	1019308
384	1	10/31/2020 to 05/01/2020	Sat: 9:00 AM-2:00 PM;	1020191
385	1	06/12/2021 to 06/12/2021	Sat: 11:00 AM-3:00 PM;	1021591
386	1	04/02/2022 to 04/02/2022	Sat: 9:00 AM-1:00 PM;	1021649
387	1	06/02/2018 to 09/29/2018	Sat: 10:00 AM-2:00 PM;	1007255
388	1	05/03/2014 to 05/03/2014	Tue: 2:00 PM-6:00 PM;Sat: 8:00 AM-1:00 PM;	1003628
389	1	01/01/2021 to 01/01/2021	Sun: 10:00 AM-1:00 PM;	1021318
390	1	09/01/2012 to 	Sat: 8:00 AM-12:00 PM;	1021261
391	1	05/12/2018 to 10/13/2018	Sun: 8:00 AM-12:00 PM;	1018958
392	1	06/03/2021 to 06/03/2021	Thu: 3:00 PM-7:00 PM;	1019458
393	2	10/07/2021 to 10/07/2021	Thu: 3:00 PM-6:00 PM;	1019458
394	1	04/01/2020 to 	Wed: 3:30 PM-6:00 PM;Sat: 9:00 AM-12:00 PM;	1018816
395	1	05/16/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1019742
396	1	07/26/2019 to 10/27/2019	Fri: 4:00 PM-7:00 PM;Sat: 1:00 PM-5:00 PM;Sun: 1:00 PM-5:00 PM;	1019439
397	1	07/18/2017 to 10/10/2017	Tue: 11:30 AM-1:30 PM;	1018706
398	1	06/06/2020 to 10/31/2020	Sat: 9:00 AM-12:00 PM;	1020111
399	1	05/05/2021 to 05/05/2021	Wed: 2:00 PM-6:00 PM;	1003046
400	1	06/06/2018 to 10/03/2018	Wed: 2:30 PM-6:00 PM;	1009829
401	1	05/15/2021 to 05/15/2021	Sat: 9:00 AM-3:00 PM;	1009894
402	1	05/09/2021 to 05/09/2021	Sun: 9:00 AM-2:00 PM;	1021296
403	1	04/24/2021 to 04/24/2021	Sat: 8:30 AM-1:00 PM;	1010954
404	1	01/09/2021 to 01/09/2021	Sat: 9:00 AM-1:00 PM;	1016793
405	1	03/07/2021 to 03/07/2021	Sun: 10:00 AM-3:00 PM;	1010969
406	1	01/09/2021 to 01/09/2021	Sun: 10:00 AM-3:00 PM;	1010972
407	2	05/15/2021 to 05/15/2021	Sat: 9:00 AM-3:00 PM;	1010972
408	1	06/11/2021 to 06/11/2021	Fri: 9:00 AM-2:00 PM;	1010958
409	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1016792
410	2	05/08/2021 to 05/08/2021	Sat: 8:30 AM-1:00 PM;	1016792
411	1	01/01/2021 to 01/01/2021	Sun: 10:00 AM-3:00 PM;	1009895
412	1	06/11/2021 to 06/11/2021	Fri: 8:30 AM-4:00 PM;	1010982
413	1	05/09/2021 to 05/09/2021	Sun: 8:30 AM-2:00 PM;	1010960
414	1	05/01/2018 to 12/01/2018	Sat: 9:00 AM-1:00 PM;	1016867
415	2	01/01/2019 to 04/01/2019	Sat: 10:00 AM-12:00 PM;	1016867
416	1	01/01/2019 to 12/31/2019	Thu: 4:00 PM-7:00 PM;	1019667
417	1	04/02/2021 to 04/02/2021	Fri: 3:00 PM-7:00 PM;	1009043
418	1	05/07/2016 to 10/29/2016	Sat: 8:00 AM-1:00 PM;	1003643
419	1	01/01/2020 to 12/31/2020	Sun: 10:00 AM-3:00 PM;	1020064
420	1	05/08/2021 to 05/08/2021	Sat: 7:30 AM-12:00 PM;	1020000
421	1	November 21 to April 17	Sat: 10:00 AM-12:00 PM;	1020001
422	1	04/20/2019 to 10/05/2019	Thu: 5:00 PM-8:00 PM;Sat: 8:00 AM-12:00 PM;	1019370
423	1	04/02/2020 to 09/24/2020	Thu: 6:00 PM-9:00 PM;	1019944
424	1	04/21/2018 to 10/27/2018	Wed: 3:00 PM-6:00 PM;Sat: 9:00 AM-12:00 PM;	1000841
425	1	06/05/2020 to 10/01/2020	Fri: 3:00 PM-7:00 PM;	1019401
426	1	05/01/2021 to 05/01/2021	Sat: 7:30 AM-1:00 PM;	1021631
427	1	05/01/2018 to 09/29/2018	Fri: 8:00 AM-1:00 PM;	1008853
428	1	05/19/2018 to 10/27/2018	Sat: 7:00 AM-12:00 PM;	1002400
429	1	05/17/2018 to 10/18/2018	Thu: 4:00 PM-6:00 PM;	1019032
430	1	05/23/2020 to 10/31/2020	Sat: 7:00 AM-12:00 PM;	1019856
431	1	01/01/2018 to 12/31/2018	Sat: 8:00 AM-12:00 PM;	1019216
432	1	05/12/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1012243
433	1	06/06/2018 to 09/26/2018	Wed: 11:00 AM-3:00 PM;	1012256
434	1	05/25/2019 to 10/26/2019	Sat: 7:00 AM-12:00 PM;	1019654
435	1	05/04/2019 to 09/21/2019	Sat: 9:00 AM-1:00 PM;	1019341
436	1	05/29/2018 to 10/09/2018	Tue: 3:00 PM-6:30 PM;	1019083
437	1	06/01/2021 to 06/01/2021	Tue: 3:00 PM-6:00 PM;	1009757
438	1	05/25/2019 to 10/26/2019	Sat: 9:00 AM-1:00 PM;	1018930
439	2	11/02/2019 to 12/14/2019	Sat: 9:00 AM-1:00 PM;	1018930
440	1	05/04/2019 to 10/26/2019	Sat: 9:00 AM-1:00 PM;	1003977
441	1	05/07/2019 to 09/24/2019	Tue: 4:00 PM-8:00 PM;	1018621
442	1	01/11/2020 to 04/25/2020	Sat: 9:00 AM-1:00 PM;	1019721
443	2	05/04/2019 to 12/19/2020	Sat: 8:00 AM-12:00 PM;	1019721
444	1	01/01/2022 to 01/01/2022	Sat: 8:00 AM-1:00 PM;	1021716
445	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-1:00 PM;	1021411
446	1	01/01/2018 to 12/31/2018	Wed: 1:00 PM-6:00 PM;	1005281
447	1	05/12/2019 to 10/27/2019	Sun: 9:00 AM-1:00 PM;	1019525
448	1	05/16/2020 to 10/17/2020	Thu: 2:00 PM-6:00 PM;Sat: 8:00 AM-12:00 PM;	1019729
449	1	06/05/2019 to 09/25/2019	Wed: 3:30 PM-7:30 PM;	1004676
450	1	05/01/2012 to 09/31/2012	Thu: 4:00 PM-8:00 PM;	1005358
451	2	04/05/2018 to 09/27/2018	Thu: 4:00 PM-8:00 PM;	1005358
452	1	05/02/2020 to 05/02/2020	Sat: 7:00 AM-12:00 PM;	1005197
453	1	07/14/2020 to 09/29/2020	Tue: 11:00 AM-1:00 PM;	1019994
454	1	05/08/2021 to 05/08/2021	Sat: 8:00 AM-12:00 PM;	1018953
455	2	10/02/2021 to 10/02/2021	Sat: 9:00 AM-12:00 PM;	1018953
456	1	04/04/2020 to 11/21/2020	Sat: 8:00 AM-12:00 PM;	1000312
457	2	12/05/2020 to 12/26/2020	Sat: 10:00 AM-12:00 PM;	1000312
458	3	04/22/2020 to 11/18/2020	Wed: 3:00 PM-6:00 PM;	1000312
459	1	06/04/2018 to 10/01/2018	Mon: 2:30 PM-6:00 PM;	1009830
460	1	05/06/2021 to 05/06/2021	Thu: 3:00 PM-7:00 PM;	1012345
461	1	06/01/2018 to 09/28/2018	Fri: 4:00 PM-8:00 PM;	1019082
462	1	05/30/2020 to 08/24/2020	Thu: 4:00 PM-7:00 PM;	1019870
463	1	01/01/2021 to 01/01/2021	Tue: 4:00 PM-7:00 PM;	1021275
464	1	04/13/2017 to 11/15/2018	Thu: 4:00 PM-8:00 PM;	1018159
465	1	07/07/2021 to 07/07/2021	Wed: 3:00 PM-6:30 PM;	1021303
466	1	10/23/2020 to 10/23/2020	Thu: 2:00 PM-6:00 PM;	1021414
467	1	01/01/2018 to 12/31/2018	Sun: 10:00 AM-2:00 PM;	1011673
468	2	01/01/2018 to 12/31/2018	Sun: 10:00 AM-2:00 PM;	1011673
469	1	06/13/2018 to 10/03/2018	Wed: 4:00 PM-7:00 PM;	1019079
470	1	01/01/2020 to 12/31/2020	Mon: 3:30 PM-7:30 PM;Thu: 3:30 PM-7:30 PM;	1020133
471	1	04/06/2021 to 04/06/2021	Tue: 3:30 PM-6:30 PM;	1011113
472	2	11/30/2021 to 11/30/2021	Tue: 3:00 PM-6:00 PM;	1011113
473	1	07/02/2019 to 10/29/2019	Tue: 12:00 PM-7:00 PM;	1019510
474	1	04/15/2020 to 11/25/2020	Wed: 11:00 AM-2:00 PM;	1020172
475	1	02/05/2020 to 12/30/2020	Wed: 4:00 PM-7:00 PM;	1012717
476	1	06/15/2018 to 10/12/2018	Fri: 2:30 PM-6:00 PM;	1019094
477	1	06/17/2021 to 06/17/2021	Thu: 10:00 AM-2:00 PM;	1021300
478	1	05/23/2018 to 10/24/2018	Wed: 3:00 PM-7:00 PM;	1019125
479	1	05/22/2022 to 05/22/2022	Sun: 10:00 AM-2:00 PM;	1021698
480	1	05/01/2021 to 05/01/2021	Sat: 9:00 AM-1:00 PM;	1009867
481	2	01/09/2021 to 01/09/2021	Sat: 10:00 AM-12:00 PM;	1009867
482	1	05/05/2019 to 09/29/2019	Sun: 1:00 PM-4:00 PM;	1019624
483	1	06/12/2022 to 06/12/2022	Sun: 10:00 AM-2:00 PM;	1021710
484	1	01/01/2020 to 12/31/2020	Fri: 3:00 PM-7:30 PM;	1021228
485	1	01/01/2021 to 01/01/2021	Sat: 8:00 AM-12:00 PM;	1012783
486	1	05/01/2021 to 05/01/2021	Sat: 9:00 AM-2:00 PM;	1012160
487	1	05/25/2018 to 10/26/2018	Fri: 9:00 AM-1:00 PM;	1019118
488	1	01/01/2022 to 01/01/2022	Sat: 8:00 AM-9:00 AM;Sun: 9:00 AM-1:00 PM;	1021652
489	1	05/20/2021 to 05/20/2021	Sun: 8:00 AM-1:00 PM;	1021574
490	1	07/09/2020 to 10/29/2020	Thu: 5:00 PM-9:00 PM;	1019936
491	1	05/26/2016 to 10/15/2020	Fri: 4:00 PM-6:00 PM;	1012634
492	1	01/01/2020 to 12/31/2020	Thu: 5:00 PM-8:00 PM;	1019921
493	1	05/29/2021 to 05/29/2021	Sat: 8:00 AM-12:00 PM;	1021587
494	1	05/12/2018 to 10/20/2018	Sat: 9:00 AM-12:00 PM;	1018900
495	1	06/09/2020 to 	Tue: 8:00 AM-1:00 PM;Fri: 8:00 AM-1:00 PM;	1020112
496	1	06/23/2018 to 10/06/2018	Sat: 9:30 AM-12:30 PM;	1018717
497	1	05/06/2018 to 11/25/2018	Sun: 10:00 AM-2:00 PM;	1002657
498	2	12/02/2018 to 12/30/2018	Sun: 10:00 AM-12:00 PM;	1002657
499	3	01/13/2019 to 04/28/2019	Sun: 10:00 AM-12:00 PM;	1002657
500	1	06/19/2021 to 06/19/2021	Sat: 9:00 AM-1:00 PM;	1002769
501	1	01/01/2021 to 01/01/2021	Sat: 10:00 AM-2:00 PM;	1019398
502	1	01/01/2016 to 12/31/2016	Sun: 8:00 AM-1:00 PM;	1012045
503	1	07/28/2018 to 09/29/2018	Sat: 9:00 AM-12:00 PM;	1018940
504	1	06/06/2019 to 09/26/2019	Thu: 3:30 PM-6:30 PM;	1019684
505	1	04/01/2017 to 10/28/2017	Sat: 8:00 AM-1:00 PM;	1018765
506	1	06/06/2019 to 09/26/2019	Thu: 3:00 PM-7:00 PM;	1019687
507	1	06/09/2014 to 06/09/2014	Mon: 10:00 AM-5:00 PM;	1006678
508	1	05/04/2019 to 09/28/2019	Sat: 11:00 AM-3:00 PM;	1003568
509	1	06/13/2020 to 09/26/2020	Sat: 10:00 AM-12:00 PM;	1020053
510	1	04/23/2020 to 11/24/2020	Thu: 8:00 AM-1:00 PM;	1019954
511	2	11/28/2020 to 12/31/2020	Thu: 9:00 AM-12:00 PM;	1019954
512	1	06/11/2022 to 06/11/2022	Sat: 9:00 AM-1:00 PM;	1010195
513	1	01/01/2019 to 12/31/2019	Fri: 9:00 AM-10:00 AM;	1005267
514	1	05/03/2018 to 10/25/2018	Thu: 2:30 PM-6:00 PM;	1007798
515	1	06/07/2018 to 10/25/2018	Thu: 3:00 AM-6:00 PM;	1019081
516	1	05/06/2020 to 10/14/2020	Wed: 4:00 PM-8:00 PM;	1018622
517	1	05/12/2018 to 10/27/2018	Sat: 8:00 AM-1:00 PM;	1019186
518	1	05/12/2018 to 	Sat: 8:00 AM-11:00 AM;	1019049
519	1	05/07/2019 to 10/15/2019	Tue: 3:00 PM-7:00 PM;	1018562
520	1	06/06/2019 to 08/01/2019	Thu: 4:00 PM-7:00 PM;	1019457
521	2	09/12/2019 to 10/10/2019	Thu: 4:00 PM-7:00 PM;	1019457
522	1	05/04/2019 to 10/26/2019	Sat: 8:00 AM-1:00 PM;	1010889
523	1	05/01/2020 to 10/30/2020	Fri: 4:00 PM-7:00 PM;	1019841
524	1	05/18/2021 to 05/18/2021	Tue: 5:00 PM-8:00 PM;	1021514
525	1	06/12/2019 to 09/25/2019	Wed: 3:30 PM-5:00 PM;	1019499
526	1	01/01/2019 to 12/31/2019	Wed: 8:30 AM-1:00 PM;Sat: 8:30 AM-1:00 PM;	1019523
527	1	05/04/2018 to 09/28/2018	Sat: 5:00 PM-8:00 PM;	1018937
528	1	06/04/2019 to 09/10/2019	Tue: 3:00 PM-6:00 PM;	1019436
529	1	06/04/2022 to 06/04/2022	Sat: 9:00 AM-1:00 PM;	1021666
530	1	05/30/2018 to 09/19/2018	Wed: 3:00 PM-7:00 PM;	1018131
531	1	03/20/2021 to 03/20/2021	Sat: 10:00 AM-1:00 PM;	1021388
532	2	05/01/2021 to 05/01/2021	Sat: 8:00 AM-12:00 PM;	1021388
533	3	07/03/2021 to 07/03/2021	Wed: 8:00 AM-12:00 PM;Sat: 8:00 AM-12:00 PM;	1021388
534	4	11/06/2021 to 11/06/2021	Sat: 10:00 AM-1:00 PM;	1021388
535	1	01/01/2020 to 12/31/2020	Thu: 12:00 PM-5:00 PM;	1005069
536	2	10/01/2012 to 12/31/2012	\N	1005069
537	1	04/24/2021 to 04/24/2021	Sat: 8:00 AM-1:00 PM;	1021404
538	1	04/03/2021 to 04/03/2021	Sat: 8:00 AM-12:00 PM;	1021620
539	2	11/06/2021 to 11/06/2021	Sat: 10:00 AM-12:00 PM;	1021620
540	1	01/01/2018 to 12/31/2018	Sat: 8:00 AM-1:00 PM;	1005159
541	1	05/22/2021 to 05/22/2021	Sat: 8:00 AM-1:00 PM;	1021538
542	1	01/01/2021 to 01/01/2021	Sat: 8:00 AM-12:00 PM;	1021581
543	1	04/02/2020 to 10/29/2020	Thu: 3:00 PM-5:30 PM;	1019993
544	1	04/04/2020 to 10/31/2020	Sat: 8:00 AM-1:00 PM;	1020079
545	1	04/04/2020 to 10/31/2020	Sat: 8:00 AM-1:00 PM;	1020080
546	1	01/16/2021 to 01/16/2021	Sun: 9:00 AM-1:00 PM;	1021595
547	1	01/01/2021 to 12/31/2021	Wed: 3:00 PM-7:00 PM;	1019862
548	1	07/15/2020 to 09/30/2020	Wed: 4:30 PM-6:30 PM;	1018427
549	1	12/23/2018 to 12/01/2020	Sun: 9:00 AM-2:00 PM;	1016870
550	1	05/08/2021 to 05/08/2021	Sat: 8:30 AM-12:00 PM;	1021460
551	1	05/02/2020 to 09/26/2020	Thu: 4:00 PM-7:00 PM;Sat: 9:00 AM-1:00 PM;	1019800
552	1	04/03/2018 to 11/20/2018	Tue: 4:00 AM-6:00 PM;	1012627
553	1	05/01/2018 to 10/30/2018	Tue: 2:30 PM-6:30 PM;	1002721
554	1	05/05/2018 to 10/20/2018	Sat: 8:00 AM-12:00 PM;	1018973
555	1	06/04/2022 to 06/04/2022	Sat: 9:00 AM-12:00 PM;	1021676
556	1	06/04/2022 to 06/04/2022	Sat: 8:00 AM-12:00 PM;	1021665
557	1	01/01/2020 to 12/31/2020	Tue: 10:00 AM-2:00 PM;Thu: 10:00 AM-2:00 PM;Sat: 8:00 AM-2:00 PM;	1020193
558	1	07/14/2018 to 10/13/2018	Wed: 3:00 PM-5:00 PM;Sat: 10:00 AM-2:00 PM;	1012308
559	1	05/02/2021 to 05/02/2021	Sun: 11:00 AM-2:00 PM;	1019771
560	1	06/09/2018 to 10/13/2018	Sat: 10:00 AM-1:00 PM;	1018193
561	1	01/01/2020 to 12/31/2020	Tue: 3:00 PM-7:00 PM;Fri: 3:00 PM-7:00 PM;	1020008
562	1	07/07/2019 to 08/18/2019	Sun: 11:00 AM-2:00 PM;	1019677
563	1	06/05/2019 to 10/23/2019	Wed: 9:30 AM-1:30 PM;	1004377
564	1	06/07/2020 to 10/25/2020	Sun: 9:00 AM-1:00 PM;	1019914
565	1	06/13/2020 to 10/31/2020	Tue: 2:00 PM-6:00 PM;Sat: 8:00 AM-1:00 PM;	1019897
566	1	05/30/2020 to 10/10/2020	Sat: 9:00 AM-1:00 PM;	1020091
567	1	08/16/2020 to 10/25/2020	Sun: 9:30 AM-1:30 PM;	1020065
568	1	05/08/2021 to 05/08/2021	Sat: 9:00 AM-12:00 PM;	1021453
569	2	06/26/2021 to 06/26/2021	Tue: 9:00 AM-2:00 PM;Thu: 9:00 AM-2:00 PM;Sat: 7:00 AM-2:00 PM;Sun: 9:00 AM-2:00 PM;	1021453
570	3	11/06/2021 to 11/06/2021	Sat: 9:00 AM-2:00 PM;	1021453
571	1	06/05/2018 to 09/25/2018	Tue: 5:00 PM-8:00 PM;	1019123
572	1	04/24/2021 to 04/24/2021	Sat: 8:00 AM-12:00 PM;	1000958
573	2	11/20/2021 to 11/20/2021	Sat: 8:00 AM-12:00 PM;	1000958
574	1	05/04/2022 to 05/04/2022	Wed: 4:00 PM-8:00 PM;	1021638
575	1	05/21/2021 to 05/21/2021	Fri: 4:00 PM-7:00 PM;	1021504
576	1	05/05/2020 to 10/27/2020	Tue: 4:00 PM-7:00 PM;	1002803
577	1	06/07/2018 to 09/27/2018	Thu: 4:00 PM-7:00 PM;	1018989
578	1	01/01/2022 to 01/01/2022	Sat: 7:00 AM-12:00 PM;	1021680
579	1	05/01/2018 to 11/23/2018	Thu: 4:00 PM-6:00 PM;Sat: 8:00 AM-10:00 AM;	1018505
580	2	11/01/2018 to 12/01/2019	Thu: 4:00 PM-6:00 PM;Sat: 9:00 AM-11:00 AM;	1018505
581	1	06/05/2018 to 09/25/2018	Tue: 4:00 PM-8:00 PM;	1019101
582	1	05/11/2019 to 05/11/2019	Wed: 3:00 PM-6:00 PM;Sat: 8:00 AM-2:00 PM;	1002880
583	2	05/22/2021 to 05/22/2021	Wed: 3:00 PM-6:00 PM;Sat: 8:00 AM-2:00 PM;	1002880
584	1	04/24/2021 to 04/24/2021	Sat: 8:30 AM-12:00 PM;	1019298
585	2	05/04/2021 to 05/04/2021	Tue: 8:30 AM-12:00 PM;	1019298
586	3	01/09/2021 to 01/09/2021	Sat: 10:00 AM-11:30 AM;	1019298
587	1	05/12/2018 to 09/01/2018	Sat: 8:00 AM-12:00 PM;	1019147
588	1	06/01/2022 to 06/01/2022	Wed: 3:30 PM-6:30 PM;	1021654
589	1	04/25/2020 to 	Tue: 8:00 AM-4:00 PM;Sat: 8:00 AM-1:00 PM;	1020092
590	1	05/30/2020 to 08/29/2020	Sun: 9:00 AM-1:00 PM;	1020007
591	1	05/30/2021 to 05/30/2021	Sun: 2:00 PM-5:00 PM;	1021565
592	1	01/01/2019 to 02/01/2019	Sat: 9:00 AM-12:00 PM;	1012429
593	2	03/01/2019 to 06/01/2019	Sat: 9:00 AM-1:00 PM;	1012429
594	3	07/01/2019 to 09/01/2019	Sat: 9:00 AM-1:00 PM;	1012429
595	4	10/01/2019 to 12/01/2019	Sat: 9:00 AM-1:00 PM;	1012429
596	1	05/10/2017 to 10/11/2017	Wed: 4:00 PM-7:00 PM;	1018415
597	1	01/01/2021 to 01/01/2021	Sat: 8:00 AM-2:00 PM;Sun: 10:00 AM-2:00 PM;	1021353
598	1	03/20/2019 to 12/18/2019	Wed: 3:00 PM-7:00 PM;	1019600
599	1	03/05/2019 to 12/10/2019	Tue: 10:30 AM-11:30 AM;	1019404
600	1	06/12/2018 to 11/17/2018	Tue: 10:00 AM-5:00 PM;Wed: 11:00 AM-5:00 PM;Thu: 9:00 AM-3:00 PM;Fri: 10:00 AM-12:00 PM;Sat: 10:00 AM-1:00 PM;	1012466
601	1	01/01/2020 to 12/31/2020	Sun: 8:30 AM-1:30 PM;	1018671
602	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-1:00 PM;	1011730
603	1	03/24/2021 to 03/24/2021	Wed: 3:00 PM-6:00 PM;	1021552
604	2	06/02/2021 to 06/02/2021	Wed: 3:00 PM-7:00 PM;	1021552
605	3	10/06/2021 to 10/06/2021	Wed: 3:00 PM-6:00 PM;	1021552
606	1	05/16/2020 to 09/26/2020	Sat: 9:00 AM-1:00 PM;	1019762
607	1	10/06/2018 to 05/11/2019	Sat: 9:00 AM-1:00 PM;	1019285
608	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-1:00 PM;	1019998
609	1	05/01/2020 to 10/01/2020	Sat: 8:00 AM-12:00 PM;	1018121
610	1	05/04/2019 to 10/26/2019	Wed: 8:00 AM-2:00 PM;Fri: 8:00 AM-2:00 PM;Sat: 8:00 AM-2:00 PM;	1006661
611	2	11/02/2019 to 04/25/2020	Sat: 10:00 AM-1:00 PM;	1006661
612	1	04/17/2021 to 04/17/2021	Sat: 9:00 AM-1:00 PM;	1021590
613	1	05/29/2021 to 05/29/2021	Sat: 8:00 AM-12:00 PM;	1021444
614	1	05/21/2022 to 05/21/2022	Sat: 8:00 AM-12:00 PM;	1021730
615	1	04/13/2019 to 10/26/2019	Sat: 8:00 AM-1:00 PM;	1019630
616	1	01/01/2018 to 12/31/2018	Sun: 8:30 AM-1:00 PM;	1011814
617	1	06/02/2018 to 09/29/2018	Sat: 7:00 AM-12:00 PM;	1018970
618	1	05/14/2020 to 09/01/2020	Thu: 4:00 PM-7:00 PM;	1018831
619	1	05/02/2020 to 10/31/2020	Sat: 9:00 AM-12:30 PM;	1019728
620	1	04/09/2022 to 04/09/2022	Sat: 10:00 AM-2:00 PM;	1021662
621	2	06/11/2022 to 06/11/2022	Sat: 10:00 AM-2:00 PM;	1021662
622	1	06/16/2020 to 10/06/2020	Tue: 3:00 PM-6:00 PM;	1020095
623	1	07/24/2019 to 10/28/2020	Wed: 9:00 AM-1:00 PM;	1019587
624	1	05/07/2022 to 05/07/2022	Tue: 7:00 AM-12:00 PM;Thu: 7:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1021677
625	1	05/04/2021 to 05/04/2021	Tue: 1:00 PM-6:00 PM;	1021416
626	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-1:00 PM;	1012033
627	1	07/01/2019 to 09/01/2019	Thu: 11:00 AM-2:30 PM;	1019602
628	1	07/16/2019 to 09/17/2019	Tue: 11:00 AM-2:30 PM;	1019603
629	1	07/23/2019 to 07/23/2019	Tue: 11:00 AM-2:30 PM;	1019604
630	1	07/11/2019 to 09/26/2019	Thu: 11:00 AM-2:30 PM;	1019605
631	1	08/01/2019 to 09/01/2019	Wed: 11:00 AM-2:30 PM;	1019606
632	1	07/10/2019 to 09/25/2019	Wed: 11:00 AM-2:30 PM;	1019607
633	1	08/29/2019 to 08/29/2019	Thu: 11:00 AM-2:30 PM;	1019608
634	1	01/02/2021 to 01/02/2021	Sat: 8:00 AM-12:00 PM;	1021461
635	2	05/01/2021 to 05/01/2021	Sat: 7:00 AM-11:00 AM;	1021461
636	3	10/02/2021 to 10/02/2021	Sat: 8:00 AM-12:00 PM;	1021461
637	1	06/13/2021 to 06/13/2021	Sun: 10:00 AM-1:00 PM;	1021284
638	1	05/01/2018 to 10/31/2018	Wed: 2:00 PM-6:00 PM;Sat: 8:00 AM-1:00 PM;	1008573
639	2	11/01/2017 to 04/01/2018	Wed: 2:00 PM-6:00 PM;	1008573
640	1	06/08/2021 to 06/08/2021	Tue: 9:00 AM-1:00 PM;	1002767
641	1	06/01/2012 to 09/30/2012	Tue: 7:00 AM-1:00 PM;	1005588
642	1	06/07/2020 to 10/25/2020	Sun: 9:00 AM-2:00 PM;	1019414
643	1	05/07/2021 to 05/07/2021	Fri: 9:00 AM-1:00 PM;	1021364
644	1	03/07/2020 to 12/19/2020	Sat: 8:00 AM-12:00 PM;	1020050
645	1	06/17/2020 to 10/01/2020	Wed: 3:00 PM-7:00 PM;	1019833
646	1	05/04/2021 to 05/04/2021	Tue: 2:00 PM-6:00 PM;	1021350
647	1	05/21/2021 to 05/21/2021	Fri: 2:00 PM-6:00 PM;	1021308
648	1	05/25/2018 to 10/26/2018	Fri: 10:00 AM-5:00 PM;	1012253
649	1	05/15/2021 to 05/15/2021	Sat: 7:00 AM-12:00 PM;	1021392
650	1	05/11/2016 to 10/29/2016	Wed: 8:00 AM-1:00 PM;Sat: 8:00 AM-1:00 PM;	1005937
651	1	04/21/2018 to 04/21/2018	Sat: 8:00 AM-12:00 PM;	1017947
652	2	11/21/2020 to 11/21/2020	Sat: 10:00 AM-1:00 PM;	1017947
653	1	01/03/2021 to 01/03/2021	Sun: 9:00 AM-1:00 PM;	1021484
654	1	07/07/2020 to 11/28/2020	Tue: 9:00 AM-4:00 PM;Sat: 9:00 AM-4:00 PM;	1019989
655	1	05/05/2021 to 05/05/2021	Wed: 2:00 PM-6:00 PM;	1009808
656	1	06/01/2021 to 06/01/2021	Tue: 4:00 PM-7:00 PM;	1021456
657	1	05/23/2018 to 10/10/2018	Wed: 6:30 AM-3:00 PM;	1006059
658	1	01/09/2021 to 01/09/2021	Sat: 9:00 AM-12:00 PM;	1021289
659	2	05/22/2021 to 05/22/2021	Sat: 8:00 AM-12:00 PM;	1021289
660	1	05/01/2021 to 05/01/2021	Wed: 7:00 AM-1:00 PM;Sun: 7:00 AM-1:00 PM;	1021319
661	1	06/05/2021 to 06/05/2021	Sat: 8:00 AM-1:00 PM;	1021320
662	1	03/30/2019 to 11/23/2019	Sat: 9:00 AM-1:00 PM;	1004849
663	1	06/04/2020 to 09/17/2020	Thu: 9:00 AM-2:00 PM;	1006997
664	1	05/09/2021 to 05/09/2021	Sun: 10:00 AM-2:00 PM;	1019805
665	1	05/05/2018 to 09/15/2018	Sat: 9:00 AM-1:00 PM;	1019132
666	1	01/01/2018 to 12/31/2018	Sat: 8:30 AM-12:30 PM;	1018472
667	1	05/13/2021 to 05/13/2021	Thu: 3:00 PM-6:00 PM;Sat: 10:00 AM-12:00 PM;	1021382
668	1	01/01/2021 to 01/01/2021	Sat: 9:30 AM-12:30 PM;	1021536
669	1	05/19/2018 to 10/20/2018	Sat: 10:00 AM-1:00 PM;	1019088
670	1	01/01/2020 to 12/31/2020	Sat: 8:30 AM-11:00 AM;	1021247
671	1	05/15/2021 to 05/15/2021	Sat: 8:00 AM-12:00 PM;	1018619
672	1	01/01/2019 to 12/31/2019	Fri: 7:00 AM-8:00 AM;	1005265
673	1	01/01/2021 to 01/01/2021	Sat: 8:00 AM-1:00 PM;	1001804
674	1	05/05/2021 to 05/05/2021	Wed: 4:00 PM-7:00 PM;	1021584
675	1	05/18/2019 to 10/05/2019	Sat: 8:30 AM-12:00 PM;	1019673
676	1	01/01/2020 to 12/31/2020	Wed: 10:00 AM-7:00 PM;Thu: 10:00 AM-7:00 PM;Fri: 10:00 AM-7:00 PM;Sat: 10:00 AM-7:00 PM;	1018774
677	1	05/08/2020 to 10/09/2020	Fri: 2:00 PM-5:30 PM;	1019738
678	2	10/16/2020 to 12/18/2020	Fri: 2:00 PM-5:30 PM;	1019738
679	1	04/04/2018 to 09/26/2018	Wed: 3:00 PM-7:00 PM;	1019209
680	1	05/15/2018 to 10/19/2018	Tue: 4:30 PM-6:30 PM;Fri: 4:30 PM-6:30 PM;	1001597
681	1	03/01/2021 to 03/01/2021	Fri: 3:00 PM-5:00 PM;	1021583
682	2	11/01/2021 to 11/01/2021	Fri: 2:30 PM-4:30 PM;	1021583
683	3	01/01/2022 to 01/01/2022	Fri: 2:30 PM-4:30 PM;	1021583
684	1	01/01/2018 to 01/01/2018	Sat: 9:30 AM-12:00 PM;	1006425
685	1	05/10/2018 to 10/25/2018	Thu: 4:00 PM-6:00 PM;	1019065
686	1	01/01/2018 to 12/31/2018	Sat: 6:00 AM-12:00 PM;	1019148
687	1	07/10/2019 to 09/25/2019	Wed: 4:00 PM-7:00 PM;	1019533
688	1	07/08/2020 to 09/30/2020	Wed: 4:00 PM-7:00 PM;	1019770
689	1	07/16/2018 to 10/31/2018	Mon: 9:00 AM-6:00 PM;Tue: 9:00 AM-6:00 PM;Wed: 9:00 AM-6:00 PM;Thu: 9:00 AM-6:00 PM;Fri: 9:00 AM-6:00 PM;Sat: 9:00 AM-6:00 PM;	1019154
690	1	05/04/2019 to 10/26/2019	Sat: 8:00 AM-1:00 PM;	1018380
691	1	10/01/2022 to 10/01/2022	Sat: 3:00 PM-4:30 PM;	1021696
692	1	06/04/2021 to 06/04/2021	Thu: 3:00 PM-7:00 PM;	1021555
693	1	05/02/2020 to 10/31/2020	Sat: 9:00 AM-1:00 PM;	1020122
694	1	06/03/2020 to 09/30/2020	\N	1020125
695	1	06/01/2020 to 09/30/2020	Tue: 7:30 AM-1:00 PM;Wed: 7:30 AM-1:00 PM;Fri: 7:30 AM-1:00 PM;	1020107
696	1	07/15/2018 to 10/14/2018	Sun: 11:00 AM-2:00 PM;	1011782
697	1	06/04/2019 to 11/19/2019	Tue: 8:00 AM-4:00 PM;	1019383
698	1	06/06/2019 to 11/14/2019	Thu: 8:00 AM-4:00 PM;	1019373
699	1	06/04/2019 to 11/19/2019	Tue: 8:00 AM-4:00 PM;	1019374
700	1	06/05/2019 to 11/20/2019	Wed: 8:00 AM-4:00 PM;	1019366
701	1	06/05/2019 to 11/20/2019	Wed: 8:00 AM-4:00 PM;Fri: 8:00 AM-4:00 PM;	1019375
702	1	06/06/2019 to 11/14/2019	Thu: 8:00 AM-4:00 PM;	1019380
703	1	01/01/2019 to 12/31/2019	Fri: 8:00 AM-4:00 PM;	1019381
704	1	06/05/2019 to 11/20/2019	Wed: 8:00 AM-4:00 PM;	1019377
705	1	06/04/2019 to 11/19/2019	Tue: 8:00 AM-4:00 PM;Fri: 8:00 AM-4:00 PM;	1019378
706	1	06/05/2019 to 11/20/2019	Wed: 8:00 AM-4:00 PM;	1019376
707	1	06/08/2019 to 11/16/2019	Sat: 8:00 AM-4:00 PM;	1019382
708	1	06/07/2019 to 11/15/2019	Fri: 8:00 AM-4:00 PM;	1002339
709	1	06/04/2019 to 11/19/2019	Tue: 8:00 AM-4:00 PM;Thu: 8:00 AM-4:00 PM;	1002335
710	1	06/05/2019 to 11/20/2019	Wed: 8:00 AM-4:00 PM;	1005332
711	1	06/06/2019 to 11/14/2019	Thu: 8:00 AM-4:00 PM;	1019379
712	1	06/04/2019 to 11/19/2019	Tue: 8:00 AM-4:00 PM;	1002345
713	1	01/01/2019 to 12/31/2019	Sat: 1:00 PM-2:00 PM;	1009660
714	1	04/03/2021 to 04/03/2021	Sat: 9:00 AM-1:00 PM;	1018282
715	1	01/04/2020 to 01/04/2020	Sat: 10:00 AM-1:00 PM;	1020044
716	1	06/01/2021 to 06/01/2021	Tue: 4:00 PM-7:00 PM;	1021431
717	1	06/23/2022 to 06/23/2022	Thu: 4:00 PM-7:00 PM;	1021671
718	1	11/05/2022 to 11/05/2022	Sat: 9:00 AM-12:00 PM;	1021672
719	1	04/18/2020 to 10/17/2020	Sat: 9:00 AM-1:00 PM;	1021211
720	1	06/04/2020 to 08/01/2020	Thu: 5:00 PM-9:00 PM;	1019786
721	1	01/01/2021 to 01/01/2021	Mon: 9:00 AM-2:00 PM;	1019757
722	1	04/07/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1019192
723	1	06/01/2020 to 08/31/2020	Tue: 5:00 PM-7:00 PM;	1019895
724	1	07/16/2021 to 07/16/2021	Fri: 3:00 PM-5:30 PM;	1021286
725	1	05/09/2020 to 10/31/2020	Sat: 9:00 AM-12:00 PM;	1019802
726	1	02/09/2021 to 02/09/2021	Tue: 4:30 PM-5:30 PM;	1021282
727	1	05/15/2020 to 10/15/2020	Tue: 6:00 PM-8:00 PM;Fri: 6:00 PM-8:00 PM;Sat: 12:00 PM-2:00 PM;	1020174
728	1	07/01/2018 to 07/01/2019	Fri: 10:00 AM-2:00 PM;	1003684
729	1	05/25/2018 to 10/06/2018	Fri: 9:00 AM-2:00 PM;Sat: 9:00 AM-2:00 PM;	1019234
730	1	05/02/2020 to 10/31/2020	Sat: 8:00 AM-1:00 PM;	1006285
731	2	11/14/2020 to 11/14/2020	Sat: 1:00 PM-5:00 PM;	1006285
732	1	04/18/2019 to 11/14/2019	Thu: 8:00 AM-12:30 PM;	1019486
733	1	06/01/2021 to 06/01/2021	Mon: 5:00 PM-9:00 PM;	1021355
734	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-12:00 PM;	1020026
735	1	01/01/2018 to 12/31/2018	Thu: 8:00 AM-12:00 PM;	1019224
736	1	04/28/2018	Sat: 8:30 AM-1:00 PM;	1019220
737	1	01/01/2018 to 12/01/2020	Thu: 12:00 PM-4:00 PM;	1012260
738	1	05/25/2018 to 10/26/2018	Fri: 3:30 PM-6:00 PM;	1006831
739	1	04/04/2021 to 04/04/2021	Sun: 10:00 AM-2:00 PM;	1021327
740	1	04/06/2018 to 10/31/2018	Mon: 11:00 AM-6:00 PM;Tue: 11:00 AM-6:00 PM;Wed: 11:00 AM-6:00 PM;Thu: 11:00 AM-6:00 PM;Fri: 11:00 AM-6:00 PM;Sat: 11:00 AM-6:00 PM;Sun: 11:00 AM-6:00 PM;	1018951
741	1	05/08/2019 to 10/09/2019	Wed: 3:30 PM-6:30 PM;	1019688
742	1	05/02/2020 to 10/31/2020	Sat: 9:00 AM-1:00 PM;	1019959
743	1	05/03/2020 to 11/01/2020	Sun: 10:00 AM-2:00 PM;	1019962
744	1	03/07/2019 to 10/31/2019	Thu: 3:00 PM-7:00 PM;	1019669
745	1	05/01/2018 to 11/17/2018	Sat: 9:00 AM-1:00 PM;	1008020
746	1	05/31/2021 to 05/31/2021	Mon: 7:00 AM-1:00 PM;	1005076
747	1	05/05/2018 to 10/27/2018	Tue: 4:00 PM-7:00 PM;Sat: 7:00 AM-12:00 PM;	1019330
748	2	11/03/2018 to 04/27/2019	Sat: 9:00 AM-12:00 PM;	1019330
749	1	05/11/2020 to 12/21/2020	Mon: 4:00 PM-8:00 PM;Thu: 4:00 PM-8:00 PM;	1021208
750	1	05/01/2021 to 05/01/2021	Wed: 9:00 AM-3:00 PM;Sat: 9:00 AM-3:00 PM;	1010937
751	1	06/02/2021 to 06/02/2021	Wed: 8:00 AM-11:00 AM;	1021511
752	1	10/02/2021 to 10/02/2021	Sat: 9:00 AM-12:00 PM;	1021512
753	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-12:00 PM;	1021516
754	1	05/01/2018 to 12/11/2018	Tue: 3:00 AM-6:00 PM;Sat: 9:00 AM-12:00 PM;	1011761
755	2	11/06/2018 to 12/11/2018	Tue: 3:00 PM-5:30 PM;	1011761
756	1	05/26/2018 to 09/29/2018	Sat: 8:00 AM-12:00 PM;	1018972
757	1	05/05/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1008980
758	1	06/08/2021 to 06/08/2021	Tue: 11:00 AM-2:00 PM;	1021547
759	2	06/18/2021 to 06/18/2021	Fri: 5:00 PM-8:00 PM;	1021547
760	3	07/16/2021 to 07/16/2021	Fri: 5:00 PM-8:00 PM;	1021547
761	4	08/20/2021 to 08/20/2021	Fri: 5:00 PM-8:00 PM;	1021547
762	1	06/24/2018 to 10/14/2018	Sun: 10:00 AM-2:00 PM;	1019302
763	1	11/07/2020 to 11/07/2020	Sat: 9:30 AM-12:00 PM;	1018853
764	2	05/01/2021 to 05/01/2021	Sat: 8:30 AM-12:00 PM;	1018853
765	1	03/24/2018 to 12/22/2018	Sat: 9:00 AM-1:00 PM;	1018458
766	2	06/20/2018 to 08/29/2018	Wed: 10:00 AM-2:00 PM;	1018458
767	1	05/30/2020 to 09/01/2020	Wed: 2:00 PM-5:00 PM;Sat: 10:00 AM-3:00 PM;	1007267
768	1	06/13/2020 to 10/10/2020	Sat: 8:00 AM-1:00 PM;	1009663
769	1	05/02/2020 to 11/21/2020	Sat: 9:00 AM-1:00 PM;	1012076
770	1	05/03/2020 to 	Sun: 11:00 AM-2:00 PM;	1019819
771	1	06/15/2022 to 06/15/2022	Wed: 4:00 PM-7:00 PM;	1021705
772	1	05/07/2022 to 05/07/2022	Sat: 9:00 AM-1:00 PM;	1021711
773	1	06/01/2018 to 10/27/2018	Sat: 9:00 AM-12:00 PM;	1012041
774	1	04/18/2020 to 10/31/2020	Tue: 7:00 AM-1:00 PM;Sat: 7:00 AM-1:00 PM;	1020100
775	1	06/12/2016 to 06/12/2016	Sun: 1:00 PM-5:00 PM;	1008366
776	1	04/06/2019 to 12/14/2019	Sat: 8:00 AM-12:00 PM;	1018200
777	1	05/01/2019 to 11/01/2019	Sat: 9:00 AM-1:00 PM;	1005674
778	1	01/01/2020 to 12/31/2020	Thu: 10:00 AM-2:00 PM;	1018152
779	1	01/01/2020 to 12/31/2020	Thu: 10:00 AM-2:00 PM;	1019990
780	1	12/04/2021 to 12/04/2021	Sat: 10:00 AM-1:00 PM;	1021610
781	1	04/07/2021 to 04/07/2021	Wed: 3:00 PM-6:00 PM;	1021612
782	1	01/01/2021 to 01/01/2021	Sun: 9:00 AM-1:00 PM;	1019056
783	2	12/09/2018 to 12/09/2018	Sun: 11:00 AM-1:00 PM;	1019056
784	1	05/06/2021 to 05/06/2021	Thu: 11:00 AM-3:00 PM;	1010598
785	1	05/29/2021 to 05/29/2021	Sat: 8:00 AM-1:00 PM;	1021268
786	2	01/09/2021 to 01/09/2021	Sat: 9:00 AM-1:00 PM;	1021268
787	1	03/06/2019 to 10/30/2019	Wed: 5:00 PM-8:00 PM;	1019586
788	1	01/01/2021 to 01/01/2021	Mon: 9:00 AM-5:00 PM;Tue: 9:00 AM-5:00 PM;Wed: 9:00 AM-5:00 PM;Thu: 9:00 AM-5:00 PM;Fri: 9:00 AM-5:00 PM;Sat: 9:00 AM-3:00 PM;Sun: 10:00 AM-2:00 PM;	1021635
789	1	05/17/2019 to 09/20/2019	Fri: 4:30 PM-8:30 PM;	1011325
790	1	05/15/2022 to 05/15/2022	Sun: 9:30 AM-1:00 PM;	1021703
791	2	11/22/2022 to 11/22/2022	Tue: 6:30 PM-8:30 PM;	1021703
792	1	06/02/2016 to 09/29/2016	Thu: 4:30 PM-6:30 PM;	1012621
793	1	12/01/2020 to 	Sat: 9:00 AM-1:00 PM;	1006417
794	1	05/20/2021 to 05/20/2021	Thu: 10:00 AM-4:00 PM;	1005080
795	1	04/01/2020 to 11/01/2020	Mon: 8:00 AM-4:00 PM;Tue: 8:00 AM-4:00 PM;Wed: 8:00 AM-4:00 PM;Thu: 8:00 AM-4:00 PM;Fri: 8:00 AM-4:00 PM;Sat: 8:00 AM-4:00 PM;	1020136
796	1	05/12/2018 to 10/13/2018	Sat: 8:00 AM-12:00 PM;	1019011
797	1	05/05/2018 to 10/27/2018	Sun: 6:00 AM-1:00 PM;	1019236
798	2	06/06/2018 to 10/31/2018	Wed: 6:00 AM-1:00 PM;	1019236
799	1	07/03/2021 to 07/03/2021	Sat: 10:00 AM-2:00 PM;	1018772
800	1	06/06/2020 to 10/31/2020	\N	1019861
801	1	06/01/2015 to 10/31/2015	Wed: 2:00 PM-6:00 PM;Sat: 9:00 AM-1:00 PM;	1004384
802	1	05/23/2020 to 10/17/2020	Wed: 5:00 PM-7:00 PM;Sat: 8:30 AM-11:30 AM;	1012626
803	1	06/30/2018 to 10/27/2018	Sat: 8:00 AM-4:00 PM;	1019340
804	2	11/03/2018 to 12/08/2018	Sat: 8:00 AM-1:00 PM;	1019340
805	1	05/05/2018 to 09/29/2018	Sat: 9:00 AM-2:00 PM;	1003680
806	1	07/25/2018 to 09/12/2018	Wed: 3:00 PM-5:30 PM;	1004380
807	1	08/11/2018 to 09/15/2018	Sat: 9:00 AM-12:00 PM;	1006376
808	1	05/01/2018 to 09/04/2018	Tue: 1:00 PM-5:00 PM;	1018907
809	1	06/01/2017 to 10/28/2017	Thu: 2:00 PM-6:00 PM;Sat: 9:00 AM-1:00 PM;	1018343
810	1	06/29/2020 to 10/02/2020	Mon: 3:00 PM-5:00 PM;Wed: 12:00 AM-2:00 PM;Fri: 11:00 AM-2:00 PM;	1020106
811	1	04/07/2018 to 10/01/2018	Wed: 3:30 PM-6:30 PM;Sat: 9:00 AM-12:00 PM;	1019263
812	2	11/03/2018 to 12/22/2018	Sat: 10:00 AM-1:00 PM;	1019263
813	1	11/03/2018 to 03/30/2019	Sat: 10:00 AM-1:00 PM;	1018978
814	1	06/17/2021 to 06/17/2021	Thu: 2:30 PM-5:30 PM;	1021281
815	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-1:00 PM;	1009970
816	1	04/07/2018 to 12/22/2018	Sat: 7:30 AM-12:00 PM;	1008299
817	1	05/27/2021 to 05/27/2021	Thu: 11:00 AM-3:00 PM;	1021306
818	1	05/02/2020 to 10/31/2020	Sat: 8:00 AM-12:30 PM;	1020192
819	1	05/28/2020 to 10/08/2020	Tue: 10:00 AM-2:00 PM;Thu: 2:00 PM-6:00 PM;	1020090
820	1	01/01/2018 to 12/31/2018	Sat: 8:00 AM-1:00 PM;	1002907
821	1	08/25/2018 to 08/25/2018	Sat: 9:00 AM-1:00 PM;	1018242
822	1	01/01/2019 to 12/31/2019	Thu: 9:00 AM-10:00 AM;	1005270
823	1	03/01/2018 to 11/30/2018	Wed: 8:00 AM-1:30 PM;	1008375
824	2	12/01/2018 to 02/28/2019	Wed: 9:00 AM-1:30 PM;	1008375
825	1	05/02/2020 to 11/21/2020	Tue: 8:00 AM-1:00 PM;Thu: 2:00 AM-6:00 PM;Sat: 7:00 AM-2:00 PM;	1019774
826	1	01/01/2019 to 12/31/2019	Sat: 10:00 AM-11:00 AM;	1005252
827	1	01/01/2019 to 12/31/2019	Sat: 6:30 AM-7:30 AM;	1008118
828	1	01/01/2021 to 01/01/2021	Sat: 7:30 AM-1:00 PM;	1021264
829	1	01/01/2019 to 12/31/2019	Thu: 10:30 AM-11:30 AM;	1005253
830	1	01/01/2019 to 12/31/2019	Sun: 7:00 AM-8:30 AM;	1005254
831	1	01/01/2019 to 12/31/2019	Sat: 8:00 AM-9:30 AM;	1005255
832	1	06/10/2022 to 06/10/2022	Fri: 10:00 AM-2:00 PM;	1021748
833	1	05/05/2018 to 11/17/2018	Sat: 9:00 AM-1:00 PM;	1019003
834	1	05/08/2021 to 05/08/2021	Sat: 10:00 AM-2:00 PM;	1021369
835	2	10/17/2020 to 10/17/2020	Sat: 9:00 AM-2:30 PM;	1021369
836	1	05/14/2022 to 05/14/2022	Sat: 9:00 AM-2:00 PM;	1021743
837	1	11/06/2021 to 11/06/2021	Sat: 10:00 AM-2:00 PM;	1021349
838	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-1:00 PM;	1020011
839	1	06/16/2022 to 06/16/2022	Thu: 4:30 PM-7:30 PM;	1021742
840	1	04/03/2021 to 04/03/2021	Sat: 9:00 AM-12:00 PM;	1021567
841	1	05/05/2021 to 05/05/2021	Wed: 11:00 AM-1:00 PM;	1010636
842	1	04/28/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1019120
843	1	01/01/2019 to 04/27/2019	Sat: 10:00 AM-2:00 PM;	1003269
844	2	05/11/2019 to 11/17/2019	Sat: 9:00 AM-2:00 PM;	1003269
845	1	05/03/2019 to 10/25/2019	Fri: 4:00 PM-7:00 PM;	1019491
846	1	04/01/2020 to 10/08/2020	Thu: 3:00 PM-7:00 PM;	1020032
847	1	05/05/2018 to 10/27/2018	Sat: 7:00 AM-12:00 PM;	1019266
848	1	07/23/2018 to 09/24/2018	Mon: 5:00 PM-7:00 PM;	1019212
849	1	06/06/2021 to 06/06/2021	Sun: 10:00 AM-2:00 PM;	1011117
850	1	05/01/2021 to 05/01/2021	Fri: 7:00 AM-7:00 PM;	1021332
851	1	05/28/2020 to 10/29/2020	Thu: 4:00 PM-7:00 PM;	1020075
852	1	01/01/2021 to 01/01/2021	Sun: 8:00 AM-1:00 PM;	1021633
853	1	11/20/2020 to 12/18/2020	Fri: 3:00 PM-5:00 PM;	1021244
854	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-3:00 PM;	1021250
855	1	01/01/2021 to 01/01/2021	Thu: 2:00 PM-7:00 PM;	1021345
856	1	07/09/2019 to 11/12/2019	Tue: 8:00 AM-3:00 PM;	1003343
857	1	07/07/2020 to 11/17/2020	Tue: 8:00 AM-2:00 PM;	1019986
858	1	05/08/2021 to 05/08/2021	Sat: 9:00 AM-1:00 PM;	1020123
859	1	04/06/2019 to 11/30/2019	Wed: 8:00 AM-5:00 PM;Sat: 8:00 AM-3:00 PM;	1019506
860	1	06/28/2019 to 	Fri: 4:00 PM-8:00 PM;	1019649
861	1	06/01/2019 to 08/31/2019	Sat: 7:00 AM-12:00 PM;	1019409
862	1	06/05/2018 to 09/25/2018	Tue: 3:00 PM-7:00 PM;	1019103
863	1	05/08/2021 to 05/08/2021	Sat: 8:30 AM-1:30 PM;	1003863
864	1	06/27/2018 to 10/17/2018	Wed: 2:00 PM-6:00 PM;	1012206
865	1	05/12/2020 to 10/20/2020	Tue: 8:00 AM-12:30 PM;	1019850
866	1	05/08/2020 to 10/23/2020	Fri: 8:00 AM-12:30 PM;	1019851
867	1	01/01/2018 to 12/31/2018	Sat: 9:00 AM-12:00 PM;	1019198
868	1	01/01/2018 to 12/31/2018	Wed: 9:00 AM-2:00 PM;Sat: 8:00 AM-12:00 PM;	1002021
869	1	06/10/2021 to 06/10/2021	Thu: 5:30 PM-7:30 PM;	1002521
870	1	07/11/2019 to 09/26/2019	Thu: 10:00 AM-2:00 PM;	1019427
871	1	02/09/2020 to 08/30/2020	Sun: 9:00 AM-12:00 PM;	1020051
872	1	05/16/2018 to 10/31/2018	Wed: 3:30 PM-6:30 PM;	1019035
873	2	06/02/2018 to 09/29/2018	Sat: 9:00 AM-12:00 PM;	1019035
874	1	05/17/2022 to 05/17/2022	Tue: 3:00 PM-6:00 PM;	1021683
875	1	05/01/2021 to 05/01/2021	Sat: 8:30 AM-12:00 PM;	1019852
876	1	02/06/2021 to 02/06/2021	Sat: 10:00 AM-12:00 PM;	1019352
877	2	06/05/2021 to 06/05/2021	Sat: 9:00 AM-12:00 PM;	1019352
878	3	10/02/2021 to 10/02/2021	Sat: 10:00 AM-12:00 PM;	1019352
879	1	11/02/2019 to 12/29/2019	Sat: 10:00 AM-5:00 PM;Sun: 10:00 AM-5:00 PM;	1005352
880	1	02/02/2019 to 03/30/2019	Sat: 10:00 AM-2:00 PM;	1009803
881	2	04/06/2019 to 10/29/2019	Tue: 10:00 AM-3:00 PM;Sat: 9:00 AM-3:00 PM;	1009803
882	1	05/15/2021 to 05/15/2021	Sat: 9:00 AM-12:30 PM;	1019756
883	1	05/22/2021 to 05/22/2021	Sat: 9:00 AM-1:00 PM;	1021291
884	1	06/04/2022 to 06/04/2022	Sat: 9:00 AM-1:00 PM;	1021661
885	1	05/07/2019 to 09/24/2019	Tue: 3:00 PM-6:00 PM;	1012344
886	1	05/31/2018 to 07/26/2018	Thu: 5:00 PM-8:00 PM;	1019030
887	1	07/11/2020 to 09/26/2020	Sun: 9:00 AM-1:00 PM;	1018834
888	1	04/10/2021 to 04/10/2021	Sat: 7:30 AM-11:30 AM;	1021324
889	1	05/04/2021 to 05/04/2021	Tue: 4:00 PM-6:00 PM;	1021325
890	1	06/04/2019 to 10/29/2019	Tue: 4:00 PM-7:00 PM;	1019450
891	1	01/01/2021 to 01/01/2021	Tue: -8:00 PM;Fri: 12:00 PM-;	1021647
892	1	05/04/2018 to 10/05/2018	Fri: 4:00 PM-7:00 PM;	1016810
893	1	05/22/2021 to 05/22/2021	Sat: 9:00 AM-12:00 PM;	1018113
894	1	01/01/2018 to 12/31/2018	Sat: 10:00 AM-3:00 PM;Sun: 10:00 AM-3:00 PM;	1019158
895	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-2:00 PM;	1006652
896	1	06/10/2021 to 06/10/2021	Thu: 9:00 AM-1:00 PM;	1002768
897	1	04/27/2019 to 10/26/2019	Tue: 9:00 AM-1:00 PM;Sat: 8:00 AM-12:00 PM;	1019512
898	1	01/01/2018 to 12/31/2018	Tue: 8:00 AM-2:00 PM;Sat: 8:00 AM-2:00 PM;	1010483
899	1	05/04/2018 to 10/26/2018	Fri: 3:30 PM-6:30 PM;	1016916
900	2	11/02/2018 to 04/19/2019	Fri: 3:30 AM-6:30 PM;	1016916
901	1	06/20/2013 to 09/26/2013	Thu: 11:00 AM-3:00 PM;	1004651
902	1	06/19/2019 to 09/04/2019	Wed: 5:00 PM-8:00 PM;	1019503
903	1	05/10/2020 to 10/25/2020	Sun: 10:00 AM-2:00 PM;	1019808
904	1	12/15/2019 to 02/23/2020	Sun: 9:00 AM-12:00 PM;	1019726
905	1	06/01/2021 to 06/01/2021	Tue: 2:00 PM-6:30 PM;	1021470
906	1	01/05/2019 to 04/13/2019	Sat: 11:00 AM-2:00 PM;	1019346
907	1	05/19/2018 to 09/29/2018	Sat: 8:00 AM-12:00 PM;	1018927
908	1	05/07/2021 to 05/07/2021	Fri: 4:00 PM-7:00 PM;	1021361
909	1	04/05/2018 to 11/01/2018	Thu: 4:00 PM-5:30 PM;	1004848
910	1	01/01/2020 to 12/31/2020	Wed: 3:00 PM-8:00 PM;	1011300
911	1	01/01/2020 to 12/31/2020	Wed: 3:00 PM-8:00 PM;	1020132
912	1	06/06/2021 to 06/06/2021	Sun: 11:00 AM-3:00 PM;	1019304
913	1	01/01/2020 to 03/01/2020	Thu: 2:00 PM-6:00 PM;	1021198
914	2	04/01/2020 to 09/01/2020	Thu: 3:00 PM-7:00 PM;	1021198
915	3	10/01/2020 to 12/01/2020	Thu: 2:00 PM-6:00 PM;	1021198
916	1	05/18/2019 to 09/28/2019	Sat: 9:00 AM-1:00 PM;	1019167
917	1	06/15/2019 to 10/12/2019	Sat: 10:00 AM-1:00 PM;	1019678
918	1	10/19/2019 to 06/13/2020	Sat: 10:00 AM-1:00 PM;	1019679
919	1	06/25/2018 to 09/24/2018	Mon: 3:00 PM-6:00 PM;	1019207
920	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-2:00 PM;	1019995
921	1	04/17/2021 to 04/17/2021	Thu: 8:00 AM-11:00 AM;Sat: 8:00 AM-11:00 AM;	1021390
922	1	05/06/2021 to 05/06/2021	Thu: 10:00 AM-3:00 PM;	1012027
923	1	05/29/2019 to 09/18/2019	Wed: 4:30 PM-7:30 PM;	1019538
924	1	07/10/2021 to 07/10/2021	Sat: 9:00 AM-2:00 PM;	1018418
925	1	05/01/2018 to 10/31/2018	Wed: 2:00 PM-6:00 PM;	1018901
926	1	06/02/2020 to 10/24/2020	Tue: 3:00 PM-6:00 PM;Sat: 7:30 AM-12:00 PM;	1020094
927	1	05/05/2019 to 11/17/2019	Sun: 9:00 AM-1:00 PM;	1019494
928	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-11:00 AM;	1005431
929	3	12/11/2021 to 12/11/2021	Sat: 10:00 AM-12:00 PM;	1005431
930	1	05/19/2021 to 05/19/2021	Wed: 3:00 PM-6:00 PM;	1018919
931	1	05/04/2021 to 05/04/2021	Tue: 3:00 PM-6:30 PM;	1000462
932	1	06/11/2020 to 10/15/2020	Thu: 3:30 PM-7:00 PM;	1016820
933	1	06/09/2022 to 06/09/2022	Thu: 10:00 AM-3:00 PM;	1021727
934	2	01/01/2021 to 01/01/2021	Sat: 11:00 AM-4:00 PM;	1011233
935	1	06/02/2018 to 10/27/2018	Sat: 8:00 AM-2:00 PM;	1018922
936	1	05/01/2018 to 10/31/2018	Sat: 9:00 AM-1:00 PM;	1011800
937	1	09/01/2012 to 	Fri: 3:00 PM-7:00 PM;	1021257
938	1	06/02/2019 to 09/01/2019	Sun: 10:00 AM-2:00 PM;	1019622
939	1	01/01/2018 to 12/31/2018	Sun: 9:00 AM-1:00 PM;	1019177
940	2	01/01/2019 to 12/31/2019	Sun: 9:00 AM-1:00 PM;	1019177
941	1	05/05/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1019175
942	2	11/03/2018 to 04/27/2019	Sat: 9:00 AM-12:00 PM;	1019175
943	1	05/05/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1019176
944	1	01/01/2021 to 12/31/2021	Tue: 7:00 AM-2:00 PM;Wed: 7:00 AM-2:00 PM;Thu: 7:00 AM-2:00 PM;Fri: 7:00 AM-2:00 PM;Sat: 7:00 AM-2:00 PM;	1019940
945	1	06/01/2019 to 09/28/2019	Sat: 10:00 AM-2:00 PM;	1019435
946	1	06/04/2020 to 08/13/2020	Thu: 8:30 AM-12:30 PM;	1011538
947	1	05/12/2018 to 10/06/2018	Sat: 8:00 AM-12:00 PM;	1000481
948	1	07/10/2018 to 10/09/2018	Tue: 9:00 AM-12:30 PM;	1012249
949	1	05/31/2018 to 10/25/2018	Thu: 2:00 PM-7:00 PM;	1005201
950	1	06/01/2019 to 09/28/2019	Sat: 9:00 AM-2:00 PM;	1012046
951	1	05/14/2021 to 05/14/2021	Fri: 3:00 PM-7:00 PM;	1021339
952	1	01/01/2019 to 02/23/2019	Sat: 8:00 AM-12:00 PM;	1019360
953	2	11/09/2019 to 02/29/2020	Sat: 8:00 AM-12:00 PM;	1019360
954	1	07/04/2020 to 09/26/2020	Sat: 8:00 AM-11:00 AM;	1021197
955	2	10/03/2020 to 11/21/2020	Sat: 8:00 AM-12:00 PM;	1021197
956	1	06/12/2021 to 09/25/2021	Tue: 8:00 AM-12:00 PM;Sat: 8:00 AM-12:00 PM;	1018407
957	1	05/20/2021 to 05/20/2021	Thu: 3:00 PM-6:00 PM;	1005528
958	1	06/03/2020 to 10/28/2020	Wed: 4:00 PM-8:00 PM;	1006837
959	1	05/01/2018 to 09/25/2018	Tue: 4:30 PM-6:00 PM;	1011119
960	1	11/06/2021 to 11/06/2021	Sat: 11:00 AM-1:00 PM;	1019706
961	2	01/01/2021 to 01/01/2021	Sat: 11:00 AM-1:00 PM;	1019706
962	1	05/22/2021 to 05/22/2021	Sat: 8:00 AM-12:00 PM;	1021624
963	2	05/21/2022 to 05/21/2022	Sat: 8:00 AM-12:00 PM;	1021624
964	1	06/20/2020 to 09/26/2020	Sat: 9:00 AM-12:00 PM;	1019752
965	1	06/03/2021 to 06/03/2021	Thu: 7:00 AM-1:00 PM;	1019501
966	1	01/01/2019 to 12/31/2019	Mon: 8:30 AM-9:30 AM;	1005256
967	1	07/01/2020 to 08/19/2020	Wed: 4:30 PM-7:30 PM;	1019969
968	1	06/20/2018 to 09/05/2018	Wed: 4:00 PM-7:00 PM;	1003980
969	1	05/25/2019 to 10/05/2019	Sat: 8:00 AM-1:00 PM;	1018217
970	1	05/16/2018 to 09/26/2018	Wed: 4:00 PM-6:00 PM;	1018998
971	1	01/01/2019 to 12/31/2019	Mon: 6:30 AM-7:30 AM;	1005257
972	1	04/28/2018 to 10/27/2018	Sat: 8:00 AM-1:00 PM;	1019111
973	1	06/16/2018 to 09/29/2018	Wed: 8:30 AM-11:30 AM;Sat: 8:30 AM-11:30 AM;	1010286
974	1	07/13/2021 to 07/13/2021	Tue: 4:00 PM-6:00 PM;	1018310
975	1	06/11/2021 to 06/11/2021	Fri: 4:00 PM-7:00 PM;	1005218
976	2	06/11/2021 to 06/11/2021	Fri: 4:00 PM-7:00 PM;	1005218
977	1	07/11/2020 to 09/26/2020	Sat: 9:00 AM-2:00 PM;	1016799
978	1	01/01/2018 to 12/31/2018	Sat: 9:00 AM-12:00 PM;Sun: 12:00 PM-3:00 PM;	1003238
979	1	06/02/2021 to 06/02/2021	Wed: 3:00 PM-6:00 PM;	1021358
980	1	05/10/2018 to 10/11/2018	Thu: 4:00 PM-7:00 PM;	1019058
981	1	05/30/2019 to 07/25/2019	Thu: 4:00 PM-8:00 PM;	1019368
982	1	05/01/2021 to 05/01/2021	Sat: 10:00 AM-3:00 PM;	1012031
983	1	04/25/2020 to 07/11/2020	Sat: 7:30 AM-12:00 PM;	1000242
984	2	10/10/2020 to 11/21/2020	Sat: 7:30 AM-12:00 PM;	1000242
985	1	07/18/2018 to 09/26/2018	Wed: 3:00 PM-7:00 PM;	1019022
986	1	05/28/2020 to 07/09/2020	Thu: 3:00 PM-6:00 PM;	1000616
987	1	01/01/2018 to 12/31/2018	Mon: 4:00 PM-6:00 PM;	1019185
988	1	05/22/2020 to 07/24/2020	Fri: 9:00 AM-12:00 PM;	1019866
989	1	06/02/2021 to 06/02/2021	Wed: 9:30 AM-1:30 PM;	1019806
990	1	06/07/2018 to 10/25/2018	Thu: 3:00 PM-7:00 PM;	1011972
991	1	06/01/2021 to 06/01/2021	Tue: 4:00 PM-6:30 PM;	1021341
992	1	05/01/2020 to 09/30/2020	Thu: 10:00 AM-3:00 PM;	1019876
993	1	05/01/2021 to 05/01/2021	Wed: 11:00 AM-1:00 PM;Sat: 9:00 AM-1:00 PM;	1019189
994	1	05/15/2020 to 10/09/2020	Fri: 11:00 AM-5:00 PM;	1019843
995	1	05/02/2020 to 11/28/2020	Sun: 8:00 AM-12:00 PM;	1020190
996	1	01/09/2021 to 01/09/2021	Sat: 10:00 AM-12:00 PM;	1002929
997	2	05/21/2021 to 05/21/2021	Fri: 2:00 PM-6:00 PM;	1002929
998	3	10/23/2021 to 10/23/2021	Sat: 10:00 AM-2:00 PM;	1002929
999	1	06/06/2019 to 08/22/2019	Thu: 5:30 PM-7:30 PM;	1019659
1000	1	05/03/2018 to 10/11/2018	Thu: 4:30 PM-7:30 PM;	1018976
1001	1	04/17/2021 to 04/17/2021	Sat: 8:30 AM-11:30 PM;	1011139
1002	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1019902
1003	1	07/13/2019 to 09/28/2019	Sat: 9:00 AM-1:00 PM;	1001281
1004	1	07/14/2018 to 10/13/2018	Sat: 10:00 AM-1:00 PM;	1005642
1005	2	07/12/2018 to 08/23/2018	Thu: 12:00 PM-5:00 PM;	1005642
1006	1	01/01/2021 to 01/01/2021	Mon: 8:30 AM-6:00 PM;Tue: 8:30 AM-6:00 PM;Wed: 8:30 AM-6:00 PM;Thu: 8:30 AM-6:00 PM;Fri: 8:30 AM-6:00 PM;Sat: 8:30 AM-3:00 PM;Sun: 12:00 PM-3:00 PM;	1003199
1007	1	06/04/2019 to 08/27/2019	Tue: 5:00 PM-8:00 PM;	1019300
1008	1	05/02/2020 to 10/31/2020	Tue: 2:00 PM-6:00 PM;Sat: 7:00 AM-12:00 PM;	1019968
1009	1	05/01/2019 to 12/18/2019	Wed: 8:00 AM-12:00 PM;	1019487
1010	1	06/01/2020 to 10/31/2020	Thu: 3:30 AM-6:30 PM;	1020134
1011	1	05/03/2019 to 11/15/2019	Fri: 8:00 AM-12:00 PM;	1019490
1012	1	05/02/2020 to 10/17/2020	Tue: 11:00 AM-2:00 PM;Sat: 9:00 AM-12:00 PM;	1020081
1013	1	06/06/2019 to 10/17/2019	Thu: 3:00 PM-7:00 PM;	1019634
1014	2	11/24/2019 to 11/24/2019	Sun: 10:00 AM-2:00 PM;	1019634
1015	1	01/01/2021 to 01/01/2021	Sun: 10:00 AM-1:00 PM;	1021314
1016	1	04/16/2018 to 	Mon: 9:00 AM-4:00 PM;Tue: 9:00 AM-4:00 PM;Wed: 9:00 AM-4:00 PM;Thu: 9:00 AM-4:00 PM;Fri: 9:00 AM-4:00 PM;	1018908
1017	1	05/16/2020 to 10/17/2020	Sat: 8:00 AM-1:00 PM;	1019858
1018	1	05/02/2020 to 10/31/2020	Sat: 10:00 AM-1:00 PM;	1019759
1019	1	04/04/2020 to 10/31/2020	Sat: 8:00 AM-1:00 PM;	1021209
1020	1	05/15/2020 to 10/30/2020	Tue: 10:00 AM-1:00 PM;Fri: 4:00 PM-7:00 PM;	1020199
1021	1	01/01/2021 to 12/31/2021	Sun: 9:00 AM-1:00 PM;	1002905
1022	1	06/06/2020 to 09/26/2020	Sat: 9:00 AM-12:00 PM;	1019816
1023	2	10/03/2020 to 11/14/2020	Sat: 9:00 AM-12:00 PM;	1019816
1024	1	06/05/2021 to 06/05/2021	Sat: 9:00 AM-12:00 PM;	1021357
1025	1	06/02/2018 to 10/27/2018	Sat: 10:00 AM-2:00 PM;	1018093
1026	1	04/13/2019 to 10/12/2019	Sat: 9:00 AM-2:00 PM;	1019464
1027	1	05/22/2021 to 05/22/2021	Sat: 9:00 AM-2:00 PM;	1021458
1028	1	06/02/2018 to 09/29/2018	Sat: 10:00 AM-2:00 PM;	1019137
1029	1	05/01/2018 to 10/31/2018	Wed: 7:00 AM-12:00 PM;Sat: 7:00 AM-11:00 AM;	1000021
1030	1	05/05/2018 to 10/27/2018	Wed: 9:00 AM-12:30 PM;Sat: 9:00 AM-12:30 PM;	1011076
1031	2	11/03/2018 to 04/27/2019	Sat: 9:00 AM-12:00 PM;	1011076
1032	1	05/06/2020 to 10/28/2020	Wed: 3:00 AM-6:00 PM;	1020087
1033	1	05/02/2019 to 10/17/2019	Thu: 4:00 PM-7:00 PM;	1019683
1034	1	05/01/2021 to 05/01/2021	Wed: 7:00 AM-1:00 PM;Sat: 7:00 AM-1:00 PM;	1019777
1035	2	11/06/2021 to 11/06/2021	Sat: 9:00 AM-12:00 PM;	1019777
1036	1	04/21/2018 to 11/10/2018	Sat: 9:00 AM-1:00 PM;	1012786
1037	2	11/24/2018 to 12/08/2018	Sat: 9:00 AM-1:00 PM;	1012786
1038	1	05/18/2013 to 10/26/2013	Sat: 7:30 AM-12:00 PM;	1005633
1039	1	06/01/2020 to 10/10/2020	Sat: 9:00 AM-12:30 PM;	1006681
1040	1	01/01/2019 to 12/31/2019	Tue: 11:30 AM-12:30 PM;	1009658
1041	1	09/12/2020 to 12/19/2020	Sat: 9:00 AM-11:00 AM;	1020034
1042	1	05/16/2020 to 09/05/2020	Sat: 9:00 AM-1:00 PM;	1020035
1043	1	06/03/2020 to 09/30/2020	Wed: 11:00 AM-2:00 PM;	1020038
1044	1	05/05/2018 to 09/29/2018	Sat: 8:00 AM-1:00 PM;	1012523
1045	2	10/06/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1012523
1046	3	11/10/2018 to 04/27/2019	Sat: 10:00 AM-1:00 PM;	1012523
1047	1	05/01/2021 to 05/01/2021	Tue: 3:00 PM-6:00 PM;	1010485
1048	1	04/20/2018 to 10/05/2018	Fri: 3:00 PM-6:00 PM;	1018486
1049	1	11/06/2021 to 11/06/2021	Sat: 8:30 AM-12:30 PM;	1021454
1050	1	05/05/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1019239
1051	1	11/16/2019 to 04/18/2020	Sat: 9:00 AM-12:00 PM;	1019716
1052	2	05/02/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1019716
1053	1	07/03/2021 to 07/03/2021	Sat: 9:00 AM-2:00 PM;	1006069
1054	1	03/26/2020 to 11/19/2020	Thu: 3:00 PM-7:00 PM;	1020195
1055	1	06/07/2018 to 09/27/2018	Thu: 4:30 PM-8:00 PM;	1016862
1056	1	03/01/2021 to 03/01/2021	Sat: 10:00 AM-2:00 PM;	1021493
1057	1	05/05/2018 to 10/27/2018	Sat: 8:00 AM-12:30 PM;	1018939
1058	2	06/19/2018 to 09/25/2018	Tue: 5:30 PM-7:00 PM;	1018939
1059	1	01/01/2018 to 12/31/2018	Wed: 9:00 AM-2:00 PM;	1010037
1060	1	05/14/2018 to 10/08/2018	Mon: 7:00 AM-11:30 AM;	1001104
1061	1	01/01/2021 to 01/01/2021	Tue: 7:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1006547
1062	2	06/15/2021 to 06/15/2021	Tue: 3:00 PM-7:00 PM;Sat: 7:00 AM-1:00 PM;	1006547
1063	1	05/01/2021 to 05/01/2021	Wed: 1:00 AM-3:00 PM;Sat: 8:00 AM-1:00 PM;	1012314
1064	2	11/13/2021 to 11/13/2021	Sat: 9:00 AM-12:00 PM;	1012314
1065	1	05/03/2020 to 10/25/2020	Sun: 10:00 AM-2:00 PM;	1019844
1066	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-1:00 PM;	1020166
1067	1	06/01/2020 to 08/17/2020	Mon: 3:00 PM-6:00 PM;	1004297
1068	1	06/20/2020 to 10/14/2020	Wed: 7:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1020085
1069	1	05/22/2021 to 05/22/2021	Sat: 8:00 AM-2:00 PM;	1021377
1070	1	05/03/2018 to 10/04/2018	Thu: 4:00 PM-7:00 PM;	1011901
1071	1	05/11/2019 to 10/26/2019	Sat: 9:00 AM-1:00 PM;	1019507
1072	2	11/02/2019 to 12/21/2019	Sat: 10:00 AM-1:00 PM;	1019507
1073	3	01/04/2020 to 05/02/2020	Sat: 10:00 AM-1:00 PM;	1019507
1074	1	05/20/2021 to 05/20/2021	Thu: 4:00 PM-8:00 PM;	1021430
1075	1	05/01/2019 to 10/30/2019	Wed: 2:00 PM-7:00 PM;	1019480
1076	1	06/01/2018 to 09/01/2018	Thu: 11:00 AM-1:00 PM;	1018573
1077	1	05/09/2020 to 10/10/2020	Sat: 9:00 AM-1:00 PM;	1018314
1078	1	05/05/2020 to 09/29/2020	Tue: 3:00 PM-7:00 PM;	1018317
1079	1	10/24/2020 to 12/19/2020	Sat: 9:00 AM-12:30 PM;	1021252
1080	1	05/06/2020 to 10/28/2020	Wed: 12:00 PM-4:00 PM;	1012560
1081	2	05/02/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1012560
1082	1	01/01/2022 to 01/01/2022	Sun: 8:00 AM-11:30 AM;	1021656
1083	1	12/05/2021 to 12/05/2021	Sun: 10:00 AM-1:00 PM;	1021467
1084	1	01/01/2020 to 12/31/2020	Sat: 2:30 PM-5:30 PM;	1020162
1085	1	05/05/2018 to 10/27/2018	Sat: 8:00 AM-1:00 PM;	1018926
1086	1	06/02/2020 to 10/27/2020	Tue: 12:00 PM-5:00 PM;	1005559
1087	1	05/22/2021 to 05/22/2021	Sat: 8:00 AM-12:00 PM;	1005499
1088	1	01/01/2018 to 12/31/2018	Sat: 9:00 AM-12:30 PM;	1018991
1089	1	04/06/2021 to 04/06/2021	Tue: 3:30 PM-7:00 PM;	1004717
1090	1	01/01/2021 to 12/31/2021	Sat: 9:00 AM-1:00 PM;	1018995
1091	1	06/01/2021 to 06/01/2021	Wed: 10:00 AM-1:00 PM;Sat: 10:00 AM-1:00 PM;	1000585
1092	1	06/17/2021 to 06/17/2021	Thu: 2:00 PM-6:00 PM;	1021307
1093	1	06/19/2021 to 06/19/2021	Sat: 9:00 AM-2:00 PM;	1021288
1094	1	05/06/2021 to 05/06/2021	Thu: 7:30 AM-2:00 PM;	1021287
1095	1	06/05/2021 to 06/05/2021	Wed: 4:00 PM-7:00 PM;Sat: 8:00 AM-12:00 PM;	1021571
1096	1	01/01/2014 to 01/01/2014	Wed: 3:30 PM-6:00 PM;	1010316
1097	1	06/26/2021 to 06/26/2021	Sat: 9:30 AM-2:30 PM;	1012725
1098	1	01/01/2021 to 12/31/2021	Sat: 4:00 PM-7:00 PM;	1018924
1099	1	05/29/2018 to 10/02/2018	Tue: 4:00 PM-7:00 PM;	1018931
1100	1	01/01/2018 to 12/31/2018	Mon: 10:30 AM-5:30 PM;	1018903
1101	1	04/13/2019 to 10/26/2019	Sat: 9:00 AM-12:00 PM;	1019682
1102	2	11/16/2019 to 04/04/2020	Sat: 7:00 AM-10:30 AM;	1019682
1103	1	01/04/2020 to 12/26/2020	Sat: 8:00 AM-12:00 PM;	1011535
1104	2	04/07/2020 to 10/27/2020	Tue: 8:00 AM-12:00 PM;	1011535
1105	1	05/16/2020 to 10/31/2020	Sat: 10:00 AM-1:00 PM;	1020055
1106	1	04/03/2021 to 04/03/2021	Sat: 8:00 AM-1:00 PM;	1003081
1107	2	06/05/2021 to 06/05/2021	Tue: 3:00 PM-6:00 PM;	1003081
1108	1	11/07/2020 to 11/07/2020	Sat: 9:00 AM-1:00 PM;	1020017
1109	1	06/22/2022 to 06/22/2022	Wed: 3:00 PM-5:00 PM;Sat: 8:00 AM-1:00 PM;	1021715
1110	1	05/22/2022 to 05/22/2022	Sun: 10:00 AM-2:00 PM;	1021642
1111	2	10/03/2021 to 10/03/2021	Sun: 10:00 AM-4:00 PM;	1021642
1112	1	05/27/2018 to 11/18/2018	Sun: 12:00 PM-4:00 PM;	1018702
1113	1	05/02/2020 to 10/03/2020	Sat: 9:00 AM-12:00 PM;	1019737
1114	1	07/06/2020 to 10/26/2020	Mon: 3:00 PM-6:00 PM;	1019908
1115	1	05/03/2020 to 10/25/2020	Sun: 9:00 AM-2:00 PM;	1019725
1116	2	11/28/2020 to 11/28/2020	Sat: 10:00 AM-3:00 PM;	1019725
1117	1	06/03/2019 to 10/28/2019	Mon: 2:00 PM-6:00 PM;	1012739
1118	1	06/01/2019 to 10/26/2019	Sat: 10:00 AM-2:00 PM;	1012738
1119	1	06/06/2019 to 10/24/2019	Thu: 2:00 PM-6:00 PM;	1019348
1120	1	11/15/2018 to 05/30/2019	Thu: 2:00 PM-5:30 PM;Sat: 10:00 AM-2:00 PM;	1012737
1121	1	01/01/2021 to 01/01/2021	Wed: 10:00 AM-1:00 PM;	1021478
1122	1	06/22/2021 to 06/22/2021	Tue: 4:00 PM-7:00 PM;	1021601
1123	1	05/10/2019 to 10/18/2019	Fri: 3:00 PM-6:30 PM;	1019227
1124	1	06/01/2020 to 09/30/2020	Wed: 5:00 PM-7:30 PM;	1019879
1125	1	04/23/2021 to 04/23/2021	Sat: 9:00 AM-12:00 PM;	1021632
1126	1	04/22/2021 to 04/22/2021	Thu: 3:00 PM-6:00 PM;	1020043
1127	1	06/27/2018 to 10/31/2018	Wed: 11:00 AM-2:00 PM;	1005939
1128	1	05/16/2018 to 10/17/2018	Wed: 4:00 PM-7:00 PM;	1005991
1129	1	02/18/2021 to 02/18/2021	Tue: 3:00 PM-6:00 PM;Thu: 12:00 PM-3:00 PM;	1021336
1130	1	06/12/2021 to 06/12/2021	Sat: 9:00 AM-2:00 PM;	1021549
1131	1	07/07/2022 to 07/07/2022	Thu: 5:00 PM-7:00 PM;	1021708
1132	1	01/01/2021 to 01/01/2021	Sun: 9:00 AM-1:00 PM;	1019240
1133	1	04/28/2018 to 	\N	1019294
1134	1	06/01/2020 to 09/30/2020	Tue: 4:30 PM-6:30 PM;Thu: 4:30 PM-6:30 PM;	1019883
1135	1	06/12/2021 to 06/12/2021	Sat: 10:00 AM-1:00 PM;	1010614
1136	1	02/11/2021 to 02/11/2021	Thu: 1:00 PM-4:00 PM;	1021279
1137	2	05/13/2021 to 05/13/2021	Thu: 1:00 PM-4:00 PM;	1021279
1138	1	01/01/2020 to 12/31/2020	Thu: 3:00 PM-7:00 PM;	1020066
1139	1	07/10/2021 to 07/10/2021	Sat: 8:00 AM-12:00 PM;	1021518
1140	1	06/03/2020 to 12/16/2020	Wed: 3:00 PM-6:00 PM;	1021243
1141	1	05/05/2021 to 05/05/2021	Wed: 3:00 PM-6:00 PM;	1021434
1142	1	06/20/2019 to 09/19/2019	Thu: 2:00 PM-6:00 PM;	1019407
1143	1	06/05/2019 to 09/25/2019	Wed: 3:00 PM-6:00 PM;	1018875
1144	1	06/03/2021 to 06/03/2021	Thu: 4:00 PM-7:00 PM;	1021344
1145	1	05/18/2018 to 10/30/2018	Tue: 4:00 PM-6:30 PM;Fri: 4:00 PM-6:30 PM;	1018184
1146	1	06/02/2018 to 11/10/2018	Sat: 8:00 AM-1:00 PM;Sun: 10:00 AM-3:00 PM;	1018550
1147	1	05/07/2021 to 05/07/2021	Fri: 10:00 AM-3:00 PM;	1001059
1148	1	07/11/2015 to 07/11/2015	Sat: 11:00 AM-2:00 PM;	1004865
1149	1	05/23/2020 to 11/21/2020	Sat: 8:00 AM-12:00 PM;	1009884
1150	1	05/01/2018 to 10/31/2018	Mon: 8:00 AM-6:00 PM;Tue: 8:00 AM-6:00 PM;Wed: 8:00 AM-6:00 PM;Thu: 8:00 AM-6:00 PM;Fri: 8:00 AM-6:00 PM;Sat: 8:00 AM-6:00 PM;	1018455
1151	1	05/14/2019 to 09/17/2019	Tue: 3:00 AM-6:30 PM;	1019640
1152	1	06/16/2021 to 06/16/2021	Wed: 7:00 AM-1:00 PM;	1003694
1153	1	05/16/2020 to 10/17/2020	Sat: 9:00 AM-1:00 PM;	1006780
1154	1	05/02/2015 to 05/02/2015	Wed: 9:00 AM-1:00 PM;Sat: 9:00 AM-1:00 PM;	1010755
1155	1	06/04/2021 to 06/04/2021	Fri: 9:00 AM-1:00 PM;	1002764
1156	1	03/14/2018 to 10/31/2018	Wed: 5:00 PM-9:00 PM;	1018728
1157	1	01/01/2021 to 12/31/2021	Wed: 4:00 PM-6:00 PM;	1019815
1158	1	05/09/2021 to 05/09/2021	Sun: 8:30 AM-12:30 PM;	1021379
1159	2	10/31/2021 to 10/31/2021	Sun: 10:00 AM-1:00 PM;	1021379
1160	1	05/06/2021 to 05/06/2021	Thu: 8:00 AM-3:00 PM;	1021554
1161	1	01/06/2021 to 01/06/2021	Mon: 12:00 PM-6:00 PM;Tue: 12:00 PM-6:00 PM;Wed: 10:00 AM-2:00 PM;Thu: 12:00 PM-6:00 PM;Fri: 12:00 PM-4:00 PM;Sun: 12:00 PM-6:00 PM;	1019008
1162	1	01/09/2021 to 01/09/2021	Sat: 11:00 AM-1:00 PM;	1019345
1163	1	04/05/2020 to 12/27/2020	Sun: 8:30 AM-1:00 PM;	1020054
1164	2	01/05/2020 to 03/29/2020	Sun: 9:00 AM-1:00 PM;	1020054
1165	1	06/17/2018 to 10/28/2018	Sun: 9:00 AM-2:00 PM;	1019127
1166	1	06/02/2018 to 10/01/2018	Sat: 9:00 AM-3:00 PM;	1019828
1167	2	06/08/2019 to 10/01/2019	Sat: 9:00 AM-2:00 PM;	1019828
1168	3	06/06/2020 to 10/01/2020	Sat: 9:00 AM-2:00 PM;	1019828
1169	1	01/01/2021 to 01/01/2021	Sun: 2:00 PM-5:00 PM;	1021566
1170	1	05/01/2019 to 11/13/2019	Wed: 8:00 AM-12:00 PM;	1019488
1171	1	06/07/2017 to 08/30/2017	Wed: 4:00 PM-7:30 PM;	1018829
1172	1	07/06/2018 to 09/07/2018	Fri: 3:00 PM-7:30 PM;	1019223
1173	1	01/01/2019 to 12/31/2019	Sat: 9:00 AM-2:00 PM;	1019353
1174	1	01/01/2018 to 12/31/2018	Wed: 4:00 PM-8:00 PM;	1001839
1175	1	06/24/2020 to 09/30/2020	Wed: 8:00 AM-1:00 PM;	1006250
1176	1	01/01/2018 to 12/31/2018	Sat: 8:00 AM-1:00 PM;	1019200
1177	1	05/15/2021 to 05/15/2021	Sat: 9:00 AM-12:00 PM;	1021412
1178	1	05/20/2021 to 05/20/2021	Thu: 4:00 PM-7:00 PM;	1021413
1179	1	06/04/2019 to 09/24/2019	Tue: 10:00 AM-2:00 PM;	1001271
1180	1	05/12/2021 to 05/12/2021	Wed: 8:00 AM-12:00 PM;Sat: 8:00 AM-12:00 PM;	1021356
1181	1	01/01/2021 to 01/01/2021	Tue: 3:00 PM-7:00 PM;	1020130
1182	1	01/01/2020 to 12/31/2020	Tue: 3:00 PM-8:00 PM;	1020131
1183	1	01/01/2020 to 12/31/2020	Fri: 8:00 AM-2:00 PM;	1020146
1184	1	01/01/2019 to 12/31/2019	Wed: 8:00 AM-9:00 AM;	1009659
1185	1	04/01/2020 to 	Sat: 9:00 AM-1:00 PM;	1010865
1186	1	04/04/2019 to 10/27/2019	Thu: 10:00 AM-3:00 PM;Fri: 10:00 AM-3:00 PM;Sat: 10:00 AM-3:00 PM;Sun: 10:00 AM-3:00 PM;	1019646
1187	2	11/02/2019 to 12/29/2019	Sat: 10:00 AM-3:00 PM;Sun: 10:00 AM-3:00 PM;	1019646
1188	3	01/04/2020 to 03/28/2020	Sat: 10:00 AM-3:00 PM;	1019646
1189	1	05/05/2019 to 10/13/2019	Sun: 9:00 AM-1:00 PM;	1018655
1190	1	04/02/2022 to 04/02/2022	Sat: 9:00 AM-4:00 PM;	1021685
1191	1	06/17/2021 to 06/17/2021	Thu: 12:00 PM-6:00 PM;	1001034
1192	1	04/10/2021 to 04/10/2021	Sat: 8:30 AM-1:30 PM;	1019317
1193	2	04/13/2021 to 04/13/2021	Tue: 9:30 AM-1:30 PM;	1019317
1194	1	06/06/2021 to 06/06/2021	Sun: 10:00 AM-2:00 PM;	1021608
1195	1	06/24/2021 to 06/24/2021	Thu: 3:30 PM-7:00 PM;	1018807
1196	2	11/18/2021 to 11/18/2021	Thu: 3:30 PM-7:00 PM;	1018807
1197	1	01/01/2021 to 12/31/2021	Sat: 9:00 AM-1:00 PM;	1020114
1198	1	09/06/2020 to 09/06/2020	Sun: 10:00 AM-3:00 PM;	1018920
1199	2	09/05/2021 to 09/05/2021	Sun: 10:00 AM-3:00 PM;	1018920
1200	1	01/01/2019 to 12/31/2019	Sat: 9:00 AM-2:00 PM;	1008468
1201	1	01/01/2018 to 12/31/2018	Sat: 8:00 AM-12:00 PM;	1019202
1202	1	05/09/2020 to 12/26/2020	Sat: 9:00 AM-1:00 PM;	1020198
1203	1	01/01/2018 to 12/31/2018	Thu: 8:00 AM-1:00 PM;	1008360
1204	1	06/04/2019 to 10/01/2019	Tue: 11:00 AM-3:00 PM;	1019416
1205	1	06/02/2018 to 10/27/2018	Sat: 8:00 AM-12:30 PM;	1019023
1206	1	11/03/2018 to 04/27/2019	Sat: 9:00 AM-12:30 PM;	1019025
1207	1	06/05/2022 to 06/05/2022	Sun: 9:00 AM-1:00 PM;	1021699
1208	1	07/06/2020 to 09/07/2020	Mon: 4:00 PM-6:30 PM;	1021215
1209	1	06/19/2020 to 09/25/2020	Fri: 3:00 PM-7:00 PM;	1020023
1210	1	05/08/2020 to 10/31/2020	Wed: 8:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1004212
1211	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-12:00 PM;	1021335
1212	2	05/04/2021 to 05/04/2021	Tue: 4:00 PM-7:00 PM;	1021335
1213	1	01/01/2020 to 12/31/2020	Thu: 9:00 AM-1:30 PM;	1012777
1214	1	06/02/2019 to 09/29/2019	Sun: 10:00 AM-2:00 PM;	1008946
1215	1	04/16/2022 to 04/16/2022	Sat: 7:30 AM-2:00 PM;	1021721
1216	1	05/03/2022 to 05/03/2022	Tue: 3:00 PM-7:00 PM;	1021722
1217	1	05/01/2021 to 05/01/2021	Sat: 7:30 AM-11:00 AM;	1021599
1218	2	10/02/2021 to 10/02/2021	Sat: 8:30 AM-12:00 PM;	1021599
1219	1	01/01/2020 to 12/31/2020	Fri: 3:00 PM-7:00 PM;	1021200
1220	1	01/11/2020 to 03/28/2020	Sat: 9:00 AM-2:00 PM;	1019723
1221	1	01/08/2022 to 01/08/2022	Sat: 9:00 AM-1:00 PM;	1021648
1222	1	06/25/2018 to 11/26/2018	Mon: 9:00 AM-12:00 PM;	1019102
1223	1	01/01/2019 to 12/31/2019	Wed: 6:30 AM-7:30 AM;	1005248
1224	1	11/17/2018 to 03/01/2019	Sat: 8:00 AM-12:00 PM;	1018687
1225	1	01/01/2016 to 01/01/2016	Sun: 8:00 AM-1:00 PM;	1011995
1226	1	06/19/2021 to 06/19/2021	Sat: 6:00 PM-9:00 PM;	1021491
1227	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-2:00 PM;	1019755
1228	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-2:00 PM;	1019761
1229	1	04/28/2018 to 10/27/2018	Wed: 12:00 PM-4:00 PM;Sat: 7:00 AM-12:00 PM;	1006927
1230	1	01/01/2020 to 12/31/2020	Sat: 11:00 AM-1:00 PM;	1019939
1231	1	04/03/2021 to 04/03/2021	Sat: 8:30 AM-1:30 PM;	1021417
1232	1	06/15/2019 to 10/12/2019	Sat: 9:00 AM-1:00 PM;	1019674
1233	1	07/01/2020 to 10/28/2020	Wed: 3:00 PM-6:00 PM;	1019910
1234	1	11/04/2017 to 04/28/2018	Sat: 9:00 AM-1:00 PM;	1018944
1235	1	05/07/2022 to 05/07/2022	Sat: 9:00 AM-12:00 PM;	1021735
1236	1	07/10/2018 to 08/28/2018	Tue: 4:00 PM-7:00 PM;	1019068
1237	1	05/29/2021 to 05/29/2021	Sat: 8:00 AM-12:00 PM;	1021389
1238	2	11/09/2021 to 11/09/2021	Tue: 3:00 PM-6:00 PM;	1021389
1239	1	06/19/2022 to 06/19/2022	Sun: 9:00 AM-1:00 PM;	1021718
1240	1	05/01/2020 to 10/16/2020	Fri: 4:30 PM-7:30 PM;	1020175
1241	1	06/06/2021 to 06/06/2021	Sun: 9:00 AM-12:00 PM;	1018466
1242	1	01/01/2019 to 12/31/2019	Sun: 10:00 AM-2:00 PM;	1019454
1243	1	05/02/2020 to 11/07/2020	Sat: 8:00 AM-2:00 PM;	1020072
1244	1	05/07/2022 to 05/07/2022	Sat: 8:00 AM-12:00 PM;	1021688
1245	1	05/29/2021 to 05/29/2021	Sat: 9:00 AM-1:00 PM;	1019854
1246	1	05/30/2022 to 05/30/2022	Mon: 7:00 AM-12:00 PM;Wed: 7:00 AM-12:00 PM;Sat: 7:00 AM-12:00 PM;	1021746
1247	1	05/01/2020 to 10/16/2020	Fri: 4:00 PM-6:30 PM;	1019822
1248	1	06/11/2020 to 08/27/2020	Thu: 4:30 PM-8:00 PM;	1018626
1249	1	05/09/2020 to 11/21/2020	Sat: 2:00 PM-5:00 PM;	1018627
1250	1	06/17/2016 to 10/21/2016	Fri: 3:00 PM-6:00 PM;	1012060
1251	1	05/05/2018 to 11/17/2018	Sat: 9:00 AM-1:00 PM;	1010839
1252	1	04/18/2018 to 10/17/2018	Wed: 4:00 PM-7:00 PM;	1019128
1253	1	05/01/2018 to 10/30/2018	Tue: 3:00 PM-7:00 PM;	1001260
1254	1	01/01/2020 to 12/31/2020	Mon: 2:00 PM-6:00 PM;	1020126
1255	1	01/01/2018 to 12/31/2018	Fri: 4:00 PM-7:00 PM;Sun: 10:00 AM-2:00 PM;	1002060
1256	1	03/01/2021 to 03/01/2021	Fri: 10:00 AM-1:00 PM;	1021494
1257	1	01/01/2013 to 12/31/2013	\N	1007245
1258	1	04/25/2020 to 11/21/2020	Sat: 9:00 AM-1:30 PM;	1010408
1259	1	06/18/2022 to 06/18/2022	Sat: 9:00 AM-12:00 PM;	1021731
1260	1	05/30/2020 to 11/24/2020	Tue: 4:30 PM-7:00 PM;Sat: 9:00 AM-1:00 PM;	1020165
1261	1	06/11/2021 to 06/11/2021	Fri: 11:00 AM-1:00 PM;Sat: 11:00 AM-1:00 PM;	1021380
1262	1	01/01/2014 to 01/01/2014	Sun: 8:00 AM-2:00 PM;	1010638
1263	1	07/17/2018 to 11/20/2018	Tue: 9:00 AM-5:30 PM;	1016803
1264	1	04/17/2021 to 04/17/2021	Sun: 8:00 AM-12:00 PM;	1021641
1265	2	06/09/2021 to 06/09/2021	Wed: 4:00 PM-6:00 PM;	1021641
1266	1	01/01/2018 to 12/31/2018	Tue: 7:00 AM-2:00 PM;Thu: 7:00 AM-2:00 PM;Sat: 7:00 AM-2:00 PM;	1018921
1267	1	06/04/2020 to 09/24/2020	Thu: 2:00 PM-6:00 PM;	1020005
1268	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-12:00 PM;	1021572
1269	1	05/30/2020 to 09/26/2020	Sat: 9:00 AM-1:00 PM;	1019328
1270	1	06/01/2020 to 09/30/2020	Wed: 9:00 AM-12:30 PM;	1019885
1271	1	05/21/2020 to 10/01/2020	Thu: 3:30 PM-6:30 PM;	1012268
1272	2	11/07/2020 to 12/01/2020	Sat: 10:00 AM-2:00 PM;	1012268
1273	1	11/07/2020 to 12/12/2020	Sat: 10:00 AM-2:00 PM;	1019344
1274	2	01/01/2019 to 12/31/2019	Wed: 8:00 AM-6:00 PM;Thu: 8:00 AM-6:00 PM;Fri: 8:00 AM-6:00 PM;	1019478
1275	1	05/04/2019 to 10/26/2019	Sat: 8:00 AM-12:00 PM;	1019616
1276	1	11/02/2019 to 04/25/2020	Sun: 8:00 AM-12:00 PM;	1019615
1277	1	06/01/2020 to 09/30/2020	Sat: 9:00 AM-12:00 PM;	1019884
1278	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-2:00 PM;	1020019
1279	1	05/10/2019 to 10/12/2019	Fri: 8:00 AM-1:00 PM;Sat: 8:00 AM-1:00 PM;	1008213
1280	1	04/03/2021 to 04/03/2021	Sat: 8:30 AM-1:00 PM;	1021455
1281	2	12/01/2021 to 12/01/2021	Sat: 9:00 AM-11:30 AM;	1021455
1282	1	05/09/2020 to 10/10/2020	Sat: 7:30 AM-11:30 AM;	1004602
1283	1	06/16/2018 to 09/29/2018	Sat: 9:00 AM-12:00 PM;	1011146
1284	1	01/01/2019 to 12/31/2019	Fri: 11:00 AM-12:00 PM;	1005259
1285	1	03/24/2021 to 03/24/2021	Wed: 4:00 PM-8:00 PM;	1021485
1286	1	06/05/2021 to 06/05/2021	Sat: 7:00 AM-11:00 AM;	1021462
1287	2	09/04/2021 to 09/04/2021	Sat: 8:00 AM-12:00 PM;	1021462
1288	1	01/01/2018 to 12/31/2018	Sun: 10:00 AM-2:00 PM;	1019027
1289	1	05/11/2018 to 10/26/2018	Fri: 2:00 AM-6:00 PM;	1018986
1290	1	06/02/2021 to 06/02/2021	Wed: 3:00 PM-7:00 PM;	1018474
1291	1	05/02/2021 to 05/02/2021	Sun: 10:00 AM-2:00 PM;	1018477
1292	1	06/06/2021 to 06/06/2021	Sun: 9:00 AM-2:00 PM;	1018478
1293	1	11/07/2020 to 11/07/2020	Sat: 9:00 AM-2:00 PM;	1018482
1294	2	04/03/2021 to 04/03/2021	Sat: 8:30 AM-2:00 PM;	1018482
1295	1	05/05/2021 to 05/05/2021	Wed: 10:00 AM-2:00 PM;	1018483
1296	1	05/05/2018 to 11/03/2018	Sat: 8:00 AM-1:00 PM;	1007797
1297	1	06/29/2020 to 09/28/2020	Mon: 4:00 PM-7:00 PM;	1019807
1298	1	01/01/2021 to 01/01/2021	Sat: 10:00 AM-1:00 PM;	1021263
1299	2	05/01/2021 to 05/01/2021	Sat: 7:30 AM-12:00 PM;	1021263
1300	1	01/09/2021 to 01/09/2021	Sat: 10:00 AM-2:00 PM;	1021501
1301	1	07/14/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1019149
1302	1	05/02/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1019793
1303	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-12:30 PM;	1020086
1304	1	07/18/2018 to 10/31/2018	Wed: 4:00 PM-7:00 PM;	1018215
1305	1	05/19/2021 to 05/19/2021	Wed: 3:30 PM-6:30 PM;	1021617
1306	1	04/04/2020 to 11/28/2020	Sat: 9:00 AM-1:00 PM;	1019868
1307	2	12/05/2020 to 	Sat: 10:00 AM-1:00 PM;	1019868
1308	1	05/01/2021 to 05/01/2021	Sat: 9:00 AM-1:00 PM;	1021266
1309	1	05/01/2021 to 05/01/2021	Sun: 9:00 AM-1:00 PM;	1011596
1310	1	04/18/2020 to 10/01/2020	Sat: 9:00 AM-2:00 PM;	1003402
1311	1	03/01/2021 to 03/01/2021	Sat: 8:00 AM-12:00 PM;	1021618
1312	1	05/17/2019 to 10/04/2019	Fri: 12:00 PM-6:00 PM;	1019477
1313	1	06/03/2021 to 06/03/2021	Thu: 3:00 PM-7:30 PM;	1010145
1314	1	01/01/2019 to 12/31/2019	Wed: 10:00 AM-11:00 AM;	1005260
1315	1	06/14/2018 to 09/06/2018	Thu: 4:30 PM-7:30 PM;	1019122
1316	1	05/05/2018 to 10/27/2018	Sat: 7:00 AM-12:00 PM;	1019315
1317	1	05/02/2021 to 05/02/2021	Sun: 10:00 AM-2:00 PM;	1021579
1318	1	05/09/2018 to 08/29/2018	Wed: 8:00 AM-12:00 PM;	1011310
1319	1	05/08/2018 to 10/27/2018	Tue: 4:00 PM-6:00 PM;Sat: 9:00 AM-12:00 PM;	1019204
1320	1	06/27/2020 to 	Sat: 9:00 AM-12:00 PM;	1020093
1321	1	06/21/2019 to 09/13/2019	Fri: 3:30 PM-6:00 PM;	1019500
1322	1	05/23/2013 to 05/23/2013	Thu: 4:00 PM-6:00 PM;Sat: 9:00 AM-12:00 PM;	1001766
1323	1	05/01/2020 to 08/18/2020	Tue: 8:00 AM-12:00 PM;	1020024
1324	2	09/29/2020 to 12/01/2020	Tue: 12:00 PM-;	1020024
1325	1	01/09/2021 to 01/09/2021	Sat: 8:00 AM-12:00 PM;	1021277
1326	1	01/01/2020 to 08/01/2020	Thu: 8:00 AM-12:00 PM;	1003610
1327	1	01/01/2019 to 12/31/2019	Mon: 10:00 AM-6:00 PM;Tue: 10:00 AM-6:00 PM;Wed: 10:00 AM-6:00 PM;Thu: 10:00 AM-6:00 PM;Fri: 10:00 AM-6:00 PM;Sat: 10:00 AM-6:00 PM;Sun: 10:00 AM-6:00 PM;	1019410
1328	1	01/01/2019 to 12/31/2019	Mon: 10:00 AM-6:00 PM;Tue: 10:00 AM-6:00 PM;Wed: 10:00 AM-6:00 PM;Thu: 10:00 AM-6:00 PM;Fri: 10:00 AM-6:00 PM;Sat: 10:00 AM-6:00 PM;Sun: 10:00 AM-6:00 PM;	1019411
1329	1	01/01/2019 to 12/31/2019	Thu: 6:00 PM-9:00 PM;	1004750
1330	1	01/01/2019 to 12/31/2019	Sat: 8:00 AM-11:00 AM;	1004751
1331	1	05/01/2015 to 10/30/2015	Fri: 10:00 AM-3:00 PM;	1000712
1332	1	05/05/2018 to 10/30/2018	Tue: 7:00 AM-1:00 PM;Thu: 7:00 AM-1:00 PM;Sat: 7:00 AM-1:00 PM;	1019235
1333	1	05/30/2021 to 05/30/2021	Sun: 9:00 AM-1:00 PM;	1021615
1334	1	05/02/2020 to 10/31/2020	Sat: 7:30 AM-11:30 AM;	1009020
1335	2	07/07/2020 to 08/31/2020	Tue: 4:00 PM-6:00 PM;	1009020
1336	1	04/20/2019 to 	Sat: 8:00 AM-12:00 PM;	1019493
1337	1	05/10/2013 to 09/27/2019	Fri: 4:00 PM-8:00 PM;	1002843
1338	1	05/02/2020 to 05/02/2020	Sat: 8:00 AM-12:00 PM;	1018549
1339	2	07/07/2020 to 07/07/2020	Tue: 4:00 PM-7:00 PM;	1018549
1340	1	11/07/2020 to 11/07/2020	Sat: 10:00 AM-1:00 PM;	1021272
1341	1	05/31/2020 to 10/04/2020	Sun: 11:00 AM-2:00 PM;	1019930
1342	1	06/01/2018 to 10/26/2018	Fri: 8:30 AM-12:30 PM;	1019142
1343	1	06/01/2018 to 10/26/2018	Fri: 8:30 AM-12:30 PM;	1019145
1344	1	05/10/2018 to 10/04/2018	Thu: 3:00 PM-6:00 PM;	1005060
1345	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-3:00 PM;	1021312
1346	1	01/01/2021 to 01/01/2021	Tue: 10:00 AM-2:00 PM;	1021302
1347	1	04/13/2019 to 10/26/2019	Sat: 9:00 AM-1:00 PM;	1019419
1348	1	08/01/2018 to 09/15/2018	Thu: 5:00 PM-7:00 PM;	1019312
1349	1	01/26/2021 to 01/26/2021	Thu: 3:00 PM-7:00 PM;	1004073
1350	2	03/04/2021 to 03/04/2021	Thu: 3:00 PM-7:00 PM;	1004073
1351	3	12/02/2021 to 12/02/2021	Thu: 3:00 PM-6:30 PM;	1004073
1352	1	03/23/2019 to 11/23/2019	Sat: 8:00 AM-1:00 PM;	1019418
1353	1	01/01/2019 to 12/31/2019	Sat: 10:00 AM-3:00 PM;	1018284
1354	1	06/05/2021 to 06/05/2021	Sat: 8:30 AM-12:00 PM;	1021409
1355	1	06/03/2020 to 10/07/2020	Wed: 2:30 PM-7:00 PM;	1000194
1356	1	10/06/2018 to 07/27/2019	Sat: 9:00 AM-1:00 PM;	1019259
1357	1	05/31/2020 to 11/22/2020	Sun: 10:00 AM-2:00 PM;	1019927
1358	1	05/04/2019 to 10/05/2019	Sun: 9:00 AM-1:00 PM;	1019635
1359	2	11/23/2019 to 	Sat: 10:00 AM-2:00 PM;	1019635
1360	1	07/07/2018 to 09/08/2018	Sat: 9:00 AM-1:00 PM;	1019070
1361	1	06/11/2020 to 08/27/2020	Thu: 4:00 PM-7:00 PM;	1019899
1362	1	08/01/2020 to 10/31/2020	Sat: 9:00 AM-1:00 PM;	1020173
1363	1	01/01/2021 to 01/01/2021	Thu: 2:00 PM-6:00 PM;	1019033
1364	1	05/18/2019 to 11/23/2019	Sat: 9:00 AM-1:00 PM;	1012576
1365	1	06/12/2021 to 06/12/2021	Sun: 9:00 AM-1:00 PM;	1021623
1366	1	04/03/2021 to 04/03/2021	Sat: 9:00 AM-1:00 PM;	1021606
1367	1	07/07/2018 to 09/29/2018	Sat: 8:30 AM-1:30 PM;	1019048
1368	1	06/13/2018 to 10/03/2018	Wed: 3:00 PM-6:30 PM;	1011286
1369	1	05/09/2020 to 10/10/2020	Sat: 9:00 AM-1:00 PM;	1019747
1370	1	03/05/2019 to 11/26/2019	Tue: 8:30 AM-1:30 PM;	1003969
1371	1	03/07/2019 to 10/31/2019	Thu: 8:30 AM-1:30 PM;	1003970
1372	1	05/04/2019 to 10/26/2019	Sat: 8:30 AM-1:00 PM;	1003971
1373	1	06/07/2019 to 08/30/2019	Fri: 4:00 PM-7:00 PM;	1018637
1374	1	05/26/2018 to 09/22/2018	Sat: 10:00 AM-2:00 PM;	1011778
1375	1	05/16/2019 to 09/26/2019	Thu: 4:00 PM-7:00 PM;	1019479
1376	1	07/07/2019 to 10/27/2019	Sun: 11:00 AM-3:00 PM;	1018349
1377	1	06/16/2020 to 09/29/2020	Tue: 3:00 PM-7:00 PM;	1019973
1378	1	04/07/2018 to 	Sat: 8:00 AM-12:00 PM;	1010821
1379	1	01/17/2020 to 	Sun: 12:00 PM-2:00 PM;	1019194
1380	1	05/13/2020 to 10/28/2020	Wed: 3:00 PM-7:00 PM;	1019791
1381	1	01/01/2021 to 01/01/2021	Sat: 10:00 AM-2:00 PM;	1021535
1382	1	05/05/2019 to 	Sun: 10:00 AM-2:00 PM;	1021218
1383	1	01/01/2019 to 12/31/2019	Sun: 9:30 AM-11:00 AM;	1005261
1384	1	05/17/2018 to 09/13/2018	Thu: 4:00 PM-8:00 PM;	1019119
1385	1	05/01/2021 to 05/01/2021	Sat: 9:00 AM-1:00 PM;	1021451
1386	1	06/12/2021 to 06/12/2021	Wed: 12:00 PM-4:00 PM;Sat: 8:30 AM-12:00 PM;	1003915
1387	1	01/01/2021 to 12/31/2021	Tue: 4:00 PM-8:00 PM;	1019620
1388	1	06/02/2022 to 06/02/2022	Thu: 3:00 PM-7:00 PM;	1021646
1389	1	06/13/2021 to 06/13/2021	Sun: 11:00 AM-3:00 PM;	1021503
1390	1	04/14/2018 to 12/15/2018	Sun: 8:00 AM-12:00 PM;	1018975
1391	1	11/02/2019 to 12/07/2019	Sat: 9:00 AM-12:00 PM;	1019715
1392	1	05/02/2020 to 10/31/2020	Sat: 9:00 AM-1:00 PM;	1019825
1393	1	05/22/2018 to 10/30/2018	Tue: 11:00 AM-5:00 PM;	1002062
1394	2	05/26/2020 to 10/27/2020	Tue: 11:00 AM-5:00 PM;	1002062
1395	1	04/03/2021 to 04/03/2021	Sat: 8:00 AM-12:00 PM;	1005214
1396	2	01/04/2014 to 01/04/2014	Sat: 9:00 AM-11:00 AM;	1005214
1397	1	08/19/2021 to 08/19/2021	Thu: 3:00 PM-7:00 PM;	1021613
1398	1	11/04/2018 to 04/28/2019	Sun: 10:00 AM-2:00 PM;	1019211
1399	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-2:00 PM;	1021546
1400	1	05/02/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1004988
1401	1	11/07/2020 to 12/31/2020	Sat: 9:00 AM-12:00 PM;	1004990
1402	1	06/02/2022 to 06/02/2022	Thu: 5:00 PM-8:00 PM;	1021724
1403	2	11/06/2021 to 11/06/2021	Sat: 10:00 AM-2:00 PM;	1021724
1404	3	04/02/2022 to 04/02/2022	Sat: 10:00 AM-2:00 PM;	1021724
1405	4	10/01/2022 to 10/01/2022	Sat: 10:00 AM-2:00 PM;	1021724
1406	1	06/11/2019 to 10/29/2019	Tue: 11:00 AM-3:00 PM;	1002485
1407	1	06/05/2019 to 09/04/2019	Wed: 4:00 PM-7:00 PM;	1019428
1408	1	01/01/2019 to 12/31/2019	Sat: 11:00 AM-12:00 PM;	1005262
1409	1	04/03/2021 to 04/03/2021	Sat: 10:00 AM-1:00 PM;	1021468
1410	1	01/01/2018 to 12/31/2018	Sat: 5:00 AM-3:00 PM;	1009080
1411	1	05/05/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1018449
1412	1	06/17/2020 to 10/28/2020	Wed: 2:00 PM-6:00 PM;	1019913
1413	1	01/04/2020 to 12/26/2020	Sat: 9:00 AM-1:00 PM;	1020185
1414	1	01/01/2021 to 01/01/2021	Sat: 8:30 AM-1:00 PM;	1021645
1415	2	03/03/2021 to 03/03/2021	Wed: 8:30 AM-1:00 PM;	1021645
1416	1	01/04/2020 to 12/30/2020	Wed: 9:00 AM-1:30 PM;Sat: 8:30 AM-1:00 PM;	1018625
1417	1	05/02/2018 to 08/22/2018	Wed: 5:00 AM-8:30 PM;	1018315
1418	1	01/01/2018 to 12/31/2018	Sat: 9:00 AM-1:00 PM;	1011160
1419	1	05/03/2014 to 10/29/2014	Wed: 8:00 AM-12:00 PM;Sat: 7:30 AM-12:00 PM;	1007261
1420	1	06/02/2018 to 09/29/2018	Tue: 6:00 AM-1:00 PM;Sat: 6:00 AM-1:00 PM;	1008303
1421	1	06/04/2016 to 10/15/2016	Sat: 9:00 AM-2:00 PM;	1012203
1422	2	10/20/2018 to 12/22/2018	Sat: 10:00 AM-2:00 PM;	1012203
1423	1	08/07/2021 to 08/07/2021	Sat: 10:00 AM-1:00 PM;	1021577
1424	1	05/29/2021 to 05/29/2021	Sat: 10:00 AM-2:00 PM;	1007250
1425	1	06/02/2021 to 06/02/2021	Wed: 4:00 PM-7:00 PM;	1021558
1426	1	05/14/2022 to 05/14/2022	Sat: 9:00 AM-12:00 PM;	1021707
1427	1	05/19/2018 to 11/17/2018	Sat: 8:00 AM-2:00 PM;	1012037
1428	1	05/22/2019 to 10/30/2019	Wed: 3:00 PM-6:00 PM;	1019627
1429	1	05/23/2020 to 09/26/2020	Sat: 9:00 AM-1:00 PM;	1020088
1430	1	06/05/2019 to 09/25/2019	Wed: 4:00 PM-7:00 PM;	1019515
1431	1	06/08/2019 to 08/31/2019	Sat: 9:00 AM-12:00 PM;	1019445
1432	1	11/10/2018 to 04/06/2019	Sat: 10:00 AM-2:00 PM;	1018167
1433	1	11/17/2018 to 03/23/2019	Sat: 10:00 AM-2:00 PM;	1018172
1434	1	03/10/2018 to 11/10/2018	Sat: 9:00 AM-12:00 PM;	1019237
1435	1	05/27/2022 to 05/27/2022	Fri: 3:00 PM-6:00 PM;	1021693
1436	2	07/08/2022 to 07/08/2022	Tue: 9:00 AM-1:00 PM;	1021693
1437	1	06/15/2022 to 06/15/2022	Wed: 2:00 PM-6:00 PM;	1021664
1438	1	01/01/2020 to 04/30/2020	Sat: 10:00 AM-12:00 PM;	1021233
1439	2	05/01/2020 to 09/30/2020	Sat: 8:00 AM-12:00 PM;	1021233
1440	3	10/01/2020 to 11/25/2020	Sat: 9:00 AM-12:00 PM;	1021233
1441	4	12/01/2020 to 12/31/2020	Sat: 9:00 AM-12:00 PM;	1021233
1442	1	05/01/2020 to 10/30/2020	Tue: 3:00 PM-6:00 PM;Fri: 3:00 PM-6:00 PM;	1018773
1443	1	07/09/2019 to 	Tue: 10:00 AM-2:00 PM;	1019610
1444	1	06/16/2020 to 10/13/2020	Tue: 3:00 PM-7:00 PM;	1019442
1614	1	07/05/2020	Sun: 8:00 AM-12:00 PM;	1000278
1445	1	05/01/2019 to 10/31/2019	Wed: 7:00 AM-11:00 AM;Sat: 7:00 AM-11:00 AM;	1019395
1446	1	05/07/2022 to 05/07/2022	Wed: 5:00 PM-7:00 PM;Sat: 8:00 AM-12:00 PM;	1021700
1447	1	06/04/2016 to 08/01/2020	Sat: 9:00 AM-1:00 PM;	1010838
1448	1	06/19/2021 to 06/19/2021	Sat: 8:00 AM-12:00 PM;	1019455
1449	1	05/01/2021 to 05/01/2021	Sat: 7:00 AM-12:00 PM;	1021429
1450	1	06/19/2021 to 06/19/2021	Wed: 3:30 PM-6:00 PM;Sat: 8:30 AM-12:00 PM;	1001280
1451	1	05/16/2020 to 09/26/2020	Sat: 8:00 AM-12:00 PM;	1019976
1452	1	06/04/2020 to 10/24/2020	Thu: 5:00 PM-8:00 PM;Sat: 8:00 AM-12:00 PM;	1020103
1453	1	06/05/2021 to 06/05/2021	Sat: 10:00 AM-2:00 PM;	1019319
1454	1	06/13/2021 to 06/13/2021	Sun: 9:30 AM-1:00 PM;	1012179
1455	1	05/30/2020 to 10/10/2020	Sat: 8:00 AM-1:00 PM;	1020004
1456	1	04/17/2021 to 04/17/2021	Sat: 8:00 AM-12:00 PM;	1021397
1457	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-12:00 PM;	1018771
1458	1	05/13/2020 to 10/28/2020	Wed: 9:00 AM-12:00 PM;	1021219
1459	1	01/01/2019 to 12/31/2019	Tue: 1:00 PM-7:00 PM;Sat: 8:00 AM-1:30 PM;	1011044
1460	1	06/07/2018 to 10/18/2018	Thu: 5:00 PM-8:00 PM;	1016822
1461	1	05/02/2017 to 09/24/2019	Tue: 10:00 AM-2:00 PM;	1018601
1462	1	01/01/2018 to 12/31/2018	Fri: 11:00 AM-3:30 PM;	1011811
1463	2	01/01/2018 to 12/31/2018	Fri: 11:00 AM-3:30 PM;	1011811
1464	1	05/06/2020 to 10/31/2020	Wed: 8:00 AM-1:00 PM;Sat: 8:00 AM-1:00 PM;	1010560
1465	1	06/20/2020 to 09/26/2020	Sat: 10:00 AM-1:00 PM;	1003169
1466	1	06/06/2020 to 10/03/2020	Sat: 9:00 AM-12:00 PM;	1019869
1467	1	01/01/2020 to 12/31/2020	Tue: 2:30 PM-5:30 PM;	1020163
1468	1	04/01/2020 to 12/01/2020	Mon: 8:00 AM-1:00 PM;Tue: 8:00 AM-1:00 PM;Thu: 8:00 AM-1:00 PM;Fri: 8:00 AM-1:00 PM;Sat: 8:00 AM-1:00 PM;	1010014
1469	1	01/01/2022 to 01/01/2022	Mon: 9:00 AM-9:00 PM;Tue: 9:00 AM-9:00 PM;Wed: 9:00 AM-9:00 PM;Thu: 9:00 AM-9:00 PM;Fri: 9:00 AM-9:00 PM;Sat: 9:00 AM-5:00 PM;Sun: 9:00 AM-5:00 PM;	1021675
1470	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-2:00 PM;	1020022
1471	1	07/08/2020 to 10/07/2020	Wed: 2:30 PM-6:00 PM;	1019926
1472	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-1:00 PM;	1020159
1473	1	01/01/2021 to 01/01/2021	Sun: 12:00 PM-4:00 PM;	1003836
1474	1	06/05/2021 to 06/05/2021	Sat: 10:00 AM-2:00 PM;	1019829
1475	1	05/25/2019 to 11/23/2019	Sat: 9:00 AM-12:00 PM;	1019671
1476	1	07/10/2020 to 10/17/2020	Fri: 10:30 AM-12:30 PM;	1020039
1477	1	07/10/2020 to 10/17/2020	Fri: 2:30 PM-4:30 PM;	1020040
1478	1	07/10/2020 to 10/17/2020	Sat: 1:30 PM-3:30 PM;	1011934
1479	1	07/10/2020 to 10/17/2020	Sat: 10:00 AM-12:00 PM;	1011935
1480	1	04/25/2020 to 10/24/2020	Sat: 9:00 AM-3:00 PM;	1019803
1481	1	01/01/2020 to 12/31/2020	Tue: 2:00 PM-6:30 PM;	1020067
1482	1	12/03/2021 to 12/03/2021	Fri: 9:00 AM-2:00 PM;	1021697
1483	1	01/01/2019 to 12/31/2019	Tue: 4:30 PM-6:00 PM;	1019385
1484	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-1:00 PM;	1021214
1485	1	01/01/2019 to 12/31/2019	Sun: 11:00 AM-3:00 PM;	1019599
1486	1	05/05/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1002526
1487	1	05/02/2020 to 10/27/2020	Tue: 2:00 PM-6:00 PM;	1019915
1488	1	06/01/2021 to 06/01/2021	Tue: 8:00 AM-1:00 PM;	1021573
1489	1	05/01/2019 to 10/31/2019	Sat: 9:00 AM-2:00 PM;	1019511
1490	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-2:00 PM;	1010997
1491	1	06/03/2021 to 06/03/2021	Thu: 3:00 PM-7:00 PM;	1010445
1492	1	06/02/2021 to 06/02/2021	Wed: 2:00 PM-7:00 PM;	1021553
1493	1	05/12/2018 to 10/06/2018	Sat: 10:00 AM-2:00 PM;	1019091
1494	2	10/13/2018 to 12/31/2018	Sat: 10:00 AM-2:00 PM;	1019091
1495	1	05/01/2018 to 	Sat: 8:00 AM-12:00 PM;	1018098
1496	1	06/03/2021 to 06/03/2021	Thu: 2:00 PM-7:00 PM;	1021563
1497	2	11/11/2021 to 11/11/2021	Thu: 10:00 AM-2:00 PM;	1021563
1498	1	05/18/2018 to 10/26/2018	Fri: 2:00 PM-6:00 PM;	1002063
1499	1	06/01/2020 to 11/02/2020	Mon: 9:00 AM-1:00 PM;	1019979
1500	1	01/01/2018 to 12/31/2018	Mon: 8:00 AM-5:00 PM;Tue: 8:00 AM-5:00 PM;Wed: 8:00 AM-5:00 PM;Thu: 8:00 AM-5:00 PM;Fri: 8:00 AM-5:00 PM;Sat: 8:00 AM-5:00 PM;Sun: 8:00 AM-5:00 PM;	1005560
1501	1	06/05/2018 to 10/02/2018	Tue: 3:00 PM-6:00 PM;	1019305
1502	1	06/15/2018 to 10/01/2018	Fri: 1:00 PM-4:00 PM;	1018952
1503	1	06/01/2021 to 06/01/2021	Tue: 8:00 AM-1:00 PM;	1021568
1504	1	05/06/2021 to 05/06/2021	Thu: 4:00 PM-7:30 PM;	1019173
1505	1	05/06/2020 to 09/09/2020	Wed: 2:00 PM-6:00 PM;	1019784
1506	1	04/13/2019 to 12/21/2019	Sat: 8:00 AM-1:00 PM;	1019452
1507	2	01/11/2020 to 	Sat: 9:00 AM-12:00 PM;	1019452
1508	1	04/11/2020 to 12/19/2020	Sun: 8:00 AM-1:00 PM;	1019782
1509	1	05/01/2021 to 05/01/2021	Mon: -1:00 PM;Tue: 7:00 AM-1:00 PM;Thu: 7:00 AM-1:00 PM;Sat: 7:00 AM-1:00 PM;	1021394
1510	1	06/05/2013 to 10/30/2013	Wed: 10:00 AM-2:00 PM;	1003588
1511	1	05/01/2022 to 05/01/2022	Sun: 8:00 AM-1:00 PM;	1021670
1512	1	05/19/2018 to 10/27/2018	Sat: 9:00 AM-2:00 PM;	1018312
1513	1	06/03/2021 to 06/03/2021	Thu: 2:00 PM-6:00 PM;	1021466
1514	1	06/07/2019 to 09/27/2019	Fri: 4:00 PM-7:00 PM;	1019628
1515	1	05/02/2020 to 09/26/2020	Sat: 8:00 AM-12:00 PM;	1020176
1516	1	04/13/2019 to 11/23/2019	Sat: 8:30 AM-11:30 AM;	1019675
1517	1	10/06/2018 to 05/25/2019	Sat: 9:00 AM-2:00 PM;	1012278
1518	2	06/01/2019 to 08/31/2019	Sat: 9:00 AM-1:00 PM;	1012278
1519	1	01/01/2021 to 01/01/2021	Sat: 8:00 AM-12:00 PM;Sun: 8:00 AM-12:00 PM;	1021483
1520	1	06/16/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1012766
1521	1	01/01/2018 to 12/31/2018	Mon: 9:00 AM-1:00 PM;	1018211
1522	1	06/23/2021 to 06/23/2021	Wed: 3:00 PM-7:00 PM;	1021526
1523	1	09/05/2018 to 11/14/2018	Wed: 11:30 AM-2:00 PM;	1012100
1524	1	05/07/2018 to 09/24/2018	Mon: 3:00 PM-7:00 PM;	1018918
1525	2	10/01/2018 to 10/29/2018	Mon: 3:00 PM-6:00 PM;	1018918
1526	1	05/08/2021 to 05/08/2021	Sat: 7:00 AM-12:00 PM;	1021333
1527	1	05/05/2021 to 05/05/2021	Wed: 4:00 PM-8:00 PM;	1021334
1528	1	01/01/2014 to 12/31/2014	Mon: -10:00 PM;Wed: 5:00 PM-6:30 PM;Sun: 8:00 AM-;	1010057
1529	1	06/08/2019 to 10/05/2019	Sat: 9:00 AM-12:30 PM;	1019526
1530	1	05/24/2020 to 10/11/2020	Sun: 10:00 AM-2:00 PM;	1018451
1531	1	05/05/2018 to 05/05/2018	Sat: 9:00 AM-1:00 PM;	1012116
1532	1	06/18/2019 to 10/08/2019	Tue: 4:00 PM-7:00 PM;	1019545
1533	1	04/06/2018 to 11/23/2018	Fri: 1:00 AM-6:00 PM;	1019036
1534	1	06/10/2018 to 08/05/2018	Sun: 10:00 AM-2:00 PM;	1019112
1535	2	10/11/2014 to 05/23/2015	Sat: 9:00 AM-1:00 PM;	1007271
1536	1	01/04/2020 to 12/26/2020	Sat: 9:00 AM-1:00 PM;	1020186
1537	1	01/01/2021 to 01/01/2021	Sat: 10:00 AM-1:00 PM;	1021432
1538	1	05/04/2021 to 05/04/2021	Tue: 10:00 AM-3:00 PM;	1009707
1539	1	01/01/2018 to 12/31/2018	Tue: 8:00 AM-1:00 PM;	1008173
1540	1	06/27/2020 to 10/03/2020	Sat: 9:00 AM-12:00 PM;	1020149
1541	1	05/29/2019 to 10/09/2019	Wed: 3:00 PM-7:00 PM;	1019481
1542	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1021643
1543	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1021644
1544	1	05/15/2021 to 05/15/2021	Sat: 9:00 AM-1:00 PM;	1002765
1545	1	11/14/2020 to 12/12/2020	Sun: 9:00 AM-12:00 PM;	1019981
1546	2	08/01/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1019981
1547	1	05/08/2021 to 05/08/2021	Sat: 9:30 AM-1:30 PM;	1021313
1548	1	10/15/2017 to 05/20/2018	Sun: 12:00 PM-4:00 PM;	1018923
1549	1	05/14/2020 to 10/08/2020	Thu: 8:00 AM-1:00 PM;	1019015
1550	1	06/06/2020 to 10/03/2020	Sat: 9:00 AM-1:00 PM;	1020036
1551	1	05/12/2018 to 10/27/2018	Sat: 8:00 AM-12:30 PM;	1018476
1552	1	05/09/2020 to 10/31/2020	Sat: 8:00 AM-12:00 PM;	1020073
1553	1	05/05/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1011738
1554	1	06/04/2018 to 09/24/2018	Mon: 3:00 PM-6:00 PM;	1019138
1555	1	06/01/2018 to 10/12/2018	Fri: 10:30 AM-4:00 PM;	1003982
1556	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-1:00 PM;	1020147
1557	1	01/01/2018 to 12/31/2018	Sat: 9:00 AM-1:00 PM;	1019075
1558	1	05/07/2022 to 05/07/2022	Sat: 10:00 AM-3:00 PM;	1021694
1559	1	06/03/2020 to 09/26/2020	Wed: 9:00 AM-1:00 PM;Sat: 9:00 AM-1:00 PM;	1018994
1560	1	05/16/2020 to 10/10/2020	Sat: 8:00 AM-12:00 PM;	1010998
1561	2	11/07/2020 to 12/19/2020	Sat: 9:00 AM-1:00 PM;	1010998
1562	1	01/01/2020 to 12/31/2020	Sat: 9:00 AM-1:00 PM;	1000710
1563	1	01/01/2021 to 01/01/2021	Sun: 10:00 AM-2:00 PM;	1021616
1564	1	05/12/2018 to 10/20/2018	Sat: 8:00 AM-12:00 PM;	1018279
1565	2	06/05/2018 to 08/28/2018	Tue: 4:00 PM-7:00 PM;	1018279
1566	1	01/01/2021 to 01/01/2021	Tue: 3:00 PM-6:00 PM;	1021235
1567	1	05/02/2020 to 09/26/2020	Sun: 8:30 AM-1:00 PM;	1021204
1568	1	01/01/2020 to 12/31/2020	Fri: 12:00 PM-6:00 PM;	1020049
1569	1	06/03/2018 to 09/30/2018	Sun: 8:00 AM-1:00 PM;	1019047
1570	1	05/02/2021 to 05/02/2021	Sun: 9:00 AM-1:00 PM;	1019933
1571	1	07/02/2020 to 10/29/2020	Thu: 4:00 PM-9:00 PM;	1021203
1572	1	06/07/2019 to 09/27/2019	Fri: 4:00 PM-8:00 PM;	1019596
1573	1	05/25/2019 to 10/12/2019	Sat: 8:00 AM-1:00 PM;	1018959
1574	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-11:00 AM;	1021254
1575	1	05/26/2018 to 09/26/2018	Wed: 11:00 AM-5:00 PM;	1019181
1576	1	05/24/2019 to 09/20/2019	Fri: 8:00 AM-3:00 PM;	1019303
1577	1	04/27/2019 to 10/26/2019	Tue: 2:30 PM-6:30 PM;Sat: 2:30 PM-6:30 PM;	1019544
1578	1	01/15/2020 to 12/16/2020	Wed: 4:00 PM-7:00 PM;	1019775
1579	1	03/01/2020 to 12/19/2020	Sat: 11:00 AM-;	1019931
1580	1	01/01/2021 to 12/31/2021	Sun: 10:00 AM-1:00 PM;	1019948
1581	1	04/04/2018 to 11/14/2018	Wed: 11:00 AM-3:00 PM;	1019166
1582	1	06/15/2019 to 10/12/2019	Sat: 9:30 AM-1:30 PM;	1019626
1583	1	06/14/2020 to 10/25/2020	Sun: 10:00 AM-2:00 PM;	1019751
1584	1	05/19/2021 to 05/19/2021	Wed: 3:00 PM-7:00 PM;	1021304
1585	1	05/08/2019 to 12/04/2019	Wed: 3:00 PM-7:00 PM;	1019697
1586	1	05/02/2019 to 12/05/2019	Thu: 3:00 PM-7:00 PM;	1019700
1587	1	04/26/2019 to 12/06/2019	Fri: 3:00 PM-7:00 PM;	1019699
1588	1	05/01/2019 to 12/04/2019	Wed: 3:00 PM-7:00 PM;	1019698
1589	1	04/23/2019 to 12/03/2019	Tue: 3:00 PM-7:00 PM;	1019696
1590	1	01/01/2021 to 01/01/2021	Thu: 3:00 PM-7:00 PM;	1021276
1591	1	01/01/2021 to 01/01/2021	Mon: 8:00 AM-5:00 PM;Tue: 8:00 AM-5:00 PM;Wed: 8:00 AM-5:00 PM;Thu: 8:00 AM-5:00 PM;Fri: 8:00 AM-5:00 PM;Sat: 8:00 AM-5:00 PM;Sun: 8:00 AM-5:00 PM;	1021619
1592	1	11/04/2018 to 04/28/2019	Sun: 9:00 AM-1:00 PM;	1012357
1593	1	05/12/2018 to 10/27/2018	Sat: 9:00 AM-1:00 PM;	1019001
1594	1	05/07/2022 to 05/07/2022	Sat: 8:00 AM-12:00 PM;	1021659
1595	1	06/06/2019 to 10/17/2019	Thu: 3:00 PM-7:00 PM;	1019504
1596	1	05/06/2021 to 05/06/2021	Thu: 3:30 PM-5:30 PM;	1019966
1597	2	11/04/2021 to 11/04/2021	Thu: 4:00 PM-5:00 PM;	1019966
1598	1	05/25/2018 to 09/28/2018	Fri: 3:00 PM-6:30 PM;	1018422
1599	2	11/03/2018 to 12/15/2018	Sat: 9:00 AM-12:00 PM;	1018422
1600	1	05/01/2022 to 05/01/2022	Sun: 9:30 AM-1:00 PM;	1021702
1601	1	06/16/2018 to 08/11/2018	Sat: 10:00 AM-1:00 PM;	1016917
1602	1	05/02/2020 to 08/29/2020	Sat: 8:00 AM-12:00 PM;	1019928
1603	1	01/01/2019 to 01/01/2019	Thu: 9:00 AM-5:00 PM;Fri: 9:00 AM-7:00 PM;Sat: 8:00 AM-4:00 PM;	1011497
1604	2	01/01/2019 to 02/28/2019	Thu: 9:00 AM-5:00 PM;Fri: 9:00 AM-5:00 PM;Sat: 8:00 AM-5:00 PM;	1011497
1605	1	06/21/2019 to 10/25/2019	Fri: 3:00 PM-6:00 PM;	1019517
1606	1	05/17/2018 to 10/18/2018	Thu: 3:00 PM-6:00 PM;	1002101
1607	2	05/16/2019 to 10/17/2019	Thu: 3:00 PM-6:00 PM;	1002101
1608	1	06/07/2020 to 09/27/2020	Sun: 9:00 AM-2:00 PM;	1019739
1609	1	05/02/2020 to 10/31/2020	Sat: 8:30 AM-2:00 PM;	1019826
1610	1	04/01/2020 to 04/01/2020	Sat: 8:00 AM-1:00 PM;	1019975
1611	1	01/08/2019 to 12/29/2019	Tue: 10:00 AM-1:30 PM;	1018628
1612	1	09/27/2020 to 11/15/2020	\N	1018624
1613	1	01/01/2021 to 01/01/2021	Thu: 2:00 AM-5:00 AM;	1021499
1615	1	05/30/2021 to 05/30/2021	Sun: 9:00 AM-2:00 PM;	1020015
1616	1	06/06/2015 to 10/03/2015	Sat: 8:00 AM-1:00 PM;	1010798
1617	1	05/23/2020 to 10/10/2020	Sat: 9:00 AM-1:00 PM;	1012799
1618	1	01/01/2021 to 01/01/2021	Sat: 8:00 AM-1:00 PM;	1021586
1619	1	05/10/2014 to 09/27/2014	Sat: 9:00 AM-12:00 PM;	1008826
1620	1	06/03/2014 to 08/26/2014	Tue: 4:30 AM-7:00 PM;	1008827
1621	1	06/16/2018 to 10/06/2018	Tue: 3:30 PM-6:00 PM;Sat: 9:00 AM-12:00 PM;	1019228
1622	1	01/01/2018 to 12/31/2018	Thu: 8:00 AM-1:00 PM;	1017961
1623	1	05/06/2018 to 10/28/2018	Sun: 9:00 AM-1:30 PM;	1009802
1624	1	06/12/2021 to 06/12/2021	Tue: 9:00 AM-1:00 PM;Sat: 9:00 AM-1:00 PM;	1021562
1625	1	01/02/2022 to 01/02/2022	Sun: 10:00 AM-1:30 PM;	1021744
1626	1	05/01/2021 to 05/01/2021	Sat: 8:00 AM-2:00 PM;	1021447
1627	1	07/02/2020 to 10/29/2020	Thu: 4:00 PM-6:00 PM;	1019963
1628	1	06/05/2021 to 06/05/2021	Sat: 8:00 AM-12:00 PM;	1021490
1629	1	05/30/2019 to 10/10/2019	Thu: 3:00 PM-7:00 PM;	1019393
1630	1	05/08/2018 to 08/28/2018	Tue: 8:00 AM-12:00 PM;	1019213
1631	1	05/28/2021 to 05/28/2021	Fri: 4:30 PM-6:30 PM;	1006324
1632	1	05/07/2022 to 05/07/2022	Sat: 8:30 AM-12:00 PM;	1021745
1633	2	01/01/2023 to 01/01/2023	Sat: 12:00 PM-3:00 PM;	1021745
1634	3	10/01/2022 to 10/01/2022	Thu: 5:30 PM-8:00 PM;	1021745
1635	1	05/09/2020 to 10/10/2020	Sat: 10:00 AM-3:00 PM;	1019638
1636	1	07/11/2018 to 09/26/2018	Wed: 4:00 PM-6:00 PM;	1018933
1637	1	01/01/2020 to 12/31/2020	Sun: 8:30 AM-2:00 PM;	1020002
1638	1	06/04/2019 to 09/24/2019	Tue: 4:00 PM-7:00 PM;	1018397
1639	1	05/04/2021 to 05/04/2021	Tue: 10:00 AM-1:00 PM;	1021576
1640	1	05/01/2018 to 10/27/2018	Tue: 3:00 PM-6:00 PM;Thu: 6:00 AM-12:00 PM;Sat: 6:00 AM-12:00 PM;	1018283
1641	1	01/05/2019 to 12/21/2019	Sat: 7:00 AM-12:00 PM;	1019349
1642	2	04/16/2019 to 09/24/2019	Tue: 3:00 PM-6:00 PM;	1019349
1643	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1012573
1644	1	01/01/2021 to 12/31/2021	Sat: 8:00 AM-12:00 PM;	1005493
1645	1	06/16/2018 to 10/13/2018	Thu: 4:00 PM-7:00 PM;Sat: 8:00 AM-1:00 PM;	1006169
1646	1	06/05/2021 to 06/05/2021	Mon: 7:30 AM-12:00 PM;Tue: 7:30 AM-12:00 PM;Wed: 7:30 AM-12:00 PM;Thu: 7:30 AM-12:00 PM;Fri: 7:30 AM-12:00 PM;Sat: 7:30 AM-12:00 PM;	1018968
1647	2	10/02/2021 to 10/02/2021	Wed: 9:00 AM-12:00 PM;Thu: 9:00 AM-12:00 PM;Fri: 9:00 AM-12:00 PM;Sat: 9:00 AM-12:00 PM;	1018968
1648	1	06/05/2021 to 10/30/2021	Tue: 2:00 PM-5:00 PM;Sat: 7:00 AM-1:00 PM;	1019215
1649	1	05/01/2020 to 10/03/2020	Sat: 10:00 AM-1:00 PM;	1019925
1650	1	05/11/2018 to 09/28/2018	Fri: 3:00 pm-6:00 pm;	1010158
1651	1	05/18/2019 to 11/23/2019	Sat: 9:00 AM-1:00 PM;	1019540
1652	1	01/01/2018 to 01/01/2018	Wed: 4:00 PM-7:00 PM;	1018634
1653	1	01/01/2021 to 01/01/2021	Wed: 9:00 AM-5:00 PM;	1021305
1654	1	05/20/2020 to 09/30/2020	Wed: 4:00 PM-7:00 PM;	1019764
1655	1	05/04/2022 to 05/04/2022	Wed: 2:30 PM-7:00 PM;	1021726
1656	1	05/05/2021 to 05/05/2021	Wed: 5:00 PM-8:00 PM;	1001886
1657	1	04/04/2018 to 09/29/2018	Wed: 10:00 AM-2:00 PM;Sat: 8:00 AM-12:00 PM;	1019105
1658	2	10/03/2018 to 03/30/2019	Wed: 10:00 AM-2:00 PM;Sat: 10:00 AM-2:00 PM;	1019105
1659	1	05/01/2019 to 10/30/2019	Wed: 3:00 PM-6:00 PM;	1019448
1660	1	01/01/2019 to 12/31/2019	Sat: 8:00 AM-12:00 PM;	1019342
1661	1	05/27/2017 to 09/30/2017	Sat: 9:00 AM-11:00 AM;	1018852
1662	2	10/07/2017 to 10/28/2017	Sat: 9:00 AM-11:00 AM;	1018852
1663	3	11/11/2017 to 04/14/2018	Sat: 9:00 AM-11:00 AM;	1018852
1664	1	05/05/2019 to 10/27/2019	Sun: 11:00 AM-2:00 PM;	1019498
1665	1	05/01/2015 to 10/30/2015	Fri: 9:00 AM-2:00 PM;	1005631
1666	1	06/30/2021 to 06/30/2021	Wed: 8:00 AM-5:00 PM;	1001999
1667	1	04/17/2021 to 04/17/2021	Sat: 7:30 AM-1:00 PM;	1018535
1668	2	06/02/2021 to 06/02/2021	Wed: 7:30 AM-1:00 PM;Sat: 7:30 AM-1:00 PM;	1018535
1669	3	10/02/2021 to 10/02/2021	Sat: 8:00 AM-1:00 PM;	1018535
1670	1	06/08/2019 to 11/02/2019	Sat: 8:00 AM-12:00 PM;	1019692
1671	2	11/02/2019 to 06/06/2020	Sat: 8:00 AM-1:00 PM;	1019692
1672	1	04/03/2021 to 04/03/2021	Sat: 10:00 AM-2:00 PM;	1012325
1673	1	06/03/2017 to 09/30/2017	Sun: 9:00 AM-12:00 PM;	1018597
1674	1	11/01/2017 to 04/28/2018	Sun: 10:00 AM-1:00 PM;	1018598
1675	2	05/17/2018 to 10/31/2018	Thu: 3:00 PM-7:00 PM;	1018598
1676	1	05/19/2018 to 10/31/2020	Wed: 3:00 PM-6:00 PM;Sat: 9:00 AM-2:00 PM;	1019078
1677	1	11/03/2018 to 05/04/2019	Sat: 10:00 AM-2:00 PM;	1019080
1678	1	05/12/2018 to 10/06/2018	Sat: 8:00 AM-12:00 PM;	1019182
1679	1	06/25/2020 to 10/08/2020	Thu: 3:00 PM-7:00 PM;	1019952
1680	1	05/04/2022 to 05/04/2022	Wed: 11:00 AM-2:00 PM;	1020048
1681	1	05/18/2018 to 	Fri: 2:00 PM-6:00 PM;	1012247
1682	1	01/01/2021 to 01/01/2021	Sat: 9:00 AM-1:00 PM;	1019513
1683	1	06/11/2018 to 08/27/2018	Mon: 4:00 PM-7:00 PM;	1012297
1684	1	06/06/2017 to 08/30/2017	Wed: 2:00 PM-5:30 PM;	1018155
1685	1	06/11/2019 to 10/29/2019	Tue: 8:00 AM-1:00 PM;	1019645
1686	1	06/10/2018 to 11/04/2018	Sun: 7:30 AM-12:30 PM;	1019156
1687	1	05/01/2018 to 	Wed: 4:00 PM-7:30 PM;Sat: 8:00 AM-1:00 PM;	1006342
1688	1	02/13/2021 to 02/13/2021	Sat: 3:30 PM-7:30 PM;	1021297
1689	2	03/13/2021 to 03/13/2021	Sat: 9:00 AM-12:00 PM;	1021297
1690	3	04/10/2021 to 04/10/2021	Sat: 9:00 AM-12:00 PM;	1021297
1691	4	05/08/2021 to 05/08/2021	Sat: 8:00 AM-12:00 PM;	1021297
1692	1	01/01/2018 to 12/31/2018	Wed: 3:00 PM-6:00 PM;Sat: 7:00 AM-12:00 PM;	1018214
1693	1	04/22/2021 to 04/22/2021	Thu: 4:00 PM-8:00 PM;	1021487
1694	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-2:00 PM;	1021251
1695	1	07/11/2021 to 07/11/2021	Sun: 10:00 AM-1:00 PM;	1018504
1696	1	06/16/2021 to 06/16/2021	Wed: 3:30 PM-6:30 PM;	1001925
1697	1	06/02/2021 to 06/02/2021	Wed: 3:00 PM-6:00 PM;	1010394
1698	1	01/01/2021 to 12/31/2021	Sat: 9:00 AM-1:00 PM;	1019155
1699	1	04/01/2021 to 04/01/2021	Sat: 8:00 AM-12:00 PM;	1021537
1700	1	01/01/2019 to 12/31/2019	Tue: 10:00 AM-11:00 AM;	1005268
1701	1	05/24/2018 to 08/30/2018	Thu: 4:30 PM-6:00 PM;	1004574
1702	1	01/01/2019 to 12/31/2019	Tue: 6:30 AM-7:30 AM;	1005263
1703	1	01/01/2019 to 12/31/2019	Sun: 11:30 AM-12:30 PM;	1005269
1704	1	01/01/2019 to 12/31/2019	Thu: 7:00 AM-8:00 AM;	1005264
1705	1	01/01/2019 to 12/31/2019	Tue: 8:00 AM-9:00 AM;	1005266
1706	1	04/17/2019 to 04/30/2019	Wed: 2:00 PM-6:00 PM;	1019489
1707	1	05/12/2021 to 05/12/2021	Wed: 3:00 PM-7:00 PM;	1021340
1708	1	01/01/2020 to 12/31/2020	Sun: 9:00 AM-1:00 PM;	1020197
1709	1	06/01/2020 to 10/01/2020	Mon: 2:30 PM-5:30 PM;Thu: 2:30 PM-5:30 PM;	1018219
1710	1	03/20/2021 to 03/20/2021	Sat: 10:00 AM-2:00 PM;	1021366
1711	1	06/04/2020 to 	Thu: 1:00 PM-7:00 PM;	1018552
1712	1	06/20/2020 to 10/03/2020	Sat: 9:00 AM-1:00 PM;	1020021
1713	1	07/06/2019 to 10/19/2019	Sat: 9:00 AM-1:00 PM;	1019394
1714	1	07/30/2020 to 	Thu: 5:30 PM-7:30 PM;	1018319
1715	1	06/20/2016 to 	Mon: 3:30 AM-6:00 AM;	1001962
1716	1	05/01/2021 to 05/01/2021	Sat: 10:00 AM-1:00 PM;	1011229
1717	1	06/01/2019 to 10/25/2019	Tue: 9:00 AM-2:00 PM;Sat: 9:00 AM-2:00 PM;	1019613
1718	1	06/24/2020 to 10/07/2020	Wed: 12:00 PM-4:00 PM;	1004499
1719	2	01/10/2020 to 03/14/2020	Sat: 10:00 AM-2:00 PM;	1004499
1720	1	05/05/2018 to 10/27/2018	Sat: 4:00 PM-6:00 PM;	1019016
1721	1	05/22/2021 to 05/22/2021	Sat: 9:30 AM-12:30 PM;	1021559
1722	1	06/01/2018 to 10/31/2018	Wed: 10:00 AM-3:00 PM;	1012485
1723	1	05/07/2022 to 05/07/2022	Sat: 9:00 AM-1:00 PM;	1020047
1724	1	05/16/2018 to 10/24/2018	Wed: 10:00 AM-2:00 PM;	1019124
1725	1	06/30/2022 to 06/30/2022	Thu: 4:00 PM-7:00 PM;	1021709
1726	1	04/24/2021 to 04/24/2021	Tue: 4:00 PM-7:00 PM;Thu: 11:00 AM-2:00 PM;Sat: 9:00 AM-12:00 PM;	1021452
1727	2	08/21/2021 to 08/21/2021	Tue: 4:00 PM-7:00 PM;Sat: 9:00 AM-12:00 PM;	1021452
1728	3	05/01/2021 to 05/01/2021	Sat: 9:00 AM-12:00 PM;	1021452
1729	1	07/09/2020 to 10/15/2020	Thu: 3:00 PM-5:00 PM;	1006093
1730	1	06/01/2020 to 10/31/2020	Sat: 8:30 AM-1:00 PM;	1000384
1731	1	06/10/2020 to 10/07/2020	Wed: 3:30 PM-6:00 PM;	1019864
1732	1	08/02/2018 to 09/13/2018	Thu: 5:00 PM-7:30 PM;	1012212
1733	1	05/09/2019 to 10/17/2019	Thu: 3:30 PM-6:30 PM;	1019641
1734	1	05/16/2018 to 10/10/2018	Wed: 8:00 AM-12:00 PM;	1019114
1735	1	01/01/2018 to 12/31/2018	Sun: 9:00 AM-1:00 PM;	1002890
1736	1	01/01/2019 to 12/01/2019	Mon: 8:00 AM-3:00 PM;Tue: 8:00 AM-3:00 PM;Wed: 8:00 AM-3:00 PM;Thu: 8:00 AM-3:00 PM;Fri: 8:00 AM-3:00 PM;	1002280
1737	1	01/01/2018 to 12/31/2018	Tue: 3:00 PM-6:00 PM;	1019067
1738	1	07/08/2021 to 07/08/2021	Thu: 11:00 AM-3:00 PM;Sat: 10:00 AM-2:00 PM;	1021569
1739	1	01/01/2018 to 12/31/2018	Sun: 9:00 AM-2:00 PM;	1018650
1740	1	05/05/2021 to 05/05/2021	Wed: 3:30 PM-7:00 PM;	1011203
1741	1	05/18/2019 to 11/02/2019	Sat: 9:00 AM-2:00 PM;	1019424
1742	1	04/03/2019 to 11/30/2019	Wed: 9:00 AM-1:00 PM;Sat: 9:00 AM-1:00 PM;	1019657
1743	2	12/07/2019 to 12/28/2019	Sat: 9:00 AM-1:00 PM;	1019657
1744	1	06/17/2018 to 10/28/2018	Sun: 9:00 AM-2:00 PM;	1002177
1745	1	06/14/2018 to 12/13/2018	Thu: 3:00 PM-7:00 PM;	1016908
1746	1	07/01/2020 to 10/28/2020	Wed: 3:00 PM-6:00 PM;	1019911
1747	1	10/01/2018 to 12/01/2019	Sun: 9:00 AM-1:00 PM;	1012204
1748	1	01/01/2018 to 12/31/2018	Thu: 3:00 PM-7:00 PM;	1010319
1749	1	06/12/2019 to 09/25/2019	Wed: 9:00 AM-1:00 PM;	1019509
1750	1	06/17/2021 to 06/17/2021	Thu: 10:00 AM-1:00 PM;	1021367
1751	1	05/23/2020 to 10/01/2020	Sun: 9:00 AM-12:00 PM;	1019444
1752	1	06/03/2021 to 06/03/2021	Thu: 12:00 PM-5:00 PM;	1021274
1753	1	05/15/2021 to 05/15/2021	Sat: 9:00 AM-12:00 PM;	1019797
1754	1	05/21/2020 to 10/08/2020	Thu: 3:00 PM-7:00 PM;	1021246
1755	1	05/04/2018 to 10/26/2018	Fri: 3:00 PM-6:00 PM;	1002816
1756	1	05/02/2020 to 10/31/2020	Sat: 9:00 AM-1:00 PM;	1020070
1757	1	04/17/2021 to 04/17/2021	Sat: 7:00 AM-12:30 PM;	1001661
1758	1	04/18/2020 to 11/07/2020	Sat: 7:00 AM-12:30 PM;	1021217
1759	1	07/12/2018 to 	Thu: 11:00 AM-12:30 PM;	1004515
1760	1	01/01/2018 to 12/31/2018	Sat: 9:00 AM-1:00 PM;	1005280
1761	1	01/01/2021 to 01/01/2021	Thu: 12:00 AM-5:00 AM;	1020020
1762	1	06/07/2020 to 10/04/2020	Sun: 10:00 AM-1:00 PM;	1021258
1763	1	05/20/2020 to 08/12/2020	Wed: 3:30 PM-7:00 PM;	1020010
1764	1	05/29/2021 to 05/29/2021	Sat: 9:00 AM-2:00 PM;	1021488
1765	1	05/02/2020 to 10/31/2020	Sat: 8:30 AM-12:00 PM;	1019955
1766	1	04/19/2019 to 11/17/2019	Fri: 10:00 AM-4:00 PM;Sat: 10:00 AM-4:00 PM;Sun: 10:00 AM-4:00 PM;	1019392
1767	1	04/28/2020 to 09/29/2020	Tue: 5:00 PM-8:00 PM;	1020157
1768	1	04/28/2020 to 09/30/2020	Thu: 5:00 PM-8:00 PM;	1020156
1769	1	06/30/2018 to 09/29/2018	Sat: 8:30 AM-1:00 PM;	1019221
1770	1	03/01/2021 to 03/01/2021	Thu: 10:00 AM-1:00 PM;	1021495
1771	1	03/01/2021 to 03/01/2021	Mon: 10:00 AM-1:00 PM;	1021497
1772	1	03/01/2021 to 03/01/2021	Mon: 10:00 AM-1:00 PM;	1021498
1773	1	03/01/2021 to 03/01/2021	Thu: 10:00 AM-1:00 PM;	1021496
1774	1	06/01/2020 to 09/30/2020	Tue: 4:00 AM-6:30 PM;	1019878
1775	1	04/28/2018 to 10/27/2018	Sat: 9:00 AM-5:00 PM;	1019069
1776	1	04/01/2020 to 10/17/2020	Tue: 3:30 PM-5:30 PM;Sat: 7:30 AM-12:00 PM;	1018274
1777	1	06/13/2019 to 11/14/2019	Thu: 3:00 PM-6:30 PM;	1019652
1778	1	03/19/2022 to 03/19/2022	Sat: 8:00 AM-12:00 PM;	1021720
1779	1	06/05/2021 to 06/05/2021	Sat: 9:00 AM-2:00 PM;	1019337
1780	1	01/04/2020 to 12/26/2020	Sat: 9:00 AM-1:00 PM;	1020187
1781	1	06/08/2019 to 10/26/2019	Sat: 9:30 AM-1:30 PM;	1019433
1782	1	05/16/2019 to 11/14/2019	Thu: 4:00 PM-7:00 PM;	1011274
1783	1	09/28/2020 to 12/28/2020	Mon: 2:00 PM-6:00 PM;	1021231
1784	1	04/07/2018 to 10/27/2018	Sat: 8:00 AM-12:00 PM;	1019229
1785	1	12/14/2019 to 02/22/2020	Sat: 8:00 AM-12:00 PM;	1019653
1786	1	01/05/2019 to 05/25/2019	Sat: 9:00 AM-3:00 PM;	1019449
1787	1	11/01/2017 to 04/18/2018	Wed: 10:00 AM-2:00 PM;	1018925
1788	1	06/06/2019 to 10/26/2019	Thu: 8:00 AM-2:00 PM;Sat: 8:00 AM-2:00 PM;	1019463
1789	1	06/14/2018 to 10/04/2018	Thu: 5:00 AM-7:00 PM;	1008231
1790	1	01/01/2020 to 	Mon: 8:00 AM-5:00 PM;Tue: 8:00 AM-5:00 PM;Wed: 8:00 AM-5:00 PM;Thu: 8:00 AM-5:00 PM;Fri: 8:00 AM-5:00 PM;Sat: 8:00 AM-5:00 PM;Sun: 8:00 AM-5:00 PM;	1019845
1791	1	04/12/2020 to 10/31/2020	Tue: 10:00 AM-5:00 PM;Fri: 10:00 AM-5:00 PM;Sat: 10:00 AM-5:00 PM;	1020158
1792	1	05/21/2015 to 10/15/2020	Thu: 12:30 PM-4:30 PM;	1009027
1793	1	01/01/2018 to 12/31/2018	Tue: 3:00 PM-7:00 PM;Sat: 10:00 AM-2:00 PM;	1019098
1794	1	05/02/2020 to 10/31/2020	Mon: 3:00 PM-6:00 PM;Wed: 3:00 PM-6:00 PM;Sat: 8:30 AM-12:00 PM;	1020168
1795	1	05/30/2018 to 10/17/2018	Wed: 3:30 AM-8:00 PM;	1019038
1796	1	04/21/2018 to 12/29/2018	Sat: 8:30 AM-12:00 PM;	1005140
1797	1	10/31/2020 to 10/31/2020	Sat: 9:00 AM-1:00 PM;	1021317
1798	1	04/17/2021 to 04/17/2021	Sat: 8:00 AM-1:00 PM;	1021386
1799	1	06/01/2021 to 06/01/2021	Tue: 8:00 AM-1:00 PM;	1021385
1800	1	05/01/2020 to 10/31/2020	Tue: 2:00 PM-6:00 PM;Thu: 2:00 PM-6:00 PM;Sat: 7:30 AM-1:00 PM;	1011337
1801	1	04/03/2021 to 04/03/2021	Sat: 8:00 AM-12:00 PM;	1021328
1802	1	07/07/2020 to 10/27/2020	Wed: 3:00 PM-6:00 PM;	1019912
1803	1	05/01/2021 to 05/01/2021	Sat: 9:00 AM-12:00 PM;	1007309
1804	2	12/12/2020 to 12/12/2020	Sat: 10:00 AM-12:00 PM;	1007309
1805	1	01/01/2018 to 01/01/2018	Sat: 8:00 AM-12:00 PM;	1017915
1806	1	10/19/2019 to 04/18/2020	Sun: 9:00 AM-12:00 PM;	1019708
1807	1	05/01/2017 to 05/01/2017	Sat: 9:00 AM-1:00 PM;	1018508
1808	2	05/01/2021 to 05/01/2021	Sat: 9:00 AM-1:00 PM;	1018508
1809	1	05/25/2019 to 10/12/2019	Sat: 7:30 AM-12:00 PM;	1007259
1810	2	11/23/2019 to 11/23/2019	Sat: 9:00 AM-1:00 PM;	1007259
1811	1	01/01/2020 to 12/31/2020	Sat: 8:00 AM-4:00 PM;Sun: 8:00 AM-4:00 PM;	1002366
1812	1	05/10/2019 to 10/18/2019	Fri: 4:00 PM-7:00 PM;	1019508
1813	1	01/01/2018 to 12/31/2018	Wed: 4:00 PM-8:00 PM;	1019247
1814	1	01/01/2018 to 12/31/2018	Sun: 11:00 AM-3:00 PM;	1019245
1815	1	01/01/2018 to 12/31/2018	Sun: 11:00 AM-3:00 PM;	1019246
1816	1	01/01/2018 to 12/31/2018	Fri: 4:00 PM-8:00 PM;	1019250
1817	1	01/01/2018 to 12/31/2018	Sun: 11:00 AM-3:00 PM;	1019242
1818	1	01/01/2018 to 12/31/2018	Sun: 11:00 AM-3:00 PM;	1019244
1819	1	01/01/2018 to 12/31/2018	Tue: 3:00 PM-7:00 PM;	1019327
1820	1	06/14/2017 to 10/11/2017	Wed: 10:00 AM-1:00 PM;	1016909
1821	1	04/16/2021 to 04/16/2021	Fri: 4:00 PM-8:00 PM;	1021545
1822	2	10/01/2021 to 10/01/2021	Fri: 9:00 AM-2:00 PM;	1021545
1823	1	05/02/2020 to 08/29/2020	Sat: 9:00 AM-1:00 PM;	1019863
1824	1	06/01/2020 to 10/12/2020	Mon: 3:30 PM-7:00 PM;	1019792
\.


--
-- Data for Name: markets; Type: TABLE DATA; Schema: public; 
--

COPY public.markets (fmid, name, street, lat, long, zip, updatetime) FROM stdin;
1018261	Caledonia Farmers Market Association - Danville	\N	44.411036	-72.140337	05828	8/3/2020 3:23:12 PM
1009994	18th Street Farmer's Market	18th and Broadway	41.864268	-103.662538	69361	2/18/2021 2:37:26 PM
1000709	26th Annual Highlands Business Partnership's Farmers Market	71 Waterwitch Avenue	40.404837	-73.994358	07732	9/10/2020 3:25:18 PM
1019956	29 Palms Farmers' Market	73484 Twentynine Palms Hwy	34.135760	-116.058946	92277	1/13/2021 5:15:12 PM
1009959	2nd Street Market - Five Rivers MetroPark	600 E. 2nd Street	39.762593	-84.181030	45402	7/26/2018 4:26:56 PM
1004950	3 French Hens French Country Market	123 W. Illinois ave.	41.356383	-88.425186	60450	7/26/2018 4:22:44 PM
1019938	3rd Day Farmer's Market	3234 S. LaChance Rd	44.292952	-85.296147	49651	6/25/2020 11:53:13 AM
1021607	4 Veggies & 3 Fruits Farmer’s Market	140 W 62nd Street	41.781896	-87.629595	60621	8/24/2021 6:09:09 AM
1018965	61st Street Farmers Market	6100 S. Blackstone Ave	41.7840790	-87.5905914	60637	2/23/2018 4:18:31 PM
1009004	A Growers' Market	229 Lake Ella Drive	30.461953	-84.279874	32303	7/29/2018 12:47:57 PM
1019473	Aberdeen Sunday Market	Broadway between Heron & State St	46.972973	-123.816413	98520	4/14/2019 8:55:10 PM
1010487	Abingdon Farmers Market	Corner of Remsburg Drive & Cummings St	36.708863	-81.977160	24212	1/27/2021 9:20:08 PM
1019695	Abita Springs Art & Farmers Market	22049 Main Street	30.479064	-90.038907	70420	9/16/2019 3:16:48 PM
1021442	Adams County Farmer's Market	110 W. Main St.	38.795296	-83.546357	45693	4/8/2021 11:21:54 AM
1019676	Adams County Farmers Market	103 Carlisle Street	39.830597	-77.234147	17325	8/8/2019 2:37:59 PM
1019351	Adams County Farmers' Market Association	103 Carlisle Street	39.830597	-77.234147	17325	1/8/2019 5:15:25 PM
1019847	Adams-Ricci Farmers Market	100 East Penn Drive	40.273997	-76.937407	17025	4/25/2020 10:26:33 AM
1008961	Adaptations' Fresh Feast	79-7500 Mamalahoa Highway, Unit 1	19.5257840	-155.9236509	96750	1/25/2021 5:42:25 PM
1019203	AG Farmers' Market	108 Indian Head Road	39.992509	-74.207478	08753	8/1/2018 9:40:50 AM
1012233	Agricenter International Farmer's Market	7777 Walnut Grove Rd	35.127452	-89.801733	38120	7/26/2018 4:07:49 PM
1005258	Aina Moana  Park (People's Open Market)	1201 Ala Moana Boulevard	21.287867	-157.844930	96822	1/24/2019 3:55:52 PM
1008054	Airport Farmers and Flea Market	17375 Spring Hill Dr	28.481294	-82.441514	34604	9/11/2020 10:04:15 AM
1008612	Alachua County Farmers' Market	5920 NW 13th Street	29.7106652	-82.3525150	32653	7/26/2018 11:10:19 PM
1018304	Alamo Heights Farmers Market	255 E Basse	29.493258	-98.481174	78209	8/6/2018 10:42:44 AM
1021689	Albany Farmers' Market	4th & Ellsworth	44.635052	-123.106097	97321	2/5/2022 8:30:36 PM
1019371	Albany IN Farmers Market	208 E. State Street	40.299191	-85.235831	47320	2/2/2019 3:43:21 PM
1021578	Albany Square Farmers Market	\N	40.247729	-94.333605	64402	7/26/2021 1:12:11 PM
1000519	Alexandria Bay Farmers Market	Route 12	44.331171	-75.916118	13607	2/1/2021 11:02:22 AM
1019113	Alexandria Farmers Market	Broadway & Second Ave	45.890762	-95.375902	56308	1/5/2021 10:22:24 AM
1021464	Alexandria Farmers Market	2727 JACKSON STREET	31.294467	-92.466488	71301	5/7/2021 12:43:38 PM
1021597	Algoma Sunday Farmers Market	Clark St. and Lake St.	44.607438	-87.435983	54201	8/3/2021 10:39:44 AM
1019831	Allen County Farmers' Market	Jefferson	37.927427	-95.400669	66749	1/14/2021 11:51:05 AM
1019832	Allen County Farmers' Market	807  N. State	37.927427	-95.400669	66749	1/14/2021 11:53:33 AM
1012389	Aloha Community Farmers' Market	17675 SW Farmington Rd and SW Kinnaman Rd	45.480164	-122.858722	97007	6/5/2019 11:04:30 AM
1020150	Alturas Farmers Market	108 S Main St	41.483907	-120.542201	96101	8/21/2020 12:20:23 AM
1021309	Ambler Farmers' Market	29 West Butler Pike	40.153501	-75.225298	19002	1/26/2021 2:26:25 PM
1011171	Ames Main Street Farmers' Market	300 & 400 Blocks of  Main Street	42.025222	-93.614943	50010	1/5/2021 2:44:07 PM
1003563	Amicalola Regional Farmers Market	186 Recreation Road	34.437795	-84.099043	30534	7/26/2018 4:05:11 PM
1019438	Amqui Station Farmers Market	303 Madison Street	36.257792	-86.717491	37115	3/22/2019 7:12:12 PM
1012157	Anaconda Community Market	Kennedy Common (306 Main)	46.099059	-113.139108	59711	9/14/2020 10:53:53 PM
1005944	Anacortes Farmers Market	611 R Avenue	48.516974	-122.609181	98221	9/10/2020 3:39:44 PM
1019647	Anderson County Farmers Market	402 N. Murray Ave	34.506898	-82.652197	29621	7/30/2019 9:44:15 AM
1020084	Anderson County Farmers Market	1505 US-127 N	38.076447	-84.917629	40342	1/4/2021 7:27:47 PM
1003516	Andersonville Farmers Market	1500 W. Catalpa Ave.	41.981745	-87.668602	60640	6/7/2020 6:00:25 PM
1020060	Andover Farmers Market	41 Central Street	42.653616	-71.143138	01810	6/21/2021 1:03:59 PM
1019484	Annandale Farmers Market	6621 Columbia Pike	38.832801	-77.196229	\N	4/25/2019 12:20:31 PM
1019096	Annandale Farmers Market - ACT	25 East Cedar St	45.2636097	-94.1238322	55302	5/11/2018 9:52:09 AM
1019350	Antioch's Farmers Market	900 Skidmore Drive	42.478128	-88.094570	60002	1/8/2019 10:32:37 AM
1000431	Appleton Downtown Farm Market	100 College Avenue	44.26201	-88.40703	54911	1/25/2021 12:18:55 PM
1021359	Aquidneck Growers Market - Wednesday	Memorial Blvd	41.483658	-71.305831	02840	2/19/2021 2:15:01 PM
1021733	Aquidneck Growers Market Miantonomi Community Farmers Market	120 Hillside Avenue	41.509894	-71.309790	02840	3/15/2022 2:41:02 PM
1021732	Aquidneck Growers Market- Saturday Summer	35 Dexter St	41.509123	-71.304555	02840	3/15/2022 2:33:29 PM
1019662	Arlington Village Farmers Market	3904 VT-7A	43.072884	-73.146078	05250	8/3/2019 10:52:02 PM
1019904	Armory Farmers Market	85 Parade St	41.814767	-71.431600	02909	6/5/2020 12:36:13 PM
1019222	Arnold Farmers Market	2400 Bradley Beach Road	38.453275	-90.353093	63010	8/8/2018 9:17:18 AM
1019495	Artisan Alley Farmers and Makers Market	Artisan Alley	29.027562	-81.304341	32720	4/27/2019 3:08:22 PM
1020068	Artistlane Farmers Market	1966 Broad Street	33.365531	-82.073422	30904	8/16/2020 11:38:31 AM
1009810	Ashland Farmers Market	125 Front St	42.260027	-71.461538	01721	1/26/2021 10:42:37 PM
1021627	Astoria Sunday Market	12th and Commercial St.	46.188719	-123.830150	97103	11/4/2021 6:46:05 PM
1001245	ASU Regional Farmers' Market	3300 Aggie Road	35.840771	-90.667327	72401	1/25/2021 4:53:54 PM
1002984	Atchison Farmers Market	Between 5th and 6th Streets on the south side of Main Street	39.560737	-95.119878	66002	2/20/2018 6:26:33 PM
1005086	Athens Farmers Market	1002 East State Street	39.336038	-82.056622	45701	1/4/2021 1:21:39 PM
1018033	Athens Farmers Market, L.L.C.	271 W Hancock Ave	33.959088	-83.380247	30601	12/29/2020 10:08:50 AM
1018032	Athens Farmers Market, LLC	705 Sunset Dr	33.9644564	-83.4121317	30606	12/29/2020 10:07:00 AM
1021450	Athol Farmers Market	30355 N 3rd Street	47.944594	-116.707904	83801	4/26/2021 4:57:07 PM
1018330	Attleboro Farmers Market, inc	201 County Street	41.937562	-71.299235	02703	2/24/2019 2:06:11 PM
1021225	Atwater Village Farmers' Market	3528 Larga Ave	34.117828	-118.260151	90039	9/21/2020 4:29:56 PM
1019789	Auburn Farmers Market	1140 Auburn Way S	47.298267	-122.218459	98002	3/6/2020 12:54:20 PM
1021329	Aurora Farmers Market	170 Main Street	42.744684	-76.699995	13026	1/30/2021 6:24:08 PM
1000559	Aurora Local Farmer's Market - Summer Market	2031 S. Elliott Ave.	36.9489080	-93.7201867	65605	7/26/2018 6:38:48 PM
1021534	AUSTIN FARMERS MARKET	9607 RESEARCH BLVD	30.387094	-97.741448	78759	6/22/2021 1:23:34 PM
1019396	Avon Farmers Market	8190 E US Highway 36	39.765279	-86.38263	\N	2/19/2019 9:59:31 AM
1019126	Avon Library Farmers Market	281 COUNTRY CLUB RD., C/O AVON LIBRARY	41.7897100	-72.8604480	06001	6/7/2018 3:20:11 PM
1021528	Backyard Market in Black Forest	12530 Black Forest Rd	39.014791	-104.702384	80908	6/21/2021 5:59:30 PM
1021530	Backyard Market in Black Forest - Holiday	13710 Black Forest Road	39.029861	-104.701697	80908	6/21/2021 6:32:12 PM
1021529	Backyard Market in Black Forest - Winter	6845 Shoup Road	39.013991	-104.698264	80908	6/21/2021 6:23:52 PM
1019044	Bainbridge Farm Market	201 Grant Ave	39.7622329	-86.8176960	46105	4/7/2018 1:22:44 PM
1019076	Baldwin's Main St. Farmers Market	Main St. and 6th Ave.	44.966999	-92.370763	54002	1/4/2021 11:59:57 AM
1021338	Ballard Farmers Market	5300 Ballard AVE NW	47.667512	-122.384500	98107	2/4/2021 4:24:25 PM
1021521	Bamberg Farmers Market	12205 Heritage Hwy	33.300136	-81.031222	29003	6/13/2021 7:42:03 PM
1012081	Bangor Farmers' Market	Corner of Franklin and Harlow Streets	44.8039587	-68.7716490	04401	1/8/2021 4:23:47 PM
1021582	Barm Bargains Market	3782 Winding Creek Ln	38.840227	-120.878152	95633	7/27/2021 4:37:54 PM
1001604	Barnegat Farmers Market	14 Birdsall St.	39.753903	-74.221654	08005	1/25/2021 11:50:12 AM
1020029	Barrow County Farmers Market	30 N. Broad St	33.993074	-83.721123	30680	8/4/2020 9:15:35 AM
1003335	Basalt Sunday Market	101 Midland Avenue	39.368957	-107.034736	81621	8/7/2020 3:54:43 PM
1019871	Bassett Farmers Market	200 Clark St.	42.582541	-99.536625	68714	5/26/2020 2:28:42 PM
1000436	Bastrop 1832 Farmers Market	1302 Chestnut Street	30.111777	-97.311627	78602	1/27/2021 7:55:24 PM
1021540	Batavia Farmers' Market	North River Street	41.851028	-88.306027	60510	6/23/2021 4:11:50 PM
1021265	Batesville Farmers Market	Main and Boehringer Street	39.298852	-85.221859	47006	1/10/2021 10:49:31 PM
1021443	Battle Creek Farmers Market	25 S McCamly St	42.320090	-85.185150	49017	4/9/2021 7:00:36 PM
1019617	Bay Area Farmers Market	500 Baybrook Mall Drive	29.548702	-95.150682	77546	1/18/2021 10:26:29 AM
1019874	Beatrice Farmers Market Indian Creek Mall	Indian Creek Mall 2205 N 6th St	40.273594	-96.747301	68310	5/27/2020 12:32:02 PM
1020102	Beattyville Main Street Marketplace Locally Made Market	26 Hwy 52 W	37.591129	-83.705633	41311	1/5/2021 10:03:29 AM
1018735	Beaumont Farmers' Market	\N	30.067686	-94.169203	77707	8/3/2020 3:32:57 PM
1019875	Beaver City Farmers Market	\N	40.138332	-99.827615	\N	5/27/2020 12:38:52 PM
1020097	Beaver Dam Farmer's Market	Hwy 231 South	37.407199	-86.877647	42320	8/18/2020 12:02:47 PM
1021630	Beaverdale Farmers Market	4801 Franklin Avenue	41.612479	-93.684710	50310	11/11/2021 11:47:07 AM
1019853	Bedford Farmers Market	209 Route 101	42.938268	-71.525849	03110	1/5/2021 10:28:37 PM
1019400	Bedminster Farmers Market	3055 River Road	40.662856	-74.646889	07921	2/23/2019 2:46:23 PM
1010607	Bel Air Farmers' Market	2 South Bond Street	39.535284	-76.351011	21014	7/27/2018 1:27:22 PM
1011902	Belleville Farmer's Market	1815 M St.	39.822988	-97.630924	66935	1/26/2021 3:04:21 PM
1021363	Belleville Farmers Market	Main and 4th	42.201917	-83.482812	48111	2/24/2021 10:15:43 AM
1008140	Bellingham Farmers Market	1207 10th Street	48.75262	-122.469657	98226	7/26/2018 7:32:32 PM
1002064	Belmont Farmers Market	5429 State Route 19N	42.234077	-78.053508	14813	1/27/2021 9:03:15 PM
1011363	Belton Farmers Market	Memorial Park	38.808556	-94.525252	64012	2/1/2019 3:25:53 PM
1001316	Bemidji's Natural Choice Farmers Market	Union Square Parking Lot--2nd Street & Paul Bunyan Drive	47.469337	-94.880609	56601	1/26/2021 11:29:14 AM
1001533	Benica Certified Farmers Market	First Street between B & D Streets	38.046215	-122.161188	94510	1/27/2021 4:23:09 PM
1018644	Bennet Farmers' Market	Elm and Harrison	40.680612	-96.503262	68317	7/26/2018 7:37:40 PM
1021403	Bentonville Farmers Market	100 N. Main Street	36.372637	-94.208458	72712	3/16/2021 6:59:10 PM
1005183	Berkeley Springs Farmers Market	129 Fairfax Street at Washington Street/522	39.624722	-78.227534	25411	7/27/2018 9:13:52 AM
1019005	Berkey Farmers Market	12290 Sylvania-Metamora Rd	41.715538	-83.839418	43504	3/13/2018 4:09:13 PM
1021628	Berwick Winter Farmers Market	11 Sullivan St.	43.269956	-70.86243	03901	11/9/2021 10:03:08 PM
1019168	BESSEMER FARMERS MARKET	1st Avenue N and 19th Street	33.401130	-86.951370	35020	7/16/2018 4:46:10 PM
1019169	Bessemer Farmers Market at Medical West	995 9th Ave SW	33.373082	-86.990644	35022	7/16/2018 4:53:12 PM
1019967	Bethalto Market In The Park	213 N Priaire St	38.902967	-90.053468	62010	7/21/2020 11:51:41 AM
1021322	BETHANY BEACH FARMERS' MARKET, INC.	601 castle court	38.538397	-75.056515	19930	1/27/2021 3:32:10 PM
1010406	Bethesda Central Farm Market	7600 Arlington Road	38.986761	-77.099890	20814	8/7/2020 10:42:42 PM
1012494	Bethlehem Farmers' Market	Intersection of New and Morton Streets	40.6098058	-75.3784029	18015	2/3/2021 3:32:09 PM
1020196	Beverly Hills Farmers Market	9300 Civic Center Dr	34.073685	-118.398746	90210	8/27/2020 3:56:45 PM
1019765	Bexley Farmers Market	E Main St and S Dawson Ave	39.957135	-82.935745	43209	2/26/2020 4:52:13 PM
1005949	Big Bear Farmers Market	42900 Big Bear Blvd	34.260803	-116.866714	92315	8/8/2018 4:44:00 PM
1019338	Big Lake Farmers Market	101 Lakeshore Drive	45.333773	-93.758167	55309	12/27/2018 3:44:43 PM
1019339	Big Lake Winter Farmers Market	311 Lake Street South	45.329205	-93.747475	55309	12/27/2018 3:52:48 PM
1019591	Billerica Farmers Market	25 Concord Road	42.557646	-71.269999	01821	6/20/2019 6:40:52 PM
1021508	Birdsboro Farmers Market	226 N Water St	40.262329	-75.810113	19508	6/8/2021 9:45:36 AM
1011037	BisMarket	\N	46.803081	-100.796471	58501	7/26/2018 5:12:00 PM
1012163	Blairstown Farmers' Market	5 Stillwater Road	40.982893	-74.955689	07825	7/27/2018 7:56:03 AM
1011829	Bloomfield Saturday Market	5050 Liberty Ave	40.459005	-79.944435	15224	1/20/2021 9:02:04 AM
1018396	Bloomington Community Farmers' Market	401 N MortonSt	39.1703084	-86.5369425	47404	1/3/2019 9:20:23 AM
1018563	Bloomington Winter Farmers' Market	1601 S Rogers St	39.149906	-86.539649	47403	1/30/2021 8:07:08 AM
1019932	Blue Ash Farmers Market	4335 Glendale Milford Road	39.251798	-84.389892	45242	6/22/2020 7:55:13 PM
1020098	Bluegrass Farmers Market, Inc	1837 Plaudit Place	38.014875	-84.418747	40509	8/18/2020 11:54:11 AM
1019372	Bluffton Farmers Market	102 S Main St	40.893082	-83.892721	45817	2/5/2019 9:23:27 AM
1019440	Bluffton Farmers' & Artisans' Market	360 N Main St	40.743479	-85.172111	46714	3/25/2019 8:50:09 AM
1018092	BMI Farmers' Market	1415 Key Highway	39.273864	-76.601326	21230	1/4/2021 9:58:14 AM
1018313	Boise Farmers Market	10TH & GROVE  - SUMMER MARKET	43.532957	-116.444084	83702	7/26/2018 5:11:56 PM
1018316	BOISE FARMERS MARKET	516 S. 8th Street	43.607980	-116.191930	83702	7/26/2018 5:21:18 PM
1020101	Boone County Farmers Market	1961 Burlington Pike	39.022231	-84.721563	41005	8/18/2020 1:42:13 PM
1006833	Boone Farmers Market Association	7th and Story Street	42.062726	-93.879688	50036	5/8/2019 2:40:22 PM
1019318	Boonville Farmers Market Inc	1931 Boone Village Shopping Center	38.955643	-92.741591	65233	11/12/2018 1:02:16 PM
1019693	Botetourt Farmer's Market	90 Town Center St	37.417795	-79.912646	24083	9/11/2019 4:14:20 PM
1018394	Bottineau Farmers Market	6th Street and Main Street	48.8262788	-100.4459433	58318	1/4/2021 10:15:44 AM
1001526	Boulder Farmers and Artisan's Market	304 N. Main Street	46.239153	-112.117592	59632	1/28/2021 3:54:31 PM
1019165	Bowie Farmers' Market	15200 Annapolis Road	38.978320	-76.741902	20715	7/11/2018 10:10:22 PM
1020096	Boyd County Farmers Market - King's Daughters Medical Center	2420 Center Street	38.470783	-82.630489	41129	8/18/2020 12:09:53 PM
1020099	Boyd County Farmers Market - KYOVA Mall	10699 US-60	38.400138	-82.712555	41102	8/18/2020 12:18:42 PM
1019205	Boyne City Farmers Market	319 N. Lake St	45.216850	-85.015378	49712	8/2/2018 12:44:47 PM
1021248	Braeswood Farmers Market	5401 south braeswood	29.676944	-95.477537	77096	12/18/2020 8:58:34 AM
1018227	Braintree Farmers Market	1 JFK Memorial Dr	42.206437	-71.004927	02184	12/22/2018 7:56:46 AM
1002407	Brattleboro Area Farmers' Market	570 Western Ave.	42.849900	-72.584070	05301	12/21/2018 8:21:16 PM
1011075	Brattleboro WInter Farmers' Market	80 Flat St.	42.850844	-72.560166	05301	12/21/2018 8:15:16 PM
1020113	Breathitt County Farmers' Market	3215 Quicksand Road	37.535327	-83.348327	41339	8/19/2020 4:29:21 PM
1018556	Bremerton Community Farmers Market	1400 Park Ave	47.574253	-122.628866	98337	6/14/2021 1:04:46 PM
1019146	Bridgewater Farmer's Market	1 Vogt Drive	40.588552	-74.607976	08807	6/26/2018 7:01:21 PM
1018756	Brigham City Farmers Market	20 N Main Street	41.510773	-112.015057	84302	4/16/2019 8:55:29 AM
1005483	Brimfield at Hitchcock Free Academy	Hitchcock Free Academy, a community center parking lot, at  2 Brookfield Rd.	42.122751	-72.199901	01010	7/26/2018 3:23:34 PM
1019905	Broad St. Farmers Market	807 Broad St.	41.801869	-71.418920	02907	6/5/2020 12:51:56 PM
1019257	Broadway Farmers Market	161 S Main St	38.611375	-78.799904	22815	9/17/2018 1:36:15 PM
1019984	Brockton Farmers Market	45 School St	42.082799	-71.018866	02301	1/4/2021 2:28:23 PM
1019794	Bronzeville Growers Market	925 E. Mt. Vernon Avenue	39.971390	-82.976997	43203	3/10/2020 12:10:09 PM
1019527	BROOKINGS HARBOR FARMERS MARKET	15786 HWY 101 SOUTH	42.037301	-124.244963	97415	5/15/2019 5:21:35 AM
1021210	Brookline Farmers' Market	Centre Street West PArking Lot	42.342190	-71.123782	02446	9/12/2020 11:54:36 AM
1021736	Brookside Farmers' Market	6425 Wornall Road	39.125212	-94.551136	64113	3/24/2022 3:45:20 PM
1018891	Brooksville Farmers' Market	15487 Citrus Way	28.654639	-82.449304	34614	9/12/2020 10:49:33 AM
1021515	Brookville Farmer's Market	116 Main Street	39.412804	-85.012083	47012	6/9/2021 4:56:44 PM
1021262	Broome County Regional Farmers Market	840 Upper Front St	42.129759	-75.904648	13905	1/5/2021 10:02:05 AM
1019906	Brown University Farmers Market	201 Thayer St	41.826418	-71.400031	02906	6/5/2020 1:04:56 PM
1019727	Brownsburg Farmers Market	61 N. Green Street	39.844272	-86.396445	46112	12/20/2019 9:47:54 AM
1017968	Bruce Community Farmers Market	Corner of Hwy 8 and N Alvey Street	45.4551101	-91.2746971	54819	7/27/2018 12:57:56 PM
1008607	Brunswick-Topsham Land Trust Farmers' Market at Crystal Spring Farm	277 Pleasant Hill Rd	43.890786	-69.995923	04011	7/26/2018 4:06:05 PM
1021311	Bryn Mawr Farmers' Market	775 Lancaster Avenue	40.021168	-75.317067	19010	1/26/2021 2:39:25 PM
1019218	Buckroe Beach Farmers Market	100 N. First Street	37.041273	-76.291807	23664	8/7/2018 10:09:43 AM
1008953	Bucksport Bay Farmers' Market	99 Main Street	44.572636	-68.796497	04416	12/27/2018 2:46:54 PM
1000843	Burbank Certified Farmers' Market	150 N. Third Street Burbank, CA 91502	34.1828004	-118.3079771	91502	12/19/2018 10:09:45 AM
1019492	Burke	5671 Roberts Parkway	38.776991	-77.263568	22015	4/25/2019 2:21:52 PM
1021524	Burke Area Farmers Market	626 County Road	43.185042	-99.299066	57523	6/15/2021 12:45:49 PM
1019965	Burlington Farmers Market	345 Pine Street	44.469730	-73.215415	05401	7/20/2020 12:13:53 PM
1021728	Burrillville Farmers Market	75 Tinkham Lane	41.967496	-71.677124	02830	3/8/2022 11:21:42 PM
1002567	Butler County Farmers Market, Greenville, AL	701 Cedar	31.830281	-86.617709	36037	8/2/2018 12:12:27 PM
1001362	Butte Farmers Market	Uptown Butte	46.01269	-112.5364	59701	9/10/2020 4:22:48 PM
1021238	Buy Local Farmers Market - Fall Creek	7930 Fall Creek Bend	29.932940	-95.269976	77396	8/19/2021 10:55:50 AM
1021614	C & C Garden	2022 S Scott St	41.657676	-86.266810	46613	9/9/2021 10:15:07 PM
1020089	Cadiz/Trigg County Farmers Market	7 0 Main Street	36.862889	-87.835998	42211	8/18/2020 9:32:27 AM
1004927	Cagan Crossings Farmers' Market	600 Cagan Park Ave.	28.355644	-81.678425	34714	7/26/2018 3:32:02 PM
1004754	Chelsea Farmers' Market	Corner of Rte 110 and Rte 113	43.98878	-72.44747	05038	1/25/2021 12:26:16 PM
1019922	CalaverasGROWN Certified Farmers' Market San Andreas	891 Mountain Ranch Road	38.191243	-120.667822	95249	6/17/2020 9:00:26 PM
1019978	CalaverasGROWN Murphys Certified Farmers' Market	505 S. Algiers St.	38.136860	-120.463811	95247	7/28/2020 11:04:18 AM
1018263	Caledonia Farmers Market Association - Winter	Pearl St	44.417224	-72.016831	05819	12/29/2020 11:13:28 AM
1019980	Caledonia Outdoor Market	3920 N Greenbay Rd	42.769605	-87.822883	53404	7/28/2020 8:00:21 PM
1020188	California Avenue Farmers' Market	California Avenue, at El Camino	37.46778	-122.13255	94306	8/24/2020 3:23:47 PM
1018459	California Farmers Market	22810 Three Notch Road	38.294524	-76.499596	20619	7/30/2018 7:54:04 AM
1019997	Camarillo Hospice Certified Farmers Market	2220 Ventura Blvd.	34.216518	-119.041574	93010	7/30/2020 3:45:12 PM
1020160	Cambria Farmers Market	1000 Main Street	35.564323	-121.096629	93428	8/21/2020 12:45:12 PM
1020183	Cambrian Park Farmers' Market	Camden Avenue and Union Avenue	37.296867	-121.819306	95124	8/24/2020 2:50:27 PM
1002674	Camellia City Farmers Market	333 Erlanger Ave. (corner of 3rd. St.)	30.275994	-89.780754	70458	1/25/2021 2:46:26 PM
1021575	Cameron Park Burke Junction Certified Farmers Market	Burke Junction Shopping Certer	38.657829	-120.973615	95672	7/21/2021 3:56:32 PM
1020117	Campbell County Farmers Market Association	7634 Alexandria Pike	38.978010	-84.392139	41001	8/20/2020 4:58:03 AM
1020118	Campbell County Farmers Market Association	3504 Alexandria Pike	39.028829	-84.451866	41075	8/20/2020 5:09:16 AM
1020119	Campbell County Farmers Market Association	709 Monmouth St	39.090164	-84.491761	41071	8/20/2020 5:16:31 AM
1020184	Campbell Farmers' Market	Campbell Avenue & Central Avenue	37.280232	-121.954352	95008	8/24/2020 2:56:55 PM
1009034	Canal District Farmers Market	200 Harding Street	42.256235	-71.797436	01604	8/17/2018 11:51:46 AM
1019810	Canal Market District	36 East Canal Street	40.056586	-82.401032	43055	3/26/2020 10:27:51 AM
1021202	Canal Village Farmers' Market	127 West Center Street	43.220102	-78.388368	14103	9/9/2020 7:55:23 PM
1012038	Canoga Park Certified Farmers Market	7248 Owensmouth st	34.203746	-118.601612	91303	7/27/2018 3:05:40 PM
1019772	Canton Farmers Market	500 North Ridge Road	42.308841	-83.533591	48188	3/3/2020 11:40:28 AM
1021435	Canton Farmers' Market	300 Market Ave N	40.800650	-81.374888	44702	3/29/2021 6:44:40 PM
1021294	Cape Coral Farmers Market	SE 47th Terrace & SE 10th Place	26.564457	-81.954459	33904	1/25/2021 11:20:01 AM
1021655	Cape Riverfront Market	35 S Spanish Street	37.302782	-89.519952	63703	1/4/2022 4:20:09 PM
1011930	Capital City Farmers Market	126 West Loockerman Street (Loockerman Way Plaza)	39.1576541	-75.5262294	19904	8/3/2020 1:04:12 PM
1018359	Capital Harvest on the Plaza	1300 Pennsylvania Avenue	38.894748	-77.030256	20004	7/28/2018 6:05:26 PM
1008450	Carmel Farmers Markets at the Barnyard Shopping Village	3690 The Barnyard	36.9872756	-121.9270394	93923	7/26/2018 4:51:00 PM
1006651	Carnation Farmers Market	Corner of Bird and Stossel	47.648587	-121.912419	98014	12/21/2018 8:39:51 PM
1019417	Carolina fresh market and more	6619 hwy 29 north	34.641892	-82.4614	29669	3/8/2019 8:37:52 AM
1021269	Carrboro Farmers' Market	301 W Main St	35.910781	-79.077607	27510	1/12/2021 10:27:30 AM
1008322	Carrollton Farmers Market	Carrollton Uptown Square	39.358097	-93.496941	64633	9/10/2020 9:34:52 PM
1021213	Carson Farmers Market @3rd & Curry St.	3rd & Curry St.	39.162841	-119.768164	89703	1/20/2021 1:17:26 PM
1020071	Carter County Farmers’ Market - Grayson	94 FAIRGROUND DR	38.331557	-82.904359	41143	8/17/2020 5:15:58 PM
1020074	Carter County Farmers’ Market - Olive Hill	131 Jessica Lane	38.297610	-83.180887	41164	8/17/2020 5:36:51 PM
1012093	Carver Farmers Market	108 Main St.	41.888852	-70.769182	02330	1/20/2021 5:32:12 PM
1021740	Casey Farm Market	2325 Boston Neck Rd.	41.513010	-71.423314	02874	3/28/2022 9:33:39 AM
1008276	Catawba County Public Health Farmers Market	3070 11th Ave Dr. SE	35.712066	-81.269507	28602	1/26/2021 8:56:35 AM
1019159	Catawba Valley Farmers Market	4965 Catawba Creek Road	37.3835006	-80.1068482	24070	7/8/2018 10:38:29 PM
1021242	CAVE SPRING FARMERS MARKET	6770 Cave Spring Rd SW	34.132871	-85.309910	30124	4/3/2022 5:29:00 PM
1012484	Cedar Mill Farmers Market	Corner Of NW Cornell and Murray Roads	45.5263877	-122.8141034	97229	7/31/2018 11:39:07 PM
1019842	Cedar Point Farmers Market	1046 Cedar Point Blvd.	34.682610	-77.083526	28584	1/4/2021 2:02:06 PM
1021362	Celina Farmers Market	1001 W Market St.	40.549633	-84.582827	45822	2/22/2021 1:15:26 AM
1018734	Celina's Friday Night Market	142 N Ohio Street	33.3247511	-96.7869845	75009	8/3/2020 1:50:15 PM
1021226	Central Avenue Farmers' Market	4301 S Central Ave	34.005326	-118.256796	90011	9/21/2020 4:43:23 PM
1019907	Central Falls Farmers Market	559 Dexter St	41.885605	-71.395650	02863	6/5/2020 1:10:55 PM
1019618	Central Kitsap Farmers Market	2251 NW Bucklin Hill Rd	47.650238	-122.680109	98383	7/11/2019 1:55:12 PM
1020142	Certified Farmers' Market Palm Springs - Indoor	401 S. Pavilion Way	33.817078	-116.525258	92262	8/20/2020 6:45:46 PM
1020141	Certified Farmers' Market Palm Springs - Outdoor	2300 E. Baristo Rd	33.820251	-116.521181	92262	8/20/2020 6:48:24 PM
1020058	CFFMA - Ft Washington Farmers Market - Sunday	NE Corner Friant and Ft Washington	36.874654	-119.776881	93730	8/11/2020 2:35:45 PM
1020057	CFFMA - River Park Farmers Market - Saturday	SE Corner Blackstone and Nees	36.849327	-119.789099	93720	8/11/2020 2:29:23 PM
1020056	CFFMA - River Park Farmers Market - Tuesday	SE Corner Blackstone and Nees	36.849308	-119.789095	93720	8/11/2020 2:36:54 PM
1019225	Challis Community Farmers Market	Challis City Park	44.505154	-114.227231	83226	8/8/2018 11:56:20 PM
1021267	Champlain Islands Farmers' Market - Wednesday	501 U.S Route 2	44.661841	-73.323048	05486	1/11/2021 3:26:08 PM
1021564	Champlain Islands Farmers' Market-Saturday	185 US Route 2	44.7968758	-73.294874	05458	7/14/2021 10:28:28 AM
1018886	Charles Town Farmers Market	100 block of South Samuel Street	39.289073	-77.858454	25414	1/4/2021 1:23:16 PM
1017995	Charleston Farmers Market	\N	35.2970353	-94.0363153	72933	7/26/2018 4:28:04 PM
1021741	Charlestown Land Trust Farmers' Market	4150 Old Post Road	41.38411	-71.621941	02813	3/28/2022 9:24:15 PM
1011689	Charlotte Regional Farmers Market	1801 Yorkmont Road	\N	\N	28217	9/11/2020 8:14:33 AM
1005834	Chatham Farmer's Market	1652 Main Street Rte 28	41.676615	-69.962249	02633	9/10/2020 2:56:47 PM
1019881	Chatter Box Farmers Market in Tekamah	\N	41.775832	-96.222387	\N	5/27/2020 2:18:00 PM
1008606	Chesterfield County Farmers Market	near 6701 Mimms Loop	37.376728	-77.504419	23832	9/11/2020 6:15:15 AM
1021310	Chestnut Hill Farmers' Market	7673 Germantown Avenue	40.067760	-75.196931	19118	1/26/2021 2:40:02 PM
1020128	Chico Certified Farmers Market - Chico Saturday	2nd and Wall Streets	39.730823	-121.838323	95927	8/20/2020 12:45:58 PM
1020129	Chico Certified Farmers Market - Chico Wednesday	North Valley Plaza Mall	39.758425	-121.848452	95926	8/20/2020 12:54:13 PM
1020127	Chico Certified Farmers Market - Paradise Tuesday	6491 Clark Road	39.773680	-121.595446	95969	8/20/2020 12:56:06 PM
1001763	Chilhowie Farmer's Market	East Lee Highway between Chestnut and Pine Avenues (Warrior Park)	36.802950	-81.676633	24319	1/2/2019 9:44:46 AM
1019104	China Grove Farmers Market	308 North Main Street	35.5709810	-80.5778246	28023	5/16/2018 9:50:37 PM
1008409	Chippewa Falls Farmers Market	1 S. Bridge Street	44.934888	-91.389337	54729	1/26/2021 11:47:35 AM
1021237	Church St Farmers Market	6730 Church St	33.749649	-84.750061	30134	10/30/2020 10:47:15 AM
1004360	Church Street Farmers' Market	603 Church Street	37.077437	-78.008079	23824	7/26/2018 4:19:07 PM
1021653	Circle Square Commons Farmers Market	8445 SW 80th Street	29.106489	-82.257895	34481	1/4/2022 11:01:58 AM
1019141	City Center Farmers Market	200 Sanborn Street	34.198789	-79.773582	29501	1/7/2021 10:46:01 AM
1005250	City Hall Parking Lot Deck (People's Open Market)	Alapai & Beretania Street	21.305408	-157.852699	96813	3/20/2019 4:35:55 PM
1021199	City Heights Certified Farmers Market	4325 Wightman St.	32.747817	-117.101527	92104	8/31/2020 4:19:21 PM
1019717	City Market	1150 South Gay Street	32.584813	-85.475592	36830	11/18/2019 5:35:12 PM
1004255	City of Loveland Farmers Market	700 S. Railroad	40.387479	-105.078652	80537	9/10/2020 3:08:27 PM
1017956	City of North Adams Farmers' Market	St. Anthony Municipal Parking Lot, at the intersection of Rte. 8 (Marshall St.) and St. Anthony Drive	42.700694	-73.112792	01247	7/26/2018 3:50:14 PM
1017930	City of Pittsburgh Carrick Farmers Market	1529 Brownsville Road	40.400201	-79.988803	15210	8/4/2020 1:07:36 PM
1000303	City of Plymouth Farmers Market	15500 County Road 6	44.997274	-93.473419	55447	1/26/2021 12:51:03 PM
1021433	City of Seven Hills Farmers Market	7221 Broadview Road	41.369164	-81.684217	44131	3/29/2021 3:20:04 PM
1021420	City of St. Clair Shores Farmers Market	24800 Jeffereson	42.6958071	-82.932268	48080	3/25/2021 8:41:49 AM
1006460	City of White Bear Lake Farmer's Market	Clark Avenue, between 2nd and 3rd Street	45.084125	-93.009953	55110	1/27/2021 9:39:39 AM
1005940	CitySeed Edgewood Park Farmers Market	corner of Whalley Ave. and West Rock Ave.	41.325348	-72.958562	06515	8/2/2018 12:10:24 PM
1005941	CitySeed Fair Haven Farmers Market	Corner of Front St. and Grand Ave.	41.308956	-72.888848	06513	8/2/2018 12:16:44 PM
1019206	CitySeed Winter Market	115 Water St	41.3011808	-72.9188338	06511	8/2/2018 12:35:23 PM
1005943	CitySeed Wooster Square Farmers Market	DePalma Ct. between Chapel St. and Wooster St.	41.303232	-72.917848	06511	8/2/2018 12:22:10 PM
1002106	Claremont Farmers & Artisans Market	Harvard Avenue Between Bonita and First Streets	34.095598	-117.716418	91711	2/12/2021 7:00:58 PM
1019061	Claremont Farmers' Market	14 North Street	43.375823	-72.339305	03743	4/21/2018 4:27:28 PM
1000579	Clarence Hollow Farmers' Market	New Town lot, 10717 Main St. (route 5)	42.98032	-78.58945	14031	2/2/2021 8:14:10 AM
1019840	Clarkston Farmers Market	Beachview Park, Chestnut St	46.410563	-117.039927	99403	4/7/2020 6:43:01 PM
1021441	Clay Center Farmers Market	720 5th Street	39.376936	-97.126471	67432	4/7/2021 4:22:47 PM
1019110	Cleburne Farmers Market	141 S Ridgeway Drive	32.339893	-97.407713	76033	5/21/2018 1:24:48 AM
1019741	Clemmons Farmers Market	1150 S Peace Haven Road	36.033223	-80.386699	27012	1/28/2020 3:34:17 PM
1019704	Cleveland Park Farmers Market	3400 Connecticut Ave NW, Washington, DC 20008	38.934817	-77.058379	20008	2/3/2021 8:08:30 AM
1018381	Clifton Park Farmers' Market	971 Route 146, Shenendehowa United Methodist Church parking lot	42.869606	-73.809271	12065	8/8/2018 1:13:00 AM
1019823	Clinton Farmers Market	20 West Park Row	43.048866	-75.378462	13323	4/6/2020 10:14:43 AM
1019763	Clintonville Farmers' Market	N High St and W Dunedin Rd	40.034269	-83.016501	43214	2/26/2020 4:40:14 PM
1000549	Clio Market	21 College Street	31.7078144	-85.6190650	36311	7/26/2018 5:08:58 PM
1002808	CMS Farmers Market	7500 Security Blvd.	39.316055	-76.764414	21244	1/25/2021 1:38:55 PM
1019474	Co-Operative Farmers Market	900 Barring Avenue	41.422523	-75.662496	18508	1/4/2021 4:10:48 PM
1018969	Coastal Growers Farmers Market	650 Ten Rod Rd.	41.572691	-71.485463	02852	2/27/2018 11:12:22 AM
1019821	Coastal Growers Market	2325 Boston Neck Rd	41.512000	-71.423632	02874	4/3/2020 11:54:23 PM
1020135	Coastside Farmers' Market - Half Moon Bay	225 Cabrillo Highway	37.46677	-122.437378	94019	8/20/2020 4:04:27 PM
1020137	Coastside Farmers' Market - Rockaway Beach, Pacifica	450 Old County Road	37.609415	-122.495081	94044	8/20/2020 4:17:05 PM
1021232	College Place Farmers & Artisan Market	801 SE Larch Avenue	46.041708	-118.377845	99324	1/5/2021 2:22:38 PM
1001290	Collinsville Farmers Market	Main St. and Route 179	41.810819	-72.923264	06019	1/26/2021 10:47:25 AM
1000210	Colorado Farm and Art Market	7350 Pine Creek Road	38.9377160	-104.8146880	80919	8/3/2020 1:44:04 PM
1009656	Colorado Farm and Art Market	215 S. Tejon	38.830543	-104.822309	80903	8/3/2020 1:43:08 PM
1018196	Columbia Farmers Fresh Market	5th Street & Riverside Drive	35.6187845	-87.0304808	38401	1/4/2021 3:59:24 PM
1019790	Columbia Farmers Market	1769 West Ash Street	38.958293	-92.364624	65203	1/13/2021 5:36:51 PM
1010758	Columbia Farmory and Mountain People Organics	10800 Airport Road	38.0293950	-120.4100110	95310	7/26/2018 4:00:01 PM
1019483	Columbus Farmers Market	14 st and 26 Ave	41.430012	-97.360360	68601	4/25/2019 11:40:40 AM
1019199	Columbus KS Farmers Market	202 N. East Avenue	37.171861	-94.831459	66725	1/25/2021 10:43:32 PM
1020124	Colusa Certified Farmers Market	10th Street Memorial Park	39.214999	-122.014038	95932	8/20/2020 11:37:54 AM
1011003	Colwell's Farmers Market	9079 HWY377	33.5491175	-96.9110998	76240	7/27/2018 10:41:19 PM
1021541	Come Thru Market	831 SE Salmon St	45.514708	-122.657252	97214	6/24/2021 9:04:15 AM
1019592	Como Farmer's Market	Main Street	34.513561	-89.939947	38619	6/20/2019 7:48:33 PM
1019042	Connecticut's Old State House Farmers Market	800 Main Street	41.766118	-72.672892	06103	4/6/2018 10:41:29 AM
1012030	Conway Farmers Market	1029 2nd Ave	33.833331	-79.044831	29526	1/27/2021 3:35:45 PM
1021396	Conway Farmers' Market	150 Amity Rd.	35.077695	-92.412570	72032	3/16/2021 10:03:50 AM
1006766	Coos Bay Farmers Market	320 Central Ave., Suite 410	43.367982	-124.215299	97420	7/26/2018 4:50:38 PM
1018190	Coralville Farmers' Market	1513 7th St	41.678726	-91.584155	52241	1/2/2019 1:09:12 PM
1021639	Cornelius Farmers Market	1370 N Adair St	45.521314	-123.055169	97113	12/6/2021 1:14:02 PM
1012666	Corpus Christi Downtown Farmers' Market	100 N Shoreline Blvd	27.791601	-97.392206	78401	12/30/2018 8:04:56 PM
1008959	Cortez Farmers Market	Main and Elm Streets	37.348444	-108.587634	81321	9/28/2018 11:07:53 AM
1021691	Corvallis Farmers' Market	1st & Jackson	44.564828	-123.258244	97330	2/5/2022 8:28:59 PM
1018629	Cotati Community Farmers Market	Old Redwood Hwy and W Sierra	38.326544	-122.707298	94931	8/6/2020 10:23:09 AM
1010975	Cottage House Youth Market	47 Doster Road	31.647050	-85.674054	36311	7/26/2018 5:02:06 PM
1004382	Cottin's Hardware Farmers Market	1832 Massachusetts Street	38.950747	-95.235146	66044	1/5/2021 4:23:14 PM
1018221	Cotton Mill Farmers Market	609 Dixie Street	33.571347	-85.072740	30117	8/3/2020 5:39:28 PM
1000368	Country Lane Farmers Market	1642 16th St	45.443768	-91.828516	54812	12/22/2018 12:39:57 AM
1019530	Countryside Farmers' Market at Highland Square	1175 W Exchange St	41.098698	-81.553272	44302	5/17/2019 9:02:26 AM
1019529	Countryside Farmers' Market at Howe Meadow	4040 Riverview Rd.	41.189312	-81.583614	44264	5/17/2019 8:58:30 AM
1019531	Countryside Public Market	21 Furnace Street	41.088850	-81.515871	44308	5/17/2019 9:06:47 AM
1019258	Countryside Winter Farmers' Market	2315 Ira Rd.	41.192676	-81.589922	44333	9/18/2018 2:03:36 PM
1019325	Coventry Farmers' Market (formerly Coventry Regional Farmers' Market)	2299 South St.	41.764283	-72.345186	06238	12/6/2018 3:52:01 PM
1019296	Covington Farmers Market	3rd and Greenup Street	39.088659	-84.508855	41011	10/1/2018 11:50:54 AM
1012552	Cowtown Farmers Market	3821 SOUTHWEST BLVD	32.716447	-97.442048	\N	7/28/2018 8:32:48 AM
1009993	Cozad Grand Generation Center	410 W 9th St.	40.8606228	-99.9901154	69130	1/27/2021 9:22:36 AM
1019130	Craft Market	Decks Reserve Carpark, Wallace Street, Mouteka	44.5205554	-109.58853	70105	6/11/2018 4:01:28 AM
1021330	Crawfordsville Farmers Market	100 W Pike St.	40.040652	-86.903732	47933	1/30/2021 8:12:45 PM
1021331	Crawfordsville Winter Market	400 Parke Avenue	40.046040	-86.896007	47933	1/30/2021 8:32:17 PM
1021227	Crenshaw Farmers' Market	3650 W Martin Luther King Jr Blvd	34.008706	-118.335422	90008	9/21/2020 4:54:14 PM
1019260	Crescent City Farmers Market	200 Broadway Street	29.932171	-90.133127	70118	9/19/2018 11:32:51 AM
1019261	Crescent City Farmers Market	1235 N. Peters	29.960279	-90.058904	70116	9/19/2018 11:41:19 AM
1019262	Crescent City Farmers Market	200 Broadway Street	29.932159	-90.133127	70118	9/19/2018 11:46:18 AM
1002470	Croghan Colonial Bank Farmers Market	Front Street and Garrison Street	41.3454080	-83.1135499	43420	1/15/2021 10:35:49 AM
1021391	Cross County Farmer's Market	705 E. Union Avenue, Room 2	35.223532	-90.786483	72396	3/15/2021 2:34:43 PM
1012365	Crossroads Farmers Market	Anne St. at University Blvd. E	38.990479	-76.990169	20912	7/30/2018 9:51:38 AM
1001869	Crystal Lake Farmers Market	Depot Park, Woodstock & Williams Streets	42.243752	-88.317010	60014	1/5/2021 4:03:16 PM
1021346	Culver City Farmers Market	Main Street in Culver City	34.024936	-118.394640	90232	2/7/2021 11:31:02 AM
1019701	Culver Farmers' Market	819 E. Lake Shore Drive	41.218494	-86.419302	46511	9/18/2019 11:29:29 AM
1019702	Culver Farmers' Market	107 N Main Street	41.216815	-86.422907	46511	9/18/2019 11:33:44 AM
1020109	Cumberland County Farmers' Market	819 S Main Street	36.790074	-85.364614	42717	8/19/2020 10:13:46 AM
1021387	Cumberland Farmers Market	11501 E Washington Street	39.775860	-85.961539	46229	3/14/2021 4:15:24 PM
1019539	Cuyahoga Falls Farmers' Market (Farmers' Market in the Falls)	1817 Front Street	41.130404	-81.483560	44222	5/23/2019 10:16:00 AM
1021408	Dallas County Farmer's Market	206 West 3rd St.	33.812858	-92.414240	71742	3/17/2021 10:16:23 AM
1004516	Danbury Farmers' Market	120 White Street	41.397912	-73.450227	06810	8/3/2020 12:23:30 PM
1019163	Dardanelle Farmers Market	120 N Front St	35.220839	-93.153099	\N	7/10/2018 9:54:37 AM
1012505	Darlington Farmers Market	Main Street	42.677666	-90.117445	53530	7/27/2018 2:55:26 PM
1018157	Davenport Farmers' Market	North Park Mall east entrance	41.562863	-90.571154	52804	1/6/2021 8:50:58 AM
1019880	David City Farmers Market	\N	41.264759	-97.129955	68632	2/23/2021 9:09:29 AM
1012254	Dawson Farmers Market	Ash  and 8th street	44.9259444	-96.0574386	56232	7/31/2018 3:31:07 PM
1019100	Daybreak Farmers Market	Kestrel Rise Rd. and Daybreak Pkwy/W 11400 S	40.547045	-112.002561	84009	5/15/2018 12:39:40 PM
1021457	De Soto Farmers' Market	520 N. Main St.	38.143674	-90.552205	63020	4/30/2021 10:25:34 AM
1018945	Dearborn Farmers & Artisans Market	22271 West Village Drive	42.313057	-83.211488	48124	2/15/2018 3:54:22 PM
1019970	Decatur Farmers Market	308 Clairemont Ave	33.778773	-84.296808	30030	7/23/2020 4:46:09 PM
1021570	Decorah Farmers Market	Heivly Street	43.301618	-91.78475	52101	7/19/2021 5:26:08 PM
1012296	DeForest Farmers' Market	DeForest Street	43.246672	-89.339846	53532	7/27/2018 2:43:26 PM
1011103	DeKalb Farmers' Market	2nd and Locust Streets	41.931127	-88.752032	60115	1/13/2021 4:01:30 PM
1002536	Del Monte Farmers Markets at Del Monte Shopping Center	1410 Del Monte Center	36.9872756	-121.9270394	93940	7/26/2018 4:48:44 PM
1020061	Delano Neighborhood Market	1709 W Douglas	37.683757	-97.360349	67213	8/12/2020 4:53:15 PM
1018416	Delcambre Seafood & Farmers Market	605 S Railroad (Hwy 330)	29.941659	-91.982453	70528	1/26/2021 5:05:10 PM
1019308	Delmar Farmers Market	332 Kenwood Ave	42.619919	-73.825895	12054	10/19/2018 6:32:07 PM
1020191	Delray GreenMarket	NE 2nd Avenue, half block east of Atlantic Avenue	26.462365	-80.071595	33444	8/25/2020 3:44:54 PM
1021591	Delridge Farmers Market	9421 18th Ave SW	47.518781	-122.358129	98106	7/30/2021 4:36:43 PM
1021649	Denton Community Market	317 w Mulberry St	33.213317	-97.136334	76201	12/16/2021 1:01:34 PM
1007255	Des Moines Waterfront Farmers Market	22307 Dock Ave S	47.401657	-122.329307	98198	7/31/2018 7:49:28 PM
1003628	Dexter Farmers Market	3233 Alpine	42.339503	-83.889459	48130	1/25/2021 3:58:58 PM
1021318	Dickinson Square Farmers' Market	1600 East Moyamensing Avenue	39.927056	-75.151276	19148	1/27/2021 10:15:51 AM
1021261	Dillsboro Farmers Market	12921 North Street	39.018037	-85.059414	47018	1/5/2021 10:05:02 AM
1018958	Dillsburg Farmers' Market	1 N. 2nd Street	40.110975	-77.037849	17019	2/20/2018 8:30:52 PM
1019458	Dimondale Farmers' Market	136 N Bridge St	42.646201	-84.647388	48821	1/6/2021 1:01:50 PM
1018816	Dodge County Farmer's Market	5401 Courthouse Circle	32.200790	-83.176305	31023	1/5/2021 10:45:45 AM
1019742	Dodgeville Farmers Market	327 N. Iowa Street	42.962345	-90.129944	53533	1/28/2020 4:22:22 PM
1019439	Dolores County Farmers Market	390 Main Street	37.764836	-108.903587	81324	3/23/2019 1:10:06 AM
1019964	Donnelly Farmers Market	FW Gestrin and E. Roseberry Rd	44.730034	-116.076720	83615	7/17/2020 3:16:35 PM
1018706	Dorchester/Dorchester House Farmers Market	1353 Dorchester Avenue	42.304202	-71.060126	02122	7/27/2018 9:25:37 AM
1020111	Dorey Park Farmers Market	2999 Darbytown Road	37.5380571	-77.405887	23231	8/19/2020 12:10:43 PM
1003046	Dousman Farmers Market	118 S. Main St	43.0131210	-88.4725142	53118	2/10/2021 8:30:21 AM
1009829	Dover Farmers' Market	550 Central Avenue	43.200765	-70.875971	03820	7/31/2018 1:38:12 PM
1009894	Down to Earth Chelsea Farmers Market	W. 23rd Street off 9th Avenue	40.746359	-74.000805	10011	1/25/2021 12:45:47 PM
1021296	Down to Earth Cunningham Park Farmers Market	Parking lot off Union Turnpike	40.730800	-73.773482	11366	1/25/2021 12:59:44 PM
1010954	Down to Earth Larchmont Farmers Market	Parking Lot off Chatsworth Ave.	40.933512	-73.760008	10538	1/25/2021 12:36:48 PM
1016793	Down to Earth Mamaroneck Winter Farmers Market	Harbor Island Park	40.944797	-73.730404	10543	1/25/2021 12:16:12 PM
1010969	Down to Earth McGolrick Park Farmers Market	At the center of the park	40.724358	-73.943291	11222	1/25/2021 12:51:27 PM
1010972	Down to Earth Morningside Park Farmers Market	110th Street and Manhattan Avenue	40.801254	-73.959645	10026	1/25/2021 12:20:48 PM
1010958	Down to Earth New Rochelle Farmers Market	Thomas Paine Cottage Museum	40.933570	-73.791017	10804	1/25/2021 12:33:42 PM
1016792	Down to Earth Ossining Farmers Market	Near the corner of Spring & Main Streets	41.160793	-73.863410	10562	1/25/2021 12:21:26 PM
1009895	Down to Earth Park Slope Farmers Market	4th Street at 5th Avenue	40.672303	-73.983867	11215	1/25/2021 12:16:43 PM
1010982	Down to Earth Queens Botanical Garden Farmers Market	Dahlia Avenue at Main Street	40.751776	-73.826548	11355	1/25/2021 12:54:44 PM
1010960	Down to Earth Rye Farmers Market	Parking lot off Theodore Fremd Ave.	40.983895	-73.686043	10580	1/25/2021 12:41:08 PM
1016867	Downingtown Farmers Market	1 Park Lane	40.007243	-75.705606	19335	7/26/2018 4:29:48 PM
1019667	Downtown Alachua Farmer's Market	14801 Main Street	29.790872	-82.495552	32615	8/5/2019 9:42:53 AM
1009043	Downtown Allen Park Farmers Market	Park Avenue and Harrison Avenue	42.2548010	-83.2089890	48101	2/4/2021 3:07:59 PM
1003643	Downtown Beloit Farmer's Market	300 block of State Street, 400 block of East Grand Avenue, Gantry parking lot	42.499698	-89.035555	53511	7/26/2018 4:38:03 PM
1020064	Downtown Berkeley	1947 Center St.	37.869819	-122.271600	94704	8/13/2020 12:58:38 AM
1020000	Downtown Bloomington Farmers Market	200 N. Main	40.480014	-88.994107	61701	1/20/2021 11:27:34 AM
1020001	Downtown Bloomington Farmers Market- Indoor	101 S. Madison	40.478127	-88.996165	61701	7/31/2020 11:46:10 AM
1019370	Downtown Canton Farmers Market	202 N. Buffalo St.	32.557360	-95.863185	75103	2/1/2019 5:03:18 PM
1019944	Downtown Chico Thursday Night Market	\N	39.728991	-121.840469	95928	6/28/2020 9:23:36 PM
1021401	Downtown Conway Farmers' & Crafts Market	718 Parkway	35.088507	-92.440867	72032	3/16/2021 5:02:46 PM
1000841	Downtown Denison Farmers Market	701 W. Main St.	33.755828	-96.545350	75020	7/27/2018 12:13:35 PM
1019401	Downtown Elgin Farmers Market	S. Spring Ave	42.036328	-88.282543	60120	1/4/2021 11:37:38 AM
1021631	Downtown Evanston Farmers’ Market	University Place at Oak Street	42.050620	-87.686152	60201	11/16/2021 11:12:21 PM
1008853	DOWNTOWN EVANSVILLE FARMERS MARKET	3rd, 4th and Bond Sts.	37.993544	-87.586443	47708	7/30/2018 2:43:44 PM
1002400	Downtown Farmers Market	206 S 4th Street	36.6097959	-88.3022291	42071	7/26/2018 3:45:49 PM
1019032	Downtown Farmers Market	101 North Main Street	34.721099	-80.770914	29720	3/30/2018 3:54:50 PM
1019856	Downtown Farmers Market	on the court square at 4th Street and Maple Street	36.609868	-88.302435	42071-0002	5/5/2020 4:19:28 PM
1019216	Downtown Farmers Market of Fort Pierce, Inc.	Melody Lane and Marina Square	27.449057	-80.321851	34950	8/6/2018 4:01:51 PM
1012243	Downtown Fond du Lac Farmers Market - Saturday	Main Street from Western Ave. to Sheboygan St.	43.775364	-88.446973	54935	7/26/2018 4:47:39 PM
1012256	Downtown Fond du Lac Farmers Market - Wednesday	Main Street Plaza	43.777853	-88.447092	54935	7/26/2018 4:49:37 PM
1019654	Downtown Green Bay Saturday Farmers Market	200 S. Washington Street	44.513118	-88.017128	54301	8/1/2019 12:17:14 PM
1019341	Downtown Lawrenceburg Farmer's Market	US 50 and Park Streets	39.095734	-84.857359	47025	12/30/2018 11:44:39 AM
1019083	DOWNTOWN LIMA FARMERS' MARKET	7 Town Square	40.7395472	-84.1058237	45801	5/2/2018 6:52:45 AM
1009757	Downtown Madison Farmers Market	2103 Main Street / Historic Red Caboose Site	32.460885	-90.114634	39110	1/26/2021 10:56:58 AM
1018930	Downtown Marquette Farmers Market	112 S. Third St.	46.543488	-87.395409	49855	1/3/2019 3:10:19 PM
1003977	Downtown Newport Farmers Market	Corner of Hwy 101 & Angle St	35.6268	-91.234721	72112	6/4/2019 11:14:17 AM
1018621	Downtown Novato Community Farmers Market	7th Street behind the CVS between Grant Ave & Novato Blvd	38.107536	-122.578749	94947	8/6/2020 10:10:41 AM
1019721	Downtown Palo Alto Farmers' Market	Gilman St, between Hamilton and Forest	37.445330	-122.159029	94301	12/8/2019 7:02:55 PM
1021716	Downtown Phoenix Farmers Market	721 N Central Ave	33.455875	-112.073418	85004	2/23/2022 5:16:11 PM
1021411	Downtown Rogers Farmers Market	Railyard Park	36.332762	-94.116000	72756	3/17/2021 4:44:25 PM
1005281	Downtown Santa Cruz Farmers' Market	Cedar St & Lincoln St.	36.9724758	-122.0270374	\N	8/1/2018 2:14:34 PM
1019525	Downtown Yakima Farmers Market	Yakima Ave & S 3rd Street	46.602267	-120.502787	98901	5/14/2019 2:03:38 PM
1019729	Dresden Farmers Market	421 Linden St.	36.277008	-88.693465	38225	1/2/2020 10:12:42 AM
1004676	Druid Hill Farmers' Market	3100 Swann Drive	39.317944	-76.645847	21217	6/2/2019 8:30:26 AM
1005358	Dublin	4201 Central Parkway	37.710402	-121.878639	94568	7/27/2018 10:37:55 AM
1005197	Dubuque Farmers Market	Iowa Street between 10th & 13th Streets	42.504521	-90.667851	52001	1/4/2021 10:35:33 AM
1019994	Duluth's Downtown Farmers' Market	Gitch ode' Akiing formerly known as Lake Place Park 214 E Superior Street	46.788805	-92.093948	55802	7/30/2020 11:11:14 AM
1018953	Durango Farmers Market	259 W 9th Street	37.273063	-107.882758	81301	1/31/2021 5:12:52 PM
1000312	Durham Farmers' Market	501 Foster Street	36.000559	-78.901856	27701	9/10/2020 7:12:47 PM
1009830	Durham Farmers' Market	Jackson Landing, 10 Old Piscataqua Road	43.136610	-70.910656	\N	7/31/2018 1:33:09 PM
1012345	Duvall Farmers Market	16201 Main St. NE at Taylor Landing	47.744679	-121.986419	98019	1/19/2021 10:33:14 PM
1019082	E. Center St. Farmers Market	40 East Center Street	39.473055	-118.776299	89406	4/30/2018 5:52:24 PM
1019870	Eagle Farmers Market	5th St. and Hwy 34	40.816121	-96.432729	68347	5/26/2020 1:48:09 PM
1021275	Eagle Springs Farmers Market	13555 Valley Lodge Parkway	29.975941	-95.194557	77346	1/13/2021 6:57:14 PM
1018159	East Atlanta Village Farmers Market	572 Stokeswood Avenue	33.738679	-84.344531	30316	7/27/2018 8:32:40 AM
1021303	East Boston Farmers Market - Summer/Early Fall	Across from 201 Border St.	42.374945	-71.039467	02128	2/9/2021 1:31:36 PM
1021414	East Boston Farmers On-line Market - Winter/Spring	250 Sumner street	42.3313532	-71.076514	02128	3/19/2021 12:50:11 PM
1011673	East End Market	2600 Navigation Blvd.	29.757511	-95.342978	77003	9/28/2018 4:00:15 PM
1019079	East Greenbush Library & YMCA Farmers Market	Between 10 and 20 Community Way in parking lot	42.618063	-73.695566	12061	4/30/2018 11:54:05 AM
1020133	East Hollywood Certified Farmers' Market	Hollywood Blvd. and Western Ave.	34.101510	-118.308877	90028	8/20/2020 3:08:26 PM
1011113	East Nashville Farmers' Market	511 Woodland Street	36.172268	-86.764338	000TN	2/2/2021 6:56:12 PM
1019510	East Orange Farmer's Market	44 City Hall Plaza	40.761250	-74.209979	07018	5/6/2019 10:02:46 PM
1020172	East Palo Alto Community Farmers Market	2555 Pulgas Avenue	37.469415	-122.132550	94303	8/21/2020 9:22:59 PM
1012717	East Point Farmers Market	2757 East Point St.	33.679488	-84.442141	30344	9/11/2020 9:55:21 AM
1019094	East Side Farmers' Market	760 E Water St Elmira	42.088757	-76.794875	14901	1/4/2021 10:31:27 AM
1021300	East Vancouver Farmers Market	17701 SE Mill Plain Blvd.	45.615372	-122.493777	98683	1/25/2021 6:24:15 PM
1019125	Eastgate Plaza Farmers Market	4927 - 5089 Transit Road	42.97573	-78.595325	14221	6/7/2018 10:33:14 AM
1021698	Easthampton Farmers' Market	50 Payson Ave	42.265213	-72.669332	01027	2/9/2022 4:05:13 PM
1009867	Easton Farmers' Market	128 Larry Holmes Drive	40.689778	-75.206274	18042	1/26/2021 8:37:18 PM
1019624	Eastside Sunday Market	2020 MLK Jr. Ave	35.976258	-83.900903	37915	7/15/2019 4:47:08 PM
1021710	Eat Drink RI Market at Blackbird Farm	660 Douglas Pike	41.901787	-71.505011	02917	2/17/2022 12:43:21 PM
1021228	Echo Park Farmers' Market	1146 Logan St	34.076409	-118.258276	90026	9/21/2020 5:23:33 PM
1012783	Edenton Farmers Market	200 North Broad St	36.062086	-76.607401	27932	1/5/2021 1:44:13 PM
1012160	Edmonds Museum Summer Market	5th Ave between Main and Bell & Bell St. between 5th & 6th Ave	47.811264	-122.376787	98020	1/31/2021 7:53:05 PM
1019118	Egg Harbor Farmers Market	7809 Highway 42	45.049942	-87.280716	54209	5/29/2018 3:09:45 PM
1021652	El Cajon Farmers Market   Non-Certified	1051 Greenfield Drive,	32.801659	-116.960482	92021	1/1/2022 2:16:34 PM
1021574	El Dorado Hills Town Center Certified Farmers Market	Town Center Blvd.	38.651318	-121.064292	95762	7/21/2021 3:58:01 PM
1019936	El Monte Farmers' Market	10700 Main Street	34.075484	-118.039950	91731	6/24/2020 7:04:28 PM
1012634	Eldora Farmers Market	Corner of Edgington Ave. and 14th Street	42.360510	-93.100656	50627	8/9/2020 5:36:19 PM
1019921	Elgin Farmers' Market	\N	30.346425	-97.370756	78621	6/16/2020 6:09:11 PM
1021587	Elkhart Farmers Market	301 NIBCO Parkway	41.687093	-85.970818	46516	7/29/2021 12:10:02 PM
1018900	Ellington Farmers Market	Main ST	41.9036393	-72.4681079	06029	1/2/2018 8:55:42 AM
1018898	Ellington Winter Farmers' Market	11 Pinney St	41.8697886	-72.4903500	06029	1/2/2018 8:41:50 AM
1020112	Elliott County Farmers’ Market	2944 S KY 7	38.093439	-83.122634	41171	8/19/2020 12:19:46 PM
1018717	Elm Street Market	Elm Street	42.349361	-71.229493	02465	7/27/2018 1:05:43 PM
1021207	Elmwood Bidwell Farmers' Market	Elmwood and Bidwell	42.923862	-78.877625	14221	9/11/2020 12:10:44 PM
1002657	Emmaus Farmers' Market	235 Main St	40.5366	-75.4903	18049	7/26/2018 5:30:51 PM
1002769	Empire Farmers Market	10234 Front Street	44.811224	-86.063056	49630	2/1/2021 3:02:49 PM
1019398	Empire Market	931 E 4th St	37.087883	-94.502691	64801	1/5/2021 5:23:07 PM
1012045	Encino Farmers Market	17400 Victory Blvd	34.1862306	-118.5128542	91406	7/27/2018 1:28:44 PM
1018940	Engadine Area Farmers' Market	\N	46.119734	-85.578248	\N	2/12/2018 5:26:42 PM
1019684	Enka-Candler Tailgate Market	70 Pisgah Hwy	35.540990	-82.684674	28715	8/15/2019 10:11:21 PM
1018765	Ennis Farmers Market	104 North McKinney Street	32.327630	-96.629391	75119	1/2/2019 2:59:58 PM
1019687	Enumclaw Plateau Farmers' Market	1600 1st Street	47.202843	-121.987466	98022	8/28/2019 1:20:48 AM
1006678	Espanola Farmers Market	1105 N.Railroad  Avenue	36.003598	-106.065805	87532	1/14/2021 1:12:45 AM
1003568	Estacada Farmers Market	664 Wade St	45.297544	-122.331858	97023	6/5/2019 10:59:41 AM
1020053	Etna Farmers Market	514 N Hwy 3	41.458263	-122.895854	96027	8/7/2020 5:34:36 PM
1019954	Eureka Springs Farmers Market	44 Kingshighway	36.398616	-93.746149	72632	7/10/2020 8:55:58 AM
1010195	Evart Farmers Market	200 South Main Street	43.899648	-85.259592	49631	3/9/2022 5:13:03 PM
1005267	Ewa Beach Community Park (People's Open Market)	91-955 North Road	21.314954	-158.007174	96706	3/20/2019 4:48:37 PM
1007798	Exeter Farmers’ Market	Swasey Parkway, off Water Street	42.983633	-70.950053	\N	7/31/2018 1:36:36 PM
1019081	Fair Haven Market (hosted by The Vermont Farmers Market	On The Green	43.594490	-73.266531	05777	4/30/2018 11:38:20 AM
1018622	Fairfax Community Farmers' Market	124 Bolinas Avenue	37.985729	-122.589980	94930	8/6/2020 10:12:20 AM
1019186	Fairfax Community Farmers' Market	10500 Page Avenue	38.846056	-77.308647	22030	7/26/2018 8:20:07 PM
1019049	Fairland Farmers Market	50 N. Pine St.	36.747475	-94.854471	74343	4/10/2018 4:18:31 PM
1018562	Fairwood Farmers' Market	319 W. Hastings Rd.	47.768387	-117.417780	99218	1/9/2019 11:53:25 PM
1019457	Fallbrook Farmers' Market	600 Fallbrook Blvd	40.877605	-96.728376	68522	4/8/2019 2:47:07 PM
1010889	Falls Park Farmers Market	E Falls Park Drive and N 2nd Ave	43.560777	-96.723203	57101	12/21/2018 4:22:10 PM
1019841	Farm to Fork Farmers Market at Normandy Farms	7802 Marsh Road	39.894467	-86.274997	46278	4/16/2020 12:45:49 PM
1021514	Farm to Fork Farmers' Market	120 S Kimball Ave	43.666163	-116.688851	83605	6/9/2021 3:33:34 PM
1019499	Farm to Preschool Market: Mercy Cares for Kids	310 S. Manning Blvd	42.665745	-73.798353	12206	4/30/2019 11:58:28 AM
1019523	Farmers and Crafts Market of Las Cruces	221 N. Main St	32.326444	-106.789695	88001	5/14/2019 1:15:47 PM
1018937	Farmers Branch Market	12700 Denton Drive	32.9178496	-96.8952798	75234	2/12/2018 2:27:55 PM
1019436	Farmers Fresh Market	33955 Community College Dr.	60.472775	-151.135361	99669	3/22/2019 4:22:15 PM
1021666	Farmers Market - Covington	301 4th St	40.137063	-87.397090	47932	1/20/2022 5:01:00 PM
1021734	Farmers Market - Covington	301 4th St	40.137120	-87.396970	47932	3/17/2022 3:49:51 PM
1018131	Farmers Market at St. John's	750 Aurora Avenue	41.767594	-88.159755	60540	7/30/2018 9:24:49 AM
1020104	Farmers Market at the Depot	101 E. Depot Street	37.683658	-85.217676	40069	8/18/2020 3:06:59 PM
1021388	Farmers Market at the Fairgrounds	620 N Apple Street	39.791832	-85.756240	46140	3/14/2021 4:33:57 PM
1019705	Farmers Market North Scottsdale	8711 E Pinnacle Peak Road	33.697831	-111.893119	85252	9/22/2019 12:30:35 PM
1005069	Farmers Market of Bluffton	40 Calhoun Street	32.234811	-80.862568	29910	9/15/2020 9:23:17 AM
1021404	Farmers Market of Gravette	Hwy. 72 east	36.419093	-94.446383	72736	3/16/2021 7:32:56 PM
1021620	Farmers Market of Madison, IN	412 West Main Street	38.737406	-85.382985	47250	10/5/2021 5:26:39 PM
1005159	Farmers Market of the Ozarks	2144 E Republic Rd	37.136365	-93.255076	65804	7/26/2018 3:54:23 PM
1021538	Farmers Market Ogden	Historic 25th Street and Grant Avenue	41.220677	-111.973274	84401	6/23/2021 2:26:26 PM
1021581	Farmers Market on Grand Parkway	1225 W Grand Parkway S	29.761952	-95.775167	77494	7/27/2021 7:27:07 AM
1019993	Farmers Market on Green River	1099 Legion Park Road	37.244082	-85.482096	42743	7/30/2020 10:25:43 AM
1020079	Farmers Market on the Square	105 Merchant Street	37.103437	-85.307537	42728	8/17/2020 6:30:06 PM
1020080	Farmers Market on the Square	105 Merchant Street	37.103437	-85.307537	42728	8/17/2020 6:39:24 PM
1021595	Farmers Market Partners	5855 Sienna Springs Way	29.533266	-95.543858	77459	8/2/2021 2:18:32 PM
1019862	Farmers on the Square	2A N Hanover St	40.201689	-77.189254	17013	1/4/2021 1:13:34 PM
1018427	Farmers' gateway Market	Eastern Gateway Community College, 4000 Sunset Boulevard	40.377613	-80.669759	43952	9/14/2020 2:06:12 PM
1016870	Farmers' Market at Hamakua Harvest	46-2600 Hawaii Belt Highway	20.070927	-155.449740	96727	5/29/2019 7:51:30 PM
1021460	Fayette County Farmers Market	101 E East St	39.53886	-83.427938	43160	5/3/2021 6:10:35 AM
1019800	Fayette County Farmers' Market	401 N Central Ave	39.641132	-85.139738	47331	3/15/2020 2:59:29 PM
1012627	Fearrington Farmers' Market	East Camden	35.800209	-79.090143	27312	7/28/2018 6:41:06 PM
1002721	Felton Farmers' Market	St. John's Church, Hwy. 9	37.048109	-122.073815	95018	8/1/2018 2:22:42 PM
1018973	Ferguson Farmers' Market	Plaza 501, 501 S. Florissant Rd.	38.7375795	-90.3027133	63135	3/1/2018 9:37:31 AM
1021676	Ferndale Farmers Market	27021 Kanis Rd	34.776925	-92.556803	72223	1/31/2022 3:40:28 PM
1021665	Fernley Poolside Farmers Market	300 Cottonwood Lane	39.594402	-119.247333	89408	1/19/2022 4:51:53 PM
1020193	Ferry Plaza Farmers Market	1 Ferry Building	37.795162	-122.393520	94111	8/27/2020 12:31:10 PM
1012308	Festival Farmers Market	942 Main Street	42.6792512	-74.4669868	12043	7/27/2018 1:07:35 PM
1019771	Fibonacci's Mount Healthy Farmers Market	1445 Compton Road	39.231610	-84.540950	45231	1/13/2021 10:11:09 AM
1018193	Fifth Street Farmers' Market	West Fifth Street	40.9509375	-83.1700053	44882	7/27/2018 8:49:58 AM
1020008	Fightingville Fresh	315 W Simcoe	30.211573	-92.031394	70501	8/2/2020 5:56:18 PM
1019677	Firefly Farmers' Market	15615 East 21st Street North	37.723203	-97.156597	67230	8/12/2019 7:26:23 PM
1004377	Fish Creek Settlement Shops Farm Market	9116 Hwy 42	45.113436	-87.245350	54212	7/30/2018 3:33:17 PM
1019914	Fisherman's Memorial Park Farmers Market	1011 Point Judith Rd	41.380339	-71.488239	02882	6/5/2020 2:12:27 PM
1019897	Fleming County Farmers’ Market	1384 Elizaville Rd	38.421407	-83.759523	41041	5/29/2020 11:55:07 AM
1020091	Floyd County Farmers Market	361 N. Lake Drive	37.670674	-82.775995	41653	8/18/2020 9:30:33 AM
1020065	Floyd County Farmers Market (Floyds Knobs)	400 Block Lafollette Station	38.315002	-85.896109	47119	8/13/2020 1:06:14 PM
1021453	Fondy Farmers Market	2200 W Fond du Lac Ave	43.061843	-87.939701	53206	4/28/2021 3:28:28 PM
1019123	Food for Thought Summer Market	200 S. David St.	42.8482536	-106.3269901	82601	6/6/2018 2:42:30 PM
1000958	Forest farmers market	15583 Forest Road	37.3643700	-79.2854430	24551	1/26/2021 8:30:18 AM
1021638	Forest Grove Farmers Market	2030 Main St	45.520653	-123.112048	97116	12/6/2021 1:06:45 PM
1021504	Forest Hills Farmers Market	1840 Ardmore Blvd	40.425019	-79.861110	15221	6/4/2021 9:14:37 AM
1002803	Forest Lakes Farmers Market	1650 Ashwood Blvd.	38.1087	-78.44106	22911	9/10/2020 6:48:35 PM
1018989	Fort Ben Farmers Market	\N	39.865956	-85.989646	\N	4/9/2018 9:53:07 PM
1021680	Fort Smith Farmer's Market	2nd and Gartison Ave	35.534732	-94.803610	72901	2/1/2022 9:38:04 AM
1018505	Fort Sumner Farmers Market	213 E Sumner Avenue	34.470848	-104.244013	88119	9/28/2018 9:57:38 AM
1019101	Fox Lake Farmers Market	17 E School St.	42.398071	-88.178510	60020	5/15/2018 5:31:46 PM
1002880	Frankenmuth Farmers Market	534 North Main Street	43.344313	-83.738212	48734	1/5/2021 3:10:42 PM
1019298	Franklin County Farmers Market	404 Wilkinson Blvd.	38.201613	-84.880210	40601	1/8/2021 7:24:07 AM
1019147	Franklin Farmers Market	Parking Lot 2 Blocks West of the Courthouse	39.479799	-86.057680	46131	6/28/2018 9:08:49 AM
1021654	Franklin Park Conservatory and Botanical Gardens Farmers' Market	1777 East Broad Street	39.965067	-82.950712	43203	1/4/2022 11:49:34 AM
1020092	Franklin Simpson Farmers' Market	304 N Main St	36.724368	-86.577261	42134	8/18/2020 9:48:09 AM
1020007	Franklin Street Bazaar	2000 W. Franklin Street	37.980191	-87.594742	47710	8/2/2020 12:41:19 PM
1021565	Frankton Town Market	102 S Church St	40.222745	-85.779261	46044	7/14/2021 2:55:15 PM
1012429	Freedom Farmers Market at the Carter Center	453 Freedom Pkwy NE	33.767590	-84.356820	30307	12/21/2018 6:32:09 PM
1018415	Freeman Health System, West - Farmers Market	1102 W 32nd Street	37.0526877	-94.5268459	64801	7/30/2018 11:44:29 AM
1021353	Freight House Farmers' Market	421 West River Drive #32	41.519748	-90.582083	52801	2/12/2021 1:24:22 PM
1019600	Freiheit Village Farmers Market	2032 Central Plaza	29.717952	-98.072988	78130	7/1/2019 10:17:22 AM
1019404	Fresh Approach Mobile Farmers' Market	213 F Street, Antioch	38.016546	-121.812514	94509	2/26/2019 7:31:50 PM
1012466	Fresh2You Mobile Market	\N	39.9731925	-75.748454	\N	7/26/2018 5:07:55 PM
1018671	FRESHFARM Dupont Market	1624 20th St NW	38.911806	-77.044967	20009	8/6/2020 11:50:08 AM
1011730	Friendswood Farmers Market	1100 S Friendswood Dr.	29.520767	-95.191302	77546	9/10/2020 5:36:25 PM
1021552	Ft. Thomas Farmers Market	801 Cochran Ave	39.068220	-84.444349	41075	6/28/2021 4:36:57 PM
1019762	Ft. Wayne's Farmers Market - Summer	301 E Wayne Street	41.078388	-85.136155	46802	2/26/2020 4:34:11 PM
1019285	Ft. Wayne's Farmers Market-Winter Market	216 W Douglas Ave	41.074494	-85.140411	46802	9/27/2018 9:55:26 AM
1019998	Fulshear Farmers' Market	9035 Bois d'Arc Lane	29.690226	-95.888475	77406	1/4/2021 3:18:28 PM
1018121	Fulton County Farmers Market	\N	41.0647645	-86.2158331	46975	1/4/2021 10:04:06 AM
1019949	Fulton Stall Market - Indoor Farmers Market	91 South St.	40.706222	-74.003474	10038	7/6/2020 3:11:54 PM
1006661	Fulton Street Farmers Market	1145 East Fulton	42.9639130	-85.6404790	49503	1/25/2019 12:14:42 PM
1021590	Fuquay-Varina Growers Market	121 N Main St.	35.585512	-78.800147	27526	7/30/2021 11:32:42 AM
1021444	Galena KS Farmer's Market	210 W 7th St	37.075194	-94.635517	66739	4/12/2021 8:57:58 PM
1021730	Galena KS Farmer's Market	210 W 7th St	37.074792	-94.640914	66739	3/12/2022 11:57:39 AM
1019630	Gallatin Farmers Market	160 W Franklin St	36.388902	-86.448948	37066	7/16/2019 2:50:40 PM
1011814	Galleria @ Tyler Riverside Farmers Market	1370 Galleria @ Tyler	33.9097475	-117.4578357	92503	7/27/2018 3:11:02 PM
1018970	Garden City Farmers Market	1210 Fleming	37.9772536	-100.8532074	67846	2/27/2018 5:39:30 PM
1018831	Gardner Farmers Market	136 E Washington St	38.812999	-94.925777	66030	1/4/2021 5:48:36 PM
1019728	Garfield Park Farmers Market	2345 Pagoda Dr	39.731109	-86.141830	46225	12/20/2019 2:27:32 PM
1021662	Garfield Park Neighborhood Market - Indoor Season	135 N Kedzie Ave.	41.883908	-87.705713	60612	1/17/2022 4:18:21 PM
1020095	Garrard County Farmers Market	117 Lexington RD	37.614373	-84.583209	40444	8/18/2020 10:49:17 AM
1019587	Gas City, IN Farmers Market	1028 E Main Street	40.489812	-85.598506	46933	8/3/2020 9:01:16 PM
1021677	Gateway Farmers Market	602 East Jefferson Ave	33.430713	-94.029739	71854	1/31/2022 3:58:54 PM
1021416	General Store Market	1327 S. 18th Street	45.402192	-91.844351	54812	3/21/2021 5:43:02 PM
1012033	Georgetown Farmers Market	122 Screven St	33.3662089	-79.2817826	29440	1/27/2021 3:37:46 PM
1019602	Get Moving Houston Farmers Market - Acres Homes	6719 W. Montgomery	29.857439	-95.422239	77091	7/2/2019 7:06:17 PM
1019603	Get Moving Houston Farmers Market - Denver Harbor	6402 Market St.	29.780472	-95.386342	77020	7/2/2019 7:05:39 PM
1019604	Get Moving Houston Farmers Market - Hiram Clarke	3810 W. Fuqua St.	29.614043	-95.433550	77045	7/2/2019 7:09:03 PM
1019605	Get Moving Houston Farmers Market - Magnolia	7037 Capitol St. 77011	29.734482	-95.300902	77011	7/2/2019 7:07:38 PM
1019606	Get Moving Houston Farmers Market - Northeast	9720 Spaulding St. 77016	29.851549	-95.304197	77016	7/2/2019 7:09:50 PM
1019607	Get Moving Houston Farmers Market - Southwest	6400 High Star Dr.	29.711246	-95.496227	77074	7/2/2019 7:08:01 PM
1019608	Get Moving Houston Farmers Market - Sunnyside	9314 Cullen St. 77051	29.656412	-95.356477	77051	7/2/2019 7:08:31 PM
1021461	Gilbert Farmers Market	222 N Ash St	33.354527	-111.790943	85234	5/4/2021 10:31:59 AM
1021284	Gilmanton Community Farmers Market Association	1385 NH Route 140	43.425347	-71.332318	03237	1/22/2021 7:16:10 AM
1008573	Gladstone Farmers' Market	602 NE 70th Street	39.2214548	-94.5730016	64118	7/26/2018 5:13:22 PM
1002767	Glen Arbor Farmers Market	6394 Western Ave.	44.897978	-85.986905	49636	2/1/2021 2:59:38 PM
1005588	GLENCOE	201  W CHASTAIN BLVD. WEST	33.9578280	-85.9347140	35905	8/3/2020 11:45:10 AM
1019710	Glens Falls Farmers Market Association	10 Sanford St	43.317546	-73.653504	12801	10/28/2019 9:21:34 AM
1019414	Glenwood Sunday Market	\N	41.837551	-87.681844	60626	1/4/2021 10:56:26 AM
1021364	Goddard Memorial State Park Farmers Market	1095 Ives Rd	41.649602	-71.444335	02818	2/24/2021 11:35:23 AM
1020050	Good Local Markets White Rock Farmers Market	9150 Garland Road	32.829956	-96.706451	75218	8/6/2020 3:57:30 PM
1019833	Goodhue Farmers Market	411 Rosie Park Way	44.403334	-92.624672	55027	1/4/2021 8:01:33 PM
1021350	Gooding Farmer's Market	Corner of 13th and Main	42.932194	-114.712524	83330	2/9/2021 2:08:16 PM
1021308	Gorgas Park Farmers' Market	6300 Ridge Avenue	40.037308	-75.221221	19128	1/26/2021 2:22:03 PM
1012253	Goshen Farmers Market	South Church and Main Street	41.401966	-74.322899	10924	7/29/2018 7:06:08 PM
1021392	Grand Prairie Farmers Market	505 S. Main St.	34.498020	-91.552370	72160	3/15/2021 4:21:19 PM
1005937	Grand Rapids Farmers' Market	11 Golf Course Road	47.221394	-93.529757	55744	7/27/2018 12:17:23 AM
1017947	Grandin Village Farmers Market	2080 Westover Ave SW	37.265053	-79.978064	24015	2/1/2021 2:02:01 PM
1021484	Grant Park Farmers Market	1040 Grant Street SE	33.725504	-84.376724	30315	5/26/2021 12:46:00 PM
1019989	Grass Roots Farmers Market	W.145th. Street between Edgecombe & Bradhurst Aves.	40.823804	-73.943475	10031	7/30/2020 1:30:11 AM
1009808	Great Falls Farmers Market, Turners Falls	Peskeomskut Park	42.606069	-72.559612	01376	1/31/2021 12:06:30 PM
1021456	Greater Washington County Food Bank Farmers' Market	909 National Pike West	40.041867	-79.977907	15417	4/29/2021 3:22:16 PM
1006059	Greater Watertown-North Country Chamber of Commerce Farm & Craft Market	317 Washington St.	43.9720956981182	-75.9112726897001	13601	7/27/2018 8:47:36 AM
1021289	Greeley Farmers Market	902 7th Ave.	40.424001	-104.689105	80631	1/25/2021 10:36:58 AM
1021319	Green City Market Lincoln Park	1817 N. Clark St	41.915854	-87.633865	60614	1/27/2021 11:20:30 AM
1021320	Green City Market West Loop	115 S. Sangamon St	41.880039	-87.650439	60607	1/27/2021 11:25:19 AM
1004849	Green Market at Piedmont Park	1071 Piedmont Ave NE	33.784257	-84.378551	30309	1/2/2019 12:41:39 PM
1006997	Green Scene Walker Community Farmer's Market	617 Michigan Avenue	47.100539	-94.584857	56484	9/11/2020 9:01:39 AM
1019805	Greenbelt Farmers Market	25 Crescent Road	39.001146	-76.877296	20770	1/25/2021 8:39:28 PM
1019132	Greene Farmers Market	42 Carmen Place	38.233858	-78.384143	22968	6/11/2018 4:00:09 PM
1018472	Gretna Farmers Market	739 Third Street	29.9165076	-90.0653599	70053	7/26/2018 4:39:21 PM
1021382	Grinnell Farmers Market	833 4th Ave	41.743189	-92.724057	50112	3/10/2021 11:36:05 AM
1021536	Grove Farm Market	4411 Kikowaena St	21.965378	-159.395575	96766	6/22/2021 2:28:19 PM
1019088	Grow Baton Rouge Farmers Market	4000 Gus Young Ave	30.4617557	-91.1491139	70802	5/6/2018 2:44:38 PM
1021247	Growing Augusta Pop-Up Market	3647 Karleen Rd	33.387808	-82.118340	30815	12/15/2020 12:35:14 PM
1018619	Guttenberg Farmers Market	400 Block of South River Park Drive	42.782433	-91.095446	52052	2/16/2021 5:38:44 PM
1005265	Halawa District Park (People's Open Market)	99-795 Iwaiwa Street	21.373292	-157.914948	96701	1/24/2019 3:51:27 PM
1001804	Halifax Market Place & Farmers Market	209 South Main Street	36.76317	-78.92836	24558	1/26/2021 1:00:38 PM
1021584	Hamilton Park Farmers Market	Hamilton Park	40.727810	-74.044847	07302	7/27/2021 10:29:39 PM
1019673	Hamilton's Historic Farmers Market	345 High Street	39.394328	-84.565522	45011	8/7/2019 6:32:08 PM
1018774	Hammond's Grandson's Produce	7165 Ramsey Street	35.1865196	-78.8531625	28310	8/3/2020 10:50:49 AM
1019738	Hampden Farmers Market	106 Western Ave.	44.745580	-68.847236	04444	1/23/2020 12:37:46 PM
1019209	Hampton Blvd Farmers Market	7400 Hampton Blvd.	36.912352	-76.305582	23505	8/3/2018 2:42:28 PM
1001597	Hampton Farmers Market	1st Street NW and 1st Ave. NW	42.742892	-93.209702	50441	7/30/2018 11:51:23 AM
1021583	Hana Farmers Market	Hana Highway	20.750751	-155.986942	96713	7/27/2021 8:40:56 PM
1006425	Hanalei Farmers' Market at Hale Halawai 'Ohana O Hanalei	55299C Kuhio Hwy	22.201731	-159.499208	96714	1/9/2021 2:05:42 PM
1019065	Hancock County Farmers' Market	200 West Main Cross	41.039589	-83.653004	45840	4/23/2018 10:54:53 AM
1019148	Hanover Market House	210 East Chestnut Street	39.803273	-76.982610	17331	6/29/2018 11:40:18 PM
1019533	HAPI Fresh Farmers' Market	647 E. Market Street	41.080456	-81.521429	44304	5/17/2019 11:01:23 AM
1019770	HAPI Fresh Farmers' Market	381 Ontario Street	41.080456	-81.521429	44310	3/2/2020 12:20:08 PM
1019154	Hardy’s Farm Market	4525 Knoll Rd	41.0359345	-85.2011808	46809	7/3/2018 2:12:38 PM
1018380	Harker Heights Farmers Market	850 West Central Texas Expressway	31.073245	-97.681611	76548	2/5/2019 10:08:46 AM
1021696	Harlingen Farmers Market	218 E Tyler Ave	26.189375	-97.694079	78550	2/8/2022 4:57:30 PM
1021555	Harrison City Market	121 E. Main Street	44.019859	-84.800573	48625	7/2/2021 7:00:30 AM
1020122	Harrison County Farmers Market - Saturday	364 Oddville Ave	38.394075	-84.286978	\N	8/20/2020 11:45:18 AM
1020125	Harrison County Farmers Market - Wednesday	111 S Main St	38.390005	-84.297879	\N	8/20/2020 11:55:03 AM
1020107	Hart County Farmers Market	Main Street	37.271492	-85.889578	42765	8/19/2020 9:28:47 AM
1011782	Hartford Farmers Market	1001 N Oaks Ave	43.632679	-96.947438	57033	7/26/2018 6:04:52 PM
1019383	Harvest Home 125th Street Market	W. 125th Street & Adam Clayton Powell Blvd	40.808707	-73.947702	\N	2/5/2019 10:44:29 AM
1019373	Harvest Home Brower Park Market	Brooklyn Avenue & Prospect Place	40.674043	-73.944530	\N	2/5/2019 9:49:19 AM
1019374	Harvest Home Clinton Hill Market	Lafayette btwn Waverly & Washington	40.688145	-73.966310	\N	2/5/2019 9:49:55 AM
1019366	Harvest Home Co-Op City Market	Asch Loop & Aldrich Street	40.870274	-73.831007	\N	1/30/2019 4:26:10 PM
1019375	Harvest Home Coney Island Hospital Market	Ocean Pkwy btwn Shore Pkwy & Avenue Z	40.585510	-73.966129	\N	2/5/2019 9:48:14 AM
1019380	Harvest Home East Harlem Market	E. 104th Street & 3rd Avenue	40.790266	-73.945625	\N	2/5/2019 10:24:52 AM
1019381	Harvest Home Harlem Hospital Market	Lenox Avenue btwn W. 136th & W. 138th Street	40.814968	-73.940100	\N	2/5/2019 10:38:46 AM
1019377	Harvest Home Hunts Point Market	E. 163rd btwn Southern & Bruckner Boulevards	40.820779	-73.890698	\N	2/5/2019 10:02:03 AM
1019378	Harvest Home Jacobi Hospital Market	1400 Pelham Parkway	40.857347	-73.846979	\N	2/5/2019 10:03:55 AM
1019376	Harvest Home Kings County Hospital Market	Clarkson Avenue btwn E. 37th & E. 39th Street	40.655889	-73.942520	\N	2/5/2019 9:59:55 AM
1019382	Harvest Home Lenox Avenue Market	Lenox Avenue btwn W. 117th & W. 118th Street	40.803029	-73.948857	\N	2/5/2019 10:42:23 AM
1002339	Harvest Home Metropolitan Hospital Market	97-99th Street and 2nd Ave.	40.785539	-73.946220	\N	1/30/2019 4:14:34 PM
1002335	Harvest Home Mt. Eden Market	Mt. Eden Pkwy & Morris Avenue	40.842700	-73.909517	\N	1/30/2019 4:18:05 PM
1005332	Harvest Home North Central Bronx Market	E. Mosholu Pkwy N. & Jerome Avenue	40.880479	-73.883864	\N	1/30/2019 4:22:25 PM
1019379	Harvest Home St. Mary's Park Market	E. 149th Street & Eagle Avenue	40.813850	-73.911898	\N	2/5/2019 10:23:11 AM
1002345	Harvest Home West Harlem Market	Broadway btwn W. 138th & W. 139th St	40.822369	-73.953193	\N	1/30/2019 12:51:26 PM
1009660	Hawaii Kai Park n Ride (People's Open Market)	300 Keahole Street	21.283943	-157.713935	\N	3/25/2019 10:07:35 AM
1018282	Haymaker Farmers' Market	Franklin Avenue & Summit Street	41.150692	-81.360033	44240	1/5/2021 3:04:15 PM
1020044	Haymaker Farmers' Market	1435 E Main St,	41.155218	-81.337712	44240	1/5/2021 3:05:39 PM
1021431	Healthway Park Farmers Market	4055 South Roy Wilson Way	39.726276	-85.917230	46163	3/25/2021 6:44:36 PM
1021671	Healthy New Albany Farmers Market	200 Market Square	40.083073	-82.798908	43054	1/26/2022 12:59:54 PM
1021672	Healthy New Albany Indoor Farmers Market	150 W Main St	40.083073	-82.798908	43054	1/26/2022 1:03:53 PM
1021211	Heathsville Farmers Market	73 Monument Place	37.916391	-76.473204	22473	9/12/2020 8:10:39 PM
1019786	Heber Market on Main	250 South Main	40.329639	-111.167763	84032	3/5/2020 5:22:40 PM
1019757	Helen Albert Certified Farmers' Market	1200 N. Vista St.	34.094113	-118.351434	90046	1/6/2021 5:43:07 PM
1019192	Henderson County Tailgate Market	100 North King Street	35.314825	-82.458271	28739	7/27/2018 9:12:52 AM
1019895	Henderson Farmers Market	\N	40.778922	-97.811491	\N	7/23/2020 12:40:05 PM
1021286	Hendricks Farmers Market	Main Street	44.508647	-96.426422	56136	1/25/2021 10:10:26 AM
1019802	Hereford Farm Market	17004 York Rd	39.4668834	-76.644722	\N	3/19/2020 5:42:28 PM
1021282	Heritage Acres Drive-thru Market	507 W B St,	40.199476	-100.631876	69001	1/21/2021 11:10:04 AM
1020174	Heritage Farmers' Market	1313 N. Mill St.	37.135019	-84.096167	40741	8/22/2020 3:13:35 PM
1003684	Heritage Harvest Certified Farmers Market @Victoria	12505 N Main St   91739	34.110872	-117.532318	91739	8/2/2018 2:18:02 AM
1019234	Heritage Market	418 Main Street	34.1324115	-109.2816730	85938	8/13/2018 8:18:23 PM
1006285	Hernando Farmers Market	2535 Highway 51 South	34.823026	-89.994281	38632	1/4/2021 9:57:37 AM
1019486	Herndon Farmers Market	768 Lynn Street	38.970411	-77.387108	20170	4/25/2019 1:09:59 PM
1021355	Herriman Farmers Market	5355 W. Herriman Main St.	40.515537	-112.015037	84096	2/17/2021 1:44:54 PM
1020026	Hickory Point UMC Produce Market	2001 Lock B Road North	36.433597	-87.248620	37043	8/3/2020 5:30:06 PM
1019224	High Desert Farmers Market	18422 Bear Valley RD	34.473755	-117.257633	92395	8/8/2018 4:53:54 PM
1019220	High Point Farmers Market	901 N Main Street	35.966162	-80.012645	27262	8/7/2018 12:07:16 PM
1012260	High Springs Farmers Market	115 NE Railroad Avenue	29.8255090	-82.5962570	32643	12/31/2018 11:51:00 AM
1006831	Highland Farmers' Market	61 Highland Center Drive	38.409646	-79.586195	24465	8/8/2018 5:30:39 PM
1021327	Highlands Ranch Farmers Market	Highlands Ranch Pkwy and Dorchester Rd	39.547023	-104.999685	80129	1/29/2021 9:55:46 AM
1018951	Highway 7 Market	1118 1st Ave	42.5171234	-94.5353089	50563	2/17/2018 2:09:46 PM
1019688	Hillsboro Farmers Market	5137 Glade Chapel Road	38.232278	-90.566655	63050	9/2/2019 2:26:35 PM
1019959	Hillsboro Farmers' Markets - Downtown Hillsboro	1st Ave and NW Lincoln St	45.524375	-122.990366	97124	7/15/2020 6:04:32 PM
1019962	Hillsboro Farmers' Markets - Orenco Station	6125 NE Cornell Rd	45.534675	-122.917552	97124	7/15/2020 6:15:07 PM
1021249	Hillsdale Farmers' Market	1405 SW Vermont St	45.477581	-122.692801	97219	12/18/2020 7:07:06 PM
1019669	Hinesville Farmers Market	S Commerce St, Hinesville, GA 31313	31.846772	-81.595690	31313	8/5/2019 12:01:25 PM
1008020	Hingham Farmers Market, Inc.	96 Otis Street	42.247351	-70.888967	02043	7/26/2018 4:09:33 PM
1005076	Hinsdale Farmers Market	30 E. Chicago Ave.	41.8036543	-87.9286940	60521	1/7/2021 11:10:46 AM
1019330	Historic Downtown Farmers Market	121 Orange Street	34.504886	-93.050943	71901	1/4/2021 10:41:53 AM
1021208	Historic Downtown Jersey City Farmers Market	Grove PATH Plaza	40.719659	-74.042428	\N	9/11/2020 5:17:22 PM
1010937	Historic Farmers Market of Lapeer LLC	272 N. Court St.	43.053482	-83.309076	48446	3/25/2021 10:06:55 PM
1021533	Historic Lafayette Farmers Market	5th Street, between Ferry and Columbia	40.418803	-86.891858	47901	6/22/2021 12:59:17 PM
1021509	Historic Lewes Farmers Market	\N	\N	\N	\N	6/9/2021 10:53:09 AM
1021511	Historic Lewes Farmers Market	36707 Crooked Hammock Way	38.746394	-75.150657	19958	6/9/2021 11:16:05 AM
1021512	Historic Lewes Farmers Market	Savannah Rd. and Sussex Ave.	38.767703	-75.147417	19958	6/9/2021 11:25:36 AM
1021516	Historic Lewes Farmers Market	Dupont and Johnson Avenues	38.772404	-75.147503	19958	6/10/2021 8:41:45 AM
1011761	Historic Marion Tailgate Market	67 West Henderson Street	35.6824650	-82.0088150	28752	7/27/2018 11:23:31 AM
1018972	Historic Newburgh Farmers Market	1 E Water St	37.944042	-87.405321	47630	2/28/2018 5:02:18 PM
1008980	Holden MO Farmer's Market	101 S Market St.	38.7186566	-93.9908869	64040	8/16/2018 10:19:22 AM
1021547	Hollidaysburg Farmers Market	Montgomery and Allegheny Street (near the Diamond)	40.429065	-78.394591	16648	6/25/2021 12:00:08 PM
1019302	Holly Farmers Market	Crapo Park	42.790600	-83.625343	48442	10/9/2018 11:21:04 AM
1018853	Holly Springs Farmers Market	300 West Ballentine Street	35.650573	-78.836190	27540	1/6/2021 1:12:45 PM
1021229	Hollywood Farmers' Market	1600 Ivar Ave	34.099639	-118.328191	90028	9/21/2020 5:35:34 PM
1018458	Home Grown Farm Market	21078 Three Notch Road	38.247929	-76.420927	20653	7/30/2018 7:52:40 AM
1007267	Homer Farmers Market	Ocean Drive	59.638109	-151.512342	99603	1/4/2021 1:41:23 PM
1009663	Homewood Farmers Market	Martin Ave and Chestnut Rd	41.562264	-87.666231	60430	9/10/2020 6:22:52 PM
1012076	Hood River Farmers Market	5th Street & Columbia Street	45.710094	-121.515814	\N	8/3/2020 1:29:11 PM
1019819	Hoodland Farmers Market	67212 E. HWY 26	45.349594	-121.960918	97067	3/30/2020 2:35:21 PM
1021705	Hope & Main's Schoolyard Market	691 Main Street	41.725289	-71.281930	02885	2/16/2022 4:13:25 PM
1021711	Hope Street Farmers Market	1015 Hope St	41.799956	-71.356584	02906	2/18/2022 4:48:17 PM
1012041	Hopkins Farmers Winter Market	33 14th Avenue North	44.925619	-93.417104	55343	7/27/2018 1:56:21 AM
1020100	Hopkinsville-Christian County Downtown Farmers Market	110 W 9th Street	36.866111	-87.489438	42240	8/18/2020 1:06:43 PM
1008366	Hopkinton Farmers Market	Main Street and Ash Street	42.229299	-71.517770	01748	1/25/2021 5:25:09 PM
1019313	Hot Springs Farmers Market	c/o Rajni Lerman	43.432276	-103.479082	57747	10/29/2018 10:12:10 PM
1018200	Hub City Farmers' Market	498 Howard St.	34.9562450	-81.9424130	29303	1/9/2019 12:41:26 PM
1005674	Hudson Farmers Market	Corner of Columbia and Sixth Streets	42.2486560	-73.7836920	12534	12/26/2018 11:16:53 AM
1018152	Huguenot-Robious Farmers Market	2051 Huguenot Road	37.5195160	-77.6103980	23236	8/1/2020 12:13:25 PM
1019990	Huguenot-Robious Farmers Market @ The Great Big Greenhouse	2051 Huguenot Road	37.519378	-77.610901	23235	7/30/2020 2:56:51 PM
1021610	Humpday Farmers Market	1237 E Main St	37.730073	-89.193194	62901	8/31/2021 12:50:49 PM
1021612	Humpday Farmers Market	2421 W Main St	37.731906	-89.247353	62901	8/31/2021 12:50:18 PM
1019056	Hunterdon Land Trust Farmers Market	111 Mine Street	40.505223	-74.871267	08822	1/27/2021 11:12:32 AM
1010598	Huntingdon Farmers' Market	842 Penn Street	40.485653	-78.017230	16652	1/26/2021 10:44:45 AM
1021268	Huntley Farmers Market	11712 Coral Street	42.168577	-88.424435	60142	1/11/2021 4:16:02 PM
1019586	Hutto Farmers Market	208 East Street	30.545152	-97.548336	78634	6/14/2019 4:36:59 PM
1021635	Hwy 80 Produce	903 E. US Hwy 80	32.528217	-94.893800	75693	12/2/2021 7:48:36 PM
1011325	Hyattsville Farmers Market	4310 Gallatin Street	38.952822	-76.941854	20781	1/28/2019 2:02:26 PM
1021703	Hyde Park Farmers' Market	2700 Erie Avenue	39.139569	-84.442416	45208	2/15/2022 12:09:15 PM
1012621	Ida Area Farmers' Market	2nd Street	42.345173	-95.470874	51445	1/4/2021 8:30:49 PM
1006417	Idaho Falls Farmers' Market	A - D St. Memorial Drive	43.494592	-112.042508	83402	1/4/2021 11:07:19 PM
1005080	Imlay City Farmers Market	120 N Main	43.024290	-83.074322	48444	2/8/2021 1:23:39 PM
1020136	Imogene Stout Market on Main	139 North Main Street	37.334578	-88.081353	42064	8/20/2020 4:08:55 PM
1019011	Independence Farmers Market	100 1st St. W	42.4687056	-91.8949732	50644	3/15/2018 2:33:07 PM
1019236	INDEPENDENCE UPTOWN MARKET	211 W. Truman Rd.	39.093845	-94.418179	64050	8/23/2018 1:53:28 PM
1018772	Indian Lake Community Farmers Market	144 JOHN RUST RD	43.782397	-74.270529	12842	1/18/2021 10:24:17 PM
1019861	Indiana County Farmers Market	8th & Church St.	40.621852	-79.155021	15701	5/14/2020 5:44:26 PM
1004384	Ionia Farmers' Market	South Steele Street and Adams Street	42.9814841	-85.0677261	48846	9/10/2020 3:58:45 PM
1012626	iowa falls farmers' market	Corner of Rocksylvania Ave. anb Stevens St.	42.521222	-93.264356	50126	8/9/2020 5:30:46 PM
1019340	Isabahlia farmers Market	410 Livoinia Ave	40.663651	-73.901875	11212	12/29/2018 8:21:05 AM
1003680	Issaquah Farmers Market	1730 10th Ave N.W.	47.550637	-122.049115	98027	7/27/2018 3:39:10 PM
1001641	Ithaca Farmers Market	Center & Pine River Street	43.292319	-84.598559	48847	1/25/2021 4:10:13 PM
1004380	Ivanhoe Farmers Market	North end of Main Street	44.465197	-96.246607	56142	7/26/2018 7:46:58 PM
1006376	Jackalope Square Farmers Market	130 S. 3rd	42.759014	-105.384457	82633	7/27/2018 12:08:04 PM
1018907	Jackson (MO) Farmers Market	252 E. Jackson Blvd.	37.3778137	-89.6659726	63755	1/11/2018 6:30:29 PM
1018343	Jackson County Farmers Market	Diploma Drive	44.291599	-90.862319	54615	7/26/2018 3:58:09 PM
1020106	Jackson County Farmers Market	1296South Main St.	37.430289	-83.988324	40447	8/19/2020 10:00:51 AM
1020108	Jackson County Farmers Market	3034 Welchburg Rd.	37.330559	-83.922703	40486	8/19/2020 10:20:14 AM
1019263	Jackson County Farmers Market - Outdoor Market	110 Railroad Avenue	35.375375	-83.218394	28779	9/19/2018 12:59:05 PM
1018978	Jackson County Winter Farmers Market	23 Central Street	35.375581	-83.224149	28779	3/2/2018 11:16:22 AM
1021281	Jackson Food & Farm Market	2708 Sherman Rd	43.309792	-88.171891	53037	1/20/2021 11:40:09 AM
1009970	Janesville Farmers Market, Inc.	Town Square, Downtown Janesville	42.681669	-89.023298	53545	1/28/2021 10:59:16 PM
1008299	Jasper Farmers Market	Park and Ride, Stegall Drive	34.4674700	-84.4343796	30143	7/26/2018 4:10:14 PM
1021306	Jefferson Farmers' Market	925 Chestnut Street	39.949940	-75.156213	19107	1/26/2021 2:01:22 PM
1020192	Jeffersontown Farmers Market	10434 watterson trail	38.195210	-85.562797	40299	8/26/2020 12:20:46 PM
1020090	Johnson County Farmers Market	826 F. M. Stafford Ave.	37.812048	-82.8042	41240	8/18/2020 9:23:52 AM
1002907	Joshua Tree Certified Farmers Market	61651 Twentynine Palms Highway	34.1349431	-116.3182535	92252	7/26/2018 7:25:49 PM
1018242	Juneau Farmers Market and Local Food Festival	350 Whittier	58.2998500	-134.4136031	99801	7/26/2018 4:09:45 PM
1005270	Kailua Distirct Park (People's Open Market)	21 South Kainalu Drive	21.395631	-157.737337	96734	3/20/2019 4:43:44 PM
1008375	Kaiser Permanente Fresno Farmers Market	7300 N. Fresno Street	36.843017	-119.781524	93720	7/30/2018 7:40:53 PM
1019774	Kalamazoo Farmers Market	1204 Bank Street	42.275163	-85.588501	49001	3/3/2020 11:41:45 AM
1005252	Kalihi Valley District Park (People's Open Market)	1911 Kam IV Road	21.344726	-157.869800	96819	1/24/2019 3:42:15 PM
1008118	Kamehameha Community Park (People's Open Market)	1400 Kalihi Street	21.335165	-157.872454	96822	3/20/2019 4:40:56 PM
1021264	Kamuela Farmers Market	67-139 Pukalani Road	20.017794	-155.662660	96727	1/10/2021 8:39:49 PM
1005253	Kaneohe District Park (People's Open Market)	45-660 Keaahala Road	21.409789	-157.810103	96788	1/28/2019 6:15:27 PM
1005254	Kapolei Community Park (People's Open Market)	91-1049 Kamaaha Loop	21.333263	-158.066932	96707	1/24/2019 3:27:36 PM
1005255	Kaumualii Street (People's Open Market)	700 Kalihi Street	21.327407	-157.877976	96819	3/20/2019 4:39:03 PM
1021748	Kayleen Weister	5000 W National Ave	43.020291	-87.976663	\N	4/5/2022 3:12:01 PM
1019003	Keller Farmers Market	400 Bear Creek Parkway	32.926757	-97.243807	76248	3/12/2018 11:58:39 PM
1021369	Kenosha Public Market	Outdoor Summer Market 625 52nd Street- Indoor Winter Market 625 57th Street	42.587189	-87.819902	53140	2/26/2021 9:46:01 PM
1021743	Kenosha Public Market - Summer Outdoor	625 52nd Street	42.587252	-87.820653	53140	3/31/2022 12:32:05 PM
1021349	Kenosha Public Market - Winter Indoor	625 57th Street	42.584009	-87.819183	53140	2/9/2021 1:05:55 PM
1020011	Kensington Farmers Market	Kensington train station parking lot	39.026476	-77.073728	20895	8/3/2020 11:30:00 AM
1021742	Kentwood Farmers Market	4900 Breton Rd SE	42.874394	-85.595648	49512	3/30/2022 2:09:42 PM
1021567	Kershaw County Farmers Market	906 Broad Street	34.243195	-80.606634	29020	7/17/2021 12:45:49 PM
1010636	King Farmers' Market	105 Moore Road	36.276367	-80.341178	27021	1/17/2021 1:14:39 PM
1019120	King George Farmers Market	King George Middle School at 8246 Dahlgren Rd	38.276780	-77.202800	22485	7/16/2020 10:04:35 AM
1003269	Kingston Farmers' Market	Wall Street - Uptown Kingston	41.932986	-74.019483	12402	1/2/2019 12:28:30 PM
1019491	Kingstowne	5870 Kingstowne Towne Center	38.8347926	-77.276198	22315	4/25/2019 2:16:52 PM
1020032	Kingwood Farmers Market	2814 Town Center Circle	30.047327	-95.184629	77339	8/4/2020 3:11:52 PM
1019266	Kirksville Kiwanis Farmers' Market	100 North Elson Street	40.195114	-92.584293	63501	9/20/2018 10:36:46 AM
1019212	Kirtland Growers Market	47 Road 6500	36.7507894	-108.3605187	87417	8/5/2018 8:25:27 AM
1011117	Kittery Community Market	10 Shapleigh Road	43.090021	-70.736542	03904	1/25/2021 7:41:28 PM
1021332	Knox County Farmers Market	107 N 4th St	40.167824	-92.172403	63537	2/2/2021 5:25:50 PM
1020075	Knox County Farmers' Market	34 Bond Hill Rd	36.849364	-83.867633	40906	8/17/2020 5:37:21 PM
1021633	Koreshan State Park Farmers Market	3800 Corkscrew Road	26.433896	-81.815322	33928	11/25/2021 6:57:36 AM
1021244	KSQ Farmers Market	401 Birch St	39.842787	-75.705331	19348	11/19/2020 12:18:50 AM
1021250	L. A Mercado Agricola	\N	18.431395	-66.011273	00979	12/24/2020 10:07:39 AM
1021345	La Cienega Farmers Market	1835 La Cienega Blvd	34.044973	-118.379830	90035	2/7/2021 11:04:49 AM
1003343	La Familia Verde Farmers Market	East Tremont Ave. between Lafontaine Ave& Arthue Ave	40.846468	-73.893737	10460	1/2/2019 12:54:29 PM
1019986	La Familia Verde Market	Tremont Ave between Arthur Ave & LaFontaine Ave	40.849357	-73.891978	10457	7/29/2020 7:56:18 PM
1020123	La Grange Farmers' Market & Artisans	100 East Main Street	38.407465	-85.379458	40031	2/9/2021 12:54:27 PM
1019506	La Plata Farmers Market - Saturday	209 Washington Ave	38.531647	-76.978699	20646	5/7/2019 4:02:37 PM
1019649	Lachat Farmers Market	106 Godfrey Road West	41.235769	-73.385668	06883	7/30/2019 1:19:59 PM
1019409	Lafayette County Farmers Market	224 E. First Street	33.355445	-93.577673	71845	3/2/2019 9:45:34 AM
1019103	Lake Barrington Farmer's Market	28214 West Northwest Highway	42.180694	-88.183818	60010	5/16/2018 12:16:39 PM
1003863	Lake Oswego Farmers' Market	Millennium Plaza Park, 200 First Street	45.417855	-122.664774	97034	1/21/2021 5:15:52 PM
1012206	Lake Placid Farmers' Market	281 Station Street	44.2770413	-73.9841054	12946	8/14/2018 10:37:23 AM
1019850	Lakes Area Growers Market	1001 Kingwood ST	46.358912	-94.193437	56401	4/30/2020 1:55:29 PM
1019851	Lakes Area Growers Market	7915 MN-210	46.352551	-94.235284	56425	4/30/2020 2:19:17 PM
1019198	Lakeside Farmers Market - Saturday - year round	6110 Lakeside Avenue	37.6145155	-77.4710931	23228	7/31/2018 9:06:06 AM
1002021	Lakeside Farmers' Market	1606 lakeside ave.	37.614945	-77.470522	23228	7/26/2018 3:48:25 PM
1002521	Lakewood Earth and Food (LEAF) Community Farmers' Market	15425 Detroit	41.4845390	-81.8042660	44107	2/11/2021 8:38:27 AM
1019427	Lakewood NY Farmers' and Artisans' Market	Chautauqua Ave	42.103565	-79.326095	14750	3/11/2019 8:14:02 PM
1020051	Lakewood Village Farmers Market	6434 E Mockingbird Lane	32.835725	-96.751083	75218	8/6/2020 4:01:08 PM
1019035	Lamoni Farmer's Market	610  E. Main St  or Corner of Main St & South Linden St	40.623530	-93.933204	50140	4/2/2018 4:48:37 PM
1021683	Lanark Farmers Market	101 N Broad St	42.102271	-89.832636	61046	2/1/2022 2:11:14 PM
1019852	Lancaster Farmers Market	West Chestnut Street	39.712631	-82.603853	43130	2/11/2021 4:55:39 PM
1019352	Landon's Greenhouse Farmers Market	505 College Meadows Drive	44.760524	-106.948321	82801	3/8/2021 6:16:30 PM
1005352	Lane County Farmers Holiday Market	Lane Event Center (Fairgrounds)	44.056748	-123.116207	97401	6/5/2019 11:17:39 AM
1009803	Lane County Farmers Market	8th Ave & Oak St.	44.050826	-123.091540	97401	6/5/2019 11:18:25 AM
1019756	Lansdale Farmers' Market	400 Penn Street	40.234201	-75.277496	19446	1/21/2021 7:08:39 PM
1021291	Larimer County Farmers' Market	200 W. Oak St.	40.586073	-105.080197	80521	1/25/2021 11:11:14 AM
1021661	Latah Farmers Market	State Highway 8	46.736826	-116.775987	83871	1/17/2022 11:15:45 AM
1012344	Latham Farmers Market	109 Weatherly Road	34.647522	-86.564530	35803	1/6/2019 9:44:32 PM
1019030	Laurel Farmers Market	\N	31.692522	-89.130033	39440	3/28/2018 2:27:59 PM
1018834	Lawrence Farmers Market	\N	42.219637	-86.048868	49064	9/11/2020 5:28:18 PM
1021324	Lawrence Farmers' Market - Saturday Downtown Market	824 New Hampshire Street	38.968590	-95.234480	66044	1/27/2021 9:59:53 PM
1021325	Lawrence Farmers' Market - Tuesday Market	1140 Massachusetts Street	38.963018	-95.235986	66044	1/27/2021 10:07:56 PM
1019450	Lawrenceville Farmers Market	250 40th Street	40.467011	-79.961092	15201	4/3/2019 3:44:32 PM
1021647	LEAF Food Hub	9535 US Hwy 51 N, Cobden, IL 62920	37.533392	-89.254353	62920	12/14/2021 3:55:57 PM
1016810	Lebanon City Market	309 S Lebanon St.	40.0456714	-86.4690470	46052	8/2/2018 3:17:01 PM
1018113	Lebanon Farmers Market	579 Exeter Road	41.635781	-72.212877	06249	1/26/2021 9:05:30 AM
1019158	Legacy Farmers Market	18402 US Highway 281 N	29.609419	-98.465436	78259	7/6/2018 5:09:54 PM
1006652	Legion Park Farmers Market	6601 Biscayne Blvd	25.836451	-80.183684	33138	12/28/2020 1:19:10 PM
1002768	Leland Farmers Market	River Street	45.022857	-85.759459	49654	2/1/2021 2:57:48 PM
1019512	Lenexa Farmers Market	17201 W. 87th St. Pkwy	38.965267	-94.803914	66219	5/7/2019 11:52:36 AM
1010483	Lenoir County Farmers Market	100N. Herritage Street	35.260631	-77.584119	02804	7/31/2018 12:21:56 PM
1016916	Lettuce Eat Well Farmers' Market	4040 Harrison Ave	39.1587027	-84.6172030	45211	7/29/2018 7:52:03 PM
1004651	Lewis County General Hospitals Farmers Market	7785 North State street	43.794672	-75.500665	13367	7/27/2018 9:59:55 AM
1019503	Lewiston Area Farmers Market	170 S Fremont St	43.980991	-91.866902	55952	5/3/2019 6:02:22 AM
1019808	Lewiston Farmers Market	65 Main St.	44.096575	-70.220379	04240	3/24/2020 5:08:05 PM
1019726	Lewiston Winter Farmers Market	130 East Ave.	44.089594	-70.172185	04240	12/14/2019 8:16:10 PM
1021470	Lexington Farmers' Market	Worthen Road Practice Field	42.444009	-71.235394	02421	5/18/2021 11:22:06 AM
1019346	Lexington Small Yet Mighty Winter Farmers Market	739 Massachusetts Avenue	42.429242	-71.206748	02420	1/2/2019 2:34:08 PM
1019650	Liberty Park Market	Liberty Park, 600 East 900 South	40.744796	-111.872426	84105	7/30/2019 11:54:50 PM
1018927	Ligonier Country Market	110 Andi Lane	40.2501886	-79.2507333	15658	2/6/2018 4:27:05 PM
1021361	Lilburn Farmers Market	1400 Killian Hill Rd	33.859588	-84.081093	30047	2/21/2021 11:43:14 PM
1004848	Lincoln County Producers' Markets	360 Lincoln Street	37.61666	-114.5149	89008	7/26/2018 5:06:14 PM
1011300	Lincoln Heights Certified Farmers Market	N. Broadway & Sichel	34.073480	-118.213092	90031	8/3/2020 5:36:05 PM
1020132	Lincoln Heights Certified Farmers Market	N. Broadway & Sichel	34.073591	-118.213102	90031	8/20/2020 1:53:46 PM
1019304	Lincoln Park Farmers Market	SW Corner Fort Street & Southfield Road	42.249843	-83.177664	48146	5/13/2021 11:06:02 PM
1021198	Linda Vista Certified Farmers Market	6939 Linda Vista Rd.	32.785209	-117.170563	92111	8/31/2020 3:57:35 PM
1019167	Linton Farmers' Market	\N	39.039325	-87.149098	47441	4/23/2019 8:48:16 AM
1019678	Litchfield Hills Farm-Fresh Market	West Street and Woodruff Lane	41.743812	-73.189724	06759	8/9/2019 10:24:08 AM
1019679	Litchfield Hills Farm-Fresh Market	421 Bantam Rad	41.740678	-73.215193	06759	8/9/2019 10:31:51 AM
1019631	Little Farm Store Market	520 Lucky Road	37.118045	-92.680159	65746	7/17/2019 5:03:38 PM
1019207	Little Italy Farmers Market	331 West 18th Street	42.1155929	-80.0850810	16502	8/3/2018 1:09:47 PM
1019995	Little Italy Mercato CFM	555 W Date Street	32.723123	-117.167574	92101	7/31/2020 2:37:03 PM
1021390	Little River County Farmers Market	\N	33.661403	-94.117600	71822	3/15/2021 1:35:48 PM
1012027	Little River Farmers Market	4461 Mineola Ave	33.880648	-78.640489	29566	1/27/2021 3:31:22 PM
1019538	Livingston Farmers Market	Miles Band Shell Park	45.654254	-110.556707	59047	5/22/2019 2:33:41 PM
1018418	Livonia Wilson Barn Farmers Market	29350 W. Chicago	42.362596	-83.331995	48150	1/27/2021 12:51:52 PM
1018901	Local APX Market - Seasonal	1848 Church Street	37.353215	-78.826847	24522	1/3/2018 6:34:07 PM
1020094	Logan County Farmer's Market	255 John Paul Avenue	36.866286	-86.884185	42276	8/18/2020 10:22:32 AM
1019494	Lorton	8990 Lorton Station Blvd	38.698239	-77.216355	22079	4/25/2019 2:29:41 PM
1005431	Los Ranchos Growers' Market	City Hall, 6718 Rio Grande Blvd. NW	35.158683	-106.654919	87107	1/26/2021 5:09:13 PM
1018919	Louisiana Community Betterment Farmer's Market	Sunset Park, Georgia Street	39.441188	-91.062659	63353	1/26/2021 5:44:10 PM
1000462	Loveland Farmers Market	205 Broadway Street	39.2663880	-84.2599240	45140	1/25/2021 2:45:24 PM
1016820	Low-Line Market at Southport	3410 N Southport Ave	41.9438160	-87.6642330	60657	9/11/2020 5:33:18 PM
1021727	Lowell Area Farmers' Market	11940 Fulton St	42.930630	-85.372381	49331	3/8/2022 9:29:08 AM
1011233	Lower Valley Farmers Market	Main street	45.570355	-117.528643	97885	1/29/2021 8:49:09 AM
1018922	Lowville Farm and Craft Market	5473 Bostwick Street	43.793854	-75.491021	13367	1/31/2018 3:01:48 PM
1011800	LSI Global Greens Farmers' Market	3200 University Ave	41.599698	-93.660454	50311	8/5/2020 8:42:25 AM
1021257	Ludington Farmer's Market	\N	43.955713	-86.447744	49431	1/4/2021 9:21:23 AM
1019622	LVHMC Bluemont Farmers Market	EE Lake General Store, 33721 Snickersville Turnpike	39.110875	-77.833365	20135	7/15/2019 2:54:02 PM
1019177	LVHMC Cascades Farmers' Market	21060 Whitfield Drive	39.031603	-77.395364	20165	7/24/2018 3:16:00 PM
1019175	LVHMC Leesburg Farmers Market	101 Catoctin Circle, S. E.	39.107555	-77.565734	20175	7/24/2018 2:45:15 PM
1019176	LVHMC Loudoun Station Farmers Market	Gramercy Park Drive and Central Station Drive	39.006277	-77.489597	20147	7/24/2018 2:57:44 PM
1019940	Lynchburg Community Market	1219 Main St	37.411517	-79.140379	24504	1/5/2021 8:26:43 AM
1019435	Lynden Farmers Market	4th and Grover Street at Centennial Park	48.944087	-122.452228	98264	3/20/2019 1:32:12 PM
1011538	Mableton Farmers Market	5239 Floyd Road	33.826085	-84.575384	30126	9/11/2020 8:38:37 AM
1000481	Madison County Farmers Market	112 N. John Wayne Dr.	41.335222	-94.013604	50273	7/30/2018 12:11:27 PM
1012249	Madison Farmers Market	Highway 40 E. and 1st St.	45.0087575	-96.1754168	56256	7/31/2018 3:28:20 PM
1005201	Madison NJ Farmers Market	Central Avenue between Cook Avenue and Main Street	40.759057	-74.414532	07940	7/26/2018 4:27:38 PM
1012046	Madras Saturday Market Holiday Market	7th Street, between C and B Streets	44.638418	-121.127162	97741	6/5/2019 11:07:42 AM
1021339	Madrona Farmers Market	1126 Martin Luther King Jr Way	47.612616	-122.295751	98122	2/4/2021 4:35:52 PM
1019360	MADWest Winter Farmers' Market	55 South Gammon Road	43.066326	-89.502026	53717	1/19/2019 12:34:09 PM
1021197	Main Street DeFuniak Farmer's Market	Baldwin Avenue between 7th and 8th St.	30.720266	-86.113700	32435	8/31/2020 12:36:23 PM
1018407	Main Street Dyersburg Farmers Market	335 Clark Ave. South	36.030081	-89.389549	38024	1/5/2021 11:48:03 AM
1005528	Main Street Farmers Market	South Main at Wheeling	40.169	-80.245	15301	1/25/2021 8:04:22 PM
1006837	Main Street Farmers Market	401 Main Street	38.730544	-120.796965	95667	8/4/2020 12:47:43 AM
1011119	Main Street Farmers Market	Main Street and Highland Ave	37.6817937	-95.4504829	66720	7/30/2018 12:25:19 PM
1019706	Main Street Farmers Market	1030 Main Street	41.575170	-75.257553	18431	6/24/2021 2:48:14 PM
1021624	Main Street Saturday Market	South Public Square	35.845982	-86.392158	37130	10/26/2021 8:36:57 PM
1019752	Main Street Wadsworth Farmers Market	151 Main Street	41.028681	-81.732318	44281	1/4/2021 2:42:03 PM
1019501	MainStreet Libertyville Farmers Market	413 N Milwaukee Ave	42.287242	-87.954744	60048	1/13/2021 1:35:56 PM
1005256	Makiki District Park (People's Open Market)	1527 Keeaumoku Street	21.303939	-157.836497	96822	3/20/2019 4:45:27 PM
1019969	Manchester's Spruce Street Market	163 Spruce St.	41.781503	-72.518324	06040	7/23/2020 3:50:03 PM
1003980	Manhattan Farmers Market	South Broadway and West Main	45.856793	-111.333325	59741	7/27/2018 10:26:14 AM
1018217	Manistee Farmers Market	180 Memorial Drive	44.249273	-86.323001	49660	2/24/2019 4:09:36 PM
1018998	Manistique Farmers' Market	180 N. Maple Street	45.959984	-86.243595	49854	3/12/2018 2:05:42 PM
1005257	Manoa Valley District Park (People's Open Market)	Manoa Rd	21.314189	-157.807997	96826	1/24/2019 3:29:18 PM
1019111	Mansfield Farmers Market	703 East Broad Street	32.564588	-97.134052	76063	5/21/2018 9:58:34 AM
1010286	Manson Farmers Market	157 E Wapato Way	47.884784	-120.155979	98831	7/26/2018 4:35:56 PM
1018310	Manson Farmers Market	\N	42.527104	-94.539507	50563	1/28/2021 11:36:05 AM
1005218	Manzanita Farmers Market	36465 N Hwy 101	45.719007	-123.894248	97131	3/8/2021 3:40:30 PM
1016799	Maple Valley Farmers' Market	25719 Maple Valley Black Diamond Road	47.367729	-122.023367	98038	1/4/2021 9:38:07 AM
1003238	Marietta Square Farmers Market	65 Church St	33.953194	-84.549494	30060	7/26/2018 4:30:44 PM
1021358	Marinette Artisan & Farm Market	1607 Main Street	45.098174	-87.628231	54143	2/19/2021 12:50:29 PM
1021713	Marion Farmers Market	2200 31st St	42.044309	-91.580645	52302	2/21/2022 9:56:28 AM
1019058	Marion Ohio Market	Main and Church	40.593304	-83.122972	43302	4/18/2018 10:01:45 AM
1019482	Market 23	2620 23 ST	41.440025	-97.361665	68601	4/25/2019 11:30:20 AM
1019368	Market at the Park - Orland Park, IL	9705 W. 142nd Steet	41.631943	-87.856517	60462	1/31/2019 3:10:20 PM
1012031	Market Common Farmers Market	Deville St	33.6699343	-78.9390094	29577	1/27/2021 3:36:48 PM
1000242	Market in The Park	300 Conti	30.690350	-88.045015	36602	8/3/2020 9:33:29 AM
1019022	Market in the Park	W South Park Ave & Georgia St	44.0053166	-88.5575090	54901	3/23/2018 11:46:13 AM
1000616	Market in The Park - Lavretta Park	200 Parkway Street West	30.691614	-88.160082	36606	8/3/2020 9:39:55 AM
1019185	Market Mondays at the Arsht Center	1301 Biscayne Blvd	25.787138	-80.189855	33132	12/28/2020 1:21:16 PM
1019866	Market of Life	3510 W 15th Ave	41.595883	-87.344853	46404	5/17/2020 12:28:42 PM
1019806	Market on Main	Ford Center Plaza 6th and Main St	37.972884	-87.568349	47715	1/5/2021 7:06:03 PM
1011972	Market on Military Summer	Military Avenue and West Mason Street	44.522210	-88.064640	54303	7/27/2018 5:46:06 PM
1021341	Market on the Green	105 Norton Park Drive	39.974230	-82.875408	43213	2/5/2021 9:48:54 AM
1019876	Market on the Square (BrokenkBow)	\N	41.40541	-99.63987	\N	5/27/2020 12:44:09 PM
1019189	Market Square Farmers' Market	500 Howard Baker Jr Ave	35.965659	-83.910506	37915	1/25/2021 9:42:32 AM
1019924	Marksville Main Street Fresh Market	317 North Main Street	31.127420	-92.066002	71351	1/8/2021 1:56:10 PM
1019843	Marlette Farmers Market	3048 Main Street	43.327346	-83.080532	48453	4/17/2020 4:44:50 PM
1020190	Marshall County Farmers Market	1933 Mayfield Highway	36.842165	-88.378744	42025	8/25/2020 12:26:30 PM
1002929	Marshfield Farmer's Market	140 Main St  (Route 3A)	42.098148	-70.717317	02050	1/27/2021 12:04:49 PM
1019659	Martin County Main Street Market	Main St. and Smithwick St.	35.855219	-77.055113	27892	8/2/2019 11:24:24 PM
1018976	Maryville Farmer’s Market	1 Schiber Ct.	38.7331622	-89.9500804	62062	3/2/2018 10:18:30 AM
1011139	Maryville Farmers Market - Saturdays	Founders Square	35.756987	-83.969504	37801	1/26/2021 9:47:24 AM
1019902	Mason County Farmers Market	2114 Old Main Street	38.615073	-83.808420	41056	1/17/2021 4:32:16 PM
1001281	Mason Farmers Market	100 block East Maple at Jefferson (in street)	42.580168	-84.442600	48854	12/23/2018 9:10:00 PM
1005642	Mattapan Square  Farmers Market	882 Cummins Hwy	42.3313532	-71.076514	02126	7/26/2018 4:13:36 PM
1003199	Matthys Farm Market	57754 Crumstown Hwy	41.65516	-86.35873	46619	1/26/2021 7:58:47 AM
1019300	Mauldin Farmers Market	101 East Butler Road	34.7796468	-82.3063956	29662	10/4/2018 4:43:20 PM
1019968	Mauston Farmers' Market	220 East State Street	43.801304	-90.082332	53948	7/22/2020 10:10:56 PM
1020145	McCreary County Farmers Market	299 Wilburn Ross Hwy,	36.694321	-84.474473	42647	8/20/2020 5:51:58 PM
1019487	McCutcheon/Mount Vernon	2501 Sherwood Hall Lane	38.818343	-77.082026	22306	4/25/2019 1:17:39 PM
1020134	McKinleyville CFM	2165 Central Ave	40.944643	-124.100568	95519	8/20/2020 2:40:54 PM
1019490	McLean	1659 Chain Bridge Rd	38.943545	-77.192913	22101	4/25/2019 2:12:06 PM
1020081	Meade County Farmers Market	1041 Old Ekron Rd	37.988637	-86.166136	40108	8/17/2020 7:26:56 PM
1019634	Medford Farmers Market	2501 Mystic Valley Parkway	42.418530	-71.115435	02155	7/19/2019 3:58:46 PM
1021314	Media Farmers' Market	Edgemont Street	39.917838	-75.385551	19063	1/26/2021 2:48:10 PM
1018908	Medicine Root/Oyate Teca Farmers Market	1000 Youth Center Drive	43.424109	-102.176734	57752	1/16/2018 1:26:36 PM
1019858	Medina Square Farmers Market	39 public square, suite 305	41.134636	-81.869513	44256	1/5/2021 9:26:24 AM
1019759	Meigs County Farmers' Market	PO Box 702	39.026596	-82.034026	45769	2/14/2020 11:13:42 AM
1021209	Memphis Farmers Market	540 S. Front Street	35.132038	-90.060080	38103	1/4/2021 10:43:10 AM
1020199	Menifee County Farmers Market	62 Back Street	37.951788	-83.627830	40322	8/30/2020 2:37:43 PM
1002905	Menlo Park Farmers' Market	Chestnut & Menlo Avenues	37.450822	-122.184100	94025	1/4/2021 1:04:34 PM
1019816	Menominee Historic Downtown Farmers Market  Association	800 1st Street & 8th Avenue	45.105926	-87.603938	49858	3/28/2020 5:58:33 PM
1021357	Menominee Historic Downtown Farmers Market  Association	\N	45.107233	-87.604562	49858	2/19/2021 12:11:57 PM
1018093	Merchantville Market Off Centre	N. Centre St. & Chestnut Ave.	39.9524734	-75.0490757	08109	7/26/2018 4:18:10 PM
1019464	Meridian Main Street Market	33 E. Broadway Ave.	43.609999	-116.392301	83642	4/10/2019 7:25:55 PM
1021458	Metuchen Farmers Market	New Street and Pearl Street	40.541112	-74.363008	08840	5/1/2021 5:27:35 PM
1019137	Miami County Farmers Market	North Broadway and East 5th Street	40.755229	-86.069521	46970	6/18/2018 11:16:56 AM
1000021	Mid-Town Farmers Market	700 North Lamar Blvd.	34.373647	-89.516816	38655	7/26/2018 10:25:56 PM
1011076	Middlebury Farmers' Market	530 Exchange St	44.026734	-73.169908	05753	7/27/2018 6:20:16 AM
1020087	middletown farmer's Market	\N	38.242222	-85.543717	40243	8/18/2020 9:07:28 AM
1019683	Middletown Farmers' Market	12 S Church St	39.441867	-77.545310	21769	8/13/2019 3:43:32 PM
1019777	Midland Area Farmers Market	\N	43.609016	-84.236727	48640	1/5/2021 2:03:38 PM
1012786	Midtown Farmers Market	6655 Delmar Blvd, Back Lot	38.656378	-90.307251	63130	7/26/2018 3:40:29 PM
1005633	Miles City Farmers Market	500 Main St  Riverside Park	46.408215	-105.840096	\N	9/10/2020 7:20:42 PM
1006681	MILFORD - DOWNTOWN FARMERS’ MARKET	108 West Main Street (Wasson Field)	41.226598	-73.062096	06460	9/10/2020 5:36:52 PM
1009658	Mililani District Park (People's Open Market)	94-1150 Lanikuhana Ave.	21.440682	-158.018299	96789	1/24/2019 3:43:44 PM
1020034	Milk Lady Derwood Fall 2020 Pickup/Delivery	16501 Redland Road	39.126727	-77.150329	20855	8/4/2020 3:29:52 PM
1020035	Milk Lady Derwood Farmers Market	16501 Redland Road	39.126885	-77.150144	20855	8/4/2020 3:41:04 PM
1020038	Milk Lady Shady Grove Farmers Market	9601 Medical Center Drive	39.104422	-77.199488	20850	8/4/2020 9:11:28 PM
1012523	Mill City Farmers Market, Inc.	704 South 2nd Street	44.978211	-93.256278	55401	7/26/2018 3:52:19 PM
1010485	Millen Produce Market	Cotton Avenue	32.802685	-81.936127	30442	1/26/2021 10:17:13 AM
1018486	Milton Farmers' Market	6 Village Center Boulevard	38.769132	-75.310511	19968	7/27/2018 12:12:44 PM
1021454	Milwaukee Winter Farmers Market	524 S Layton Blvd	43.025865	-87.944924	53215	4/28/2021 3:40:20 PM
1019239	Mineola Main Street Farmers Market	115 E. Front St.	32.662165	-95.489641	75773	8/27/2018 4:06:21 PM
1019716	Minnetrista Farmers Market	1200 North Minnetrista Pkwy	40.198978	-85.393346	47303	11/15/2019 10:58:28 AM
1006069	Minturn Market	Historic Downtown Minturn	39.58839	-106.4315	81645	1/19/2021 3:31:17 PM
1020195	Mission Community Market	84 Bartlett Street	37.755373	-122.419881	94111	8/27/2020 12:41:12 PM
1016862	Mission Farm and Flower Market	5635 Johnson Drive	39.0219446	-94.6512054	66202	2/22/2018 12:02:56 PM
1021493	Mission Marquee Plaza Farmers' Market	3100 Roosevelt Ave	29.472403	-98.525142	78214	6/1/2021 10:53:06 AM
1018939	Missoula Farmers' Market	Circle Square (by the XXXXs)	46.874740	-113.992113	\N	2/12/2018 4:58:11 PM
1010037	MLK Campus Farmers' Market	1670 E 120th St	33.923533	-118.243583	90059	7/30/2018 1:25:34 PM
1001104	Monday Farmers Market at your library	1515 SW 10th Avenue	39.049968	-95.696240	66604	7/27/2018 10:17:54 AM
1006547	Monroe County Farmer's Market	20 E. Willow St.	41.91965	-83.39378	48162	1/25/2021 5:11:32 PM
1012314	Monroe Farmers Market	10th St and 16th Ave	42.601889	-89.639224	53566	1/25/2021 4:03:11 PM
1019844	Montavilla Farmers Market	7700 Block of SE Stark Street	45.519002	-122.584311	97215	4/21/2020 3:14:02 AM
1020166	Montclair Village Farmers' Market	6131 La Salle Ave, Oakland, CA 94611	37.826522	-122.209928	94611	8/21/2020 2:04:34 PM
1004297	MONTEVALLO FARMERS MARKET	Middle Street and Island Street	33.099480	-86.862926	35115	8/4/2020 10:26:48 AM
1020085	Montgomery County Farmers' Market	153 South Maysville Street	38.054333	-83.941302	40353	8/18/2020 8:42:23 AM
1021377	Monticello Market on the Square	119 W. Washington St.	33.304642	-83.683495	31064	3/5/2021 11:29:18 AM
1011901	Montour Falls Farmers Market	300 West Main Street	42.346431	-76.847748	14865	8/8/2018 9:44:15 AM
1019507	Montrose Farmers Market - Summer	S. Uncompahgre and S. 1st Street	38.479423	-107.874269	81401	5/5/2019 9:17:25 AM
1021430	Moonlight Market	11110 Johnson Drive	39.017779	-94.805322	66203	3/25/2021 4:59:44 PM
1019480	Moreland Farmers Market	1400 SE Bybee Blvd	45.473940	-122.651387	97202	4/20/2019 11:08:40 AM
1018573	Morgan County Farmers Market	Intersection Main and Kennebec	39.648855	-81.853276	43756	7/30/2018 10:02:36 AM
1018314	Morgan County Farmers' Market Association	Main St. & Indiana St.	39.423392	-86.428695	46151	12/28/2020 6:20:26 PM
1018317	Morgan County Farmers' Market Association	Monroe & Main St.	39.6128060	-86.3796098	46158	12/28/2020 6:14:05 PM
1021252	Morgan County Winter Farmers' Market Association	240 E Washington St.	39.422141	-86.420904	46151	12/28/2020 6:37:07 PM
1012560	Morganton Farmer's Market	111 North Green Street	35.7466269	-81.6884880	28655	9/11/2020 8:14:50 AM
1021656	Morningside Farmers Market	1411 N. Morningside Drive NE	33.793194	-84.356113	30306	1/10/2022 2:30:15 PM
1021467	Morris County Winter Farmers' Market	6 Normandy Heights Rd	40.796595	-74.448694	07960	5/13/2021 9:51:49 AM
1020162	Morro Bay Main Street Farmers Market	Main St. and Morro Bay Blvd.	35.365976	-120.849956	93442	8/21/2020 1:04:43 PM
1018926	Moscow Farmers Market	400 South Main, Moscow, Idaho 83843	46.7317086	-117.0014061	83843	2/6/2018 3:15:51 PM
1005559	Mosinee Farm Market	1101 Main Street	44.797421	-89.708626	54455	9/10/2020 4:01:18 PM
1005499	Mount Carroll Farmers Market	116 E Market Street	42.101295	-89.978008	61053	1/26/2021 5:33:00 PM
1018991	Mount Hope Farmers Market	250 Metacom Ave	41.6694780	-71.2568820	02809	3/9/2018 2:29:20 PM
1004717	Mount Pleasant Farmers Market	645 Coleman Boulevard	32.790718	-79.873400	29464	1/25/2021 5:02:45 PM
1018995	Mount Pleasant Farmers' Market	3200 Mt. Pleasant St NW	38.931518	-77.038675	20010	1/4/2021 10:36:05 AM
1000585	Mountain Fresh Oakland Farmers Market	5 Town Park Lane	39.408747	-79.409554	21550	1/25/2021 4:53:15 PM
1021307	Mt Airy Farmers' Market	601 Carpenter Lane	40.046156	-75.196253	19119	1/26/2021 2:08:50 PM
1021288	Mt. Pleasant Farmers' Market - Broadway Street	Broadway Street between Main & University Streets	43.604433	-84.776052	48858	1/25/2021 10:26:01 AM
1021287	Mt. Pleasant Farmers' Market - Island Park	331 N. Main Street	43.607074	-84.780178	48858	1/25/2021 10:18:14 AM
1021571	Mt.Washington Farmer's Market	320 N.Bardstown rd	37.9700281	-85.695776	40047	7/20/2021 4:38:20 PM
1010316	Mulberry Market	1155 College Street	32.833797	-83.646551	31201	1/26/2021 2:15:35 PM
1012725	Muldoon Farmers Market	1301 Muldoon Road	61.2089910	-149.7311890	99504	2/1/2021 11:34:22 PM
1018924	Muncie Makers Market	Outside at Books & Brews, 2100 West White River Boulevard	40.1883942	-85.4106750	47303	1/4/2021 12:40:15 PM
1018931	Munising Farmers' and Artisans' Market	Veteran's Drive	46.412557	-86.653401	49862	2/7/2018 2:27:55 PM
1019857	Murrysville Farmers' Market	3235 Sardis Road	40.430121	-79.696788	15668	1/4/2021 5:08:44 PM
1018903	My Matanuska Marketplace	610 S Valley Way	61.599930	-149.113628	99645	1/4/2018 6:22:00 PM
1019682	Myersville Farmers Market	301 Main Street	39.505519	-77.565240	21773	8/13/2019 3:37:03 PM
1011535	Napa Downtown Farmers Market	1100 West Street	38.301189	-122.285131	94559	8/5/2020 3:48:30 PM
1020055	Narrowsburg Farmers' Market	7 Erie Avenue	41.596136	-75.05512	12764	8/11/2020 1:40:58 PM
1003081	Nash County Farmers Market in Rocky Mount	1006 Peachtree St.	35.955256	-77.802729	27804	1/13/2021 11:13:13 AM
1020017	Natick Winter Market	Common Street	42.290237	-71.341206	01760	8/3/2020 1:10:50 PM
1021715	Navarro Farm	22155 S.104th Ave.	41.488007	-87.867562	60423	2/23/2022 10:52:07 AM
1021642	Nederland Farmers Market	80 E. Second St.	39.962418	-105.508922	80466	12/10/2021 1:56:07 PM
1018702	Needham Farmers Market	Garrity Way	42.280988	-71.236446	02492	7/26/2018 4:23:59 PM
1019737	Neosho Farmers Market	Spring & Jefferson St	36.870009	-94.370028	64850	1/20/2020 10:46:00 PM
1021634	Netcong Community Marketplace/Farmers Market	Rt. 46 & Main Street	40.897787	-74.707004	07857	12/2/2021 11:20:15 AM
1019908	Neutaconkanut Farmers Market	675 Plainfield St	41.811800	-71.461775	02909	6/5/2020 1:17:27 PM
1019725	New Baltimore Farmers Market	On Washington Street between Main & Front Streets in Historic Downtown	42.68546	-82.737607	48047	12/13/2019 7:34:35 PM
1012739	New Bedford Farmers Market- Brooklawn Park	1997 Acushnet Ave.	41.675431	-70.923644	02745	1/7/2019 1:07:34 PM
1012738	New Bedford Farmers Market- Clasky Common Park	1119 Pleasant St.	41.644314	-70.928587	02740	1/7/2019 1:05:44 PM
1019348	New Bedford Farmers Market- Downtown/Custom House Square	466 Brock Ave	41.661303	-70.937913	02740	1/7/2019 1:10:42 PM
1012737	New Bedford Farmers Market- Indoor	101 West Rodney French Blvd	41.661303	-70.937913	02744	1/7/2019 1:04:19 PM
1021478	New Braunfels Food Bank Farmers' Market	1620 S. Seguin Ave	29.699301	-98.115109	78130	5/25/2021 3:12:11 PM
1021601	New Era Farmers Market	1820 Ray Avenue	43.559633	-86.347156	49446	8/8/2021 2:46:00 PM
1019227	New Glarus Farmers Market	1101 Hwy 69	42.809612	-89.632242	53574	1/11/2019 3:18:51 PM
1019879	New Grand Island Farmers Market	\N	40.922193	-98.357951	\N	5/27/2020 1:11:29 PM
1021632	New Harmony Farmers & Artisans Market	407 West Tavern St.	38.128990	-87.936384	47631	11/19/2021 12:54:55 PM
1020043	New Harvest Farmers' Market	4775 New Harvest Lane	36.039471	-83.883624	37918	1/25/2021 9:33:47 AM
1005939	New Haven - CitySeed Downtown Farmers Market	Church St.	41.307645	-72.924912	06510	8/2/2018 12:21:07 PM
1005991	New Highland Baptist Church Farmers Market	9200 New Ashcake Road	37.699238	-77.410676	23116	8/1/2018 9:37:27 AM
1021336	New Orleans East Hospital Farmer's Market	5620 Read Boulevard	30.030672	-89.975013	70127	2/4/2021 10:04:46 AM
1021549	Newburgh Farmers' Market	97 Broadway	41.499810	-74.011014	12550	6/28/2021 3:04:01 PM
1021708	Newcastle Farmers Market	\N	43.849469	-104.184983	82701	2/17/2022 10:58:04 AM
1012044	Newmarket Farmers Market	5 Granite St	43.0788567	-70.9380776	03875	8/16/2018 10:06:27 PM
1019240	Newport Beach Certified Farmers' Market by Farmer Mark	1 McFadden Place	33.607886	-117.928792	92663	1/10/2021 12:35:59 PM
1019294	Nicholasville Farmers Market	717 N. Main Street	37.893076	-84.56655	40356	10/1/2018 11:27:17 AM
1019883	Norfolk Farmers Market	\N	41.948007	-97.212686	\N	5/27/2020 3:49:49 PM
1010614	NORFOLK FARMERS’ MARKET	19 Maple Avenue	41.9907390	-73.1978730	06058	2/9/2021 6:45:51 PM
1021279	North Albany Farmer's Market	6980 nw hwy 20	44.636640	-123.178829	97321	1/18/2021 9:45:22 PM
1020066	North Berkeley Farmers' Market	Shattuck and Vine	37.880337	-122.269078	94702	8/13/2020 6:37:07 PM
1021518	North Branch Farmers Market	6241 Main Street	45.510887	-92.982014	55056	6/11/2021 1:45:21 PM
1021243	North Canton Farmers' Market	1447 North Main Street	40.892548	-81.409572	44720	11/12/2020 10:13:11 AM
1021434	North Canton Farmers' Market	1000 West Maple St	40.875871	-81.417769	44720	3/29/2021 6:34:44 PM
1019407	North Creek Farmers Market	River Front Park, Rail Road Place	43.702638	-73.988272	12843	3/1/2019 7:13:25 PM
1018875	North End Farmers Market	417 Blust Ave.	40.7703620	-82.5247140	44903	12/23/2018 9:57:01 AM
1021344	North End Farmers Market	311 Bowman St.	40.766123	-82.523336	44903	2/5/2021 3:30:48 PM
1018184	North Iowa Farmers Market	1st NE and Delaware	43.152590	-93.199249	50401	7/26/2018 3:44:25 PM
1018550	North Market Farmers' Market	59 Spruce Street	39.9718961	-83.0043304	43215	7/26/2018 3:48:03 PM
1001059	North Myrtle Beach Farmers Market	925 First Avenue South	33.827655	-78.683173	29582	1/27/2021 3:28:08 PM
1004865	North Prairie Farmers Market - Minot	Corner of 3rd Ave SW and Broadway	48.233564	-101.295598	58701	1/25/2021 5:09:27 PM
1009884	North Square Farmers Market	100 Spring St	39.938459	-77.662435	17201	8/7/2020 3:00:41 PM
1018455	North St. Mary's County Farmers Market	37600 New Market Turner Road	38.473539	-76.775630	20622	7/30/2018 7:51:13 AM
1019640	Northampton Pa Farmers Market	1401 Laubach Avenue Municipal Park	40.684278	-75.489035	18067	7/24/2019 2:53:53 PM
1003694	Northbrook Farmers Market	Cherry Lane and Meadow Road	42.1314024	-87.8286573	60062	2/9/2021 10:05:12 AM
1006780	Northeast Minneapolis Farmers Market	University Avenue NE and 7th Avenue NE	44.995288	-93.262339	55413	9/11/2020 6:35:49 PM
1010755	Northeast Washington (NEW) Farmers Market	Corner of Main and Astor	48.543279	-117.905228	99114	1/26/2021 11:33:12 AM
1002764	Northport Farmers Market	105 S. Bay Street	45.129668	-85.614175	49670	2/1/2021 3:01:51 PM
1018728	Northridge Farmers Market and family festival	9301 tampa ave	34.2385732	-118.5562362	91324	7/27/2018 3:02:47 PM
1019815	Northside Farmers Market	4222 Hamilton Ave	39.163947	-84.539984	45223	1/4/2021 2:33:39 PM
1021379	Northside Farmers' Market	2901 N. Sherman Ave.	43.128145	-89.362808	53704	3/9/2021 1:51:24 PM
1021554	Northville Farmers Market	Corner of 7 Mile and Center Streets	42.426370	-83.483407	48167	6/30/2021 11:34:38 AM
1019008	Norwich Farmers Market	2-75 North Broad Street	42.531632	-75.523641	13815	3/1/2021 1:25:13 PM
1019345	Nourish Knoxville's Winter Farmers' Market	500 Howard Baker Jr Ave	35.965650	-83.910507	37915	1/25/2021 9:38:40 AM
1020054	NOVA Central Farm Market	543 Beulah Road	38.915538	-77.264712	22180	8/7/2020 11:00:59 PM
1019127	Nutley Farmers Market	537 Franklin Avenue	40.824341	-74.154584	07110	6/10/2018 1:01:07 PM
1019828	Oak Creek Farmers Market	Drexel Town Square	42.899242	-87.917781	53154	1/4/2021 12:36:37 PM
1021566	Oak Hill Hops	3051 W STREETSBORO RD	41.244993	-81.600093	44286	7/17/2021 7:58:12 AM
1019488	Oak Marr	3200 Jermantown Road	38.889444	-77.302226	22124	4/25/2019 2:00:30 PM
1018829	Oak Square Farmers Market	640 Washington Street	42.3506821	-71.1691939	02135	9/28/2018 9:52:43 AM
1019223	Oakcrest Farmers Market	1300 Capitol Heights Blvd	38.8708398	-76.9185759	20743	8/8/2018 9:56:29 AM
1019971	Oakhurst Farmers Market	630 East Lake Drive, SUITE E	33.760143	-84.304799	30030	7/23/2020 5:17:34 PM
1019353	Ocala Downtown Market	corner of SE 3rd Street and SE 3rd Avenue	29.19393	-82.320981	34471	1/11/2019 1:14:08 PM
1001839	Ocean Beach Certified Farmers Market	4900 Newport Avenue	32.746190	-117.250160	92107	12/21/2018 9:03:14 PM
1006250	Ocean City, NJ Farmers & Crafters Market	6th Street & Asbury Avenue	39.282143	-74.572082	08226	8/5/2020 11:33:22 AM
1019200	Ocean Pines Farmers & Artisans Market	239 Ocean Parkway	38.3992566	-75.1600720	21811	7/31/2018 10:59:00 AM
1021412	Ohio Valley Farmers' Market	3200 Union St	40.014375	-80.742120	43906	3/19/2021 11:39:44 AM
1021413	Ohio Valley Farmers' Market	67800 Mall Rd	40.069884	-80.865892	43950	3/19/2021 11:48:12 AM
1001271	OHSU Farmers Market	Mailcode L338, 3181 SW Sam Jackson Park Rd	45.499865	-122.687706	97239	1/4/2021 8:26:41 PM
1021356	Old Capitol Farmers Market	4th and Adams	39.800581	-89.650662	62701	2/17/2021 4:35:37 PM
1020130	Old L.A. Certified Farmers Market	North Figueroa & Ave. 58	34.110124	-118.191900	90042	1/18/2021 6:01:46 PM
1020131	Old L.A. Certified Farmers Market	N Figueroa & Ave. 58	34.110171	-118.191934	90042	8/20/2020 1:44:46 PM
1020146	Old Oakland Farmers' Market	492 9th street	37.801382	-122.274596	94609	8/20/2020 7:31:04 PM
1009659	Old Stadium Park (People's Open Market)	2237 South King Street	21.292322	-157.827323	\N	3/20/2019 4:51:43 PM
1010865	Olde Beaufort Farmers' Market	300 Courthouse Square	34.719572	-76.663201	28516	8/3/2020 11:02:58 AM
1021667	Olde Pickerington Farmers' Market	89 N Center St	39.886046	-82.754075	43147	1/21/2022 9:50:21 AM
1019646	Olympia Farmers' Market	700 Capitol Way N	47.050425	-122.902519	98501	7/30/2019 12:45:30 AM
1018655	Omaha Farmers Market - Aksarben Village	67th & Center Street	41.2377371	-96.0138738	68106	1/2/2019 10:11:17 AM
1019343	Omaha Farmers Market - Old Market	11th & Jackson Street	41.264675	-96.041927	68102	1/2/2019 10:11:50 AM
1021685	One African! One Nation! Farmers Market	4031 W. Florissant Ave.	38.674084	-90.218914	63107	2/1/2022 4:39:30 PM
1001034	Oneida Farmers Market	N7332 Water Circle Place	44.503625	-88.202341	54155	1/25/2021 7:35:22 PM
1019317	Onslow County Farmers Market	4024 RIchlands Hwy	34.782418	-77.493260	28540	2/1/2021 8:57:14 AM
1021608	Open Air Farmers Market+ At The Dole Mansion	401 Country Club Road	42.232554	-88.335331	60014	8/25/2021 4:49:26 PM
1018807	Orange Community Farmers' Market	525 Orange Center Road	41.2735586	-73.0210587	06477	1/6/2021 10:11:44 AM
1020114	Orange Home Grown Farmers & Artisans Market	303 W. Palm Ave.	33.791554	-117.855866	92866	1/4/2021 12:02:47 PM
1018920	Orange Park Farmer's & Arts Market	2042 Park Ave	30.165484	-81.701664	32073	2/17/2021 12:39:09 PM
1008468	Oregon City Year-Round Farmers Market	2051, Kaen Rd, off Beavercreek Rd.	45.333082	-122.597822	97045	6/4/2019 11:20:50 AM
1019202	Original Merced County Certified Farmers Market - Downtown Merced	16th St. and Canal St.	37.300930	-120.484427	95340	7/31/2018 3:31:25 PM
1020198	Orinda Famers Market	28 Orinda Way	37.882764	-122.174543	94563	8/27/2020 7:34:12 PM
1008360	Ormond Beach Farmers Market	22 S. Beach St. (City Hall Plaza)	29.284852	-81.055484	32174	7/26/2018 5:19:16 PM
1019416	Orofino Farmers Market	101 Michigan Ave.	46.477929	-116.255806	83544	3/7/2019 5:53:40 PM
1019019	Oshkosh Farmers Market - Downtown	400-500 Blocks N Main St	44.021478	-88.537573	54901	3/22/2018 9:09:01 PM
1019023	Oshkosh Farmers Market - Downtown	400 & 500 Blocks N Main St & 100 Block Church Ave	44.022875	-88.537461	54901	3/23/2018 2:05:23 PM
1019025	Oshkosh Farmers Market - Winter	108 W New York Ave	44.033250	-88.540004	54901	3/23/2018 2:36:26 PM
1021699	Oswego Country Market	15 Main Street	41.684774	-88.351584	60543	2/10/2022 11:36:06 AM
1021215	Overbrook Farmers Market	Maple & Market St	38.777419	-95.556782	66524	9/16/2020 4:12:27 AM
1020023	Ovid Farmers Market	Main Street	42.676729	-76.822157	14521	8/3/2020 2:35:03 PM
1021384	Owen County Farmers Market	459 W. Morgan Street (SR46)	39.286121	-86.769484	47460	3/11/2021 11:53:32 AM
1004212	Oxford Farmers Market	Corner of Lanier and McClanahan Streets	36.3148277	-78.5866163	27565	9/10/2020 4:56:49 PM
1021335	Oxford Farmers Market	E. Park Place	39.510915	-84.741544	45056	2/3/2021 11:04:53 AM
1012777	Oxnard Farmers Market	500 South C Street	34.197980	-119.180270	93030	9/11/2020 6:34:33 PM
1008946	Pacific City Farmers Market	6200 Camp St	45.2050760	-123.9607490	97135	6/5/2019 10:54:35 AM
1021721	Paducah Homegrown Farmer's Market	306 N 2nd Street	37.090228	-88.596465	42001	3/3/2022 10:38:28 AM
1021722	Paducah Homegrown Farmer's Market-Tuesday Market	300 N. 30th St	37.074367	-88.637149	42001	3/3/2022 10:44:09 AM
1021599	Pahrump Saturday Farmers' Market	900 E Hwy 372	36.205326	-115.997901	89048	8/6/2021 2:32:31 PM
1021200	Pajaro Valley CFM	Peck and Union st.	36.910275	-121.755366	95076	8/31/2020 8:33:24 PM
1019723	Palisades Winter Farmers' Market	675 Oak Tree Road	41.011605	-73.917284	10964	12/11/2019 4:11:42 PM
1021648	Palmas Farmers Market	170 Canderlero Dr	18.088831	-65.797119	00791	12/15/2021 11:33:36 AM
1019102	Palo Alto College Farmers Market	1400 W Villaret Blvd	29.321634	-98.543052	78224	5/16/2018 12:00:55 PM
1005248	Palolo Valley District Park (People's Open Market)	2007 Palolo Avenue	21.298910	-157.797316	96813	1/24/2019 3:26:18 PM
1018687	Palos Heights Farmer's Market	6601 W 127th Street	41.6604652	-87.7831286	60463	12/11/2018 3:37:09 PM
1011995	Palos Verdes Farmers Market	27118 Silver Spur Road	33.779336	-118.373725	90274	1/25/2021 7:51:26 PM
1021491	Paola Farmers Market	Park Square	38.572307	-94.878291	66071	5/29/2021 10:12:35 PM
1021398	Paragould Farmers' Market	100 W. Emerson	36.055570	-90.486623	72450	3/16/2021 11:18:28 AM
1019755	Park View Farmers Market	3400 Georgia Ave NW	38.932172	-77.023928	20009	2/10/2020 10:25:51 AM
1019761	Park View Farmers Market	3400 Georgia Ave NW	38.932155	-77.023960	20010	2/21/2020 12:41:15 PM
1006927	Parkville Farmers' Market	English Landing Park, off Hwy 9 in Parkville MO	39.187828	-94.683086	\N	7/31/2018 6:13:58 AM
1019939	Paseo Farmers Market	3100 N Walker Ave	35.501891	-97.524820	73103	6/25/2020 1:50:06 PM
1021417	Patch & Pasture, LLC	17004 Path Valley Rd	40.151488	-77.766771	17262	3/22/2021 2:47:45 PM
1019674	Pawling Farmers Market	Charles Colman Blvd & West Main Street	41.564215	-73.600845	12564	8/7/2019 7:56:19 PM
1019910	Pawtucket Farmers Market	374 Main ST	41.877734	-71.387274	02860	6/5/2020 1:34:59 PM
1018944	Pawtucket Wintertime Farmers Market	1005 Main Street	41.862831	-71.399990	02860	2/15/2018 1:02:31 PM
1021735	Pawtuxet Village Farmers Market	60 Rhodes Pl	41.768065	-71.393666	02905	3/27/2022 4:22:24 PM
1019068	Payette Farmers Market	Kiwanis Park	44.069117	-116.935907	83661	4/24/2018 11:43:00 AM
1021389	Payson Farmers Market, LLC - Twilight Tuesdays	816 S. Beeline Hwy	34.229808	-111.327601	85541	10/17/2021 2:50:37 PM
1021718	PC Sunday Farmers Market	Madison Street	41.512209	-82.941236	43452	2/24/2022 1:16:34 PM
1020175	Peaceful Valley Farmers Market	14888 Peaceful Valley Road	37.974304	-120.338076	95370	8/23/2020 7:22:03 PM
1019685	Peach Street Farmers Market	234 S. Arcola St.	29.169195	-95.428973	77515	8/20/2019 9:10:53 AM
1018466	Peacham Farmers Market	555 Bayley Hazen Road	44.327445	-72.170037	05862	1/26/2021 6:38:09 AM
1019454	Pedernales Farmers Market	23526 TX-71	30.387133	-98.084871	78669	4/7/2019 2:38:57 PM
1020072	Pendleton County Farmers’ Market	68 Fairgrounds Road	38.671615	-84.332926	41040	8/17/2020 5:19:40 PM
1021688	Pendleton Indiana Farmers Market	Falls Park Drive	40.005635	-85.744734	46064	2/5/2022 12:23:21 PM
1019854	Pennington Farmers Market	101 Route 31 N	40.349400	-74.796880	08534	1/23/2021 11:14:59 AM
1021746	Perry County Farmers Market Perryville	\N	35.005134	-92.801421	72126	4/4/2022 11:37:42 AM
1019822	Perry Lecompton Farmers Market	2115 Ferguson Rd.	39.081430	-95.392324	66073	4/4/2020 2:38:25 PM
1018626	Petaluma Evening Farmers' Market	2nd Street between D St and B St	38.233365	-122.637103	94952	8/6/2020 10:24:02 AM
1018627	Petaluma Farmers Market	Petaluma Blvd S and D St	38.231796	-122.636797	94952	8/6/2020 10:20:00 AM
1012060	Petersham Friday Market	\N	42.488744	-72.186669	01366	1/4/2021 11:53:37 AM
1010839	Petworth Community Market	4100 9th St. NW	38.9411512	-77.0250472	20010	8/2/2018 8:15:50 AM
1019128	Pfafftown Farmer's Market	4725 Yadkinville Rd	36.1304034	-80.256362	27040	6/10/2018 11:01:33 PM
1001260	Pflugerville Pfarmers Market	901 Old Austin Hutto Road	30.442585	-97.606001	78660	7/26/2018 5:36:04 PM
1020126	Phelan Certified Farmers Market	4128 Warbler Road	34.439822	-117.524831	92371	8/20/2020 12:13:21 PM
1002060	Philmont Farmers' Market	116 Main St. - opposite Local 111 restaurant	42.249303	-73.649443	12565	7/26/2018 5:45:58 PM
1020177	Phoenix Hill NuLu Farmers' Market	1007 E. Jefferson St	38.251583	-85.733398	40206	8/24/2020 8:57:28 AM
1021494	Pica Pica Plaza Farmers' Market	910 SE Military Dr	29.472403	-98.525142	78214	6/1/2021 10:56:49 AM
1007245	Piedmont Triad Farmers Market	2914 Sandy Ridge Road	36.087691	-79.992657	27235	9/11/2020 8:52:44 AM
1010408	Pike Central Farm Market	910 Rose Avenue	39.049352	-77.117929	20852	8/7/2020 10:48:18 PM
1021731	Pike Farmers Market	5429 Lafayette Road	39.849755	-86.258818	46254	3/14/2022 8:56:07 PM
1020165	Pikeville Farmers Market	130 Adams Lane	37.485971	-82.544326	41501	8/21/2020 1:51:51 PM
1021380	Pine City Farmers Market	Main Street and 1st Ave NW	45.832364	-92.970689	55063	3/9/2021 7:07:03 PM
1010638	Pinecrest Farmers Market	11000 S. Red Road	25.669124	-80.285895	33156	1/25/2021 9:15:23 PM
1016803	Pitkin Verde Farmers Market	2094 Pitkin Avenue	40.671863	-73.895438	11207	7/30/2018 10:19:07 AM
1021641	Pittsburg Area Farmers' Market	119 E. 11St.	37.418249	-94.703397	66762	12/9/2021 5:17:19 PM
1018921	Pittsburg County Farmers Market	SW Corner of Main and Choctaw	34.926816	-95.769944	74501	1/30/2018 1:21:49 PM
1020005	Pittsfield Township Farmers Market	6201 W. Michigan Ave	42.197733	-83.700262	48108	7/31/2020 4:37:50 PM
1021572	Placerville Certified Farmers Market	337 Placerville Drive	38.731615	-120.821856	95667	7/21/2021 3:30:38 PM
1019328	Plainfield Township Farmers Market Hale	220 West Washington	44.380388	-83.804474	48739	1/4/2021 11:32:45 AM
1019885	Plainview Farmers Market	\N	42.353346	-97.787145	\N	5/28/2020 9:53:23 AM
1012268	Plainwell Farmers Market	554 Allegan St.	42.452003	-85.650721	49080	1/5/2021 9:27:15 AM
1019344	Plainwell Indoor Market	211 N. Main St.	42.444910	-85.643297	49080	1/5/2021 9:31:03 AM
1019478	Plateau Valley Farmers Market	2003 Main Street	39.238943	-107.962277	81624	4/18/2019 4:31:50 PM
1019616	Platteville Farmers Market - Summer	100 Park Place	42.735314	-90.479570	53818	7/10/2019 3:52:43 PM
1019615	Platteville Farmers Market - Winter	205 Market Street	42.736018	-90.479874	53818	7/10/2019 3:37:18 PM
1019884	Plattsmouth Downtown Farmers Market	\N	41.005653	-95.894144	\N	5/27/2020 4:07:11 PM
1020019	Playa Vista Farmers' Market	12775 W. Millennium	33.975922	-118.416626	90094	1/10/2021 12:33:05 PM
1008213	Pleasants Area Farmers Market	2nd Street	39.390828	-81.205928	26170	12/23/2018 10:34:58 AM
1021455	Pleasantville Farmers Market - Outdoor	Memorial Plaza (next to the train station)	41.135051	-73.793652	10570	4/28/2021 8:42:27 PM
1004602	Plymouth Farmers Market	Garro St.	41.340650	-86.307641	46563	8/4/2020 11:53:02 AM
1011146	Poestenkill Farmers Market	38 Davis Drive	42.6904758	-73.5635307	12140	7/26/2018 4:34:00 PM
1005259	Pokai Bay Beach Park (People's Open Market)	85-037 Pokai Bay Road	21.442923	-158.188437	96792	1/26/2019 4:30:58 PM
1021485	Ponce City Farmers Market on the BeltLine	675 Ponce de Leon Ave	33.772425	-84.364611	30315	5/26/2021 12:55:54 PM
1021462	Pontiac Farmers' Market	\N	40.880177	-88.629562	61764	5/4/2021 3:29:13 PM
1019027	Port Chester Farmers Market	Highland St	41.002110	-73.661339	10573	3/24/2018 8:09:22 AM
1018986	Port Sanilac Farmers' Market	228 S Ridge Street	43.424322	-82.543109	48469	3/7/2018 8:26:53 AM
1020037	Port Townsend Farmers Market	600 Block Tyler St	48.117020	-122.760304	98368	8/4/2020 5:51:56 PM
1018474	Portland Farmers Market - Kenton	N McClellan & N Denver	45.583224	-122.686792	97217	1/6/2021 5:28:07 PM
1018477	Portland Farmers Market - King	NE 7th and Wygant	45.557097	-122.658982	97211	1/6/2021 5:23:47 PM
1018478	Portland Farmers Market - Lents International	SE 92nd and Reedway	45.4813183	-122.5685894	97266	1/6/2021 5:22:04 PM
1018482	Portland Farmers Market - Portland State University	SW Park and Montgomery	45.512348	-122.684833	97201	1/6/2021 5:20:16 PM
1018483	Portland Farmers Market - Shemanski Park	SW Park and Main	45.517125	-122.682231	97205	1/6/2021 5:18:24 PM
1007797	Portsmouth Farmers' Market	City Hall, 1 Junkins Avenue	43.0711929	-70.7535534	03801	7/31/2018 1:35:39 PM
1018963	Prairie Lakes Farmers Market	2824 Prairie Lakes Dr, Ste. 201, Ste. 201	43.1680835	-89.2702544	53590	2/22/2018 5:17:58 PM
1019807	Prairie Township Farmer's Market	5955 W. Broad Street	39.9695356	-83.009303	43119	3/24/2020 3:25:57 PM
1021263	Prescott Farmers Market	900 Iron Springs Road	34.557395	-112.482809	86301	1/6/2021 7:13:15 PM
1021501	Pretzel Park Farmers Market	4300 Silverwood Street	40.025446	-75.220985	19127	6/3/2021 12:00:04 AM
1019149	Price Farmers Market	100 N 100 E	39.6010798	-110.8088043	84501	7/2/2018 6:09:06 PM
1019793	Prince George Farmers Market	6605 Courts Drive	37.224538	-77.287343	23875	3/9/2020 5:04:14 PM
1020086	Prospect Area Farmer's Market	12900 W. Hwy 42	38.371020	-85.589960	40059	8/18/2020 9:10:39 AM
1018215	Pueblo of San Felipe Farmers' Market	25 Hagen Road	35.416275	-106.404321	87001	7/27/2018 1:26:49 PM
1021617	Pullman Farmers Market	150 E Spring St	46.729751	-117.174043	99163	9/20/2021 11:30:47 AM
1019868	Purcellville Farmers' Market	717 E Main Street	39.136603	-77.703843	20132	5/20/2020 5:02:13 PM
1021266	Putnam Farmer's Market	1 Valley Park Drive	38.440335	-81.995042	25526	1/11/2021 12:42:05 PM
1011596	Putnam Farmers Market	1 Valley Way	38.441892	-81.995540	25526	1/26/2021 12:29:00 PM
1003402	Puyallup Farmers' Market	300  S Meridian (COVID operations at corner of  2nd and Main, downtown Puyallup)	47.191241	-122.292435	98371	1/4/2021 11:35:46 AM
1021618	QC Farmers' Market	1700 1st ave	41.512780	-90.576384	61201	9/22/2021 2:53:54 PM
1019477	Quapaw Farmers Market	326 N Main St	36.955063	-94.787418	74363	4/18/2019 11:21:35 AM
1010145	Queen Anne Farmers Market	W Crockett Street and Queen Anne Ave N	47.637172	-122.357601	98109	1/26/2021 2:56:24 PM
1005260	Queen Kapiolani Park (People's Open Market)	Monsarrat and Paki Streets	21.268812	-157.816380	96822	3/20/2019 4:50:13 PM
1019122	Quincy Certified Farmers' Market	530 W. Main St.	39.937091	-120.950176	95971	5/31/2018 6:47:04 PM
1019315	Quincy Farmer's Market	128 N. 5th St.	39.932754	-91.409173	62301	11/1/2018 12:37:30 PM
1021579	Rail Yards Market	777 1st street SW	35.075615	-106.649029	87102	7/26/2021 8:10:15 PM
1011310	Randolph County Farmers Market	2959 County Road 333	33.255362	-85.451892	36278	8/6/2018 9:35:35 AM
1019204	Randolph County Farmers' Market	1966 Highway 62 West	36.257409	-90.983393	72455	8/2/2018 1:40:01 AM
1020093	Red Bird Farmers Market	70 Queendale Center	37.009793	-83.526289	40913	1/4/2021 2:22:15 PM
1019500	Red Lodge Farmers' Market	Lion's Park	45.191300	-109.247918	59068	5/1/2019 4:49:06 PM
1001766	Red Oak Farmers Market	307 East Reed Street	41.009641	-95.228044	51566	1/28/2021 8:53:53 AM
1020024	Red Stick Farmers Market  - Seasonal Tuesdays	7711 Goodwood Boulevard	30.442682	-91.106845	70806	8/3/2020 2:48:34 PM
1021277	Red Stick Farmers Market - Saturday Downtown Year Round	5th Street and Main Street	30.451950	-91.185787	70801	1/15/2021 12:55:31 PM
1003610	Red Stick Farmers Market - Thursday Year Round	6400 Perkins Road	30.399197	-91.121067	70808	8/3/2020 2:53:38 PM
1019410	Redland Community Farm and Market	12690 SW 280th Street	25.506957	-80.395809	33033	3/2/2019 8:11:36 PM
1019411	Redland Community Farm and Market	12690 SW 280th Street	25.506957	-80.395820	33033	3/3/2019 3:35:26 PM
1004750	Redlands Certified Farmers Market	100 E. State Street	34.056448	-117.181441	92373	4/9/2019 3:43:43 PM
1004751	Redlands Saturday Morning Certified Farmers Market	100 E. Redlands Boulevard	34.057080	-117.180913	92373	4/9/2019 3:50:14 PM
1000712	Reedsburg Area Medical Center Farmer's Markets	2000 North Dewey Avenue	43.549612	-89.993406	53959	7/26/2018 4:13:41 PM
1019235	Reidsville Market Square Farmers' Market	303 S. Scales Street	36.3586088	-79.6640029	27320	8/20/2018 10:08:27 AM
1021615	Reisterstown Farmers Market	120 Main Street	39.465227	-76.829700	21136	9/15/2021 4:57:07 PM
1009020	Rensselaer Farmers Market	110 W Harrison St.	40.9356403	-87.1501069	47978	1/4/2021 1:36:19 PM
1019493	Reston	1609 Washington Plaza	38.948449	-77.342215	20190	4/25/2019 2:25:37 PM
1002843	Rexburg Farmers Market	118 College Ave.	43.823218	-111.782405	83440	1/15/2019 2:10:20 PM
1018549	Richmond Farmers Market - Summer Season (May-October)	47 N 6th St	39.829996	-84.893377	47374	1/12/2021 10:37:51 AM
1021272	Richmond Winter Farmers Market - Winter Season (November - April)	204 S Second St	39.825813	-84.900398	47374	1/12/2021 11:20:42 AM
1019930	Ridgeway Farmers Market	299 Hughitt Street	42.998521	-89.993242	53582	6/22/2020 3:51:49 PM
1019142	Right Choice, Fresh Start Farmers' Market	3310 Magnolia St.	33.528187	-80.838621	29115	6/26/2018 12:52:48 PM
1019145	Right Choice, Fresh Start Farmers' Market	5484 Carolina Hwy	33.3150790	-81.1442720	29042	6/26/2018 4:01:40 PM
1005060	Rindge Farmers and Crafters Market	Bradford Street and Route 202	42.765593	-72.035850	03461	8/7/2018 6:22:13 PM
1021312	Rittenhouse Saturday Farmers' Market	1800 Walnut Street	39.950039	-75.170836	19103	1/26/2021 2:38:08 PM
1021302	Rittenhouse Tuesday Market	1800 Walnut Street	39.950045	-75.170843	19103	1/26/2021 1:57:10 PM
1019419	River Street Market	30 River Street	37.233787	-77.403730	23803	3/8/2019 1:18:41 PM
1019312	River Valley Farmers' Market	Center Avenue	45.742235	-107.608015	59034	10/27/2018 12:24:21 PM
1004073	Riverdale Park Farmers Market	4650 Queensbury Road	38.962979	-76.935311	20737	1/26/2021 9:25:32 AM
1019418	Riverfront Farmers Market	116 Dock St.	34.234207	-77.947930	28401	3/8/2019 12:46:17 PM
1018284	Riverside Arts Market	715 Riverside Avenue	30.3164943	-81.6762903	32204	12/21/2018 3:23:24 PM
1021409	Riverside Farmers Market	2800 Riverside Drive	39.806671	-86.192041	46208	3/17/2021 11:27:42 AM
1000194	Riverside Farmers' Market	10 Pine Ave.	41.8277856	-87.8201027	60546	9/14/2020 11:10:45 AM
1019259	Rivertown Farmers Market	303 Williams Blvd	29.973156	-90.246653	70062	9/19/2018 11:21:53 AM
1019927	Riverview Farmers Market	320 Ogden Avenue	40.744736	-74.042798	07307	6/21/2020 5:25:58 PM
1019635	Riverwalk Farmers Market	5 S. Walnut Street	38.913062	-75.428080	19963	7/22/2019 10:20:48 AM
1019070	Roanoke Farmer's Market	Main Street	40.961979	-85.373322	46783	4/24/2018 8:31:28 PM
1019899	Rock Valley Farmers Market	1013 13th Ave	43.200223	-96.300832	51247	5/29/2020 1:53:50 PM
1020173	Rockford Midtown Market	503 Seventh Street	42.262526	-89.080980	61104	8/22/2020 9:23:15 AM
1019033	Rockmart Farmers Market	108 Water St.	33.997669	-85.053094	30153	1/7/2021 5:10:08 PM
1012576	Rockville Farmers Market	Route 28 & Monroe Street	39.0819115	-77.1492295	20850	1/2/2019 8:39:20 AM
1021623	Rocky Butte Farmers Market	9200 NE Fremont St	45.551352	-122.568013	97220	10/19/2021 12:18:57 AM
1021606	Rocky Mount Farmers Market	435 Franklin St	36.994866	-79.888073	24151	8/23/2021 11:23:51 AM
1019048	Rocky Mountain Front Farmers Market	North Main Avenue & 8th Street NW	47.818183	-112.188004	59422	4/9/2018 6:38:27 PM
1011286	Rogers Farmers Market	12724 Main Street	45.1869330	-93.5519650	55374	7/30/2018 8:38:11 AM
1019747	Rogersville Farmer's Market	270 County Line Road	37.115153	-93.066381	65741	2/6/2020 6:18:53 PM
1003969	Rogue Valley Growers & Crafters Market	1492 East Main	42.1949	-122.6905	97520	6/4/2019 1:36:08 PM
1003970	Rogue Valley Growers & Crafters Market	99 Hawthorne St	42.336896	-122.854244	97501	6/4/2019 1:35:24 PM
1003971	Rogue Valley Growers & Crafters Market	Oak & N Main	42.192172	-122.700426	97520	6/4/2019 1:37:08 PM
1018637	Rohnert Park Farmers' Market	500 City Center Dr	38.349284	-122.703949	94928	8/6/2020 10:23:34 AM
1011778	Rolling Meadows City Markets	2720 Kirchoff Road	42.078232	-88.016174	60008	7/30/2018 11:10:56 AM
1019479	Ronan Farmers' Market	155-199 Hwy 93	47.527600	-114.097574	59864	4/18/2019 5:40:42 PM
1018349	Roosevelt Community Farmers' Market	380 Nassau Road	40.6817846	-73.5908479	11575	12/21/2018 11:40:45 PM
1019973	Rosa Parks Farmers Market	2020 Beatties Ford Road	35.262802	-80.854493	28216	7/24/2020 3:20:43 PM
1010821	Rose City Farmers Market	302 S. Broadway Ave.	32.347948	-95.300309	75701	7/26/2018 7:43:10 PM
1019194	Roslindale Village Main Street Winter Farmers Market	32 Birch St	42.286072	-71.130709	02131	1/4/2021 12:35:33 PM
1019791	Ross Township Farmers Market	920 Perry Hwy	40.533713	-80.036108	15229	3/6/2020 4:12:56 PM
1021535	Round Rock Farmers' Market	201 University Oaks Blvd	30.557966	-97.688209	78665	6/22/2021 1:42:20 PM
1021218	Route One Farmers Market	3745 Constellation Rd	34.700679	-120.466224	93436	9/17/2020 7:10:21 PM
1005261	Royal Kunia Park-n-Ride (People's Open Market)	Kupuna Lp/Kupuohi Street	21.389120	-158.032652	96797	3/20/2019 4:47:05 PM
1019119	RT 639 Farmers Market	7278 Ladysmith Road,	38.016661	-77.518506	22546	7/16/2020 10:02:41 AM
1021451	Running Springs Farmers Market and Artisan Faire	2645 Whispering Pines Drive	34.206855	-117.104915	92382	4/26/2021 7:25:52 PM
1003915	Rusk County Farmers Market	US Highway 8 & W. 2nd  Street	45.464998	-91.099240	54848	1/25/2021 4:26:58 PM
1019620	Russellville Community Market	320 West C St.	35.280402	-93.135468	72801	1/4/2021 2:55:08 PM
1021646	Russian River Farmers Market	16290 5th St	38.503197	-122.998786	95446	12/13/2021 5:20:16 PM
1021503	Russiaville Farmers Market	250 N Union St	40.419151	-86.270804	46979	6/3/2021 12:46:49 PM
1018975	Ruston Farmers Market	220 E. Mississippi Avenue	32.529214	-92.635542	71270	3/1/2018 2:47:29 PM
1019715	RVCC Winter Market	Rockfish School Lane	37.7874422	-78.886752	22920	11/13/2019 10:46:29 AM
1019825	Saint Mary Farmers Market	700 s third st	39.948137	-82.994617	43206	4/6/2020 10:44:53 AM
1019734	SaintParis FarmersMarket	135 W. Main St	40.127699	-83.959772	43072	1/12/2020 3:36:20 PM
1002062	Salamanca Farmers market	768 Broad st	42.164734	-78.741263	14779	12/28/2020 6:10:47 PM
1005214	Salem Farmers Market	3 East Main Street	37.292997	-80.058606	24153	1/26/2021 1:43:45 PM
1021613	Salem Farmers Market	32 Derby Square	42.520767	-70.894541	01970	9/1/2021 8:54:54 AM
1019211	Salem NH Farmers Market - Winter	14 Main Street	42.7817730	-71.2372585	03079	8/4/2018 5:17:57 PM
1021546	Salinas City Center Certified Organic Farmer's Market	Gabilan Street	36.675383	-121.656030	93901	6/24/2021 2:22:45 PM
1004988	Saline Farmers Market	S. Ann Arbor Street	42.165956	-83.781146	48176	4/20/2020 6:52:28 AM
1004990	Saline Farmers Market	7265 Saline Ann Arbor Road	42.179728	-83.785094	48176	4/20/2020 6:53:48 AM
1021724	Salisbury Farmer's Market	16 Elm Street	42.835542	-70.842243	01952	3/3/2022 1:52:12 PM
1002485	Salmon Creek Farmers' Market at Legacy Hospital	2211 NE 139th Street	45.7203870	-122.6485540	98686	12/21/2018 8:24:35 PM
1019428	Salomon Farm Park Farmers' Market	817 West Dupont Road	41.175641	-85.152678	46825	3/12/2019 9:42:36 AM
1005262	Salt Lake Municipal Lot (People's Open Market)	5337 Likini Street	21.346157	-157.904131	96818	1/24/2019 3:53:25 PM
1021468	San Antonio Food Bank Farmers' Market	5200 Enrique M. Barrera Pkwy	29.418102	-98.591790	78227	5/13/2021 2:41:41 PM
1009080	San Francisco Certified Alemany Farmers Market	100 Alemany Boulevard	37.7373447	-122.4085979	94110	7/26/2018 5:29:47 PM
1018449	Sanford Farmers' Market	919 Main St	43.438711	-70.774653	04073	7/27/2018 11:48:39 AM
1019913	Sankofa World Market	224 Dexter St	41.811066	-71.428530	02907	6/5/2020 2:03:36 PM
1020185	Santa Clara Farmers' Market	Jackson Street at Homestead Road	37.364613	-121.967934	95050	8/24/2020 3:02:29 PM
1021645	Santa Rosa Certified Farmers Market	50 Mark West Springs Rd.	38.495737	-122.751970	95403	12/13/2021 4:55:28 PM
1018625	Santa Rosa Community Farmers Market at the Veterans Building	1501 Farmers Lane	38.434379	-122.689399	95404	8/6/2020 10:16:56 AM
1018315	Santa Rosa Downtown Market (Wednesday Night Market)	Courthouse Square & 4th St	38.4406777	-122.7135900	95404	7/28/2018 5:47:25 PM
1011160	Santa Rosa Farmers Market	4587 Woodbine Road	30.6039770	-87.1835590	32571	4/17/2018 1:41:21 AM
1007261	Sara Hardy Downtown Farmers Market	152 East Grandview Parkway	44.765173	-85.621764	49684	7/26/2018 4:15:30 PM
1008303	Saracen Landing Farmers Market	200 Lake Saracen Drive	34.231049	-92.004296	71601	7/26/2018 3:33:24 PM
1012203	Saranac Lake Village Farmers Market	Riverside Park	44.324630	-74.131251	12983	8/14/2018 10:33:37 AM
1021577	Saturday Market at Steele	4350 Thomas Drive	38.992994	-122.875318	95435	7/22/2021 7:07:21 PM
1007250	Saugerties Farmers Market	115 Main Street	42.080345	-73.946818	12477	1/25/2021 5:09:41 PM
1021558	Scituate Farmers Market	600 Chief Justice Cushing Hwy	42.198470	-70.769256	02066	7/2/2021 11:58:44 PM
1021707	Scituate Rotary Farmers Market	46 Institute Lane	41.848902	-71.579083	02857	2/16/2022 7:30:06 PM
1012037	SCOTCH PLAINS FARMERS' MARKETPLACE	430 Park Ave (Municipal Parking Lot), Scotch Plains, New Jersey 07076	40.650167	-74.397557	07076	7/26/2018 3:59:05 PM
1019627	Scotland Farmers Market	Rt. 14 & Rt. 97	41.698757	-72.081503	06264	7/15/2019 11:13:06 PM
1020088	Scott County Farmers' Market	corner of North Broadway and Washington Street	38.211492	-84.559554	40324	8/18/2020 9:16:40 AM
1019515	Scottsville Midweek Farmers' Market	61 Main St.	43.022276	-77.753379	14546	5/8/2019 8:57:31 AM
1019445	SE Columbus Farmer's & Grower's Market	5081 Carbondale Drive	39.924927	-82.847372	43232	3/28/2019 4:51:40 AM
1018167	Seacoast Eat Local Winter Farmers' Market - Exeter High School	1 Blue Hawk Drive	43.0168516	-71.0003126	03833	12/30/2020 11:32:30 AM
1018172	Seacoast Eat Local Winter Farmers' Market - Wentworth Greenhouses	141 Rollins Road	43.2155618	-70.8601023	03869	7/26/2018 5:19:10 PM
1019237	Sealy Farmers Market	410 Main Street	29.780290	-96.159309	77474	8/26/2018 2:25:19 PM
1021693	Searcy County Farmers Market	200 W Fair Street	35.911945	-92.632893	72650	2/6/2022 1:38:53 PM
1021664	Seaside Farmers Market	1140 Broadway	45.993667	-123.919864	97138	1/18/2022 8:07:18 PM
1021233	Secotan Market	2868 NC-345	35.854615	-75.645391	27981	10/2/2020 3:14:47 PM
1018773	Sedalia Area Farmers' Market	2233 W 16th St	38.698011	-93.255481	65301	9/10/2020 10:49:10 PM
1019610	Seed2Seed Farmer’s Market	100 north main st.	36.095980	-80.244023	27101	7/4/2019 5:15:10 PM
1019442	Seneca Falls Farmers Market	15 Water Street	42.909109	-76.800314	13148	8/3/2020 2:03:10 PM
1019395	Sevier County Farmers Market	Herman Dierks Park   604 East Hayes Avenue	34.042245	-94.342133	71832	2/18/2019 1:25:28 AM
1021700	Seward Farmer's Market	529 Seward St	40.907721	-97.098509	68434	2/11/2022 3:31:07 PM
1010838	Shallotte Farmers Market/Market on Mulberry	123 Mulberry Street	33.975058	-78.386035	28470	9/11/2020 8:37:46 AM
1019455	Shawano Farmers Market	235 S. Washington Street	44.777707	-88.612868	54166	1/8/2021 11:53:52 AM
1021429	Shawnee Farmers Market	11110 Johnson Drive	39.017779	-94.805322	66203	3/25/2021 4:55:21 PM
1001280	Shelby County Farmers Market	Hwys 44 and 59	41.645926	-95.338882	51537	1/25/2021 10:00:43 PM
1019976	Shelby County Farmers Market	151 W Washington Street	39.524220	-85.780478	46176	7/27/2020 3:33:35 PM
1020103	Shepherdsville farmer's Market	170 W. Joe B. Hall Avenue	37.988053	-85.709198	40165	8/18/2020 2:24:16 PM
1018988	Shiloh Farmers' Market	5300 Philadelphia Dr.	39.819046	-84.235026	45415	3/7/2018 8:31:35 PM
1019319	Shoreline Farmers Market	15415 Westminster Way	47.741553	-122.349452	98133	1/26/2021 2:51:39 PM
1012179	Shorewood Farmers Market	3400 Estabrook Parkway	43.091905	-87.898448	53211	1/28/2021 10:39:37 PM
1020004	Shreveport Farmers' Market	101 Crockett Street	32.514186	-93.744962	71101	7/31/2020 1:29:55 PM
1021397	Siloam Springs Farmers Market	205 Jefferson Street	36.181621	-94.541074	72761	3/16/2021 10:39:37 AM
1018771	Silver City Farmers' Market Downtown	901 N Pope ST	32.774517	-108.276185	88061	9/17/2020 7:55:04 PM
1021219	Silver City Farmers' Market Midweek Market	3025 Highway 180 E, Silver City, NM 88061	32.787733	-108.242482	88061	9/17/2020 7:52:48 PM
1011044	Silver Lake CFM	1500 Griffith Park Blvd	34.090541	-118.277386	90026	12/25/2018 12:02:06 PM
1016822	Silver Valley Farmers Market	10 Station Ave	47.536412	-116.120504	83837	7/26/2018 4:04:00 PM
1018601	Silverdale Farmers Market	2222 Bucklin Hill Rd	47.651931	-122.668607	98383	9/25/2019 11:52:42 AM
1011811	Simi Valley City Hall Certified Farmers' Market	2757 Tapo Canyon rd	34.285295	-118.718091	93093	7/27/2018 3:05:03 PM
1010560	Sioux City Farmers Market	100 Pearl Street	42.490552	-96.408445	51101	9/15/2020 10:14:13 AM
1003169	Sitka Farmers Market	611 Lincoln Street	57.051519	-135.326742	99835	9/10/2020 10:20:11 PM
1018814	Sleeping Dragon Farmers Market	6475 Columbus Rd SE	32.189126	-107.750939	88030	8/4/2018 2:53:56 PM
1019869	Slippery Rock Farmers Market	Gateway Park, 100 Midway Street	41.062533	-80.050842	16057	5/20/2020 9:17:24 PM
1020163	SLO Farm Supply Farmers Market	224 Tank Farm Rd	35.247189	-120.667181	93401	8/21/2020 1:11:27 PM
1010014	Smith County Farmers Market	110 Ag. Center lane	36.2233523	-85.9461859	37030	9/11/2020 10:20:57 AM
1021675	Snookz block mini market	225 elm st, 4	34.342681	-119.084049	93060	1/31/2022 2:29:28 AM
1020022	SOCO Farmers' Market	3315 Hyland	33.694867	-117.927099	92626	1/10/2021 12:40:08 PM
1019926	Sodus Farmers' Market	58 West Main Street	43.237102	-77.062753	14551	6/19/2020 3:33:20 PM
1020159	SoKY Marketplace Farmer's Market	636 Center Street	36.970919	-86.438462	42102	8/21/2020 12:00:14 PM
1003836	Solana Beach Farmers Market	444 South Cedros Avenue	32.987194	-117.269204	92075	1/26/2021 5:58:13 PM
1019829	Soldotna Saturday Farmers Market	193 E. Corral Ave	60.493040	-151.067584	99669	1/11/2021 1:00:36 PM
1019671	Somerset County Farmers' Market Inc.	800 Georgian Place	40.022787	-79.072141	15501	8/5/2019 8:04:46 PM
1020039	Somerville Mobile Farmers' Market - Council on Aging	167 Holland Street	42.400980	-71.125686	02144	8/5/2020 9:55:26 AM
1020040	Somerville Mobile Farmers' Market - East Somerville Community School	50 Cross Street	42.385778	-71.087099	02145	8/5/2020 9:58:03 AM
1011934	Somerville Mobile Farmers' Market - Mystic	530 Mystic Avenue	42.396251	-71.091856	02145	8/5/2020 9:51:19 AM
1011935	Somerville Mobile Farmers' Market - North Street	24 North Street	42.407206	-71.131331	02144	8/5/2020 9:49:56 AM
1019803	Soutel Community Market	4750 Soutel Dr	30.403740	-81.720010	32208	3/20/2020 9:03:02 PM
1020067	South Berkeley Farmers' Market	Adeline at 63rd Street	37.847765	-122.271931	94703	8/13/2020 6:57:25 PM
1021697	South Collier Farmer's Market	6060 Collier Blvd	26.045266	-81.698398	34114	2/9/2022 4:38:25 PM
1019385	South Cumberland Farmers Market	39 Ballpark Road	35.193923	-85.917223	37375	2/9/2019 10:13:14 AM
1018138	South East Area Farmers' Market	900 Fuller Ave SE	42.9464659	-85.6394126	49506	8/2/2018 3:25:38 PM
1021214	South End Market at Atherton	2000 South Blvd.	35.209110	-80.860801	28203	9/15/2020 11:56:05 AM
1019599	South Fork Fun Food & Brew	3309 W. Hwy 29	30.631014	-97.745633	78628	6/30/2019 8:12:03 PM
1002526	South Hill Farmers Market	105 W. Danville Street	36.7244013	-78.1301422	23970	7/30/2018 2:54:40 PM
1019915	South Kingstown Farmers Market  at Marina Park	2 Salt Pond Rd	41.428192	-71.496960	02879	6/5/2020 2:37:13 PM
1021573	South Lake Tahoe Certified Farmers Market	2748 Young Street	38.927079	-119.982044	96150	7/21/2021 3:40:18 PM
1019511	South Lyon Farmers and Artisans Market	110 W. Liberty	42.461015	-83.653169	48178	5/7/2019 12:49:32 AM
1010997	South Miami Farmers Market	6130 Sunset Dr	25.704072	-80.291066	33143	12/28/2020 1:17:03 PM
1010445	South Milwaukee Downtown Market	11th and Milwaukee Avenues	42.9107287	-87.8626880	53172	3/25/2021 12:47:54 PM
1021553	South Orange Farmers Market	12 Sloan Street	40.7881258	-74.248205	07079	6/29/2021 11:20:37 AM
1019091	South Side Farmers' Market	Alder Street and Cedar Avenue	41.4003507	-75.6668643	18505	5/8/2018 1:30:19 PM
1018098	South St. Joseph Farmers Market at the Junction	Lake & Illinois Avenues	39.718654	-94.865955	64504	7/26/2018 5:30:09 PM
1021563	South Waterfront Farmers Market	3508 S Moody Avenue	45.496936	-122.671046	97239	7/13/2021 1:49:12 PM
1021589	South Windsor Farmers' Market	220 Nevers Rd.	41.842841	-72.551790	06074	7/29/2021 8:19:03 PM
1002063	Southern Tier Farmers Market - Olean	1900 Constitution Ave	42.211214	-78.041832	14760	5/20/2018 5:29:57 PM
1019979	Southshore Outdoor Market	8505 Durand Ave	42.697348	-87.888847	53177	12/29/2020 12:30:36 PM
1021326	Southwest Plaza Farmers Market	Wadsworth and Bowles	39.611904	-105.095730	80123	1/28/2021 5:21:25 PM
1005560	Southwest Virginia Farmers' Market	497 Farmers Market Drive	36.742228	-80.772836	24343	8/2/2018 10:42:01 AM
1019305	Sowing Seeds Growing Futures Farmers Market	18917 Joy Road	42.362216	-83.130895	48228	10/12/2018 11:14:34 AM
1018952	Spanish Peaks Farm Stand	23500 US Hwy 160	37.600391	-104.831846	81089	2/19/2018 4:20:21 PM
1021568	Sparks United Methodist Church Farmer's Market	1231 Pyramid Way	39.544248	-119.753397	89431	7/18/2021 8:51:27 PM
1019173	Speedway Farmers Market	1068 Main Street	39.793698	-86.247542	46224	1/25/2021 11:24:13 PM
1019784	Spotsylvania Farmers Market - Spotsylvania Regional Medical Center	4600 Spotsylvania Parkway	38.219747	-77.495899	22407	3/4/2020 7:58:49 PM
1019452	Spotsylvania Farmers Market - VDOT Commuter Parking Lot	12150 Gordon Road	38.290380	-77.563047	22407	4/6/2019 9:53:21 PM
1019782	Spotsylvania Farmers Market - VDOT Commuter Parking Lot	12150 Gordon Road	38.289909	-77.559528	22170	3/4/2020 7:45:48 PM
1021394	Springdale Farmers’ Market	992 E. Emma Ave.	36.187450	-94.118450	72764	3/16/2021 9:44:42 AM
1003588	Square Market	Public Square	34.316885	-89.952098	38606	7/26/2018 4:01:29 PM
1021670	St. John Farmers Market	9660 Wicker Avenue	41.444077	-87.468144	46373	1/25/2022 3:45:25 PM
1018312	St. Johns Farmers Market	N.Lombard and N.Philidelphia	45.5901096	-122.7544853	97203	8/1/2018 8:15:13 PM
1021466	St. Louis Farmers Market	300 North Mill Street	43.410742	-84.608462	48880	5/11/2021 8:08:51 PM
1019628	St. Maries Farmers Market	\N	47.318286	-116.586445	83861	7/16/2019 11:36:34 AM
1020176	St. Matthews Farmers Market	4100 Shelbyville Rd	38.251785	-85.646194	40207	8/24/2020 7:48:33 AM
1019675	St. Michaels Farmers Market	204 S Talbot St	38.785161	-76.225202	21663	8/8/2019 12:52:24 PM
1007810	St. Paul Farmers' Market	210 Holyoke	44.6451	-93.2429	55044	7/26/2018 5:02:51 PM
1012278	St. Petersburg Saturday Morning Market	First Street and First Avenue South	27.769964	-82.633652	33701	12/21/2018 10:42:01 PM
1021483	St. Phillips Plaza Market	4280 N. Campbell Rd	32.285766	-110.942088	85718	5/26/2021 12:36:22 PM
1012766	Stafford Community Farmers' Market	31 Main Street	41.953553	-72.304724	06076	7/26/2018 4:12:04 PM
1018211	Stanly Commons Farmers Market	1000 N. First St.	35.366184	-80.197218	28001	7/28/2018 8:06:55 PM
1021526	Stayton Farmers Market	Third Ave & Florence St	44.796453	-122.791922	97383	6/18/2021 12:47:34 PM
1012100	STCC Farmers' Market	One Armory Square	42.108668	-72.581067	01102	8/7/2018 12:24:27 PM
1018918	STCC Open Air Market	180 Airport Road	40.050647	-77.477569	17257	1/24/2018 11:54:48 AM
1021333	Steelville Farmer & Artist Saturday Morning Market	392 Main St	37.967138	-91.358368	65565	2/2/2021 8:19:20 PM
1021334	Steelville Farmer & Artist Wednesday Night Market	Hoppe Spring Park, Church Street	37.966076	-91.359291	65565	2/2/2021 8:28:55 PM
1010057	Stones River Market	301 Spring Street	35.852209	-86.416062	37130	9/11/2020 9:18:51 AM
1019526	Stow Community Farmers Market	1567 Pilgrim Drive	41.168794	-81.452156	44224	1/4/2021 11:19:13 AM
1018451	Stowe Farmers' Market	1799 Mountain Road	44.473531	-72.712004	05672	9/16/2020 10:44:03 AM
1012116	Suffolk Farmers' Market	524 N. Main Street	36.737572	-76.581989	23434	1/26/2021 10:46:00 AM
1019545	Summit Lake Neighborhood Farmers' Market	380 W. Crosier St.	41.058965	-81.542318	44311	6/2/2019 1:03:52 PM
1019036	Sumter Farmers Market	200 Miller road	33.9324793	-80.3730000	29153	4/3/2018 12:22:21 PM
1019112	Sunday Market on Main Street	4138 Main St, Unit A	40.529078	-104.981878	80547	5/21/2018 1:37:58 PM
1007271	Sunland Park Ardovino's DC Farmers' Market	one Ardovino Dr	31.791358	-106.557437	88063	7/26/2018 4:10:17 PM
1020186	Sunnyvale Farmers' Market	Murphy Avenue at Washington Avenue	37.385784	-122.026323	94086	8/24/2020 3:07:55 PM
1021432	Superior Farm-to-Fantastic Farmer's Market	Superior Food Court, Main Street	33.285146	-111.1103	85173	3/26/2021 2:14:04 PM
1009707	Surfside Beach Farmers Market	Intersection of Surfside Drive and Willow Drive	33.6069616	-78.9743641	29575	1/27/2021 3:28:58 PM
1008173	Surfside Sunset Market	Veteran's Pkwy & Surfside Blvd	26.608161	-82.024341	33991	7/27/2018 9:54:19 AM
1020149	Surprise Valley Farmers Market	501 Main	41.527832	-120.171665	96104	8/21/2020 12:10:28 AM
1019481	Sustain Greenville Farmers Market	N1915 Julius Dr	44.311141	-88.557375	54942	4/24/2019 5:11:29 PM
1021643	Sustainable Food Center Farmers' Market Downtown	422 Guadalupe St	30.267660	-97.747306	78701	12/10/2021 3:15:41 PM
1021644	Sustainable Food Center Farmers' Market Sunset Valley	3200 Jones Rd	30.230977	-97.807494	78745	12/10/2021 3:20:30 PM
1002765	Suttons Bay Farmers Market	Intersection of M22 & M204	44.980186	-85.647075	49682	2/1/2021 3:00:49 PM
1019981	Suwanee Farmers Market	330 Town Center Ave	34.056170	-84.063354	30024	7/29/2020 11:32:59 AM
1021313	Swarthmore Farmers Market	121 Park Avenue	39.901671	-75.348771	19081	1/26/2021 2:43:34 PM
1018923	Sweetwater Sunday Market	6942 West Comanche Avenue	27.999259	-82.560612	33634	1/31/2018 4:02:17 PM
1019015	Tahoe City Farmers Market Thursday CFM	400 N Lake Blvd	39.169938	-120.141130	96145	8/4/2020 8:24:25 AM
1020036	Tamarack Junction Casino Farmers' Market	13101 So. Virginia Street	39.416292	-119.755381	89511	8/4/2020 4:33:39 PM
1018476	Taos Farmers' Market	400 Camina de la Placita	36.407207	-105.574539	87571	8/14/2018 4:56:11 PM
1020073	Taylorsville Farmers Market Inc.	751 Taylorsville Rd	38.03192	-85.344893	40071	8/17/2020 5:35:19 PM
1011738	TD Saturday Market	Main Street at West Court Street	34.8485031	-82.4000115	29601	7/31/2018 1:38:02 PM
1019138	Team Jaffrey Farmers Market	28 Main St	42.815213	-72.023787	03452	6/21/2018 5:55:59 AM
1003982	Telluride Farmers' Market	South Oak St	37.9368430	-107.8130860	81435	7/26/2018 10:57:00 PM
1020147	Temescal Urban Village Farmers' Market	5300 Claremont Ave.	37.839774	-122.259736	94618	8/20/2020 7:45:49 PM
1019075	Temple Terrace Farmers' Market	11302 N 56th St	28.0509640	-82.3941250	33617	4/26/2018 8:36:35 PM
1021694	Tenino Farmers Market	po Box 554	46.853829	-122.860375	98589	2/8/2022 12:49:42 PM
1018994	Terra Square Farmers Market	3380 Chicago Dr.	42.8677383	-85.8654557	49426	1/4/2021 12:28:47 PM
1010998	Terre Haute Farmers Market	2800 Poplar Street	39.464145	-87.376070	47803	3/26/2020 5:13:53 PM
1000710	Texas Farmers' Market at Lakeline	Lakeline Mall parking lot, behind Sears & Dillard's	30.469036	-97.806683	78613	9/16/2020 11:09:37 AM
1021616	Texas Farmers' Market at Mueller	2006 Philomena St.	30.300107	-97.703135	78723	9/16/2021 4:54:39 PM
1018279	Texas Township Farmers' Market	7110 West Q Ave	42.201444	-85.687996	49009	7/31/2018 9:42:42 AM
1021235	The 'Whee Market	113 Market Street	35.301188	-83.185690	28723	1/11/2021 3:31:32 PM
1021204	The Albemarle Farmers Market	Towncenter lane	38.126837	-78.445556	22911	9/10/2020 6:57:22 PM
1020049	The American Legion Farmers Market	2 S Artillery Dr	33.919521	-80.361114	29150	8/6/2020 3:12:09 PM
1019047	The Ballpark Farmers & Artisan Market	7 Ballpark way	43.514488	-70.391653	04064	4/9/2018 12:29:55 PM
1019933	The Berlin Farmers Market	Pitts Street and Commerce Street	38.325383	-75.219388	21811	1/6/2021 11:17:53 AM
1021203	The BLVD Market	Lancaster BLVD	34.697730	-118.142518	93534	9/10/2020 5:16:36 PM
1019596	The Capital Market of 20743	111 Capitol Heights Blvd	38.887555	-76.913335	20743	6/24/2019 10:41:46 PM
1018959	The Clarksville Downtown Market	One Public Square	36.528219	-87.361048	37040	1/2/2019 12:46:53 PM
1021254	The Corner Farmers Market	2200 Walker Avenue	36.069019	-79.828293	27403	12/30/2020 3:13:31 PM
1019181	The cornwall farmers market	183 main street	41.442234	-74.059815	12518	7/26/2018 4:12:54 PM
1019303	The Creede Farmers and Local Artisan Market	001 - 1st Street	37.852344	-106.926949	81130	10/11/2018 2:45:13 PM
1019544	The East End Farmer’s Market	13060 Factory Lane	38.286927	-85.508543	40245	5/27/2019 3:22:16 AM
1019775	The Fairfield Farmers Market	411 Wessel Drive	39.334042	-84.563916	45014	3/3/2020 1:17:11 PM
1019931	the Farm Market	Main St	32.920178	-107.569106	88042	6/22/2020 5:11:04 PM
1019948	The Farm Market at Mill No. 5	250 Jackson Street, 5th Floor	42.641166	-71.312805	01852	1/4/2021 3:44:06 PM
1019166	The Farmers Market at Maryland	3900 Campus Drive	38.985968	-76.947513	20742	7/12/2018 4:14:34 PM
1019626	The Farmers Market at Tiffany Farms	156 Sterling City Road	41.4878526	-72.101949	06371	7/15/2019 8:47:35 PM
1019751	The Farmers’ Market at Rutherfurd Hall	1686 county road 517	40.914599	-74.813622	07820	2/9/2020 11:24:02 AM
1021304	The Fountain Farmers' Market	The Singing Fountain	39.929934	-75.163171	19147	1/26/2021 1:50:55 PM
1019697	The Fresh MARTA Market - Bankhead Rail Station   Wednesdays  3:00-7:00p.m.	1335 Donald Lee Hollowell Parkway	33.773326	-84.426967	\N	9/16/2019 4:45:39 PM
1019700	The Fresh MARTA Market - College Park Rail Station   Thursdays  3:00-7:00p.m.	3800 Main Street	33.638149	-84.46008	30337	9/16/2019 4:41:20 PM
1019699	The Fresh MARTA Market - Five Points Rail Station   Fridays  3:00-7:00p.m.	30 Alabama Street SW	33.755202	-84.390574	30303	9/16/2019 4:35:02 PM
1019698	The Fresh MARTA Market - H.E. Holmes Rail Station   Wednesdays  3:00-7:00p.m.	70 Hamilton E. Holmes	33.764764	-84.476405	30311	9/16/2019 4:29:45 PM
1019696	The Fresh MARTA Market - Tuesdays - West End Station	\N	33.728652	-84.416667	\N	9/16/2019 4:36:48 PM
1021276	The Groves Marketplace	11939 Madera Run Pkwy	29.957574	-95.188057	77346	8/19/2021 11:25:41 AM
1021619	The Historic City Market	213 Market St SE 3rd Floor, Downtown Roanoke Inc.	37.271606	-79.939064	24011	9/27/2021 2:07:30 PM
1012357	The Indian Shores Sunday Morning Market	19305 Gulf Blvd	27.847880	-82.842837	33785	7/26/2018 5:02:25 PM
1019001	The Lewis Co. Farmers Market, Inc.	210 Center Ave	39.037553	-80.465764	26452	3/13/2018 9:05:29 AM
1021659	The LMH Market	1408 Short Eleventh St	40.154175	-89.385624	62656	1/10/2022 9:41:33 PM
1019504	The Market at Long Valley	66 East Mill Road	40.784492	-74.770016	07853	5/3/2019 9:56:38 AM
1019966	The Market at Second Stage	194 Second St.	37.583162	-79.048809	24521	1/20/2021 4:47:54 PM
1018422	The Market at Town Square	492 Hill St.	43.845375	-88.960382	54941	7/26/2018 4:08:33 PM
1021702	The Market at White River State Park	801 W Washington St.	39.767371	-86.171313	46204	2/14/2022 9:28:55 AM
1016917	The Market in Petersburg, Alaska	1st and Gjoa	56.811930	-132.955913	99833	7/27/2018 2:41:09 PM
1019928	The Marketplace at Lee Branch, Lee Branch Farmers Market	611 Doug Baker Blvd	33.406440	-86.666868	35242	6/20/2020 8:05:22 AM
1011497	The Markets at Shrewsbury	12025 Susquehanna Trail S	39.793503	-76.730703	17327	12/28/2018 4:00:06 PM
1019517	The Monroe Farmers’ Market	7 Fan Hill Road	41.332210	-73.207774	06468	5/9/2019 10:21:38 PM
1002101	The Orange Farmers Market	135 East Main st	42.5907340	-72.3033449	01364	7/27/2018 9:28:45 PM
1019739	The Orchard Farmers Market	14697 Delaware St	39.961115	-104.992071	80023	1/26/2020 12:39:42 AM
1019826	The Original Gresham Farmers Market	401 NE Second St.	45.499582	-122.426975	97030	4/6/2020 11:19:56 AM
1019975	The People’s Market	3220 E 3rd St.	39.164192	-86.491053	47403	1/11/2021 5:46:42 PM
1018628	The Petaluma East Side Farmers' Market	320 N McDowell Blvd	38.252337	-122.630899	94954	8/6/2020 10:20:47 AM
1018624	The Springs Community Farmers' Market	Parking lot at Boyes Blvd & Hwy 12	38.314330	-122.482053	95476	8/6/2020 10:14:39 AM
1021499	The St. James Farmers Market	304 Armstrong Blvd n	43.9784291	-94.614044	56081	6/2/2021 10:13:04 PM
1000278	The Territory Farmers' Market	2000 Territory Drive	42.404443	-90.313530	61036	9/10/2020 4:27:17 PM
1020015	The Township of Little Falls Farmers Market	225 Main St	40.882225	-74.234683	07424	2/23/2021 2:44:33 PM
1010798	The Village Farmers Market on California Street	625 Booth Street	39.514749	-119.827646	89509	8/4/2020 4:24:35 PM
1012799	The West River Farmers Market	2242 N. Main St.	43.228259	-72.821619	05148	8/3/2020 11:41:37 AM
1021586	The Wilmington Farmers Market	5329 Oleander Dr	34.208950	-77.860425	28403	7/28/2021 4:52:37 PM
1008826	The Woodland Farmers Market	250 First Street	38.6792311	-121.7737712	95695	8/3/2020 11:30:27 AM
1008827	The Woodland Farmers Market at Woodland Healthcare	Corner of Cottonwood and Gibson Rd	38.663686	-121.793045	95695	8/3/2020 11:28:08 AM
1019228	Thief River Falls Farmers Market	Corner of 3rd Street and Duluth Ave.	48.118841	-96.184263	56701	8/9/2018 11:30:07 AM
1017961	Thursday Marin Farmers Market	Avenue of the Flags, San Rafael , California 94903	38.001229	-122.534505	94903	7/26/2018 6:08:11 PM
1009802	Tigard Farmers Market	Burnham Street at Main Street	45.429956	-122.772142	\N	7/26/2018 4:00:17 PM
1021562	Titusville Open Air Market	11652 Hydetown Road	41.636919	-79.701982	16354	7/8/2021 6:37:02 PM
1021744	Tiverton Farmer's Market	10 Quintal Drive	41.629479	-71.158928	02878	3/31/2022 3:57:05 PM
1021447	Tontitown Farmers' Market	235 E. Henri De Tonti Blvd	36.175764	-94.232501	72770	4/21/2021 10:58:25 AM
1019963	Torrington WY Farmers Market	21st & Main Street	42.064541	-104.184071	82240	7/17/2020 12:07:55 AM
1021490	Tosa Farmers Market	7720 Harwood Ave	43.048733	-88.008791	53213	5/29/2021 12:07:12 PM
1019393	Town of Hillsville Farmers Market	410 N. Main Street	36.766222	-80.736200	24343	2/17/2019 11:39:59 AM
1019213	Town of Wadley Farmers Market	Main Street	33.123400	-85.573055	36276	8/6/2018 9:48:24 AM
1006324	Townshend Farmers Market	6573 Route 30	43.084256	-72.711717	05359	3/4/2021 5:48:17 PM
1021745	Travelers Rest Farmers Market	235 Trailblazer Lane	34.955543	-82.442632	29690	4/1/2022 3:20:44 PM
1019638	Treasure Lake Farmers Market and Artisan Faire	95 Coral Reef	41.201813	-78.704999	15801	7/24/2019 9:11:25 AM
1021343	Tremont Farmers Market	1200 Startkweather Ave	41.479328	-81.690301	44113	2/5/2021 1:55:47 PM
1018933	Trout Creek Farmers Market	Trout Creek Park	47.832429	-115.587957	59874	2/7/2018 9:59:08 PM
1020002	Troy Waterfront Farmers Market	Riverfront Park	42.732715	-73.691288	12180	7/31/2020 12:58:07 PM
1019632	Tuesday Farmers Market at Meridianville	175 Monroe Road	34.859086	-86.575130	35759	7/18/2019 1:37:41 PM
1018397	Tuesday Market at Bloomington Community Farmers Market	6th and Madison Streets	39.167687	-86.537883	47404	1/3/2019 9:17:40 AM
1021576	Tuesday Market in Library Park	200 Park Street	39.043583	-122.913879	95453	7/22/2021 7:03:10 PM
1018283	Tupelo Farmers' Depot	415 South Spring Street	34.253733	-88.704327	38804	7/26/2018 4:02:38 PM
1019349	Tuscaloosa River Market	1900 Jack Warner Pkwy	33.216479	-87.562834	35401	1/7/2019 4:44:33 PM
1012573	Twin Bridges ALL YEAR Farmers' Market	Main Street City Park and Fairgrounds	45.542747	-112.33373	59754	1/6/2021 11:12:40 AM
1005493	Twin City Farmers Market	106 Avenue A	41.787255	-89.697172	61081	1/4/2021 9:26:38 AM
1006169	Two Rivers Farmers/Crafter Market	\N	44.150114	-87.569392	54241	7/30/2018 12:50:29 AM
1018968	Union County Farm & Craft Market	106 Lakeside Drive	34.716023	-81.614994	29379	1/27/2021 10:39:31 AM
1019215	Union County Farmers Market	290 Farmers Market Way	34.886298	-83.950669	30512	1/5/2021 1:28:05 PM
1019925	Union County Farmers' Market	115 Durham Drive	36.237614	-83.822800	37807	6/19/2020 1:42:52 PM
1010158	Union Farmers Market	280 Common Road	44.211498	-69.274562	04862	7/26/2018 6:41:12 PM
1019540	Union Square Farmers Market	66-70 Union Square	42.379761	-71.094533	02143	5/23/2019 11:00:33 AM
1018634	Union Street Farmers Market @ Celebration Pointe	4949 Celebration Pointe Ave	29.625490	-82.395520	32608	1/5/2021 5:33:52 PM
1021305	University Square Farmers' Market	3600 Walnut Street	39.953276	-75.194883	19104	1/26/2021 1:54:33 PM
1019764	Upper Arlington Farmers Market	2850 Tremont Rd	40.013849	-83.066903	43221	2/26/2020 4:45:10 PM
1021726	Uptown Farmers Market	4620 N. Broadway	41.965832	-87.657972	60640	3/4/2022 1:45:19 PM
1001886	Uptown Greenville Umbrella Market	Fifth Street and Evans Street	35.611005	-77.373338	27858	1/5/2021 5:58:18 PM
1019105	Uptown Market	220 Maxwell Avenue	34.1903885	-82.1638058	29646	5/17/2018 1:59:06 PM
1019448	Uptown Westerville Farmers' Market	62 N. State St.	40.127570	-82.932051	43081	4/1/2019 10:30:42 AM
1019342	Urban Harvest Farmers Market	2752 Buffalo Speedway	29.741093	-95.431103	77027	1/3/2019 11:33:41 AM
1018852	Urbana Farmers' Market	102 Capitol Ave	42.223981	-91.873662	52345	9/13/2020 8:22:24 AM
1019498	Urbana Library Farmers' Market	9020 Amelung Street	39.331636	-77.354470	21704	4/29/2019 5:40:58 PM
1005631	USDA Farmers Market	Corner 12th St. & Independence Ave. SW	38.887743	-77.028494	20250	7/2/2020 2:41:51 PM
1001999	Utica Farmers Market	Chancellor Park, Elizabeth St.	43.096382	-75.225983	13501	1/27/2021 11:13:03 AM
1018535	Vance County Regional Farmers Market	210 Southpark Dr.	36.3378971	-78.4244013	27536	1/13/2021 11:52:31 AM
1018650	West LA Farmers Market	1600 Purdue Ave.	34.045724	-118.450674	90025	12/29/2018 12:51:17 PM
1019692	Vanderbilt Farmers Market	Galleria Shoppes at Vanderbilt	26.246337	-81.771054	34109	9/10/2019 10:10:31 AM
1012325	Vashon Farmers Market - Saturday	17519 Vashon Highway SW	47.447921	-122.460758	98070	1/25/2021 1:47:42 PM
1018597	Vermillion Area Farmers Market Summer Saturday Markets	Main and Market Streets	42.779219	-96.934150	57069	7/31/2018 2:55:48 PM
1018598	Vermillion Area Farmers Market Winter Markets	515 High Street	42.7851033	-96.9346099	57069	7/31/2018 2:58:56 PM
1019078	Vermont Farmers Market	Depot Park (at the Walmart Shopping Plaza)	43.605826	-72.980071	05701	8/3/2020 1:43:51 PM
1019080	Vermont Farmers Market	251 West Street	43.607916	-72.985592	05701	4/30/2018 11:31:37 AM
1019182	Vernon County Farmers Market	PO Box 873	37.843772	-94.340102	64772	7/26/2018 4:22:19 PM
1019952	Vernon Hills Park District Farmers Market	Lakeview Parkway and Hawthorn Parkway	42.241619	-87.962265	60061	7/7/2020 5:39:54 PM
1020048	Verona Farmers Market	18 Gov Center Ln	38.193744	-79.010219	24482	2/9/2022 4:15:49 PM
1012247	Vicksburg Farmers' Market	300 N. Richardson	42.126553	-85.528345	49097	7/26/2018 7:12:08 PM
1019513	Victoria Farmers' Market	2805 North Navarro	28.821562	-97.000968	77901	1/5/2021 4:07:42 PM
1012297	Village Market- Slavic Village	5106 Fleet Ave	41.455724	-81.654595	44105	7/31/2018 10:00:19 AM
1018155	Village of Constantine Farmers' Market	165 N Washington St	41.843957	-85.670007	49042	7/27/2018 8:50:29 AM
1019645	Village of Lemont Farmers Market, "Tuesday's on Talcott"	Stephen Street & Talcott Avenue (behind LaDolce Vita)	41.675519	-87.998186	60439	7/29/2019 4:18:29 PM
1019156	Village of Skokie Farmers' Market	5127 Oakton Street	42.026029	-87.756755	60077	7/5/2018 12:47:15 PM
1006342	Vincennes Historic Farmers Market	102 N. Second St.	38.680610	-87.531359	47591	7/26/2018 4:12:06 PM
1021297	Vine Street Market at O'Fallon Station	212 E 1st Street	38.591615	-89.908925	62269	1/25/2021 2:43:03 PM
1018214	Vineyard Farmers Market	100 W. Shaw	36.8097606	-119.7910413	93704	12/26/2018 3:51:09 PM
1021487	Virginia Highland Farmers Market	1017 North Highland Avenue NE	33.782208	-84.354177	30306	5/26/2021 1:08:31 PM
1021251	Vizcaya Village Farmers Market	3250 S. Miami Ave	25.747026	-80.212735	33129	12/28/2020 1:24:48 PM
1018504	Voluntown Farmers' Market	195 Main Street	41.573913	-71.865502	06384	1/21/2021 12:36:35 PM
1001925	Voorheesville Farmers Market	68 Maple Ave.	42.649656	-73.930027	12186	1/25/2021 4:00:18 PM
1010394	Wabasha Downtown Farmers Market	Main Street West & Allegheny Avenue next to Hill’s Hardware	44.384124	-92.032633	55981	2/20/2021 10:23:01 AM
1019155	Waco Downtown Farmers Market	500 Washington Avenue	31.556820	-97.132941	76701	1/4/2021 5:27:06 PM
1021537	Wagoner Farmers Market	115 S Main Street	35.963528	-95.379596	74467	6/23/2021 12:46:31 AM
1005268	Wahiawa District Park (People's Open Market)	1139 A Kilani Avenue	21.500382	-158.022580	96786	3/20/2019 4:37:25 PM
1004574	Wahoo Farmers Market	Corner of 7th and Beech	41.212079	-96.617391	68066	7/30/2018 11:01:21 AM
1005263	Waiau District Park (People's Open Market)	98-1650 Kaahumanu Street	21.402403	-157.952992	96782	1/24/2019 3:52:32 PM
1005269	Waikele Community Park (People's Open Market)	94-870 Lumiana Street	21.453708	-157.971725	96767	1/24/2019 3:57:57 PM
1005264	Waimanalo Beach Park (People's Open Market)	41-741 Kalanianaole Highway.	21.331444	-157.694600	96795	1/24/2019 3:50:32 PM
1005266	Waipahu District Park (People's Open Market)	94-230 Paiwa Street	21.387839	-157.999449	96767	3/20/2019 4:54:48 PM
1019489	Wakefield	8100 Braddock Road	38.832801	-77.196229	22003	4/25/2019 2:07:36 PM
1021340	Wallingford Farmers Market	4800 Meridian Ave N	47.663924	-122.333359	98103	2/4/2021 4:43:53 PM
1020197	Walnut Creek Certified Farmers' Market	1799 Locust Street	37.902666	-122.040479	94596	8/27/2020 7:27:10 PM
1018219	Wapello County Farmers Market	\N	41.017422	-92.425855	52501	9/10/2020 10:33:56 PM
1021366	Washington on the Brazos Farmers Market	23400 Park Road 12	30.2145775	-96.403458	77880	2/24/2021 12:13:56 PM
1018552	Waterfront Farmers Market of Gig Harbor	3211 Harborview Drive	47.330952	-122.581273	98335	1/4/2021 12:21:44 PM
1020021	Waterloo Rotary Farm Market	22 Locust Street	42.903737	-76.865814	13165	8/3/2020 2:28:33 PM
1019394	Watertown, CT Farmers' Market	690 Thomaston Rd.	41.622580	-73.106489	06795	2/17/2019 12:54:20 PM
1018319	Watford Market	501 7th St SE	47.797315	-103.271392	58854	1/4/2021 5:19:08 PM
1001962	Waukon Farmers Market	850 Rossville Road	43.260191	-91.472878	52172	9/15/2020 4:42:23 PM
1011229	Way Green Local Fare Market	1460 n Augusta Ave	31.2357520	-82.3818511	31503	1/6/2021 3:12:02 PM
1019613	Wayland Farmers Market on Main Street	149 South Main Street	42.672620	-85.642864	49348	7/10/2019 1:49:29 PM
1004499	Wayland Winter Farmers' Market	397 Boston Post Road	42.363071	-71.369892	01778	1/4/2021 9:39:35 AM
1019016	Wayne County Farmers Market	Center & Main	38.299219	-111.420890	84775	3/18/2018 10:56:49 PM
1021559	Wayne County Farmers Market	200 Willow Ave. Route 6	41.566626	-75.251698	18431	7/4/2021 3:02:35 PM
1012485	Wayne State University Farmers Market	Warren and Woodward Ave	42.356528	-83.064645	48202	7/26/2018 4:12:18 PM
1020047	Waynesboro Farmers Market	215 McElroy St.	38.068559	-78.885734	22980	2/9/2022 4:11:37 PM
1019124	Waynesburg Farmers' Market	High Street	39.896462	-80.186112	15370	6/7/2018 9:39:40 AM
1021709	Weaver Library Farmers' Market	41 Grove Avenue	41.818333	-71.377570	02914	2/17/2022 12:24:04 PM
1021452	Webb City Farmers Market	106 East Tracy Street	37.140206	-94.462592	64870	4/28/2021 11:12:30 AM
1006093	Webster Springs Farmer's Market	Baker's Island	38.478420	-80.415459	26288	8/5/2020 9:25:35 AM
1000384	Webster's Joe Obbie Farmers' Market, Inc.	1028 Ridge Road, Webster Towne Center	43.212229	-77.452948	14580	1/5/2021 10:18:30 AM
1019864	Wednesday, Indiana County Farmers' Market	Wayne Avenue & Hospital Rd	40.610507	-79.159344	15701	5/15/2020 3:03:53 PM
1012212	Weiser Farmer's Market	1 State Street	44.244083	-116.971130	83672	7/26/2018 5:18:02 PM
1019641	Welcome Center Farmers Market	2931 Monroe Avenue	41.583893	-95.848181	51555	7/25/2019 2:04:15 PM
1019114	Wellfleet Farmers' Market	200 Main Street	41.939238	-70.027995	02667	5/25/2018 2:46:47 PM
1002890	Wellington Square Certified Farmers Market	4394 W Washington Blvd.	34.039790	-118.334753	90016	7/26/2018 7:32:01 PM
1002280	WesMar Farms Farm Stand	851 Couvillion St	31.035239	-91.979567	71355	12/21/2018 5:49:03 PM
1019067	West End Farmers Market	1210 Patterson Ave. SW	37.27783	-79.958472	24016	4/23/2018 4:46:45 PM
1021569	West Haven Farmers Market	355 Main Street	41.271879	-72.949946	06516	7/19/2021 12:33:47 PM
1011203	West Lafayette Farmers Market	3065 N Salisbury St	40.461469	-86.915836	47906	1/26/2021 11:25:42 AM
1019424	West Orange Farmers Market	80 Main Street	40.780392	-74.238131	07052	3/11/2019 12:02:58 PM
1019657	West Plains Area Farmers' Market	1380 Bill Virdon Blvd.	36.723987	-91.835774	65775	8/2/2019 12:24:47 PM
1019877	West Point Farmers Market	\N	41.837741	-96.705918	\N	5/27/2020 12:48:41 PM
1002177	West Point-Town of Highlands Farmers Market	Main street	41.36957	-73.96631	10928	8/2/2018 12:58:13 AM
1016908	West Town Health & Farmers Market	2233 W Division St	41.902872	-87.684396	60622	8/3/2018 11:00:23 AM
1019911	West Warwick Farmers Market	186 Providence St	41.713691	-71.516856	02893	6/5/2020 1:41:43 PM
1012204	Westbrook Village Second Sundays Marketplace	19251 N Westbrook Parkway	33.6581970	-112.2655960	85382	12/27/2018 10:10:53 AM
1010319	Westchase District Farmers Market	10503 Westheimer Road	29.736539	-95.560152	77042	7/31/2018 12:41:49 PM
1019509	Westcliffe Farm and Maker's Market	315 Main Street, Jess Price Park	38.136152	-105.466411	81252	5/6/2019 9:28:39 PM
1021367	Westerly Land Trust Farmers Market	61-85 Main Street	41.375089	-71.831720	02891	2/24/2021 1:53:38 PM
1019364	Western Greenbrier Farmers Market	Main and 11th st	37.972743	-80.760056	25962	1/28/2019 2:51:19 PM
1019444	Westerville Saturday Farmers Market	21 South State Street	40.123435	-82.913324	43081	1/4/2021 11:47:24 AM
1021274	Westfield Farmers Market	36 Court St	42.119742	-72.751662	01085	1/12/2021 10:19:48 PM
1019797	Westgate Farmers Market	2925 W. Broad Street	39.954491	-83.078781	43204	1/25/2021 7:51:33 PM
1021246	Westland Farmers & Artisan Market	1901 N. Carlson	42.319173	-83.380778	48185	11/30/2020 1:06:33 PM
1002816	Westminster Farmers' Market	21-33 Academy St. (Town Common)	42.541635	-71.906161	01473	7/27/2018 7:54:29 AM
1020070	Westport Rd Baptist Farmers Market	9705 Westport Road	38.288727	-85.571695	40241	8/17/2020 11:27:09 AM
1001661	Westside Community Market	750 University Row	43.076159	-89.470061	53705	1/29/2021 12:33:57 PM
1021217	Westside Community Market	750 University Row	43.076385	-89.470022	53705	9/17/2020 1:56:59 PM
1004515	Westside Farmers Market	510 W. Ottawa St.	42.734770	-84.559858	48933	7/26/2018 10:09:52 PM
1005280	Westside Santa Cruz Farmers' Market	Corner of Western Drive and Mission St.	36.9598	-122.057	95060	8/1/2018 2:17:51 PM
1020020	Westwood Village Farmers Market	1030 Broxton St	34.061784	-118.446530	90024	1/10/2021 12:38:25 PM
1021258	Weymouth Farmers Market	1 Wildcat Way	42.181987	-70.941897	02190	1/4/2021 9:25:07 AM
1020010	White House Farmers Market	105 College Street	36.467683	-86.653004	37188	8/3/2020 9:58:14 AM
1021488	White Mountains Market	1501 W White Mountain Blvd	34.146798	-109.970749	85929	5/27/2021 3:44:58 PM
1019955	White St. Saturday Market	26 White St.	36.404902	-93.741728	72632	7/10/2020 9:11:47 PM
1019392	Whitehaven Kulliye Farmers Market	3379 Millbranch Road	35.055288	-90.008281	38116	2/17/2019 10:22:17 AM
1020157	Whitley County Farmers Market	NIBROC Park	36.947000	-84.096509	40771	8/21/2020 10:21:39 AM
1020156	Whitley County Farmers Market (WCFM)	Billwoods Park	36.741975	-84.159267	40769	8/21/2020 10:12:21 AM
1019221	Whittier Farmers Market	2608 Blaisdell Ave S	44.955321	-93.280032	55408	8/7/2018 12:26:16 PM
1021495	WIC Clinic Callaghan Farmers' Market	4412 Callaghan Rd	29.472403	-98.525142	78228	6/1/2021 11:00:05 AM
1021497	WIC Clinic Naco-Perrin Farmers' Market	4020 Naco Perrin	29.472403	-98.525142	78217	6/1/2021 11:04:55 AM
1021498	WIC Clinic Pecan Valley Farmers' Market	802 Pecan Valley	29.472403	-98.525142	78220	6/1/2021 11:07:14 AM
1021496	WIC Clinic Salinas Farmers' Market	630 S General McMullen	29.472403	-98.525142	78237	6/1/2021 11:02:20 AM
1019878	Wilber Farmers Market	\N	40.64738	-97.114886	\N	5/27/2020 1:06:28 PM
1019069	Wild West Farmers Market	8116 19th St	33.578343	-101.996150	79407	4/24/2018 4:53:52 PM
1018274	Wilkes County Farmers' Market	842 CBD Loop	36.159075	-81.145200	28659	8/3/2020 11:24:55 AM
1019652	Wilkinsburg Thursday Open Market	225 Penn Avenue	40.445948	-79.890864	15221	7/31/2019 2:01:58 PM
1021720	Williamsburg Farmers Market	345 W. Duke of Gloucester Street	37.270966	-76.705462	23185	2/28/2022 12:34:20 PM
1019337	Williamson Farmers Market	54 3rd. Ave. W.	37.674029	-82.277984	25661	1/27/2021 8:47:15 AM
1020187	Willow Glen Farmers' Market	1425 Lincoln Avenue	37.296867	-121.819306	95125	8/24/2020 3:19:19 PM
1019433	Winchester Farmers Market	Larawy Rd	42.452024	-71.137946	01890	3/19/2019 12:50:14 PM
1019369	Winchester Farmers' Market	Meridian & Washington St.	40.1721	-84.977051	47394	2/1/2019 12:39:25 PM
1011274	Winchester Road Farmers Market	1262 Winchester Rd	34.8010920	-86.5264710	35811	1/9/2019 6:39:29 PM
1021231	Windmill Park Farmers Market in Cornville	9950 E CORNVILLE RD	34.739119	-111.908597	86325	9/27/2020 7:44:54 PM
1019229	Winnsboro Farmers' Market	Market Street	32.957692	-95.289646	75494	8/9/2018 1:14:16 PM
1019848	Winter Farmers Market by Grow Oak Ridge	323 Vermont Avenue	36.017239	-84.251024	37830	1/4/2021 2:46:53 PM
1019653	Winter Farmers Market presented by Bellin Health	333 Main Street	44.517943	-88.011250	54301	8/1/2019 11:57:05 AM
1019449	Winter Makers Market	420 W. 1st St.	42.850412	-106.329524	82601	4/1/2019 1:11:40 PM
1018925	Winters Farmers Market at The Crossing at Hollar Mill	883 Highland Avenue SE	35.7353920	-81.3258422	28602	2/5/2018 5:19:20 PM
1019463	Wisconsin Rapids Downtown Farmers Market	100-198 1st Avenue South	44.392924	-89.82674	54495	4/10/2019 11:51:18 AM
1008231	Wise Farmers' Market	309 E. Main Street	36.9768742	-82.5782570	24293	7/27/2018 3:41:13 PM
1019845	WNC Farmers Market	570 Brevard Road, Asheville, NC  28806	35.555133	-82.598648	28806	4/22/2020 9:13:10 AM
1020158	Wolfe County Farmers Market	640 S KY 15	37.727015	-83.542778	41301	8/21/2020 10:42:52 AM
1009027	Wolfeboro Area Farmers Market	233 South Main St	43.580593	-71.202747	03894	9/11/2020 12:14:43 PM
1019098	Wolfforth Farmers Market	8924 CR 7100	33.5197029	-102.0163305	79382	5/11/2018 10:06:56 PM
1020138	Woodford County Farmers Market	N. Gratz St.	38.149925	-84.682308	40347	8/20/2020 4:44:25 PM
1020168	Woodford County Farmers' Market	525 Marsailles Road	38.050275	-84.733856	40383	8/21/2020 2:54:29 PM
1019038	Woodstock Farm Festival	6 Maple Lane	42.040522	-74.117834	12498	4/4/2018 11:27:02 AM
1005140	Woodstock Farm Fresh Market	Market Street and Elm Street	34.100488	-84.520920	30188	7/27/2018 11:11:31 AM
1021317	Woodstock Farmers Market - Winter	11900 Country Club Rd.	42.310266	-88.435654	60098	1/26/2021 10:06:31 PM
1021386	Woodstock Farmers Market-Saturday Summer	112 S. Benton St.	42.310266	-88.435654	60098	3/12/2021 9:00:45 PM
1021385	Woodstock Farmers Market-Tuesday Summer	112 S. Benton St.	42.310266	-88.435654	60098	3/12/2021 6:58:49 PM
1011337	Woodward Farmers' Market Association	13th St. and Locust Ave.	36.4314963	-99.3957807	73801	5/19/2020 11:18:03 AM
1021328	Woolery Farmers' Market	2250 W Sunstone Dr	39.138753	-86.559788	47403	1/30/2021 8:58:12 AM
1019912	Woonsocket Farmers Market	450 Clinton St	42.007654	-71.504321	02895	6/5/2020 1:45:14 PM
1007309	Wrightstown Farmers Market	Middletown Grange 576 Penns Park Road	40.3368710	-75.106815	18940	1/26/2021 6:40:47 PM
1017915	Wytheville Farmers Market	210 W. Spring Street	36.9486397	-81.0833677	24368	1/7/2021 6:40:36 AM
1019708	Yardlet Farmers Market - Indoor Winter Market	65 N. Main St.	40.243417	-74.841627	19067	10/16/2019 11:19:52 AM
1018508	Yardley Farmers Market	Buttonwood Drive, Buttonwood Park	40.240829	-74.839997	19067	1/20/2021 2:50:54 PM
1007259	Yates County Cooperative Farm and Craft Market (Penn Yan Market)	Main Street, North of Elm Street	42.661345	-77.053889	14527	2/3/2019 12:29:07 PM
1002366	Yellow Green Farmers Market	1940 North 30th Road	26.030260	-80.169243	33021	8/3/2020 1:01:45 PM
1019508	Yorktown Farmers Marketplace	1901 South Tiger Drive	40.177147	-85.495124	47396	5/5/2019 10:31:00 PM
1019247	Your Neighborhood Farmers Market-CityCentre	800 Towne and County BLVD.	29.780472	-95.386342	77024	9/6/2018 5:06:10 PM
1019245	Your Neighborhood Farmers Market-LaCenterra at Cinco Ranch	23501 Cinco Ranch BLVD.	29.7413678	-95.7750405	77494	9/6/2018 4:05:02 PM
1019246	Your Neighborhood Farmers Market-Park Lakes	4503 Canyon Village  Trace Dr.	29.9415214	-95.2539369	77396	9/6/2018 4:58:02 PM
1019250	Your Neighborhood Farmers Market-Summerwood	14303 West Lake Houston Parkway	29.9341141	-95.1773832	77044	9/6/2018 5:23:03 PM
1019242	Your Neighborhood Farmers Market-The Groves	17317 Cathedral Pines Drive	29.988144	-95.26831	77346	9/6/2018 1:51:15 PM
1019244	Your Neighborhood Farmers Market-Towne Lake at Boardwalk	9945 Barker Cypress Road	29.9223808	-95.6872981	77443	9/6/2018 3:58:40 PM
1019327	Ypsilanti Farmers Market- Downtown	16 S Washington	42.240285	-83.614751	48197	12/11/2018 12:29:56 PM
1016909	Yreka Community Certified Farmers Market	1712 Fairlane Road	41.7070195	-122.6401341	96097	12/23/2018 5:34:09 PM
1021545	Yucaipa Certified Farmers Market	12062 California St	34.032512	-117.044913	92399	6/24/2021 2:27:32 PM
1019863	Zebulon Farm Fresh Market	103 N Arendell Ave	35.821835	-78.314111	27597	5/15/2020 10:36:59 AM
1019792	Zelienople-Harmony Farmer's Market	Beaver Street and South Division Street	40.792698	-80.130181	16063	3/7/2020 3:58:56 PM
\.



COPY public.payment_methods (payment_method_id, payment_method) FROM stdin;
1	Credit
2	WIC
3	WICcash
4	SFMNP
5	SNAP
\.



COPY public.products (product_id, product_name) FROM stdin;
1	Organic
2	Bakedgoods
3	Cheese
4	Crafts
5	Flowers
6	Eggs
7	Seafood
8	Herbs
9	Vegetables
10	Honey
11	Jams
12	Maple
13	Meat
14	Nursery
15	Nuts
16	Plants
17	Poultry
18	Prepared
19	Soap
20	Trees
21	Wine
22	Coffee
23	Beans
24	Fruits
25	Grains
26	Juices
27	Mushrooms
28	PetFood
29	Tofu
30	WildHarvested
\.



COPY public.reviews (review_id, fmid, rating, comment, created_at, user_id) FROM stdin;
1	1012634	4	good	2026-03-01 23:05:22.616544	1
2	1009959	5	excellent!	2026-03-01 23:06:07.93592	1
3	1010487	4	good	2026-03-02 18:15:37.062704	1
5	1004950	5	4	2026-03-04 23:54:22.340318	3
7	\N	4	ckgjg	2026-03-05 21:45:51.50303	7
8	1018304	5	love it	2026-03-05 21:57:51.313257	7
\.



COPY public.users (id, username, password, email, created_at, rol) FROM stdin;
3	Alex	$2b$12$rIvyq5MLFK1tBqu9EmPNNe6YRvCoPyWO4cCDjZUKqjp8etj20c0Z2	\N	2026-03-04 21:32:30.358629	app_user
1	Lolita	$2b$12$6cFoVSxHoejJScHCjUGoOuewkTH/8Acr.bwZ3dx2jaVDND95wpfDW		2026-03-02 23:59:28.270749	admin
6	Kate	$2b$12$C74feU.crssIoqQiVU44X.xer/w6QKS.dxYlC6sJSkKl1Y1NK8Ljy	kate@gmail.com	2026-03-05 20:54:21.849633	\N
7	Fred	$2b$12$dwM18cgrmZopYFL9CQevD.uUwGTkqzqgoEyQK7WE0Daaq4LyJmBrS		2026-03-05 21:42:40.630826	\N
\.



SELECT pg_catalog.setval('public.market_schedules_schedule_id_seq', 1, false);

SELECT pg_catalog.setval('public.payment_methods_payment_method_id_seq', 1, false);

SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);

SELECT pg_catalog.setval('public.reviews_review_id_seq', 8, true);

SELECT pg_catalog.setval('public.users_id_seq', 7, true);

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (zip);

ALTER TABLE ONLY public.market_media
    ADD CONSTRAINT market_media_pkey PRIMARY KEY (fmid);

ALTER TABLE ONLY public.market_payments
    ADD CONSTRAINT market_payments_pkey PRIMARY KEY (fmid, payment_method_id);

ALTER TABLE ONLY public.market_products
    ADD CONSTRAINT market_products_pkey PRIMARY KEY (fmid, product_id);

ALTER TABLE ONLY public.market_schedules
    ADD CONSTRAINT market_schedules_pkey PRIMARY KEY (schedule_id);

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_pkey PRIMARY KEY (fmid);

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (payment_method_id);

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);

ALTER TABLE ONLY public.market_payments
    ADD CONSTRAINT fk_market_payments_fmid FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;

ALTER TABLE ONLY public.market_products
    ADD CONSTRAINT fk_market_products_fmid FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT fk_markets_zip FOREIGN KEY (zip) REFERENCES public.locations(zip);

ALTER TABLE ONLY public.market_media
    ADD CONSTRAINT fk_media_fmid FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;

ALTER TABLE ONLY public.market_products
    ADD CONSTRAINT fk_products_fmid FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_reviews_markets FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_reviews_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.market_schedules
    ADD CONSTRAINT fk_schedules_fmid FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;

ALTER TABLE ONLY public.market_payments
    ADD CONSTRAINT market_payments_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(payment_method_id) ON DELETE CASCADE;

ALTER TABLE ONLY public.market_products
    ADD CONSTRAINT market_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_zip_fkey FOREIGN KEY (zip) REFERENCES public.locations(zip);

ALTER TABLE ONLY public.market_media
    ADD CONSTRAINT media_fmid_fkey FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_fmid_fkey FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;

ALTER TABLE ONLY public.market_schedules
    ADD CONSTRAINT schedules_fmid_fkey FOREIGN KEY (fmid) REFERENCES public.markets(fmid) ON DELETE CASCADE;


-- PostgreSQL database dump complete
--

