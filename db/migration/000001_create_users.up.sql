CREATE TABLE "public"."users" (
    "id" integer GENERATED ALWAYS AS IDENTITY,
    "name" varchar NOT NULL,
    "key" varchar NOT NULL,
    "job" varchar NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT (now()),
    PRIMARY KEY ("id")
);