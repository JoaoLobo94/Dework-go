CREATE TABLE "public"."userCompanies" (
    "id" integer GENERATED ALWAYS AS IDENTITY,
    "companyId" integer NOT NULL,
    "userId" integer NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("companyId") REFERENCES "public"."companies"("id"),
    FOREIGN KEY ("userId") REFERENCES "public"."users"("id")
);
