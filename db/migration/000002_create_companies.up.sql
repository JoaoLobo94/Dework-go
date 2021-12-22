CREATE TABLE public.companies (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar NOT NULL,
    github varchar NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT (now()),
    PRIMARY KEY (id)
);
