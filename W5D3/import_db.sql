PRAGMA foreign_keys = ON;

DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  parent_reply_id INTEGER,
  body TEXT NOT NULL,
  question_id INTEGER,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  likes INTEGER,
  user_id INTEGER,
  question_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('michael', 'jordan'), ('steven', 'hawking');

  INSERT INTO
  questions (title, body)
VALUES
  ('I am confused','What is a physic?'), ('How much?', 'Wood would a woodchuck chuck if a woodchuck could chuck wood?');


  INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'michael'), (SELECT id FROM questions WHERE title = 'How much?')),
  ((SELECT id FROM users WHERE fname = 'steven'), (SELECT id FROM questions WHERE title = 'I am confused'));

  INSERT INTO
  replies (body, question_id)
VALUES
  ('No such thing as a physic',(SELECT id FROM questions WHERE title = 'I am confused')),
  ('As much as he wants',(SELECT id FROM questions WHERE title = 'How much?'));

  INSERT INTO
  question_likes (likes, user_id, question_id)
VALUES
  (1,(SELECT id FROM users WHERE fname = 'michael'), (SELECT id FROM questions WHERE title = 'How much?')),
  (1,(SELECT id FROM users WHERE fname = 'steven'), (SELECT id FROM questions WHERE title = 'I am confused'));





