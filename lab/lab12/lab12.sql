.read su18data.sql
.read sp18data.sql

-- Q2
CREATE TABLE obedience AS
  SELECT seven, denero FROM students;

-- Q3
CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 13 ORDER BY smallest ASC LIMIT 20;

-- Q4
CREATE TABLE matchmaker AS
  SELECT lover1.pet, lover1.song, lover1.color, lover2.color
  FROM students AS lover1, students AS lover2
  WHERE lover1.pet = lover2.pet AND lover1.song = lover2.song AND
  lover1.time < lover2.time;