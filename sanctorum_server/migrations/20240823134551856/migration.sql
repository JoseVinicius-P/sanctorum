BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "miracle" DROP COLUMN "year";
ALTER TABLE "miracle" DROP COLUMN "event";
ALTER TABLE "miracle" ADD COLUMN "details" text;
ALTER TABLE "miracle" ADD COLUMN "name" text;

--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240823134551856', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240823134551856', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
