PGDMP     *                    x           newair_development    12.2    12.2 _    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    45690    newair_development    DATABASE     �   CREATE DATABASE newair_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Polish_Poland.1250' LC_CTYPE = 'Polish_Poland.1250';
 "   DROP DATABASE newair_development;
                postgres    false            �            1255    45959    logchange()    FUNCTION     �   CREATE FUNCTION public.logchange() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
if NEW.airport<>OLD.airport then
insert into "AirportUpdates" values( old."id", old."country", old."airport", new."airport");
end if;
return new;
end;
$$;
 "   DROP FUNCTION public.logchange();
       public          postgres    false            �            1259    45706    Aircraft    TABLE     �   CREATE TABLE public."Aircraft" (
    id integer NOT NULL,
    "regNum" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public."Aircraft";
       public         heap    postgres    false            �            1259    45704    Aircraft_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Aircraft_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Aircraft_id_seq";
       public          postgres    false    206            �           0    0    Aircraft_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Aircraft_id_seq" OWNED BY public."Aircraft".id;
          public          postgres    false    205            �            1259    45946    AirportUpdates    TABLE       CREATE TABLE public."AirportUpdates" (
    id integer NOT NULL,
    country character varying(255),
    "oldAirport" character varying(255),
    "newAirport" character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
 $   DROP TABLE public."AirportUpdates";
       public         heap    postgres    false            �            1259    45944    AirportUpdates_id_seq    SEQUENCE     �   CREATE SEQUENCE public."AirportUpdates_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."AirportUpdates_id_seq";
       public          postgres    false    224            �           0    0    AirportUpdates_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."AirportUpdates_id_seq" OWNED BY public."AirportUpdates".id;
          public          postgres    false    223            �            1259    45904    Airports    TABLE     �   CREATE TABLE public."Airports" (
    id integer NOT NULL,
    dest character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public."Airports";
       public         heap    postgres    false            �            1259    45902    Airports_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Airports_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Airports_id_seq";
       public          postgres    false    218            �           0    0    Airports_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Airports_id_seq" OWNED BY public."Airports".id;
          public          postgres    false    217            �            1259    45824    Captains    TABLE     '  CREATE TABLE public."Captains" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    phone character varying(255),
    salary integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public."Captains";
       public         heap    postgres    false            �            1259    45822    Captains_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Captains_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Captains_id_seq";
       public          postgres    false    208            �           0    0    Captains_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Captains_id_seq" OWNED BY public."Captains".id;
          public          postgres    false    207            �            1259    45917 	   Countries    TABLE     �   CREATE TABLE public."Countries" (
    id integer NOT NULL,
    country character varying(255),
    description text,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public."Countries";
       public         heap    postgres    false            �            1259    45915    Countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Countries_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Countries_id_seq";
       public          postgres    false    220            �           0    0    Countries_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Countries_id_seq" OWNED BY public."Countries".id;
          public          postgres    false    219            �            1259    45933    CountryAirports    TABLE     �   CREATE TABLE public."CountryAirports" (
    id integer NOT NULL,
    country character varying(255),
    airport character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
 %   DROP TABLE public."CountryAirports";
       public         heap    postgres    false            �            1259    45931    CountryAirports_id_seq    SEQUENCE     �   CREATE SEQUENCE public."CountryAirports_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."CountryAirports_id_seq";
       public          postgres    false    222            �           0    0    CountryAirports_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."CountryAirports_id_seq" OWNED BY public."CountryAirports".id;
          public          postgres    false    221            �            1259    45856    Crews    TABLE     $  CREATE TABLE public."Crews" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    phone character varying(255),
    salary integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public."Crews";
       public         heap    postgres    false            �            1259    45854    Crews_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Crews_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Crews_id_seq";
       public          postgres    false    212            �           0    0    Crews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Crews_id_seq" OWNED BY public."Crews".id;
          public          postgres    false    211            �            1259    45872 
   Dispachers    TABLE     )  CREATE TABLE public."Dispachers" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    phone character varying(255),
    salary integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
     DROP TABLE public."Dispachers";
       public         heap    postgres    false            �            1259    45870    Dispachers_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Dispachers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Dispachers_id_seq";
       public          postgres    false    214            �           0    0    Dispachers_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Dispachers_id_seq" OWNED BY public."Dispachers".id;
          public          postgres    false    213            �            1259    45698    Flights    TABLE     )  CREATE TABLE public."Flights" (
    id integer NOT NULL,
    date date,
    "aircraftId" integer,
    "destId" integer,
    cpt integer,
    offr integer,
    crew integer,
    disp integer,
    gstaff integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public."Flights";
       public         heap    postgres    false            �            1259    45696    Flights_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Flights_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Flights_id_seq";
       public          postgres    false    204            �           0    0    Flights_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Flights_id_seq" OWNED BY public."Flights".id;
          public          postgres    false    203            �            1259    45888    Gstaffs    TABLE     &  CREATE TABLE public."Gstaffs" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    phone character varying(255),
    salary integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public."Gstaffs";
       public         heap    postgres    false            �            1259    45886    Gstaffs_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Gstaffs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Gstaffs_id_seq";
       public          postgres    false    216            �           0    0    Gstaffs_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Gstaffs_id_seq" OWNED BY public."Gstaffs".id;
          public          postgres    false    215            �            1259    45840    Officers    TABLE     '  CREATE TABLE public."Officers" (
    id integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    phone character varying(255),
    salary integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public."Officers";
       public         heap    postgres    false            �            1259    45838    Officers_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Officers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Officers_id_seq";
       public          postgres    false    210            �           0    0    Officers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Officers_id_seq" OWNED BY public."Officers".id;
          public          postgres    false    209            �            1259    45691    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            �            1259    45968 	   cptSalary    VIEW     �  CREATE VIEW public."cptSalary" AS
 WITH cte1 AS (
         SELECT "Captains".id,
            "Captains"."firstName",
            "Captains"."lastName",
            "Captains".phone,
            "Captains".salary,
            "Captains"."createdAt",
            "Captains"."updatedAt"
           FROM public."Captains"
          WHERE ("Captains".id = 10)
        )
 SELECT cte1."firstName",
    cte1."lastName",
    cte1.salary
   FROM cte1;
    DROP VIEW public."cptSalary";
       public          postgres    false    208    208    208    208    208    208    208            �
           2604    45709    Aircraft id    DEFAULT     n   ALTER TABLE ONLY public."Aircraft" ALTER COLUMN id SET DEFAULT nextval('public."Aircraft_id_seq"'::regclass);
 <   ALTER TABLE public."Aircraft" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206            �
           2604    45949    AirportUpdates id    DEFAULT     z   ALTER TABLE ONLY public."AirportUpdates" ALTER COLUMN id SET DEFAULT nextval('public."AirportUpdates_id_seq"'::regclass);
 B   ALTER TABLE public."AirportUpdates" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �
           2604    45907    Airports id    DEFAULT     n   ALTER TABLE ONLY public."Airports" ALTER COLUMN id SET DEFAULT nextval('public."Airports_id_seq"'::regclass);
 <   ALTER TABLE public."Airports" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �
           2604    45827    Captains id    DEFAULT     n   ALTER TABLE ONLY public."Captains" ALTER COLUMN id SET DEFAULT nextval('public."Captains_id_seq"'::regclass);
 <   ALTER TABLE public."Captains" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207    208            �
           2604    45920    Countries id    DEFAULT     p   ALTER TABLE ONLY public."Countries" ALTER COLUMN id SET DEFAULT nextval('public."Countries_id_seq"'::regclass);
 =   ALTER TABLE public."Countries" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �
           2604    45936    CountryAirports id    DEFAULT     |   ALTER TABLE ONLY public."CountryAirports" ALTER COLUMN id SET DEFAULT nextval('public."CountryAirports_id_seq"'::regclass);
 C   ALTER TABLE public."CountryAirports" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �
           2604    45859    Crews id    DEFAULT     h   ALTER TABLE ONLY public."Crews" ALTER COLUMN id SET DEFAULT nextval('public."Crews_id_seq"'::regclass);
 9   ALTER TABLE public."Crews" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �
           2604    45875    Dispachers id    DEFAULT     r   ALTER TABLE ONLY public."Dispachers" ALTER COLUMN id SET DEFAULT nextval('public."Dispachers_id_seq"'::regclass);
 >   ALTER TABLE public."Dispachers" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �
           2604    45701 
   Flights id    DEFAULT     l   ALTER TABLE ONLY public."Flights" ALTER COLUMN id SET DEFAULT nextval('public."Flights_id_seq"'::regclass);
 ;   ALTER TABLE public."Flights" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            �
           2604    45891 
   Gstaffs id    DEFAULT     l   ALTER TABLE ONLY public."Gstaffs" ALTER COLUMN id SET DEFAULT nextval('public."Gstaffs_id_seq"'::regclass);
 ;   ALTER TABLE public."Gstaffs" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �
           2604    45843    Officers id    DEFAULT     n   ALTER TABLE ONLY public."Officers" ALTER COLUMN id SET DEFAULT nextval('public."Officers_id_seq"'::regclass);
 <   ALTER TABLE public."Officers" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            |          0    45706    Aircraft 
   TABLE DATA           L   COPY public."Aircraft" (id, "regNum", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    206   �p       �          0    45946    AirportUpdates 
   TABLE DATA           m   COPY public."AirportUpdates" (id, country, "oldAirport", "newAirport", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    224   )t       �          0    45904    Airports 
   TABLE DATA           H   COPY public."Airports" (id, dest, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   �t       ~          0    45824    Captains 
   TABLE DATA           j   COPY public."Captains" (id, "firstName", "lastName", phone, salary, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    208   bx       �          0    45917 	   Countries 
   TABLE DATA           Y   COPY public."Countries" (id, country, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    220   0�       �          0    45933    CountryAirports 
   TABLE DATA           [   COPY public."CountryAirports" (id, country, airport, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    222   *�       �          0    45856    Crews 
   TABLE DATA           g   COPY public."Crews" (id, "firstName", "lastName", phone, salary, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    212   ��       �          0    45872 
   Dispachers 
   TABLE DATA           l   COPY public."Dispachers" (id, "firstName", "lastName", phone, salary, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    214   ��       z          0    45698    Flights 
   TABLE DATA           ~   COPY public."Flights" (id, date, "aircraftId", "destId", cpt, offr, crew, disp, gstaff, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    204   ��       �          0    45888    Gstaffs 
   TABLE DATA           i   COPY public."Gstaffs" (id, "firstName", "lastName", phone, salary, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   ��       �          0    45840    Officers 
   TABLE DATA           j   COPY public."Officers" (id, "firstName", "lastName", phone, salary, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    210   ��       x          0    45691    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    202   s�       �           0    0    Aircraft_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Aircraft_id_seq"', 100, true);
          public          postgres    false    205            �           0    0    AirportUpdates_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."AirportUpdates_id_seq"', 1, false);
          public          postgres    false    223            �           0    0    Airports_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Airports_id_seq"', 100, true);
          public          postgres    false    217            �           0    0    Captains_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Captains_id_seq"', 100, true);
          public          postgres    false    207            �           0    0    Countries_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Countries_id_seq"', 15, true);
          public          postgres    false    219            �           0    0    CountryAirports_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."CountryAirports_id_seq"', 30, true);
          public          postgres    false    221            �           0    0    Crews_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Crews_id_seq"', 100, true);
          public          postgres    false    211            �           0    0    Dispachers_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Dispachers_id_seq"', 100, true);
          public          postgres    false    213            �           0    0    Flights_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Flights_id_seq"', 100, true);
          public          postgres    false    203            �           0    0    Gstaffs_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Gstaffs_id_seq"', 100, true);
          public          postgres    false    215            �           0    0    Officers_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Officers_id_seq"', 100, true);
          public          postgres    false    209            �
           2606    45711    Aircraft Aircraft_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Aircraft"
    ADD CONSTRAINT "Aircraft_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Aircraft" DROP CONSTRAINT "Aircraft_pkey";
       public            postgres    false    206            �
           2606    45713    Aircraft Aircraft_regNum_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Aircraft"
    ADD CONSTRAINT "Aircraft_regNum_key" UNIQUE ("regNum");
 J   ALTER TABLE ONLY public."Aircraft" DROP CONSTRAINT "Aircraft_regNum_key";
       public            postgres    false    206            �
           2606    45954 "   AirportUpdates AirportUpdates_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."AirportUpdates"
    ADD CONSTRAINT "AirportUpdates_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."AirportUpdates" DROP CONSTRAINT "AirportUpdates_pkey";
       public            postgres    false    224            �
           2606    45909    Airports Airports_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Airports"
    ADD CONSTRAINT "Airports_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Airports" DROP CONSTRAINT "Airports_pkey";
       public            postgres    false    218            �
           2606    45832    Captains Captains_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Captains"
    ADD CONSTRAINT "Captains_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Captains" DROP CONSTRAINT "Captains_pkey";
       public            postgres    false    208            �
           2606    45925    Countries Countries_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Countries" DROP CONSTRAINT "Countries_pkey";
       public            postgres    false    220            �
           2606    45941 $   CountryAirports CountryAirports_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."CountryAirports"
    ADD CONSTRAINT "CountryAirports_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."CountryAirports" DROP CONSTRAINT "CountryAirports_pkey";
       public            postgres    false    222            �
           2606    45864    Crews Crews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Crews"
    ADD CONSTRAINT "Crews_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Crews" DROP CONSTRAINT "Crews_pkey";
       public            postgres    false    212            �
           2606    45880    Dispachers Dispachers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Dispachers"
    ADD CONSTRAINT "Dispachers_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Dispachers" DROP CONSTRAINT "Dispachers_pkey";
       public            postgres    false    214            �
           2606    45703    Flights Flights_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Flights"
    ADD CONSTRAINT "Flights_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Flights" DROP CONSTRAINT "Flights_pkey";
       public            postgres    false    204            �
           2606    45896    Gstaffs Gstaffs_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Gstaffs"
    ADD CONSTRAINT "Gstaffs_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Gstaffs" DROP CONSTRAINT "Gstaffs_pkey";
       public            postgres    false    216            �
           2606    45848    Officers Officers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Officers"
    ADD CONSTRAINT "Officers_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Officers" DROP CONSTRAINT "Officers_pkey";
       public            postgres    false    210            �
           2606    45695     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    202            �
           2620    45960    CountryAirports logchanger    TRIGGER     v   CREATE TRIGGER logchanger BEFORE UPDATE ON public."CountryAirports" FOR EACH ROW EXECUTE FUNCTION public.logchange();
 5   DROP TRIGGER logchanger ON public."CountryAirports";
       public          postgres    false    226    222            �
           2606    45714    Aircraft Aircraft_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public."Aircraft"
    ADD CONSTRAINT "Aircraft_id_fkey" FOREIGN KEY (id) REFERENCES public."Flights"(id);
 G   ALTER TABLE ONLY public."Aircraft" DROP CONSTRAINT "Aircraft_id_fkey";
       public          postgres    false    204    2778    206            �
           2606    45910    Airports Airports_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public."Airports"
    ADD CONSTRAINT "Airports_id_fkey" FOREIGN KEY (id) REFERENCES public."Flights"(id);
 G   ALTER TABLE ONLY public."Airports" DROP CONSTRAINT "Airports_id_fkey";
       public          postgres    false    204    2778    218            �
           2606    45833    Captains Captains_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public."Captains"
    ADD CONSTRAINT "Captains_id_fkey" FOREIGN KEY (id) REFERENCES public."Flights"(id);
 G   ALTER TABLE ONLY public."Captains" DROP CONSTRAINT "Captains_id_fkey";
       public          postgres    false    208    204    2778            �
           2606    45865    Crews Crews_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public."Crews"
    ADD CONSTRAINT "Crews_id_fkey" FOREIGN KEY (id) REFERENCES public."Flights"(id);
 A   ALTER TABLE ONLY public."Crews" DROP CONSTRAINT "Crews_id_fkey";
       public          postgres    false    212    204    2778            �
           2606    45881    Dispachers Dispachers_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public."Dispachers"
    ADD CONSTRAINT "Dispachers_id_fkey" FOREIGN KEY (id) REFERENCES public."Flights"(id);
 K   ALTER TABLE ONLY public."Dispachers" DROP CONSTRAINT "Dispachers_id_fkey";
       public          postgres    false    2778    214    204            �
           2606    45897    Gstaffs Gstaffs_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public."Gstaffs"
    ADD CONSTRAINT "Gstaffs_id_fkey" FOREIGN KEY (id) REFERENCES public."Flights"(id);
 E   ALTER TABLE ONLY public."Gstaffs" DROP CONSTRAINT "Gstaffs_id_fkey";
       public          postgres    false    204    216    2778            �
           2606    45849    Officers Officers_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public."Officers"
    ADD CONSTRAINT "Officers_id_fkey" FOREIGN KEY (id) REFERENCES public."Flights"(id);
 G   ALTER TABLE ONLY public."Officers" DROP CONSTRAINT "Officers_id_fkey";
       public          postgres    false    210    2778    204            |   ;  x���G��HD�ѧ�����2z+�E�~�_��k�PY���cQ�[(�ķ��J�#�Ø��?>����/���}�Iܢ۶�,Hܡ�Uq�$�q����H<@o/C�Z��~#q)��j�vR�j���X^a��J�,��2W������Ϸh���+˧�U�]���Fu�'�,�2+������I^	V��m%1�Ϯ��U
c�e�Y^C.��-,�.�g���_z�п�~���4�+��<\Wgۇ����lb����}ِ����6l�j�2���y���`y�b�:5��A{���_m1��hY���|�c���=�;�������������O�����}�l��Ļ�ݓ�NF!�����8�ά��#۩e��X�CY����l��_�a/�.�?L@��nc��Ĥ�2�+6:Hkǭgy	���,Y^�_������������,h��^�k�!�wF=���=�q�;�6忦>%]��g?n�cw/��y�['q�{d��R���5���_��];K�������Y�p[.��Οs���k6?���/V]�ܨ���.韼Ν=���~h��M�^��^�/}����5\��|��Aގ�a��[�1���o��l�rb��{��"V6����h�H�I���Vl�	C�m�A�.m3�����������������_58I�Ϣ	�����fyn]��S5;�!�~v]`�/D�O�_v�i�X�}��%>v8'��Q!{�S��5�X�����^ʬe�/Zdbh��e���8���ch>�.����71�_�d�/�Hx�:V�%��(�^�C؇0?º?�¶|k����=txh����������?	3=      �   b   x�3���I�K��.)�,ȯ��".#�pQ6gqL؜3� 13�3)9�371�؈34ؑ3'����**h��\�����Z�Ǚ_\�Y\������� R�!�      �   �  x��XMo�8=����Y�N`�߽��lZ4-�t���	�h�HYYN�������XP�1-�L����R�w�.B��&���u�b��JEIz�e�*��=V�����B�&����%	!r��Q���|%t/arܹ^z���{�uy\�Z��2�2uX`I�i�%	�w�����4��f�kO��$,��p�;�b�~h��R��@zO�`B�JOWp�zC:�E�^��<��\Ti(*����:��u+�g��5Eo��σ^�����G4�(L��R¨���b����w�إ!���j�&���`�s��G9��^F���F�&�T��5�#��K1X�݄��x�de�N�Q�FL�T��Y��R�� �뻃��Rv'��v}����y��<-��n��q"���p&g#g���R���b�O�S��Q���@�f1�P�ҽT��^��������Vs#�����n��A{�f�h��p)ܒ٢�H2�ɚ+�,�dLm4�#:m��������%�"U�dݫm7�85�<�V�Y��pt��)T9�d���X�s�Z�-���IA��L{-�Ӝ]�Zˏ�A�'/��Q +�f����/�r]2�a�_OJ���:���^�I���{��{��D.�RE�.ݳ~!.W�}�^l{9��/�(XsB��e�=�EQ�3orwV�0v򍱌/�͗�%�w�}s��8;�͖#���n.�a��1~�,���R\`�AOeń�eS~�5L�1�O~S頗�*9�~KAks�����㡯հ�u��q�܉Vv/7�����rj(�2%��f�NL���Y
l����E�˩�K�`��L7���U�|�Sxҫ��gჺ��mț����Dr--�|��%ܬ{9��*�M��a��Ev�IGS��l:���x@oz�#(���:�FI� ��������u      ~   �
  x��YKs�H>'��o�Ć�~pc<�xfmb&�Rv��Z�%��n~�~Y����ި�YR֗�#��S��y��������k/�˕R��BF�JyRB�F�F��ԯ�y�t���P?���.r�':�i<���1�5�KK&V�5���O��a�0~�:���O�`�!��,m�mN�i�Oc�W���JJ�&�ʪ�~�C7��n��&��҉�VONE����,��M����4?�=7$j�h���"+E�����G��i��3��Z�d뵎�'k�G�͏J��z��	�z����0�2�� BX=����)��qJ����X� v�1���W��ϝ�Oϼ��U��j�񚯳4=V?�����wC��4����ieh$ZN��ZxK�Y��t����1V58�@��I� �+Q[s���1v�i���uu�w��%�r��<O�4bZm1���Փ�dl�lJg�&4�r�N�o�u�2*pG�m����o1=����v��9�z/["#%
�'.�*�ζi��G �=�[B4�A&o�1?�yp�p�'D:���1�W��#�i���F��x]�z �C����#\	���,f����`fk�Kz?C�6#`s��<��X��b��`��eG��oy�������IK� �G���i���4�c7���� kq��6�o�B��*Cgi��j����l ��A��dQ����W��]�=�y�e��:z�r�#%#3��3�J�g8:�͑��a.���r��7"(����0����	��}��̇���H8^�1Z4Qz8Q�*|�``fV�mEh��7��NU�B��<A��W�M{��h@���|��R���Aӂ���z����J�0O16� X�����5���`�el��-�
W��0�RM�hE�r?���r� 22�\��)JKS��0/W�Q�Ux(���7��pNLИ�MukZ�	����2a�p�����V�S�bu����1;��2f��ťv<W]���a��g�D�,8H@��V��=l�g��}M߃�1hl��\��0�=��"C�i��,H˝�Cu�"�#�>�].o/��~���;�>fI��┇���z��G�H��ú���A�s �p�jA�y���%�������BC8@F*2����J�B��>M�4{4�Ȉ�k�߾��`~��<����	1�uPyh������G��~�ۑ�s�
~G�|�0��:��}�.�v�{@�ar<�!�jb]�S�(vr�az�b�\�#�a����h<y���	����ww��Ay�H�@�_-�\ޕ��鿍�lZ!^�s���z�p�?ӦC�����dSR��*��QA;LPK�9u�L��_�b���i4޲�p������y�ذ~��C� �k�=b����N��������Y�ӰA����^��Hۂ�X�T`�+��:'�p�_sy*+��7Bx\qu�gY�'��̄E�e����V�%�q���w@$U�=�,��A�ĳ#��ur�*Owh7{��d�'���Jd,�����'d������a��J��Nh��n������Et# �*/(R/���걌/�~:O��:�ڕSmG���i���÷��
X� �8��3E�R���{��Mq��~O.�V;� �
U[XA���eD�_�GZkma
��];rADo��j���^���<�=� ��E�q[�G/���.t�����L��U)Ue����{�t]�4�MyG���DW� ����3W�w��	���üM�CY�D���/hh��N-�9�L���g��y?�;B(.�&h������VFЂ�O�����\�-XnMu��>�tp������3�.����i����<	���[(+TC���V��t�e����t�-2Mk�� (��eItY�K[�e<ܳ�Y[�0�f)��#5h�նb|	[Pto�����kT��P0egVX���n���b�t^��/:�f���+[����t/���V����[�r���ߏe����i�R0a�
ܤ�脆��֖��yN5��=��Ff���T��y�;���#�ry�D��1`��jE�'�%O���>�!�V�j�=�49z�$p7Px�/�<B0Y�U]Wқ��0���+�Ws�GȀ���Ø��Π8i�G߾y��R�܆�2����5�<�R���^�Q�X�4K:S���Q��oX�0�6��O��~��2��{�e�`Y����f�{�S���{D ��弧�n���)���$C��O9�;K,~�8Y�����<cT�9F�K�~�)<����Ȱ�������퐁A��e/ʷ%m�a�V�,	��0��{�kzN}�`�4��L4��hq� $���tϲ1n�����ʇ��V�Aa��k$��򷺓�H���n�>��#iϴ��5܌r�ċ:Y\�t{^�}�a�jCd���¨%9Y^�v���|s�y@�[gbk��O����E�t�Cg}w�g�u3����Dc~���]\��,^Fxئ	Y�{�]��������62K��@'Op�.�S��7�/	�*��{�hLd�*��x���:y�ǜ��M���!9��zoڀI#���9Y7�5�F^�6yB� +���󢤑ț���J9y�/k
�Ñ�l�oc��tmY�����{���46Ll���i4aє�<��5���zP?�K��j���T��ꕒ��m�	\��/��@Ǎ      �      x��[M��y>���:r�=�|�#�fFZ�DI�HV�����f��{(��k� "���}	� p��Y�'p��d�d�?��C~������&g���ZC6����~ޏ�l<ѩ�F�h�ob&�����w��W?��g�u0�e!�Ib��e6��67#��ϓ8�i���J<U�r�&1��Յ�^��r������gb����ϊ����?Ď�^ڗ��f'�)b\+�Hu,5I&���T�+s=W�A�{&��}�\$#��Т�'�h�dX/�Er��)�t�Itf"�|��$�	�+I�mw�����0���$�I�g�ȕ�Nw+�mo�'1Kp:��D�S���I��
[a#%��p�8Mf����ċ����)Σ3�0S2ǣ���.�MS�<Wz��ȳt� Γs<?Ӧ�K�҈��U.LA�b5��r4=ϰ�l2"�sp?����Ip�6z!s#m�+�b&��s'E$Y��#%�r��7�H|��ߌ��]$^�:��rA'�����#�1S˥��
�d폳������G*���V�eZ@�N���C�Y"�
OKc���L!�l�ˑx<L%�A�Ù΋I$�c���\&��w@$E$NS}!���;���6����M����*��l�Y�iL�3|���	�O��QEK
\Ʉ�,����eFb��Xx`	ɛ�x6�u9�XP$)�"���e�O��
1T�����0e��@�Un�(Ҭ�[Az\�EI����*��TǢ].�sM3�៤�W[|�
G��BZ�{�U�YM2b1�b�a[l�tC�Ƥ���X�Լ�#2����ᡨCb�[;G�,"��h�C�,�1-�����({�ㆼL��x\b[��`Ɂ-�t/Λ'^:s0{�ɥ?L��r4�!����/��@ap$!5hFbf�4�gL����|!1�ܗuQ���U����Ǒѭ,WR��Aw6"���Lb2Mc4�.�&%X��IƤ�L�7��!inF�Q�|�\�3'��?��'a!8P=��lޑ��,��Z�E'��ڢ�_����i�
���&��R��J��#�;:=|������X����)��4�b�YBgP�F+GzN촏��I�m�:���J>{IQ����|�
{}q����;��٠�{���#��Aw����g�۴UM���{�8�n���� ���\�RP�!F��i���x���j= �f���7i{�▍��?�l��`hH.
J��+?����p�k����0��t@k�+�q~�51�ݫ�F��ȱ�^s�����/X/ȑ�@���c���5�	3������2�:qO���H�#^�f�e�;u1�H����q�D�|�E���l��쵎&2�T�UXQ>�5~'�Db�+N���t��-rdy,���Vb]�B��qN�ҒF�ِ��F;�Bs�w��z���Y�huw�mOg�Ͷ3��s�����s�����^��d���W��=}�� αӛ�,�y�3�H.{��S5_➩�[_�����o'�)�ק�x^� 8d�;}Գ���5�R͡m���.� .�y||l�Ecu/�. ��� ���QB�Ȍ,��?�j�5-h�5����I�4��Mpٚ�!�4N�0W�1Q���:����0��R�֬O�ccm�>��-�C���A�IO�&a5��� 9���/�$	�m�`tˆ\�S����4�q���D�s5�����^��S��ƴ��m뜐����� |X�����5l6�GA�{;�Q�s]N���G�=�S�٤��f���ko�B�ВL)hu��[�p��^o�����5Kn�AZ>0M�����YX��X/�1A��E�2].AaN�d��s�L �|����%�@`�`��4�|:$Ŕ�K���I�E-��[ĺPs��D��E���@��FZ����2�J׻���g��h�h�ma?�A��U!߽N����h�L��]��.�+$�|�;���6|�:�g�Ѡ�9��p)#���8$�
��@��H!-�0��`:��!W���<1�l���V�H&"���ޙp���f{&,�*���3q�w�	���[Sq�O����6�7A�!���D�;א�w���ݭ��9�Q�n�u���J�KڴR�t��t��%�s�+�w%!Y`poN��;H2��k�
A�qz���j�:��9��c�uX�����3�Ӑ�-pP�z�����f��$X�bo+8�$��!�����Y�$�G��u���	ri���{5�������;�˂/�6E�n4�;D-���6��fW���;"�]�MΚ���u�NV����u��2�S+*ٜ(
�Vp@��t;|�1�;�'�Pm�}�Z����R4�֊��+���I<���w��No�W�;�G��҉�����.�M�9�L�K�	���*�����0P�BIb�x�����e�v��u
�x�|u�-l*��ײ)��5����W��e��d0�������,{$*��A��U�X�u&Ȅno���Э�v�Q�`�S5>xX�0.�c�Ӱ�a�k�{��e�v�8B��G�D��Jq����� ܛ%�39~hɋ�T4*���������T�����ej4�M.���.�b#�УFd ~9�L�Ω�ȉ>�ev�~ár�׵Cy'(S$���o�'P�56�jb�,�'9�ֵ֭bs�����������ƉNG�B��pX�޽�}�>�0<����э�>��6#�9�}O�=l�pǥ���g���1ay�Fuk�'W�잯��˯n�z���+�V��x
�D;b��-�&��|�d�Q��]�"��Z�n�a�^ExU��9�c�M��3$9��Z�iJ��u%CW�D�hky�^.%�!��@� =.
b������>Ö�t�*CQ�����eC`9T��,W®2�fw/�|"1T����3{8����$W�V��*�3.½lA/�/�eF1��0Ch���J�n'�T�|�
y���]�����^�-�V^���������JZ��!l���Aޣ,���X\@�vW-fU9j�eψL�U3S�&�2S?Tü$L������p(g�:Rsr��)9������#o���I�s���q���% 
� J�6`3n11�G���i��Dyل  ��ww�ڸEufY$�NO���j��x�q�� �m�&K�n��-��T�TQO؉��;O�����+Z��q��R�7����2�R�կ�U*T+��ʌv�՟�ykp�o�)�Õ,�W��5r���c���H��V�N��$L��d�S���_)�88���%&��I�:Q�.� !�̞�$�ډ(�V�ׅ�#Ds����cW��5�P䵥��s��T�ȡD�å�܍p���>����w�J�Oy�v��Oԛ���&#}��/RuI��\��s�7gr�\͇���ü�JV��'K�u�z����;��u�s�z�=����6MeD�VJ����Q���d��UbX)�By#^��{�p\ Y/�!S�a�tGt�%l���Dݻ��G��m��PWT���c�abb��c/��s^�����X�7(;E���v&�w��T�@S ����ؼ��}Q�{u��2=[7���Z�� �����7Ფz��Ϩ�寑�]��6��ߦk���@|��r�ty�-F���R�pP�3�pR�!���{Yz�*M�՞k�u�UJ�����5Σ�d݋�hp�}��D�TBj4ԴQ=��ڧ�$��m/C�c�AF��MS�J�^��7\���-��6�xY�xb�,�"w �̵G9�]����oD�^�n��g�c굝��e\�67�	��z��t��Ŋ]7k�ۋ�8S^�5��E��^�5I\	`���r�p7.���@H=�6���E�Z��f2��<�����+����V�Z��ޫ�5D�Q54ae���CNg:[�;�9[�u�,���Dϧ��d��k$_yz�c��{�D�iV����H	8�7�=�������k�Efҥ�DGxd8�6#���u����4��~#g�5��� ;�p�����d��]2����}��c��%�.�k[� �	  !���>T�b9«�3�����ϩ�u&m!�x�u+�,�"��R$�0b�۵2�|���.���`y��M�ʡd4�  ��%`/�a�f�:��VX9E�e�һ��AG�"�}@�����#,��\�.i���k�TlEG���C� �/ݠ��d6��v9倱A��W;��\O9W�����[0l�RqZ�����^2]�c��[��wؘN�-������5է���1bu��)b=��,�i����_ �2�he��4�jp-+�9	^zC�M'�	c�ڠ�+���%���O@"�9l<no�{��?�co6I�0�{s,��� ��lC����1�����Ⱥ���F���Pt��N�."�8]�2�
�u�i��47�2HA(ld�'��px�T!�� u�Q@����Ӄ��ih���qwl~Ͱ�{
��Y���&}pK�8�Y�=�24����؍��O��$�VP��Q���@%�skF4ښ��AnP[���߲��������	02}y��
���Psd��W��-@Y��s��Xd��_����M.Wmw����x��Y���ӬhYMO_H3�
Z�n��]��ʪNk����T��gEr�oف<��2���s���eC��VU��ty�Ɩ���]D���Tgɥ�l�$�����\�1��Vaϱ�͆�
R<"olצ[�2�
�;</Je���k+Z.3h��U��J��^ȜzT��?��'�^{����׫tm�x2�ӯ(uS^0EǍ�d�s۬P/�n��UzV�&�K�2��L�gn�Z�9u���S���~�U�T����-��:#����Z˽C:�����k�dnd3Ė�8�����j\5-BE���-�׺=�����ٯ3/�I%p�,!'G�my�RgV�\����p�dk���!� %�Gl���MKf�mv��̪K�A^L�;���q�2}�����飦������rlr���~I�͍-���o��ゼ��E�"�)�.�&����/,o��JJp�2��hRqV���Or�VO
����*9,�C䡁v��kT���̍��������:K숿:/�cM�Q��r�r�I���!!k��h�������O?�e$%�9:��5}������7gV%w���n��x��D�2�': ��\�jZ~�k}č�c�nK�j5fm
���x:х�6�
�x�>��-b�g2YT^�%�vG���l��>uR�ɍRen��X���|&�����E�����G���o�:�6h�](>���i��HO�@S�DA�&%2�I2�S|x�,���\X��ӥ��y-���k'Q�4 ��k&���Z�>�K��6�����>�u�?"�_�4��u5�~�<�hA�r�
�,�E2����z/���>�0QE�Q�&��t��� �4���924��� ��aj�|�ɾR��ӣv�9�V��9Jl%n�n�.�U����XyX)P�*����}V�Y���� ���۽�N�ҏ"��hv6���4�Oy�o���3�! WMo�/����_}��}�C�� �G�?�#����I���0���~�^�jx���_��jaL����b�=S48?�ϮwJ~ZĥG���f��4�?���+gTn��4���"� �
����K_�{���:�S���/���M.UZUw��|w�m7���}y)�K���d��� ��_����:�͡�_��%�#�F���gl�[�:4��eT�:<�	�J�:��P��y_M�ս$�<���i�s�vh�"m�FD��x �)�å�N�(7&���p�+��Ct��i�\�rK,�{��♓%܀$�*k\h�vQ�n�4Y�B8)8�V�KϪ��F�U��)�F}B5Djw�q9O�����r�7�AZ��y���CjD��u�3��ˍ��2XL\�tr�ԓ���Ҹ��� U/	���v6 ���vV�S 	d{Ue`�Jc[��9c{Zڈx`�9�OX�\�m�w:b�r��Kz�
Ϗ��[S���Ta	��uQ�߲�MOP�1�41Pp�#���wv{��S��-�����@Sgg�]{ը��a���-��������~��o����������U*����#�"=�@D���@����WF�I8�Ֆz�nql��5�=8'��b��V�T�s�ݭN��8�B�.�o����ĬU����\h�I�4aos��`	Q�̽�t�bt��Ni�1'����>�����xf0y�d�A:�Oժ�6�<���/���X�+��ͬ_{�µ���w��k�6��J��cm�FTc��YS�
�wJ�{'�:�������50�����	�����xH����yL��٘xu�a�@na^��v{_øK[�#��������J'��EzBW��t9��Ƶr�T4��ϕ��I��~�/|�n���8/6�F/�i�
�����\�)49,v�R�(��a���$��2�"uvk�'X:�r��>ZM?W�T�ٜ�{1\��2޳I��+釪��S%��Gn�?���?�$�      �   �  x�]��n�0�ׇ��~TB`WE�ZU����68	�c[6$%O_C1��>���c����D������խ Ý!��P��J�x-G���2M�'����:ӱ&|4v�q��V�ɕ�h+c���씪�2,;mZ��%�/$�I�G)�$]�٣\	=e�<c�+��{���}�Uk��j�S��!.Ј�g^���,8����\�Cc�ec}�� �a	6�[|��x"M��gn[���n���`-�z9���I�9x�L7$:�~��>�3��H����Zr�|�=ސ�VW�#{�Xt7,�Ŭt�a��"�XkW'��W&e��i.!cC���ѥ�8.��̲0ɋ^�`y���l�u��_r9mo���=����      �   �
  x��ZMOI=�G�U���cn0����4�Kҝt�vQ�Vw�_�/��H{(Jʱ�	����-�U�7�e_�6m�Ӯ�J�F����I.y�C%�P�i��T��\���}�����&7͖��?)g+��>z5���V�����x��]ǮrO��p�Q�Z�W��GUx�f7�_$���E�,�Գc',�*i>���	��D;}��a'��ys�>���1QI�+�}��G�RP	
O��,�w}\���4���JY_-pu/xa`G%�ǖ�mr�(�j�\������ߋ�ٷԦ�{J�G�v�=s��4�RR��W��;[���r�D��K�)�WA�*8��g��`J������&v��' ����⚊��@���'�W\lb�ggqX�qƞn�P�v��z���ˀ$�ˮe׹]��D�e8�/,���$�4�bg]�%0���V(�FG�*��z�)�ٟy��zv:<>�>�"�{*g9P��ѫ�A����aW�m��jh#�u��n���ٰ�}_�nd��&�j��x������kQ��n��}���}�WR�V��;A9w���#�$�O�n��k�rB`t�]��=!��e�<��m^$\\��T8.��߾Vrv�m�ȮӰ]�)�> ��@D�@)KPѥ\ i���M�z@rVh$	�H��h��%��������%4�Ծ�ր�!�@E���4��!]�G(v�-�O�<�f{J�H�d
�k��6fv3��g�0��*�(=�J�tqr;N=2#�[���,�Py艵DcZ���b�f_�5Y���YSi�vtj)��)����v��e��o��d��@5UH�/nZ���~G���
�+4m�7)xZY�)���|0%LѼ��P���;�F�_ެc߇���v~���J@S�3�摒�^ �Ǌ;�|H���|�[�� _^�v��H�mV��Z�k)Lm�Fҽ,%8��p��Gp�῏���Kx(���9)[�;|Nښ`#P#uŕwD���=t�k��ǡ�`"aS�#�2��a*�~:�C[8�}!SM�<����U��r�BO�q6���]�)��!�=�nL�G:E��M�~���^�j�c��AG9j�ym-�!Ƒ��)~��%��m0!�Z*Q�f���b�f��f�y���o���ò[�h�V�h1a��g#�5�ֱͱa��H&���3�W
y�A�7�� I�₝v�6/��C�j���@A���I^b��4,6}^�`'��a%k�<)*_Zc�Gn�P��^`����x���&�c6��G���m"����j.�"5�QXS�G��R��ǖ��t�T !�{�_f;$��)��6�d�1��+���J	�v�ݳӸ���.�% 7*'+�-�7L��l� ��#�U�]3�[@1�$&Bq�c�����"7M�;�	���1n,Lyp�S�b�눸��5�!�5����AבX�yw�1���CJd8'[
s�0J>��!$�!4$�Z"W
�s/\.�	��t��-u�{S~z6�a7�!�rٽ���d=.9��D�2���������S׏����#O�B��R.7�}���|W�vO�!Wd��/ XM����Tt�_��c���
.�[N�1�e@:�dx@M�0�JcN�JX XS�M����iG�Ė���ص�VC7��R��/rC;U0M��R���s*J;i�g��68���q����qZ2�� J���K��})�j��1Y�ʢ��R@B��[�9���96�6��M�K+D#@q�:���cR�2p��!�Ţ�4X� �٧���c,;�#�3A�D%9�v����E�8�b�ަ����%6;��v������Z��R� �~=�)UW� 5��`iL3�1�|fiD%O�ar��&*4�T�l1*M�Kz8 v�DoR+��2�Lz�(�+��n�`|������q�TU��
-�eiΝDaav�|Fҧ玖�.`����s�$$t�(�W��E&�����8��%�5�M&�Wʖ��3�66��6i)�Be=$� ȑyS�`���\B�FJ��מ�Z���{~j2_�O4�� ����	���@�6X��1�d)��mz����4���i�6$�A�2��4?X�ۦ�>�L�1x+#�KF�6��0? �M
��q\�;��;Z����-�_���N1`���o#��Y�т�A`��Q�*\�����Ч%dfM(UA9XYAc��f6���}�X�4�-�S�O,S���1�b�}����Z�o&A�һj|6vr}5C��������X1�vWﬀf������Mn�-hz�#ȐÙ�
��-��=u͒��\�4 �\+k���Q���{�lx�7����q8L7�����Z���u�lt�N�����~"/������CΆ���킸���JX)��!�Г�f.6nv�t��ܓa�E$�:!-N�����7d��1��4�o���f�1��À��ӎY�f��]њ6����3V�ZA8FG3��9ZA���5���w4�2zA7�h]�;��4ƳGh{KS�M"�<ˢ��hډ)����lxX��S�i��n_��Ճ���Y���lhKFo�̤�����F�n��4�1�{���:�G����0��Jzv&�4�UG��&�[�څ�H}��D}���7�_Wx�M���ZZ5��0C>��SR=w�@�_��@J��-5%#O_W�R҃д#����Ç��+֩      �   �
  x��ZMs�<�b�"3��܄�	�M��/-m�kvF���~��x<F1��ڬVuUVf�}�Ǒ>�iG^�Z�P{'��!�<Io<)�D%b��F�ƼP����E�'>z��u?Ny��9�RG��NUV�*6^[�H:aV0t֦��DoS��Ċ�|c���GWk�n��Ќ�q�k�G:Q�<�8�`]�<(��d���}�6���m���.���^��IΉ�+�=]����y�H�ұ�2V2D��7�e?��=�z�L\v��+��T�H�!ؕ��>5SO��ݡ�6�-��+�VW��y�Rp���cKA�{��e���H����V�q�(�T�^A�9��m��w{28�׺6�̓�M+�ZpE��M��a�G9c�hC�՛�(����]���p�|<t��hU����<�����џ��#Ч]���!t4(�������F]�a�*�Kt�kr�9�@�FQ�X�v�\+-b;��ˉ>7�\��t�,
�"�EPO����RU=�l<XQT�G��__����Ӯ�ߏ}N��\������t��Zr���ԣ�H�G�8W"+A�m3��0.P�ȇ��d���%�� %�*}M]�v��?���F�ka�ƙC\��Pq	u�:퐌��X�/��A[U�D��H��l����Ԏ;�d5��Ţ$B歸:�~{L� �D���m�F:�ޣX��B� ��0A��s%�c����4�b�@��]�	�m������OA<��P��'�m�
ʣ?(RbtD�,'h5���k
;��q�OS��)++@�
)�d%~��öX�_QCV��E]o�{�*���k?�ձ�������͘!`���5�Ҋ�&�9.[���ns{����nP��+��0[��1 �U�5��Ғ.s�<�m[�-!1C��\��NXn5��!��L��vwƉE����J@$D�\!�t�"��6h���e:���@;E�y�>�\�6���JB�������X���Ϯ�^�C� �yו�[�U�L����ݯλ���~`�����q�s�R|��֮�/��o'���
^ko`=z���H�K{�I�E���m������:XQ��\�MGzwH]3�\�[���\��I'�}?�C�b�K�r�(ɻ��*����7W,���Κ��7h�}��$O䂬c�Ʊ�s�6�e|1���8a�|w{Z�PIcw�a�:3����m�$��q���´�e*�7s�a1���X���Cn1o����e��sÓ��2L}�1��Wѧ�{������!��<Y�q{d�}�t#��k�M����
.vi���xz��� ��Tq�+UIau�SE�q�"~�߀]4�xI񛂥ru�D:Oe����cj����2�K�VpwޠM#���Y�i���\��5	b5�dp&.��;�]��P�.�#�J�E`E����鴝r���+K��0�<�4Ol�h���b��뾻Iwh"r��f���V��5F�|�.�Gh2��VA�P�\��Ҫ�U�Q��o{z?�G���E)��"�(]����t7�����IA�#-6�GE�3cu�aYS�M��fzov�(P5�L�4�?R�{���A���G��J;%�����7;�������6�I���\%cqaF�.@c�_�=���У;��q��'.��1��+�u��YO��sY�*!-�<}�L�/!+��}�����䬪,�O�V�߻�?��+��be�V�l�,˕��̆>�a���Us4�Q�J{�nD���h�u��Zv�gC߁�3Qָ�'Y�G����վ�vi�C~n��BCy��~By9A�?�%&���5j�����v��'Z}��GNJ?`6��F~ו����32q9@�V��ʸk�Q0��Q֡�7�9m���Y~�K͞.�6S4���s�� ���[�-�iܣL~�1N,�C$���������՝Q�!T	�~-K�`�=��H��s!j-X�[5GW���.�0�����<����Lq���՜�������͘��h�^@�b�9[�sE�n�j�L �f-x$�6Z�h~Vs��ehG����F��)�fg���wq��/�{��we!�3y�8�a�][s�y���?L��]0�֑�\���E�H��-�L��`|��<�y]!��ei?��'(�p$j>��E����#-t����0�m��Mi.3��N�#�f�ҷtD�<�;�ym�e��s�|�enFV���3O@���w3O
i�x�\��8�>�<_�-K"�ٯd��7��Z���Jt��� ��tb���]�����{L�3&q��Ej��X9�s[�|���R�1�"���/CB��4 _'=$L�X����^�x���]�+��F�+��4c�����m2���s�����V��6�z�ϯ�yJ�.�G�l���5o�	��D�r�� p=K��y�ܯ��/��u� �������^�.�FƶI;�07e�#���h/��^8���,�,~l���Np�e*s��
>�^�k�	}�*�;�h���Y8p�b|h�r��3��f�綟!P��	����@����"8+�o�u�8ڻ�:I`$���,[R�c��92��1l���ma���X�p~U�8�S����e��1�\�&S�#���y_�X��9BX��V�yy���0@PB�yr���1c�6c�Q��R�hVzs�z�����S��2���s���)7���4;�V�1����;����5�;�����/0��_+f���^_;[#�U?{��y,��      z   �  x��YK�+9[�O1�A=X���e��!i�қ��@H7��%��-�h��x��BΡ�PFr
5���8��������)�)5���_��F(1�
���h�Y��	�	���Wp3L|���0r�N�N�R��ك��:�k$��2�qY�R	��̀�@,�d�pۦ�^ق!�f":N|�an'nS2d>~o5T������.i�WE���ѷ�ĝ;\���������f�D0*x}2����kw���+`"�����O��DYyl��5@F��Ůʍu[��c���W�Y�� x� A�ߖ�o�f��}n V��$xtx~�n`�[D�]Q��$��Y7��Nܾ�e,�DB��'��_%m������E�h�2@�Q�z�Uq�L��J�Qv�l=/l�V��)N
i�H��%ۺ�(�$�%Q��Ct¦�.*n���z�*���[ʻ�����ąF��-�O-��[YY���Հ�gO������Uq͂L �(�z�D�?����miO'Ƨ�Eh�9�'�|>%gג�Vي����9�T�^�xA��I}^����B�(e=�4�e���7ǝ�T�����a,��$j����(�z�g�K��㻧�{�M[z��r��H'Z/�2aV�N"�P��Q�;�|w��÷�4��@Kf��ϲ��[���l�xz`A!�EE���>���)�S��h��Y^qOQ1����:����!w��6�i� 9Fy@���س~�ݾٖ�g��Gr�����4� ����U��_^~��ڃl@W���C��W���+b�{RSԲLP��w��wE<%&/>K���.��[��*3��F����!o�=v\$�J�'��7r�ȉi�R���Ӈ̼v��ę�rv���:�q�����QȬH��ǣWع������0�� nͪ�p+"6P��TS6���'��
l{.H�k9w���{(@���
|f���Ek���ؼ[h%������=�߮�OՑ�cZ����������<���	zJ�V�$Y��S�ƹ2oW�=mn\�Z[^k/�w�9���z4s��bwۨ��>�l�Ջ���Jn��d&�ث��ȴ{\t��g,(lU^�6"�I�սsid�I�W�l�J~༵�R������	���Z����A3t��K��yŲ��</��;��HZ�@#��{\���/����=4ã���ǒ���+���'9�A�Z�K�L�2:�y� G0wq�Su2kM-�m���p�m�9<�H�¹1#���	��\C2�Q����Tsp�*[��dcm-��Ȁ���q�'�5�����Qmo���\V:��ek�5���n!��`P/�����������mPL�J�F�ƳCQO���po���x�*j��/jcn��J��7���hO�g`~�5���Yޡ1*��q��ۡ�]���m����
pv9��
Z��6��^���m�ظL2�Ŵ��t����QVG�D{J�W�z{��V�R�-k�W�E�I�k���Q�����[z�Z3k"/J^��x��
|6�S6P-��s4�O��
�Y[��d���4�͗x�빤����ou-=�X����t�elF���P�a8zN��2Xۤ������\��G�Bg��E���+�켄��:����x��
��.Ӧ<Ϛ4���nzۮݱ��@L�w\t��8��x��7tT�Y���1�����8w�V7��2��W��4m��ܖ�	�p��W���G��e���wa�������K      �   �
  x��Z�n��|n�<�H���7��%�do$m�,���Df8�@rd��~�P��" �@�-W�ϥN�iIv���^w�CW5��"2�B)a6��9&4��\���F�WZ���4A����B��!��K��0ħf�D��+�w���R�k�f��ر���Զ�hQJ#�`�d�(��k�?�б�t{ۦ�)mJ#T�L(2a-��1C��_�5/p�Br�o�qu�3�p�S_�U�ML	WX����P��A��u�Dv���(���6����ͣ�����L���q����������&��V���؂��C������c�dШn[+������?�mp���ƾõ�z�1�\;tcr�%�+����}��;f/�0�Nl-�Fq
�$�b��d����!n��T�
���<:m5�=d��������b��	�B��Q����]o�ЦibW���m5�3��ˍ�pB���FV�t��.,�%/����=�v�Pܢ��u�&c�K���Բ�cӍ���in^n,�����G��R��2���=��Ul���R]z�Ѳp�X�G�c��D.~`7�;F�>V�_(
'}!�Ap8�&�8[r���m�>�)��V��t�;�^X��Ջ��z�����]��m�o0����Ah�8*���K��9S����m�^�c�oq
%W8ʮʏ�bߚ��*v�Lۚ����`{���ҔZ���<��v�<3V�Ѹ.������i�E�I�E�S��k��sYp!��L�+��^/���,�� &���4�{0���R���`���>±�&���~�ggN�y��ȳ�Q�`ݳw�Sd����!>�̦R
��<A�<�\� ��8�Y7abA�����Y� I���Cg����S_c�4u�4�M��(!!K͵
-�M�z�Y��Lˠd#]� �DFѻK��
/�U�"�ҷ9�Z�IUJ��>zE�O/��Ul�>�}CU	�w���FZ[`�(*�������C6�ƭ��9�2�8f�#���)����	_�qk��r�K�؃*�$b⌂d��s���)���3p؂#q�bs�)�5�3�v�x��T��ڶ�Y5�P��F��Ҕ���%E3v@��ca�l�,�tP�����&I4ʻ�������
ʂH�A |CC�粘�<�S�5��a��?H�XLBh�;5G�2���!�{r
�`����D���.�( xQK�]=4�o�V;J'8�:�Q	�y
�$�fWqusI�@,�5X�8Q�T.�!�׌�?d'<�,���Ɵ���#�`�6��W3/Q�N��XQ:^U�%�
�@�۩���c����"Mi\�;x�����T�u���[ȅ�� �ol����PV�-&*��ooo��1�}�u �8n��ܪ10�ޑ}R�꾝��rU5?;kI|�ܶ�h�ԓ8��RK�3�=in �'y̗f�*��}'�Xm tK��0hLY������+�'=B$�
�p��#��AyCڌ�zrKĹzlm���	jd8�2YZU&�;���+
��0��@c�f�����fז�XƲ%��q0ηcm�P$,t
� �ip�/�eJ��!a"�`U�eE�,,$��B��\�98O0��R3�]���c��>o,Tvj�<��k�U�B�KQ��uh�JZ�(�$v��-tq��?�yΎ�[Z��S��U\�Q�w�Я�S�@���H ]�E|qW�z�<j
�m���LP8�L�����Wt���}	"��mqК�F܃#l��Svn�v�ȼ���Τ��U�q��2��؆����f���mM
���XO_�o�$�(�W���=��Y��,yX5�1΂$�ci,�u��?>��yi�,9�D����������ǡ�Й�f�TF�&��˹U�����D٧��*��b8��O1�2��+�0�����Sw}��]���¼"�p�����۹e��1�ᐩ�e6�@��I�f:��Y�����\ݬb+D����_���	N���5m��-��nN��g�i$:Ij֬Jgƀ%����ۡɨy�Io!�0R).K�v����r�#�W��b>��*Y�u�kE���Tļ��Ap���X
�*���x��)�(A�h�N-'Fק��*|���Ǧ���oi��@�'�-�`a�?�uw�E�Ӹ��%������WW�'~nKK{i����ė�K�b]���Ʈb�[�6�g�@F�Q����j����~g�<�-qwz����b�3�o[W	�w`����-�-���.� ,c{d�ݎ9\[!���SS䶤��tW5U��:1I���㎓����lxG��D&�Ӑh��.�2СHs��S6i� �:�~v�����O�'f4=�	+�ey��zH�1Ь��h�yyE�ː��flԒ�[; 툒�IW����N("]Wp�2457�&���� ����p�O��^�.�R�f6���6AB���v�M�>="ͶT<��s�
����K^f� �.U�vb���Qi���8��r�`6;�v��������5����5�n��@?&!��M&��ERS�'z����ɿ7z7m"x�zdSk]�a<���P�5���p�>��J�s������h`MVF-����ꨫ�a�v���9����$G�N��V�T���@6�凞![h�B���t\@4l����z�����o�P�N�@G���V��&�o(�m�C�v�����-͑�}Q��1��������._�x�;V��      �   �
  x��Z�r�]_�v�T���~�N�-ٖ4��N\qe���խt��9_�s[�$��0�U�.��s���χ���EZ玴Q�צ1JK2F	RB�F�F��6�g�[o䟅z�^)�膱�����Ֆ$*�&���(�deeM劉��~���z�޶ں��hN~��\ ���\���6ueMש�|�ݖN��?�g���ZW�t6>��л��V��N���1��ʒ�:TVwt]���>ћ��L�m�2mV���A������{��cG���*�L���k�Ft�䇉8��k�5�����ܬ^�n�o��i�	��ڞ��D��#]։n��� � 8�3ёQՐ��>��;��0�쩗�56h�Ƕ�AWLб���7�_����4e�����w�Z�#rk�V���o_S��Ev�<ޕܭ�N� {i� �~\��t� 5�u��.=��i��- �����������>c
&�J�N��̔c\mYK��.��X�.sJ5N�F+x
�����;�Įs�{�A�ơ�O��| =ݦՖ���mZm3EgZ/�%�ɏh%�F[Qݛ@���tsw�rM��4밂�f����HWyڦ����X o,�h��˸j��.w�DW]�7t�v���
l�kyvk�@av!����
�A6ǫ��wL��!dk�+�ʴK�*D۞	�̭Q�F`�2V�^���#%ӧ�;�D��n��A���X�
l.PŞN���:#`�G��w�3ۗ�}�d
�4�1"8nH-ܕc.��=:�_����F�<Ժ�!ُ8>���|�!X�FP$�}���P�����x�w)m�$ml M�	�0h���Gn�n�f<�5{?-`�j�j�kkk�{m0�ԡ;A���J)A��K�P�x��K��f8t�N�
p�Q7F��WWV�)���q7\Y���&z�{2���j���~��AN�p�����ZV�{~[��fS��Q������E5�|�-]������+Nu"��������{�U�uGg�]��.'�V�eBh1<
��|#�Ȩ���%��=�y�I�r�P��2�.O0`��4�si�!���'k����6�n`�-:�U��Ae���1�Z�6Xd���o{6�=�#$0�ڱ��r��%�M�ݡ���T���}�9Ew,�#�Wm���[ؗ���`N�o��"4�)&�:Rj:߯��n�"���
�jxj(��EK�����!����!�gnAV�� ǀ��a+�"����D}�18b~l��1��c�@�P:�M�^`����6Q2��t����Z�J̈y��5��`��yg8Iz-�v�X��%W��F��6u�@[DI3�s�\�(AK�]����n�Gh6�"�F�xh�����r�t֗i�Xo��#�/�%#E��z>[P�����=�����{�G�A�Ց��z�
Vi��� l"r �A6�s���VV���즡}��ƚ����\�V�vw��!�< �hL�h��w���j*~��p�O�q5 ��:z�"�II�Z�Z�kDz*��SX5 DD"�4g���|�t!���]�a6�A���)C���@p�*�J����`�a5l�}�
�� 1B�Ǉҗ�3�V��t�_��3E|D,��\�XT�v���i��s��h����m������z0��)��AFR|[��@\ڹZ^@�(��>�;P�9�/���ؚ��N#��heM�coA@��.M��l,�e��5Z-��heC��M9�s�0�$R ,�����hqKW����f}�`K�t��*ǚd%�n�%4��������-P�n��g�XL2G�{:�z��a��Țq
:D��n��K��J�X�z��~����H#�Z�9m��Ų��?��,�;8��!� �Y�/v������F���ffƈ-V]�e�y]@B)�\6[�����ķRl�,?tD�"�xAr����]W&��n�d���5��@�$���h}M�� �^�����@5Z��a8��j�0l@�OLa߆qG���j��o��牭�o��ݮ��C���t�nئ"����3�d����
{��*��$U	lzt�V������c����I^	^;zVl%���I�<���R���ֳD9�Vb��r~�Q/9���#[�~��w5lg��5�ך�Np�Ɔ�A�/0�|�I+���U���ժ�kls�7��������+��[a|4:�D4�f�������2<뗯C�J����C,KKD�����������0g�$'�F+�@�y����L��z�|��%'�UQ��tˉn�-ڝ��-�~��]��f�=y��k�H5'B����;z��Ow�i7�U�AL��oʫy��A�3�n�U����I��@�z���}E�������#A8%�^;6Ҳ��+�o���(D��	h���}1Z.0����,7r����0~�c���W�hz�O����e�(��?f����V����[+N�/87�����P|B������"����e
MTK��h}Mo�>O;�㋴e!���	�֝���gݣ���5F��9��$��[�e����;8����n�����%=0yg�9����%�9��Ė����~L��{�9=?~c�$o\4rGk#�>����|	J�)i�^�����ϗG�:��.��E�lCcd���\^���1fi��֏�}�z��g]���
xS��y�m������w]�����"_���9C;~!Ub).[���W���ҽ      x   �   x�e�A� �=w���r�n��4J���Ť�Jّ���B�� 7��d�{�iN�}c��Q�Dɵ�&jw-Hj�0:$�
-�:獍P �	�>�i޲/�跠�\@$U�ķ����s��"��Ā��8K������5�NR�'���z��+��1_����o�     