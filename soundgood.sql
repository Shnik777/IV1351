CREATE TYPE "level" AS ENUM ('beginner', 'intermediate', 'advanced');

CREATE TABLE "person"
(
  "person_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "ssn" varchar(15) UNIQUE,
  "first_name" varchar(30),
  "last_name" varchar(30)
  
);

CREATE TABLE "student"
(
  "student_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
  "skill" LEVEL,
  PRIMARY KEY("student_id")
  
);

CREATE TABLE "pricing_discount"
(
  "discount_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "sibling_discount" int NOT NULL
  
);

CREATE TABLE "sibling"
(
  "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
  "sibling_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
  "discount_id" int NOT NULl REFERENCES "pricing_discount" ON DELETE CASCADE,
  PRIMARY KEY("person_id", "sibling_id")
  
);

CREATE TABLE "instrument_type"
(
  "instrument_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "instrument_type" varchar(20)
  
);

CREATE TABLE "learning_instrument"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "instrument_id" int NOT NULL REFERENCES "instrument_type" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "instrument_id")
  
);

CREATE TABLE "teaching_instrument"
(
  "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
  "instrument_id" int NOT NULL REFERENCES "instrument_type" ON DELETE CASCADE,
  PRIMARY KEY("person_id", "instrument_id")
  
);

CREATE TABLE "contact_details"
(
  "contact_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "street" varchar(40),
  "zip" varchar(10),
  "city" varchar(30)
  
);
CREATE TABLE "phone"
(
  "phone_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "phone_no" varchar(20),
  "contact_id" int REFERENCES "contact_details"
  
);

CREATE TABLE "contact_person"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "phone_id" int NOT NULL REFERENCES "phone" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "phone_id")
  
 );
 
 CREATE TABLE "rent_instrument"
(
  "rent_instrument_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "instrument_type" varchar(20),
  "brand" varchar(20),
  "stock" int,
  "price" int
  
  
);

CREATE TABLE "rented_instrument"
(
  "rent_instrument_id" int NOT NULL REFERENCES "rent_instrument" ON DELETE CASCADE,
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "rent_date" DATE NOT NULL,
  PRIMARY KEY("rent_instrument_id", "student_id")
  
);

CREATE TABLE "timeslot"
(
  "time_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "time_slot" TIME(4),
  "date_slot" DATE
  
 );
 
 CREATE TABLE "group_pricing"
 (
   "group_price_id" LEVEL NOT NULL PRIMARY KEY,
   "payment" int NOT NULL,
   "price" int NOT NULL
  
 );
 
 CREATE TABLE "private_pricing"
 (
   "private_price_id" LEVEL NOT NULL PRIMARY KEY,
   "payment" int NOT NULL,
   "price" int NOT NULL
  
 );
 
 CREATE TABLE "group_lesson"
 (
   "group_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   "instructor_id" int REFERENCES "person",
   "skill_pricing_id" LEVEL REFERENCES "group_pricing",
   "timeslot_id" int REFERENCES "timeslot",
   "max_students" int NOT NULL,
   "min_students" int NOT NULL,
   "instrument_type" varchar(20)
   
 );
 
 CREATE TABLE "student_group_lesson"
 (
   "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
   "group_id" int NOT NULL REFERENCES "group_lesson" ON DELETE CASCADE,
   PRIMARY KEY("student_id", "group_id")
   
 );
 
 CREATE TABLE "ensemble"
 (
   "ensemble_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   "instructor_id" int REFERENCES "person",
   "timeslot_id" int REFERENCES "timeslot",
   "max_students" int NOT NULL,
   "min_students" int NOT NULL,
   "genre" varchar(100)
   
 );
 
 CREATE TABLE "student_ensemble"
 (
   "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
   "ensemble_id" int NOT NULL REFERENCES "ensemble" ON DELETE CASCADE,
   PRIMARY KEY("student_id", "ensemble_id")
   
 );
 
 CREATE TABLE "private_lesson"
 (
   "private_id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   "instructor_id" int NOT NULL REFERENCES "person",
   "student_id" int NOT NULL REFERENCES "student",
   "skill_pricing_id" LEVEL REFERENCES "private_pricing",
   "timeslot_id" int REFERENCES "timeslot",
   "instrument_type" varchar(20)
   
 );