CREATE INDEX "enrollment_index" ON "enrollments" ("course_id");

CREATE INDEX "course_index_number" ON "courses" ("number");

CREATE INDEX "students_index" ON "students" ("id");

CREATE INDEX "course_index_title" ON "courses" ("title");

CREATE INDEX "satify_index" ON "satisfies" ("course_id");

CREATE INDEX "course_index_department" ON "courses" ("department");

CREATE INDEX "course_index_semester" ON "courses" ("semester");
