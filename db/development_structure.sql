CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "title" varchar(255), "content" text, "created_at" datetime, "updated_at" datetime, "destroyable" boolean);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "site_configuration_options" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "setting" varchar(255), "created_at" datetime, "updated_at" datetime, "value" varchar(255));
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120121015836');

INSERT INTO schema_migrations (version) VALUES ('20120122173814');

INSERT INTO schema_migrations (version) VALUES ('20120122180457');

INSERT INTO schema_migrations (version) VALUES ('20120122182058');