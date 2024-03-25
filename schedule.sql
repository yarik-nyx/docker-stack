CREATE TABLE "schedule" (
  "schedeule_id" smallint PRIMARY KEY,
  "class_room_id" varchar,
  "group_id" varchar(10),
  "day_of_week" smallint,
  "teacher_id" uuid,
  "lesson_id" smallint,
  "number_of_day" smallint
);

CREATE TABLE "replace_schedule" (
  "schedeule_id" smallint PRIMARY KEY,
  "class_room_id" varchar,
  "group_id" varchar(10),
  "day_of_week" smallint,
  "teacher_id" uuid,
  "lesson_id" smallint,
  "number_of_day" smallint,
  "lesson_date" date
);

CREATE TABLE "archive_schedule" (
  "class_room_id" varchar,
  "group_id" varchar(10),
  "day_of_week" smallint,
  "teacher_id" uuid,
  "lesson_id" smallint,
  "number_of_day" smallint,
  "lesson_date" date,
  "lesson_start_at" time,
  "lesson_end_at" time
);

CREATE TABLE "classes" (
  "class_room_id" varchar(4) PRIMARY KEY,
  "class_type" varchar
);

CREATE TABLE "inventory" (
  "inventory_id" bigint PRIMARY KEY,
  "inventory_name" varchar(255),
  "class_room_id" varchar(4)
);

CREATE TABLE "groups" (
  "group_id" varchar(10) PRIMARY KEY,
  "group_curator" uuid,
  "group_speciality" varchar(255)
);

CREATE TABLE "users" (
  "user_uuid" uuid PRIMARY KEY,
  "user_fio" text,
  "user_role" smallint
);

CREATE TABLE "roles" (
  "role_id" smallint PRIMARY KEY,
  "role_name" varchar(255)
);

CREATE TABLE "lessons" (
  "lesson_id" smallint PRIMARY KEY,
  "lesson_name" varchar(255),
  "lesson_hours" smallint
);

CREATE TABLE "timetable" (
  "timetable_number" smallint,
  "timetable_start_at" time,
  "timetable_end_at" time
);

COMMENT ON COLUMN "schedule"."day_of_week" IS '1, 2, 3, 4, 5, 6, 7';

COMMENT ON COLUMN "replace_schedule"."day_of_week" IS '1, 2, 3, 4, 5, 6, 7';

COMMENT ON COLUMN "archive_schedule"."day_of_week" IS '1, 2, 3, 4, 5, 6, 7';

COMMENT ON COLUMN "classes"."class_type" IS 'компьютерный/радиотехнический/общеобразовательный';

ALTER TABLE "schedule" ADD FOREIGN KEY ("class_room_id") REFERENCES "classes" ("class_room_id");

ALTER TABLE "schedule" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "schedule" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("user_uuid");

ALTER TABLE "schedule" ADD FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("lesson_id");

ALTER TABLE "schedule" ADD FOREIGN KEY ("number_of_day") REFERENCES "timetable" ("timetable_number");

ALTER TABLE "replace_schedule" ADD FOREIGN KEY ("class_room_id") REFERENCES "classes" ("class_room_id");

ALTER TABLE "replace_schedule" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "replace_schedule" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("user_uuid");

ALTER TABLE "replace_schedule" ADD FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("lesson_id");

ALTER TABLE "replace_schedule" ADD FOREIGN KEY ("number_of_day") REFERENCES "timetable" ("timetable_number");

ALTER TABLE "archive_schedule" ADD FOREIGN KEY ("class_room_id") REFERENCES "classes" ("class_room_id");

ALTER TABLE "archive_schedule" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id");

ALTER TABLE "archive_schedule" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("user_uuid");

ALTER TABLE "archive_schedule" ADD FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("lesson_id");

ALTER TABLE "inventory" ADD FOREIGN KEY ("class_room_id") REFERENCES "classes" ("class_room_id");

ALTER TABLE "groups" ADD FOREIGN KEY ("group_curator") REFERENCES "users" ("user_uuid");

ALTER TABLE "users" ADD FOREIGN KEY ("user_role") REFERENCES "roles" ("role_id");
