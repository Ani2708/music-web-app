--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-13 09:44:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16397)
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    album_id integer NOT NULL,
    album_name character varying(200) NOT NULL,
    release_date date
);


-- ALTER TABLE public.album OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16396)
-- Name: album_album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.album_album_id_seq OWNER TO postgres;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 219
-- Name: album_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.album_album_id_seq OWNED BY public.album.album_id;


--
-- TOC entry 232 (class 1259 OID 16501)
-- Name: appears_on; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appears_on (
    song_id integer NOT NULL,
    album_id integer NOT NULL
);


-- ALTER TABLE public.appears_on OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16413)
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    artist_id integer NOT NULL,
    name character varying(100) NOT NULL,
    country character varying(100)
);


-- ALTER TABLE public.artist OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16412)
-- Name: artist_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artist_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.artist_artist_id_seq OWNER TO postgres;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 223
-- Name: artist_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.artist_artist_id_seq OWNED BY public.artist.artist_id;


--
-- TOC entry 229 (class 1259 OID 16452)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    user_id integer,
    song_id integer,
    content text NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


-- ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16451)
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.comments_comment_id_seq OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 228
-- Name: comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments.comment_id;


--
-- TOC entry 233 (class 1259 OID 16516)
-- Name: contains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contains (
    user_id integer NOT NULL,
    playlist_name character varying(100) NOT NULL,
    song_id integer NOT NULL
);


-- ALTER TABLE public.contains OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16404)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    genre_name character varying(100) NOT NULL,
    description text
);


-- ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16403)
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.genre_genre_id_seq OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 221
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;


--
-- TOC entry 230 (class 1259 OID 16471)
-- Name: listening_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listening_history (
    user_id integer NOT NULL,
    song_id integer NOT NULL,
    date_played date NOT NULL
);


-- ALTER TABLE public.listening_history OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16486)
-- Name: performed_by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.performed_by (
    song_id integer NOT NULL,
    artist_id integer NOT NULL
);


-- ALTER TABLE public.performed_by OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16441)
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
    user_id integer NOT NULL,
    playlist_name character varying(100) NOT NULL,
    creation_date date
);


-- ALTER TABLE public.playlist OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16420)
-- Name: song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.song (
    song_id integer NOT NULL,
    title character varying(200) NOT NULL,
    upload_date date,
    user_id integer,
    album_id integer,
    genre_id integer
);


-- ALTER TABLE public.song OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16419)
-- Name: song_song_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.song_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.song_song_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 225
-- Name: song_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.song_song_id_seq OWNED BY public.song.song_id;


--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);


-- ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4788 (class 2604 OID 16400)
-- Name: album album_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album ALTER COLUMN album_id SET DEFAULT nextval('public.album_album_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 16416)
-- Name: artist artist_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist ALTER COLUMN artist_id SET DEFAULT nextval('public.artist_artist_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16455)
-- Name: comments comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 16407)
-- Name: genre genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16423)
-- Name: song song_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song ALTER COLUMN song_id SET DEFAULT nextval('public.song_song_id_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 16393)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4978 (class 0 OID 16397)
-- Dependencies: 220
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.album VALUES (1, 'Ylang Ylang EP', '2019-11-12');
INSERT INTO public.album VALUES (2, 'BRAT', '2024-06-07');
INSERT INTO public.album VALUES (3, 'Born in the Wild', '2024-06-06');
INSERT INTO public.album VALUES (4, 'Who Really Cares', '2016-02-25');
INSERT INTO public.album VALUES (5, 'Fable', '2024-10-25');
INSERT INTO public.album VALUES (6, 'VISION', '2002-10-09');
INSERT INTO public.album VALUES (7, 'LOVE ALL SERVE ALL', '2002-03-23');
INSERT INTO public.album VALUES (8, 'Abyss', '2015-03-10');
INSERT INTO public.album VALUES (9, 'Petals to Thorns', '2023-05-26');
INSERT INTO public.album VALUES (10, 'Immunity', '2019-08-02');


--
-- TOC entry 4990 (class 0 OID 16501)
-- Dependencies: 232
-- Data for Name: appears_on; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appears_on VALUES (1, 7);
INSERT INTO public.appears_on VALUES (2, 7);
INSERT INTO public.appears_on VALUES (3, 7);
INSERT INTO public.appears_on VALUES (4, 2);
INSERT INTO public.appears_on VALUES (5, 2);
INSERT INTO public.appears_on VALUES (6, 2);
INSERT INTO public.appears_on VALUES (7, 1);
INSERT INTO public.appears_on VALUES (8, 1);
INSERT INTO public.appears_on VALUES (9, 1);
INSERT INTO public.appears_on VALUES (10, 4);
INSERT INTO public.appears_on VALUES (11, 4);
INSERT INTO public.appears_on VALUES (12, 4);
INSERT INTO public.appears_on VALUES (13, 5);
INSERT INTO public.appears_on VALUES (14, 5);
INSERT INTO public.appears_on VALUES (15, 5);
INSERT INTO public.appears_on VALUES (16, 9);
INSERT INTO public.appears_on VALUES (17, 9);
INSERT INTO public.appears_on VALUES (18, 9);
INSERT INTO public.appears_on VALUES (19, 6);
INSERT INTO public.appears_on VALUES (20, 6);
INSERT INTO public.appears_on VALUES (21, 6);
INSERT INTO public.appears_on VALUES (22, 8);
INSERT INTO public.appears_on VALUES (23, 8);
INSERT INTO public.appears_on VALUES (24, 8);
INSERT INTO public.appears_on VALUES (25, 3);
INSERT INTO public.appears_on VALUES (26, 3);
INSERT INTO public.appears_on VALUES (27, 3);
INSERT INTO public.appears_on VALUES (28, 10);
INSERT INTO public.appears_on VALUES (29, 10);
INSERT INTO public.appears_on VALUES (30, 10);


--
-- TOC entry 4982 (class 0 OID 16413)
-- Dependencies: 224
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.artist VALUES (1, 'Fujii Kaze', 'Japan');
INSERT INTO public.artist VALUES (2, 'Charli xcx', 'UK');
INSERT INTO public.artist VALUES (3, 'FKJ', 'France');
INSERT INTO public.artist VALUES (4, 'TV girl', 'USA');
INSERT INTO public.artist VALUES (5, 'Gigi Perez', 'USA');
INSERT INTO public.artist VALUES (6, 'd4vd', 'USA');
INSERT INTO public.artist VALUES (7, 'Double', 'Japan');
INSERT INTO public.artist VALUES (8, 'Pastel Ghost', 'USA');
INSERT INTO public.artist VALUES (9, 'Tems', 'Nigeria');
INSERT INTO public.artist VALUES (10, 'Clairo', 'USA');


--
-- TOC entry 4987 (class 0 OID 16452)
-- Dependencies: 229
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comments VALUES (1, 1, 5, 'This beat is so smooth, perfect for late-night drives.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (2, 2, 12, 'Her voice feels like a warm hug. Love this track.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (3, 3, 8, 'The production on this is insane. Who else is obsessed?', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (4, 4, 20, 'Found this gem last week and now it is on repeat.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (5, 5, 3, 'The lyrics hit different at 2 AM. So relatable.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (6, 6, 15, 'This song got me through my finals, no joke.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (7, 7, 22, 'The melody is like floating on a cloud. Beautiful.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (8, 8, 9, 'Never skip this one. That bassline is everything.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (9, 9, 27, 'Underrated. More people need to hear this.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (10, 10, 14, 'The vibe is immaculate. Whole album is a masterpiece.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (11, 4, 7, 'Yes. Just yes.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (12, 7, 18, 'Play this at my wedding.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (13, 5, 1, 'Instant mood booster.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (14, 9, 25, 'Why is this so short? I need a 10-hour version.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (15, 2, 30, 'The guitar riff >>>', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (16, 3, 11, 'Takes me back to summer 2020. What a time.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (17, 6, 6, 'I miss music like this. Bring it back.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (18, 10, 19, 'This artist never misses. Ever.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (19, 1, 4, 'Wish I could hear this for the first time again.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (20, 8, 10, 'Sounds like golden hour in song form.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (21, 5, 2, 'Me: trying to be productive / This song: exists', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (22, 7, 13, 'When the chorus hits and you forget all your problems.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (23, 4, 16, 'POV: You''re the main character with this on blast.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (24, 9, 21, 'Who else is here after that TikTok trend?', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (25, 3, 23, 'This is my Roman Empire.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (26, 2, 28, 'If this comes on, I''m dropping everything to vibe.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (27, 10, 29, 'The kind of song that makes you stare at the ceiling.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (28, 6, 17, '10/10 would recommend to my friend.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (29, 1, 24, 'This is my soul''s soundtrack.', '2025-05-21 22:09:11.647712');
INSERT INTO public.comments VALUES (30, 8, 26, 'How is this so good? I demand answers.', '2025-05-21 22:09:11.647712');


--
-- TOC entry 4991 (class 0 OID 16516)
-- Dependencies: 233
-- Data for Name: contains; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contains VALUES (1, 'Dreamy Nights', 10);
INSERT INTO public.contains VALUES (1, 'Dreamy Nights', 11);
INSERT INTO public.contains VALUES (1, 'Dreamy Nights', 28);
INSERT INTO public.contains VALUES (1, 'Dreamy Nights', 16);
INSERT INTO public.contains VALUES (1, 'Dreamy Nights', 29);
INSERT INTO public.contains VALUES (2, 'Electro Energy', 4);
INSERT INTO public.contains VALUES (2, 'Electro Energy', 5);
INSERT INTO public.contains VALUES (2, 'Electro Energy', 22);
INSERT INTO public.contains VALUES (2, 'Electro Energy', 23);
INSERT INTO public.contains VALUES (2, 'Electro Energy', 13);
INSERT INTO public.contains VALUES (3, 'Retro City Pop', 1);
INSERT INTO public.contains VALUES (3, 'Retro City Pop', 2);
INSERT INTO public.contains VALUES (3, 'Retro City Pop', 19);
INSERT INTO public.contains VALUES (3, 'Retro City Pop', 20);
INSERT INTO public.contains VALUES (3, 'Retro City Pop', 21);
INSERT INTO public.contains VALUES (4, 'Lo-Fi Chill', 16);
INSERT INTO public.contains VALUES (4, 'Lo-Fi Chill', 17);
INSERT INTO public.contains VALUES (4, 'Lo-Fi Chill', 18);
INSERT INTO public.contains VALUES (4, 'Lo-Fi Chill', 28);
INSERT INTO public.contains VALUES (4, 'Lo-Fi Chill', 30);
INSERT INTO public.contains VALUES (5, 'Jazz & House Grooves', 7);
INSERT INTO public.contains VALUES (5, 'Jazz & House Grooves', 8);
INSERT INTO public.contains VALUES (5, 'Jazz & House Grooves', 9);
INSERT INTO public.contains VALUES (5, 'Jazz & House Grooves', 19);
INSERT INTO public.contains VALUES (5, 'Jazz & House Grooves', 20);
INSERT INTO public.contains VALUES (6, 'Deep R&B Vibes', 13);
INSERT INTO public.contains VALUES (6, 'Deep R&B Vibes', 14);
INSERT INTO public.contains VALUES (6, 'Deep R&B Vibes', 25);
INSERT INTO public.contains VALUES (6, 'Deep R&B Vibes', 26);
INSERT INTO public.contains VALUES (6, 'Deep R&B Vibes', 1);
INSERT INTO public.contains VALUES (7, 'Synthwave Escape', 22);
INSERT INTO public.contains VALUES (7, 'Synthwave Escape', 23);
INSERT INTO public.contains VALUES (7, 'Synthwave Escape', 24);
INSERT INTO public.contains VALUES (7, 'Synthwave Escape', 5);
INSERT INTO public.contains VALUES (7, 'Synthwave Escape', 10);
INSERT INTO public.contains VALUES (8, 'Afro-Soul Rhythms', 25);
INSERT INTO public.contains VALUES (8, 'Afro-Soul Rhythms', 26);
INSERT INTO public.contains VALUES (8, 'Afro-Soul Rhythms', 27);
INSERT INTO public.contains VALUES (8, 'Afro-Soul Rhythms', 7);
INSERT INTO public.contains VALUES (8, 'Afro-Soul Rhythms', 14);
INSERT INTO public.contains VALUES (9, 'Acoustic Serenade', 28);
INSERT INTO public.contains VALUES (9, 'Acoustic Serenade', 29);
INSERT INTO public.contains VALUES (9, 'Acoustic Serenade', 30);
INSERT INTO public.contains VALUES (9, 'Acoustic Serenade', 2);
INSERT INTO public.contains VALUES (9, 'Acoustic Serenade', 17);
INSERT INTO public.contains VALUES (10, 'Pop Fusion', 4);
INSERT INTO public.contains VALUES (10, 'Pop Fusion', 1);
INSERT INTO public.contains VALUES (10, 'Pop Fusion', 25);
INSERT INTO public.contains VALUES (10, 'Pop Fusion', 28);
INSERT INTO public.contains VALUES (10, 'Pop Fusion', 19);


--
-- TOC entry 4980 (class 0 OID 16404)
-- Dependencies: 222
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genre VALUES (1, 'J-Pop / R&B', 'A blend of Japanese pop and contemporary R&B influences');
INSERT INTO public.genre VALUES (2, 'Hyperpop / Electropop', 'High-energy, experimental pop with electronic elements');
INSERT INTO public.genre VALUES (3, 'French House / Nu-Jazz', 'Smooth, jazzy electronic music with house influences');
INSERT INTO public.genre VALUES (4, 'Indie Pop / Dream Pop', 'Ethereal, lo-fi pop with nostalgic vibes');
INSERT INTO public.genre VALUES (5, 'Alternative R&B', 'Moody, introspective R&B with indie influences');
INSERT INTO public.genre VALUES (6, 'Bedroom Pop / Lo-Fi', 'DIY-style pop with intimate, raw production');
INSERT INTO public.genre VALUES (7, 'City Pop / J-Funk', 'Japanese retro funk and pop from the 80s/90s revival');
INSERT INTO public.genre VALUES (8, 'Witch House / Synthwave', 'Dark, atmospheric electronic music with haunting melodies');
INSERT INTO public.genre VALUES (9, 'Afro-R&B / Soul', 'Nigerian-influenced R&B with soulful, rhythmic grooves');
INSERT INTO public.genre VALUES (10, 'Indie Folk / Soft Rock', 'Gentle, acoustic-driven music with introspective lyrics');


--
-- TOC entry 4988 (class 0 OID 16471)
-- Dependencies: 230
-- Data for Name: listening_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.listening_history VALUES (1, 5, '2024-03-15');
INSERT INTO public.listening_history VALUES (1, 12, '2024-03-14');
INSERT INTO public.listening_history VALUES (1, 28, '2024-03-12');
INSERT INTO public.listening_history VALUES (1, 7, '2024-02-28');
INSERT INTO public.listening_history VALUES (1, 19, '2023-12-05');
INSERT INTO public.listening_history VALUES (2, 1, '2024-03-16');
INSERT INTO public.listening_history VALUES (2, 2, '2024-03-16');
INSERT INTO public.listening_history VALUES (2, 3, '2024-03-15');
INSERT INTO public.listening_history VALUES (2, 21, '2024-03-10');
INSERT INTO public.listening_history VALUES (2, 27, '2024-01-22');
INSERT INTO public.listening_history VALUES (3, 4, '2024-03-16');
INSERT INTO public.listening_history VALUES (3, 5, '2024-03-15');
INSERT INTO public.listening_history VALUES (3, 13, '2024-03-14');
INSERT INTO public.listening_history VALUES (3, 22, '2024-02-29');
INSERT INTO public.listening_history VALUES (3, 8, '2023-11-18');
INSERT INTO public.listening_history VALUES (4, 10, '2024-03-16');
INSERT INTO public.listening_history VALUES (4, 11, '2024-03-15');
INSERT INTO public.listening_history VALUES (4, 12, '2024-03-13');
INSERT INTO public.listening_history VALUES (4, 20, '2024-02-14');
INSERT INTO public.listening_history VALUES (4, 6, '2023-10-05');
INSERT INTO public.listening_history VALUES (5, 25, '2024-03-15');
INSERT INTO public.listening_history VALUES (5, 26, '2024-03-14');
INSERT INTO public.listening_history VALUES (5, 27, '2024-03-10');
INSERT INTO public.listening_history VALUES (5, 9, '2024-01-30');
INSERT INTO public.listening_history VALUES (5, 15, '2023-09-15');
INSERT INTO public.listening_history VALUES (6, 7, '2024-03-16');
INSERT INTO public.listening_history VALUES (6, 8, '2024-03-15');
INSERT INTO public.listening_history VALUES (6, 9, '2024-03-12');
INSERT INTO public.listening_history VALUES (6, 23, '2024-02-18');
INSERT INTO public.listening_history VALUES (6, 17, '2023-08-22');
INSERT INTO public.listening_history VALUES (7, 22, '2024-03-16');
INSERT INTO public.listening_history VALUES (7, 23, '2024-03-15');
INSERT INTO public.listening_history VALUES (7, 24, '2024-03-11');
INSERT INTO public.listening_history VALUES (7, 14, '2024-01-25');
INSERT INTO public.listening_history VALUES (7, 13, '2023-07-07');
INSERT INTO public.listening_history VALUES (8, 16, '2024-03-15');
INSERT INTO public.listening_history VALUES (8, 17, '2024-03-14');
INSERT INTO public.listening_history VALUES (8, 18, '2024-03-10');
INSERT INTO public.listening_history VALUES (8, 29, '2024-02-22');
INSERT INTO public.listening_history VALUES (8, 30, '2023-06-18');
INSERT INTO public.listening_history VALUES (9, 4, '2024-03-16');
INSERT INTO public.listening_history VALUES (9, 14, '2024-03-15');
INSERT INTO public.listening_history VALUES (9, 24, '2024-03-13');
INSERT INTO public.listening_history VALUES (9, 1, '2024-02-11');
INSERT INTO public.listening_history VALUES (9, 21, '2023-05-20');
INSERT INTO public.listening_history VALUES (10, 25, '2024-03-16');
INSERT INTO public.listening_history VALUES (10, 26, '2024-03-14');
INSERT INTO public.listening_history VALUES (10, 27, '2024-03-12');
INSERT INTO public.listening_history VALUES (10, 5, '2024-01-15');
INSERT INTO public.listening_history VALUES (10, 15, '2023-04-10');


--
-- TOC entry 4989 (class 0 OID 16486)
-- Dependencies: 231
-- Data for Name: performed_by; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.performed_by VALUES (1, 1);
INSERT INTO public.performed_by VALUES (2, 1);
INSERT INTO public.performed_by VALUES (3, 1);
INSERT INTO public.performed_by VALUES (4, 2);
INSERT INTO public.performed_by VALUES (5, 2);
INSERT INTO public.performed_by VALUES (6, 2);
INSERT INTO public.performed_by VALUES (7, 3);
INSERT INTO public.performed_by VALUES (8, 3);
INSERT INTO public.performed_by VALUES (9, 3);
INSERT INTO public.performed_by VALUES (10, 4);
INSERT INTO public.performed_by VALUES (11, 4);
INSERT INTO public.performed_by VALUES (12, 4);
INSERT INTO public.performed_by VALUES (13, 5);
INSERT INTO public.performed_by VALUES (14, 5);
INSERT INTO public.performed_by VALUES (15, 5);
INSERT INTO public.performed_by VALUES (16, 6);
INSERT INTO public.performed_by VALUES (17, 6);
INSERT INTO public.performed_by VALUES (18, 6);
INSERT INTO public.performed_by VALUES (19, 7);
INSERT INTO public.performed_by VALUES (20, 7);
INSERT INTO public.performed_by VALUES (21, 7);
INSERT INTO public.performed_by VALUES (22, 8);
INSERT INTO public.performed_by VALUES (23, 8);
INSERT INTO public.performed_by VALUES (24, 8);
INSERT INTO public.performed_by VALUES (25, 9);
INSERT INTO public.performed_by VALUES (26, 9);
INSERT INTO public.performed_by VALUES (27, 9);
INSERT INTO public.performed_by VALUES (28, 10);
INSERT INTO public.performed_by VALUES (29, 10);
INSERT INTO public.performed_by VALUES (30, 10);


--
-- TOC entry 4985 (class 0 OID 16441)
-- Dependencies: 227
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.playlist VALUES (1, 'Dreamy Nights', '2025-05-10');
INSERT INTO public.playlist VALUES (2, 'Electro Energy', '2025-04-22');
INSERT INTO public.playlist VALUES (3, 'Retro City Pop', '2025-03-15');
INSERT INTO public.playlist VALUES (4, 'Lo-Fi Chill', '2025-02-28');
INSERT INTO public.playlist VALUES (5, 'Jazz & House Grooves', '2025-05-19');
INSERT INTO public.playlist VALUES (6, 'Deep R&B Vibes', '2025-01-08');
INSERT INTO public.playlist VALUES (7, 'Synthwave Escape', '2025-05-21');
INSERT INTO public.playlist VALUES (8, 'Afro-Soul Rhythms', '2025-03-05');
INSERT INTO public.playlist VALUES (9, 'Acoustic Serenade', '2025-02-10');
INSERT INTO public.playlist VALUES (10, 'Pop Fusion', '2025-05-18');


--
-- TOC entry 4984 (class 0 OID 16420)
-- Dependencies: 226
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.song VALUES (1, 'Matsuri', '2021-05-12', 3, 1, 1);
INSERT INTO public.song VALUES (2, 'Garden', '2022-08-22', 7, 1, 1);
INSERT INTO public.song VALUES (3, 'masshiro', '2020-11-30', 2, 1, 1);
INSERT INTO public.song VALUES (4, '360', '2023-01-14', 5, 2, 2);
INSERT INTO public.song VALUES (5, 'Talk Talk', '2022-06-08', 9, 2, 2);
INSERT INTO public.song VALUES (6, 'B2b', '2021-09-19', 4, 2, 2);
INSERT INTO public.song VALUES (7, 'Ylang Ylang', '2020-07-03', 1, 3, 3);
INSERT INTO public.song VALUES (8, 'TUI', '2021-12-10', 6, 3, 3);
INSERT INTO public.song VALUES (9, 'Tadow', '2022-04-25', 8, 3, 3);
INSERT INTO public.song VALUES (10, 'Not Allowed', '2020-10-17', 10, 4, 4);
INSERT INTO public.song VALUES (11, 'Lovers Rock', '2021-03-29', 3, 4, 4);
INSERT INTO public.song VALUES (12, 'Louise', '2023-02-11', 7, 4, 4);
INSERT INTO public.song VALUES (13, 'Sailor Song', '2022-07-05', 2, 5, 5);
INSERT INTO public.song VALUES (14, 'Fable', '2021-11-21', 5, 5, 5);
INSERT INTO public.song VALUES (15, 'Chemistry', '2023-05-18', 9, 5, 5);
INSERT INTO public.song VALUES (16, 'Here With Me', '2022-09-14', 4, 6, 6);
INSERT INTO public.song VALUES (17, 'Romantic Homicide', '2021-08-07', 8, 6, 6);
INSERT INTO public.song VALUES (18, 'Sleep Well', '2023-03-22', 1, 6, 6);
INSERT INTO public.song VALUES (19, 'Strange Things', '2020-12-09', 6, 7, 7);
INSERT INTO public.song VALUES (20, 'Love Of Mine', '2021-04-30', 10, 7, 7);
INSERT INTO public.song VALUES (21, 'Angel', '2022-11-15', 3, 7, 7);
INSERT INTO public.song VALUES (22, 'Suffocation', '2021-02-28', 7, 8, 8);
INSERT INTO public.song VALUES (23, 'Iris', '2020-06-12', 2, 8, 8);
INSERT INTO public.song VALUES (24, 'Shadows', '2023-07-01', 5, 8, 8);
INSERT INTO public.song VALUES (25, 'Forever', '2022-01-20', 9, 9, 9);
INSERT INTO public.song VALUES (26, 'Free Fall', '2021-07-11', 4, 9, 9);
INSERT INTO public.song VALUES (27, 'Found', '2020-08-26', 1, 9, 9);
INSERT INTO public.song VALUES (28, 'Bags', '2020-04-05', 8, 10, 10);
INSERT INTO public.song VALUES (29, 'Softly', '2022-03-13', 6, 10, 10);
INSERT INTO public.song VALUES (30, 'Glue Song', '2023-09-08', 2, 10, 10);


--
-- TOC entry 4976 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'jason_carter', 'jason.carter@gmail.com');
INSERT INTO public.users VALUES (2, 'emily_hayes', 'emilyhayes24@yahoo.com');
INSERT INTO public.users VALUES (3, 'michael_ross', 'mross89@outlook.com');
INSERT INTO public.users VALUES (4, 'sarah_johnson', 'sjohnson22@hotmail.com');
INSERT INTO public.users VALUES (5, 'david_keller', 'david.keller@protonmail.com');
INSERT INTO public.users VALUES (6, 'laura_smith', 'laura.smith@gmail.com');
INSERT INTO public.users VALUES (7, 'alex_martin', 'alex.martin95@yahoo.com');
INSERT INTO public.users VALUES (8, 'jessica_lee', 'jlee.work@outlook.com');
INSERT INTO public.users VALUES (9, 'ryan_clark', 'ryan.clark2020@gmail.com');
INSERT INTO public.users VALUES (10, 'olivia_brown', 'olivia.brown@icloud.com');


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 219
-- Name: album_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_album_id_seq', 10, true);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 223
-- Name: artist_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artist_artist_id_seq', 10, true);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 228
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_comment_id_seq', 30, true);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 221
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_genre_id_seq', 10, true);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 225
-- Name: song_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.song_song_id_seq', 30, true);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


--
-- TOC entry 4797 (class 2606 OID 16402)
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (album_id);


--
-- TOC entry 4813 (class 2606 OID 16505)
-- Name: appears_on appears_on_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appears_on
    ADD CONSTRAINT appears_on_pkey PRIMARY KEY (song_id, album_id);


--
-- TOC entry 4801 (class 2606 OID 16418)
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artist_id);


--
-- TOC entry 4807 (class 2606 OID 16460)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 4815 (class 2606 OID 16520)
-- Name: contains contains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_pkey PRIMARY KEY (user_id, playlist_name, song_id);


--
-- TOC entry 4799 (class 2606 OID 16411)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 4809 (class 2606 OID 16475)
-- Name: listening_history listening_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listening_history
    ADD CONSTRAINT listening_history_pkey PRIMARY KEY (user_id, song_id, date_played);


--
-- TOC entry 4811 (class 2606 OID 16490)
-- Name: performed_by performed_by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performed_by
    ADD CONSTRAINT performed_by_pkey PRIMARY KEY (song_id, artist_id);


--
-- TOC entry 4805 (class 2606 OID 16445)
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (user_id, playlist_name);


--
-- TOC entry 4803 (class 2606 OID 16425)
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (song_id);


--
-- TOC entry 4795 (class 2606 OID 16395)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4826 (class 2606 OID 16511)
-- Name: appears_on appears_on_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appears_on
    ADD CONSTRAINT appears_on_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(album_id) ON DELETE CASCADE;


--
-- TOC entry 4827 (class 2606 OID 16506)
-- Name: appears_on appears_on_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appears_on
    ADD CONSTRAINT appears_on_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.song(song_id) ON DELETE CASCADE;


--
-- TOC entry 4820 (class 2606 OID 16466)
-- Name: comments comments_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.song(song_id);


--
-- TOC entry 4821 (class 2606 OID 16461)
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4828 (class 2606 OID 16526)
-- Name: contains contains_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.song(song_id) ON DELETE CASCADE;


--
-- TOC entry 4829 (class 2606 OID 16521)
-- Name: contains contains_user_id_playlist_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_user_id_playlist_name_fkey FOREIGN KEY (user_id, playlist_name) REFERENCES public.playlist(user_id, playlist_name) ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 16481)
-- Name: listening_history listening_history_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listening_history
    ADD CONSTRAINT listening_history_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.song(song_id) ON DELETE CASCADE;


--
-- TOC entry 4823 (class 2606 OID 16476)
-- Name: listening_history listening_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listening_history
    ADD CONSTRAINT listening_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 4824 (class 2606 OID 16496)
-- Name: performed_by performed_by_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performed_by
    ADD CONSTRAINT performed_by_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(artist_id) ON DELETE CASCADE;


--
-- TOC entry 4825 (class 2606 OID 16491)
-- Name: performed_by performed_by_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performed_by
    ADD CONSTRAINT performed_by_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.song(song_id) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 16446)
-- Name: playlist playlist_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 16431)
-- Name: song song_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(album_id) ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 16436)
-- Name: song song_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id) ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 16426)
-- Name: song song_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


-- Completed on 2025-06-13 09:44:08

--
-- PostgreSQL database dump complete
--

