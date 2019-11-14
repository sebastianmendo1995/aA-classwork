DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

PRAGMA foreign_keys = ON;
CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255),
  lname VARCHAR(255)
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title character varying(100),
  body TEXT,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)

);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  body TEXT,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Ned', 'Ned'),
 ('Kush', 'Kush'),
  ('Earl', 'Earl');


INSERT INTO
  questions(title, body, author_id)
VALUES
  ('Ned Question', 'NED NED NED', 1),
  ('Kush Question', 'KUSH KUSH KUSH', 2),
  ('Earl Question', 'EARL EARL EARL', 3);

  INSERT INTO
    replies(body, question_id, parent_reply_id, user_id)
  VALUES
    ('This is reply 1', 3, 2, 1),
    ('This is reply 2', 2, 2, 2),
    ('This is reply 3', 1, 1, 3);

  INSERT INTO
    question_likes(user_id, question_id)
  VALUES
    (1,2),
    (2,3),
    (3,1);

  INSERT INTO
    question_follows(user_id, question_id)
  VALUES
    (1,2),
    (2,3),
    (3,1);