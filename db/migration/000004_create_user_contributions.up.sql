CREATE TABLE public.userContributions (
    id integer GENERATED ALWAYS AS IDENTITY,
    "companyId" integer NOT NULL,
    "contributionId" integer NOT NULL,
    balance integer,
    "voteBalance" integer,
    PRIMARY KEY (id),
    FOREIGN KEY ("companyId") REFERENCES public.companies(id),
    FOREIGN KEY ("contributionId") REFERENCES public.contributions(id)
);
