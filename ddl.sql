-- public.boston_ma definition
-- This table contains all the listings along with their properties for Boston MA region.
-- "type" tells whether the listing is: single family, multi family, condo, land 

-- DROP TABLE IF EXISTS public.boston_ma;

CREATE TABLE public.boston_ma (
	id serial NOT NULL,
	agent_id text NOT NULL,
	baths_full int2 NULL,
	baths_half int2 NULL,
	beds int2 NULL,
	facts json NULL,
	hashtags _text NULL,
	last_updated timestamp NULL,
	listing_id text NOT NULL,
	pictures _text NULL,
	price float4 NOT NULL,
	remarks text NOT NULL,
	sort_id text NOT NULL,
	sqft int4 NULL,
	status text NOT NULL,
	street_name text NULL,
	street_no text NULL,
	"type" text NOT NULL,
	videos _text NULL,
	zip text NOT NULL,
	CONSTRAINT boston_ma_pkey PRIMARY KEY (id),
	CONSTRAINT boston_ma_un UNIQUE (listing_id)
);
CREATE INDEX boston_ma_bath_full_idx ON public.boston_ma USING btree (baths_full);
CREATE INDEX boston_ma_bed_full_idx ON public.boston_ma USING btree (beds);
CREATE UNIQUE INDEX boston_ma_id_idx ON public.boston_ma USING btree (id);
CREATE INDEX boston_ma_last_updated_idx ON public.boston_ma USING btree (last_updated);
CREATE INDEX boston_ma_listing_id_idx ON public.boston_ma USING btree (listing_id);
CREATE INDEX boston_ma_price_idx ON public.boston_ma USING btree (price);
CREATE INDEX boston_ma_sort_id_idx ON public.boston_ma USING btree (sort_id);
CREATE INDEX boston_ma_sqft_idx ON public.boston_ma USING btree (sqft);
CREATE INDEX boston_ma_type_idx ON public.boston_ma USING btree (type);
CREATE INDEX boston_ma_zip_idx ON public.boston_ma USING btree (zip);
ALTER TABLE boston_ma ADD COLUMN idx_open_houses _json;
ALTER TABLE boston_ma ADD COLUMN idx_virtual_tours _json;
ALTER TABLE boston_ma ADD COLUMN open_house_today boolean;
CREATE INDEX boston_ma_open_house_today_idx ON public.boston_ma USING btree (open_house_today);



-- public.hearts definition
-- This table contains contains the information of users that have hearted a listing

-- DROP TABLE IF EXISTS public.hearts;

CREATE TABLE public.hearts (
	id serial NOT NULL,
	email text NULL,
	listing_id text NOT NULL,
	"name" text NOT NULL,
	notes text NULL,
	phone text NOT NULL,
	CONSTRAINT hearts_pk PRIMARY KEY (id)
);
CREATE INDEX heart_email_idx ON public.hearts USING btree (email);
CREATE UNIQUE INDEX heart_id_idx ON public.hearts USING btree (id);
CREATE INDEX heart_listing_id_idx ON public.hearts USING btree (listing_id);
CREATE INDEX heart_phone_idx ON public.hearts USING btree (phone);


-- public.hearts foreign keys

ALTER TABLE public.hearts ADD CONSTRAINT hearts_fk FOREIGN KEY (listing_id) REFERENCES boston_ma(listing_id);


-- public.hearts definition
-- This table contains contains the information of users that have emailed themselves a listing

-- DROP TABLE IF EXISTS public.mails;

CREATE TABLE public.mails (
	id serial NOT NULL,
	email text NULL,
	listing_id text NOT NULL,
	"name" text NOT NULL,
	notes text NULL,
	phone text NOT NULL,
	CONSTRAINT mails_pk PRIMARY KEY (id)
);
CREATE INDEX mail_email_idx ON public.mails USING btree (email);
CREATE UNIQUE INDEX mail_id_idx ON public.mails USING btree (id);
CREATE INDEX mail_listing_id_idx ON public.mails USING btree (listing_id);
CREATE INDEX mail_phone_idx ON public.mails USING btree (phone);


-- public.mails foreign keys

ALTER TABLE public.mails ADD CONSTRAINT mails_fk FOREIGN KEY (listing_id) REFERENCES boston_ma(listing_id);



-- public.hearts definition
-- This table contains contains the information of users that have texted themselves a listing

-- DROP TABLE IF EXISTS public.mails;

CREATE TABLE public.texts (
	id serial NOT NULL,
	email text NULL,
	listing_id text NOT NULL,
	"name" text NOT NULL,
	notes text NULL,
	phone text NOT NULL,
	CONSTRAINT texts_pk PRIMARY KEY (id)
);
CREATE INDEX text_email_idx ON public.texts USING btree (email);
CREATE UNIQUE INDEX text_id_idx ON public.texts USING btree (id);
CREATE INDEX text_listing_id_idx ON public.texts USING btree (listing_id);
CREATE INDEX text_phone_idx ON public.texts USING btree (phone);


-- public.texts foreign keys

ALTER TABLE public.texts ADD CONSTRAINT texts_fk FOREIGN KEY (listing_id) REFERENCES boston_ma(listing_id);

