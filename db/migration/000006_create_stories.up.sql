CREATE TABLE public.stories (
    id integer GENERATED ALWAYS AS IDENTITY,
    "privateKey" varchar NOT NULL,
    "pullRequest" varchar NOT NULL,
    type varchar NOT NULL,
    merged boolean DEFAULT false,
    balance integer,
    "voteBalance" integer,
    "companyId" integer NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT (now()),
    PRIMARY KEY (id),
    FOREIGN KEY ("companyId") REFERENCES public.companies(id)
);
