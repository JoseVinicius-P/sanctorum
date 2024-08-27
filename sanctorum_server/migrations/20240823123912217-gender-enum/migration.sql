BEGIN;


--
-- MIGRATION VERSION FOR sanctorum
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sanctorum', '20240823123912217-gender-enum', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240823123912217-gender-enum', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
