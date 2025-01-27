PGDMP         .                y            inappfeedback    10.12    13.2 O    j           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            k           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            l           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            m           1262    197345    inappfeedback    DATABASE     q   CREATE DATABASE inappfeedback WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE inappfeedback;
                postgres    false            m           1247    197388    enum_questions_type    TYPE     �   CREATE TYPE public.enum_questions_type AS ENUM (
    'string',
    'singleline',
    'multiline',
    'number',
    'select',
    'choice'
);
 &   DROP TYPE public.enum_questions_type;
       public          postgres    false            �           1247    197468    enum_users_status    TYPE     P   CREATE TYPE public.enum_users_status AS ENUM (
    'invited',
    'accepted'
);
 $   DROP TYPE public.enum_users_status;
       public          postgres    false            �            1259    197347    Session    TABLE     �   CREATE TABLE public."Session" (
    sid character varying(36) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Session";
       public            postgres    false            �            1259    197352 
   dbVersions    TABLE     �   CREATE TABLE public."dbVersions" (
    id integer NOT NULL,
    version character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."dbVersions";
       public            postgres    false            �            1259    197346    dbVersions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."dbVersions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."dbVersions_id_seq";
       public          postgres    false    198            n           0    0    dbVersions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."dbVersions_id_seq" OWNED BY public."dbVersions".id;
          public          postgres    false    196            �            1259    197437    feedback_answers    TABLE       CREATE TABLE public.feedback_answers (
    id integer NOT NULL,
    feedback_id integer NOT NULL,
    widget_question_id integer NOT NULL,
    answer text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 $   DROP TABLE public.feedback_answers;
       public            postgres    false            �            1259    197435    feedback_answers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.feedback_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.feedback_answers_id_seq;
       public          postgres    false    208            o           0    0    feedback_answers_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.feedback_answers_id_seq OWNED BY public.feedback_answers.id;
          public          postgres    false    207            �            1259    197376 	   feedbacks    TABLE     �   CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    widget_id integer NOT NULL,
    screen_shot character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.feedbacks;
       public            postgres    false            �            1259    197374    feedbacks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.feedbacks_id_seq;
       public          postgres    false    202            p           0    0    feedbacks_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;
          public          postgres    false    201            �            1259    197458    question_options    TABLE        CREATE TABLE public.question_options (
    id integer NOT NULL,
    question_id integer NOT NULL,
    label character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 $   DROP TABLE public.question_options;
       public            postgres    false            �            1259    197456    question_options_id_seq    SEQUENCE     �   CREATE SEQUENCE public.question_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.question_options_id_seq;
       public          postgres    false    210            q           0    0    question_options_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.question_options_id_seq OWNED BY public.question_options.id;
          public          postgres    false    209            �            1259    197403 	   questions    TABLE     �  CREATE TABLE public.questions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    display_text character varying(255),
    tooltip character varying(255),
    type public.enum_questions_type DEFAULT 'singleline'::public.enum_questions_type,
    "limit" integer DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.questions;
       public            postgres    false    621    621            �            1259    197401    questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.questions_id_seq;
       public          postgres    false    204            r           0    0    questions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;
          public          postgres    false    203            �            1259    197475    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    api_key character varying(255) NOT NULL,
    account_id character varying(255) NOT NULL,
    status public.enum_users_status DEFAULT 'invited'::public.enum_users_status,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public            postgres    false    641    641            �            1259    197473    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    212            s           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    211            �            1259    197487    widget_connections    TABLE     �  CREATE TABLE public.widget_connections (
    id integer NOT NULL,
    widget_id integer NOT NULL,
    github_api_url character varying(255),
    is_github_connected boolean DEFAULT false,
    personal_access_token character varying(255),
    github_response text,
    repo_id character varying(255),
    repo_name character varying(255),
    repo_owner character varying(255),
    repo_url character varying(255),
    is_slack_connected boolean DEFAULT false,
    webhook character varying(255),
    channel_name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public.widget_connections;
       public            postgres    false            �            1259    197485    widget_connections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.widget_connections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.widget_connections_id_seq;
       public          postgres    false    214            t           0    0    widget_connections_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.widget_connections_id_seq OWNED BY public.widget_connections.id;
          public          postgres    false    213            �            1259    197416    widget_questions    TABLE     �  CREATE TABLE public.widget_questions (
    id integer NOT NULL,
    widget_id integer NOT NULL,
    question_id integer NOT NULL,
    "order" integer NOT NULL,
    display_text character varying(255) NOT NULL,
    is_required boolean DEFAULT true,
    is_active boolean DEFAULT true,
    "limit" integer DEFAULT 0,
    option_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 $   DROP TABLE public.widget_questions;
       public            postgres    false            �            1259    197414    widget_questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.widget_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.widget_questions_id_seq;
       public          postgres    false    206            u           0    0    widget_questions_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.widget_questions_id_seq OWNED BY public.widget_questions.id;
          public          postgres    false    205            �            1259    197364    widgets    TABLE     E  CREATE TABLE public.widgets (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    creater_name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    status boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.widgets;
       public            postgres    false            �            1259    197362    widgets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.widgets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.widgets_id_seq;
       public          postgres    false    200            v           0    0    widgets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.widgets_id_seq OWNED BY public.widgets.id;
          public          postgres    false    199            �
           2604    197357    dbVersions id    DEFAULT     r   ALTER TABLE ONLY public."dbVersions" ALTER COLUMN id SET DEFAULT nextval('public."dbVersions_id_seq"'::regclass);
 >   ALTER TABLE public."dbVersions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    198    196    198            �
           2604    197440    feedback_answers id    DEFAULT     z   ALTER TABLE ONLY public.feedback_answers ALTER COLUMN id SET DEFAULT nextval('public.feedback_answers_id_seq'::regclass);
 B   ALTER TABLE public.feedback_answers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    208    208            �
           2604    197379    feedbacks id    DEFAULT     l   ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);
 ;   ALTER TABLE public.feedbacks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201    202            �
           2604    197461    question_options id    DEFAULT     z   ALTER TABLE ONLY public.question_options ALTER COLUMN id SET DEFAULT nextval('public.question_options_id_seq'::regclass);
 B   ALTER TABLE public.question_options ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �
           2604    197406    questions id    DEFAULT     l   ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);
 ;   ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            �
           2604    197478    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �
           2604    197490    widget_connections id    DEFAULT     ~   ALTER TABLE ONLY public.widget_connections ALTER COLUMN id SET DEFAULT nextval('public.widget_connections_id_seq'::regclass);
 D   ALTER TABLE public.widget_connections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �
           2604    197419    widget_questions id    DEFAULT     z   ALTER TABLE ONLY public.widget_questions ALTER COLUMN id SET DEFAULT nextval('public.widget_questions_id_seq'::regclass);
 B   ALTER TABLE public.widget_questions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206            �
           2604    197367 
   widgets id    DEFAULT     h   ALTER TABLE ONLY public.widgets ALTER COLUMN id SET DEFAULT nextval('public.widgets_id_seq'::regclass);
 9   ALTER TABLE public.widgets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    199    200            V          0    197347    Session 
   TABLE DATA           Q   COPY public."Session" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    197   �d       W          0    197352 
   dbVersions 
   TABLE DATA           M   COPY public."dbVersions" (id, version, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    198   e       a          0    197437    feedback_answers 
   TABLE DATA           q   COPY public.feedback_answers (id, feedback_id, widget_question_id, answer, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    208   _e       [          0    197376 	   feedbacks 
   TABLE DATA           Y   COPY public.feedbacks (id, widget_id, screen_shot, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    202   |e       c          0    197458    question_options 
   TABLE DATA           c   COPY public.question_options (id, question_id, label, value, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    210   �e       ]          0    197403 	   questions 
   TABLE DATA           m   COPY public.questions (id, name, display_text, tooltip, type, "limit", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    204   f       e          0    197475    users 
   TABLE DATA           m   COPY public.users (id, name, email, role, api_key, account_id, status, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    212   �f       g          0    197487    widget_connections 
   TABLE DATA           �   COPY public.widget_connections (id, widget_id, github_api_url, is_github_connected, personal_access_token, github_response, repo_id, repo_name, repo_owner, repo_url, is_slack_connected, webhook, channel_name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    214   �f       _          0    197416    widget_questions 
   TABLE DATA           �   COPY public.widget_questions (id, widget_id, question_id, "order", display_text, is_required, is_active, "limit", option_id, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    206   �f       Y          0    197364    widgets 
   TABLE DATA           `   COPY public.widgets (id, name, creater_name, url, status, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    200   g       w           0    0    dbVersions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."dbVersions_id_seq"', 1, true);
          public          postgres    false    196            x           0    0    feedback_answers_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.feedback_answers_id_seq', 1, false);
          public          postgres    false    207            y           0    0    feedbacks_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.feedbacks_id_seq', 1, false);
          public          postgres    false    201            z           0    0    question_options_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.question_options_id_seq', 1, false);
          public          postgres    false    209            {           0    0    questions_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.questions_id_seq', 1, false);
          public          postgres    false    203            |           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    211            }           0    0    widget_connections_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.widget_connections_id_seq', 1, false);
          public          postgres    false    213            ~           0    0    widget_questions_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.widget_questions_id_seq', 1, false);
          public          postgres    false    205                       0    0    widgets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.widgets_id_seq', 1, false);
          public          postgres    false    199            �
           2606    197361    Session Session_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (sid);
 B   ALTER TABLE ONLY public."Session" DROP CONSTRAINT "Session_pkey";
       public            postgres    false    197            �
           2606    197359    dbVersions dbVersions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."dbVersions"
    ADD CONSTRAINT "dbVersions_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."dbVersions" DROP CONSTRAINT "dbVersions_pkey";
       public            postgres    false    198            �
           2606    197445 &   feedback_answers feedback_answers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.feedback_answers
    ADD CONSTRAINT feedback_answers_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.feedback_answers DROP CONSTRAINT feedback_answers_pkey;
       public            postgres    false    208            �
           2606    197381    feedbacks feedbacks_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.feedbacks DROP CONSTRAINT feedbacks_pkey;
       public            postgres    false    202            �
           2606    197466 &   question_options question_options_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.question_options
    ADD CONSTRAINT question_options_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.question_options DROP CONSTRAINT question_options_pkey;
       public            postgres    false    210            �
           2606    197413    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public            postgres    false    204            �
           2606    197484    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    212            �
           2606    197497 *   widget_connections widget_connections_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.widget_connections
    ADD CONSTRAINT widget_connections_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.widget_connections DROP CONSTRAINT widget_connections_pkey;
       public            postgres    false    214            �
           2606    197424 &   widget_questions widget_questions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.widget_questions
    ADD CONSTRAINT widget_questions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.widget_questions DROP CONSTRAINT widget_questions_pkey;
       public            postgres    false    206            �
           2606    197373    widgets widgets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.widgets DROP CONSTRAINT widgets_pkey;
       public            postgres    false    200            �
           2606    197446 2   feedback_answers feedback_answers_feedback_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback_answers
    ADD CONSTRAINT feedback_answers_feedback_id_fkey FOREIGN KEY (feedback_id) REFERENCES public.feedbacks(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.feedback_answers DROP CONSTRAINT feedback_answers_feedback_id_fkey;
       public          postgres    false    2760    208    202            �
           2606    197451 9   feedback_answers feedback_answers_widget_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback_answers
    ADD CONSTRAINT feedback_answers_widget_question_id_fkey FOREIGN KEY (widget_question_id) REFERENCES public.widget_questions(id) ON UPDATE CASCADE;
 c   ALTER TABLE ONLY public.feedback_answers DROP CONSTRAINT feedback_answers_widget_question_id_fkey;
       public          postgres    false    208    2764    206            �
           2606    197382 "   feedbacks feedbacks_widget_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_widget_id_fkey FOREIGN KEY (widget_id) REFERENCES public.widgets(id) ON UPDATE CASCADE;
 L   ALTER TABLE ONLY public.feedbacks DROP CONSTRAINT feedbacks_widget_id_fkey;
       public          postgres    false    200    2758    202            �
           2606    197498 -   widget_connections widget_connections_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.widget_connections
    ADD CONSTRAINT widget_connections_id_fkey FOREIGN KEY (id) REFERENCES public.widgets(id) ON UPDATE CASCADE;
 W   ALTER TABLE ONLY public.widget_connections DROP CONSTRAINT widget_connections_id_fkey;
       public          postgres    false    200    214    2758            �
           2606    197503 4   widget_connections widget_connections_widget_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.widget_connections
    ADD CONSTRAINT widget_connections_widget_id_fkey FOREIGN KEY (widget_id) REFERENCES public.widgets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.widget_connections DROP CONSTRAINT widget_connections_widget_id_fkey;
       public          postgres    false    200    214    2758            �
           2606    197430 2   widget_questions widget_questions_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.widget_questions
    ADD CONSTRAINT widget_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.widget_questions DROP CONSTRAINT widget_questions_question_id_fkey;
       public          postgres    false    206    2762    204            �
           2606    197425 0   widget_questions widget_questions_widget_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.widget_questions
    ADD CONSTRAINT widget_questions_widget_id_fkey FOREIGN KEY (widget_id) REFERENCES public.widgets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.widget_questions DROP CONSTRAINT widget_questions_widget_id_fkey;
       public          postgres    false    206    2758    200            V      x������ � �      W   3   x�3�42020"]CH��)�Y�Z[��Yj������� �r?      a      x������ � �      [      x������ � �      c   c   x�3�4�4U.I,�,FF��F��
�VF@d�gf�m`�[��hFpnfNj��[brj1g1�C�Y�@�J�L�J�rS�8�Js�R�sX� @�1      ]   �   x��ͽ
�0����*�.-I�E�tEt����4��77`�B���oxts�ZCx#2/=|�W�m�R�~r�9F��)�6�Ar^&y%d%8��Y�Nu��x��a�1B��"8r6�S����-�\��/�̔ҖTw�	��9�J��c?�ǅw      e      x������ � �      g      x������ � �      _      x������ � �      Y      x������ � �     