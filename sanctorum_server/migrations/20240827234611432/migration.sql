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
-- ACTION ALTER TABLE
--
ALTER TABLE "miracle" DROP COLUMN "year";
ALTER TABLE "miracle" DROP COLUMN "event";
ALTER TABLE "miracle" ADD COLUMN "details" text;
ALTER TABLE "miracle" ADD COLUMN "name" text;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "saint" DROP COLUMN "gender";
ALTER TABLE "saint" ADD COLUMN "gender" text;

--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240827234611432', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240827234611432', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
