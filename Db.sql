BEGIN;


CREATE TABLE IF NOT EXISTS public.discount
(
    id integer NOT NULL,
    percent integer NOT NULL,
    duration integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product
(
    id integer NOT NULL,
    shop_id integer NOT NULL,
    photo_url character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_discount
(
    id integer NOT NULL,
    product_id integer NOT NULL,
    discount_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.shop
(
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    manager_name character varying(50) NOT NULL,
    manager_surname character varying(150) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.product
    ADD FOREIGN KEY (shop_id)
    REFERENCES public.shop (id)
    NOT VALID;


ALTER TABLE public.product_discount
    ADD FOREIGN KEY (discount_id)
    REFERENCES public.discount (id)
    NOT VALID;


ALTER TABLE public.product_discount
    ADD FOREIGN KEY (product_id)
    REFERENCES public.product (id)
    NOT VALID;

END;