BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "saint" (
    "id" bigserial PRIMARY KEY,
    "urlImage" text NOT NULL,
    "name" text NOT NULL,
    "title" text,
    "birthPeriod" json,
    "celebrationDate" text,
    "academicTraining" json,
    "cononizationDate" timestamp without time zone,
    "prayer" text NOT NULL,
    "summary" text NOT NULL
);


--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240813193653577', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240813193653577', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
