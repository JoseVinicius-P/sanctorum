BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "saint" ALTER COLUMN "urlImage" DROP NOT NULL;
ALTER TABLE "saint" ALTER COLUMN "name" DROP NOT NULL;
ALTER TABLE "saint" ALTER COLUMN "prayer" DROP NOT NULL;
ALTER TABLE "saint" ALTER COLUMN "summary" DROP NOT NULL;

--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240815123253168', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240815123253168', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
