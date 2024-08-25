BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "ecclesiastical_hierarchy" DROP COLUMN "mother";
ALTER TABLE "ecclesiastical_hierarchy" DROP COLUMN "father";
ALTER TABLE "ecclesiastical_hierarchy" DROP COLUMN "numberOfSiblings";
ALTER TABLE "ecclesiastical_hierarchy" ADD COLUMN "hiearchyName" text;
ALTER TABLE "ecclesiastical_hierarchy" ADD COLUMN "details" text;

--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240823133623313', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240823133623313', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
