CREATE TABLE public.contributions (
    id integer GENERATED ALWAYS AS IDENTITY,
    "pullRequest" varchar NOT NULL,
    type varchar NOT NULL,
    merged boolean DEFAULT false,
    balance integer,
    "voteBalance" integer,
    "storyId" integer NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT (now()),
    PRIMARY KEY (id),
    FOREIGN KEY ("storyId") REFERENCES public.companies(id)
);
