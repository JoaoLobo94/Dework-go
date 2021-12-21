CREATE TABLE "public"."contributions" (
    "id" integer GENERATED ALWAYS AS IDENTITY,
    "pullRequest" varchar NOT NULL,
    "type" varchar NOT NULL,
    "key" varchar NOT NULL,
    "merged" boolean DEFAULT false,
    "companyId" integer NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT (now()),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("companyId") REFERENCES "public"."companies"("id")
);
