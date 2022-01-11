CREATE TABLE public.companies (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar NOT NULL,
    github varchar NOT NULL,
    "privateKey" varchar NOT NULL,
    balance integer,
    "createdAt" timestamp without time zone NOT NULL DEFAULT (now()),
    PRIMARY KEY (id)
);
