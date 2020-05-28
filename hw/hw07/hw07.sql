CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- Q1 --
-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name as name, s.size as size FROM dogs as d, sizes as s WHERE d.height <= s.max AND d.height > s.min;

-- Q2 --
-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT d.name
  FROM dogs AS d, parents as p, dogs as par
  WHERE d.name = p.child and par.name = p.parent
  ORDER BY par.height DESC;

-- Q3 --
-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT p1.child as first,p2.child as second
  FROM parents as p1, parents as p2
  WHERE p1.parent = p2.parent AND p1.child < p2.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT  sib.first || " and " || sib.second || " are " || size1.size || " siblings"
  FROM siblings as sib, size_of_dogs as size1, size_of_dogs as size2
  WHERE sib.first = size1.name and sib.second = size2.name and size1.size = size2.size
  ORDER BY sib.first;

-- Q4 --
-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here
INSERT INTO stacks_helper SELECT name,height,height FROM dogs as d;
INSERT INTO stacks_helper
    SELECT dogs || ', ' || d.name, sh.stack_height + d.height, d.height
    FROM dogs as d, stacks_helper as sh
    WHERE d.height > sh.last_height;
INSERT INTO stacks_helper
    SELECT dogs || ', ' || d.name, sh.stack_height + d.height,
        d.height FROM dogs as d, stacks_helper as sh
    WHERE d.height > sh.last_height;
INSERT INTO stacks_helper
    SELECT dogs || ', ' || d.name, sh.stack_height + d.height,
        d.height FROM dogs as d, stacks_helper as sh
    WHERE d.height > sh.last_height;

CREATE TABLE stacks AS
  SELECT dogs,stack_height
  FROM stacks_helper
  WHERE stack_height >= 170
  ORDER BY stack_height ;