BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "birth" (
    "id" bigserial PRIMARY KEY,
    "period" json,
    "country" text,
    "city" text,
    "details" text,
    "correspondentActualCountry" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "date" (
    "id" bigserial PRIMARY KEY,
    "year" bigint NOT NULL,
    "month" bigint NOT NULL,
    "day" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "death" (
    "id" bigserial PRIMARY KEY,
    "period" json,
    "country" text,
    "city" text,
    "details" text,
    "correspondentActualCountry" text,
    "isMartir" boolean,
    "causeOfdeath" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ecclesiastical_hierarchy" (
    "id" bigserial PRIMARY KEY,
    "mother" text,
    "father" text,
    "numberOfSiblings" bigint,
    "_saintEcclesiasticalhierarchySaintId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "family" (
    "id" bigserial PRIMARY KEY,
    "mother" text,
    "father" text,
    "numberOfSiblings" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "miracle" (
    "id" bigserial PRIMARY KEY,
    "year" bigint,
    "event" text,
    "_saintMiraclesSaintId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quotation" (
    "id" bigserial PRIMARY KEY,
    "quote" text,
    "context" text,
    "reference" text,
    "_saintQuotationsSaintId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "religious_event" (
    "id" bigserial PRIMARY KEY,
    "year" bigint,
    "event" text,
    "_saintReligiouseventsSaintId" bigint
);

--
-- ACTION DROP TABLE
--
DROP TABLE "saint" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "saint" (
    "id" bigserial PRIMARY KEY,
    "urlImage" text,
    "name" text,
    "religiousName" text,
    "gender" bigint NOT NULL,
    "title" text,
    "birthId" bigint NOT NULL,
    "deathId" bigint NOT NULL,
    "familyId" bigint NOT NULL,
    "venerationId" bigint NOT NULL,
    "academicTraining" json,
    "cononizationDate" json,
    "beatificationDate" json,
    "prayers" json,
    "summary" text,
    "sourceLink" text,
    "fullText" text,
    "sourceHtml" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "veneration" (
    "id" bigserial PRIMARY KEY,
    "celebrationDate" json,
    "legacy" text
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ecclesiastical_hierarchy"
    ADD CONSTRAINT "ecclesiastical_hierarchy_fk_0"
    FOREIGN KEY("_saintEcclesiasticalhierarchySaintId")
    REFERENCES "saint"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "miracle"
    ADD CONSTRAINT "miracle_fk_0"
    FOREIGN KEY("_saintMiraclesSaintId")
    REFERENCES "saint"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "quotation"
    ADD CONSTRAINT "quotation_fk_0"
    FOREIGN KEY("_saintQuotationsSaintId")
    REFERENCES "saint"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "religious_event"
    ADD CONSTRAINT "religious_event_fk_0"
    FOREIGN KEY("_saintReligiouseventsSaintId")
    REFERENCES "saint"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "saint"
    ADD CONSTRAINT "saint_fk_0"
    FOREIGN KEY("birthId")
    REFERENCES "birth"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "saint"
    ADD CONSTRAINT "saint_fk_1"
    FOREIGN KEY("deathId")
    REFERENCES "death"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "saint"
    ADD CONSTRAINT "saint_fk_2"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "saint"
    ADD CONSTRAINT "saint_fk_3"
    FOREIGN KEY("venerationId")
    REFERENCES "veneration"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240821191802410', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240821191802410', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
