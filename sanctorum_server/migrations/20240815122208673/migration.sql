BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "saint" ADD COLUMN "sourceHtml" text;

--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240815122208673', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240815122208673', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
