BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "saint" ALTER COLUMN "gender" DROP NOT NULL;
ALTER TABLE "saint" ALTER COLUMN "birthId" DROP NOT NULL;
ALTER TABLE "saint" ALTER COLUMN "deathId" DROP NOT NULL;
ALTER TABLE "saint" ALTER COLUMN "familyId" DROP NOT NULL;
ALTER TABLE "saint" ALTER COLUMN "venerationId" DROP NOT NULL;

--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240821193459689', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240821193459689', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
