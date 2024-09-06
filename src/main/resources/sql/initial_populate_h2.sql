-- Start a transaction
SET AUTOCOMMIT OFF;

-- Temporary table to hold question IDs
CREATE TEMPORARY TABLE temp_question_id (id INT);

-- Insert and process questions and answers

-- 1. Neutral color?
INSERT INTO question (text, stage)
VALUES ('Neutral color?', 1);

-- Store ID
INSERT INTO temp_question_id (id)
SELECT ID FROM question WHERE text = 'Neutral color?' AND stage = 1 ORDER BY ID DESC LIMIT 1;

-- Insert answers
INSERT INTO answer (text, points, question_id)
SELECT 'Grey', 25, id FROM temp_question_id
UNION ALL
SELECT 'White', 12, id FROM temp_question_id
UNION ALL
SELECT 'Brown', 16, id FROM temp_question_id
UNION ALL
SELECT 'Tan', 18, id FROM temp_question_id;

-- Clear temporary table
DELETE FROM temp_question_id;

-- 2. Dark color?
INSERT INTO question (text, stage)
VALUES ('Dark color?', 1);

-- Store ID
INSERT INTO temp_question_id (id)
SELECT ID FROM question WHERE text = 'Dark color?' AND stage = 1 ORDER BY ID DESC LIMIT 1;

-- Insert answers
INSERT INTO answer (text, points, question_id)
SELECT 'Black', 25, id FROM temp_question_id
UNION ALL
SELECT 'Blue', 12, id FROM temp_question_id
UNION ALL
SELECT 'Green', 16, id FROM temp_question_id
UNION ALL
SELECT 'Purple', 18, id FROM temp_question_id
UNION ALL
SELECT 'Brown', 19, id FROM temp_question_id
UNION ALL
SELECT 'Grey', 12, id FROM temp_question_id;

-- Clear temporary table
DELETE FROM temp_question_id;

-- 3. Bright color?
INSERT INTO question (text, stage)
VALUES ('Bright color?', 1);

-- Store ID
INSERT INTO temp_question_id (id)
SELECT ID FROM question WHERE text = 'Bright color?' AND stage = 1 ORDER BY ID DESC LIMIT 1;

-- Insert answers
INSERT INTO answer (text, points, question_id)
SELECT 'Yellow', 25, id FROM temp_question_id
UNION ALL
SELECT 'Red', 12, id FROM temp_question_id
UNION ALL
SELECT 'Orange', 16, id FROM temp_question_id;

-- Clear temporary table
DELETE FROM temp_question_id;

-- 4. Name something that might be a day old?
INSERT INTO question (text, stage)
VALUES ('Name something that might be a day old?', 1);

-- Store ID
INSERT INTO temp_question_id (id)
SELECT ID FROM question WHERE text = 'Name something that might be a day old?' AND stage = 1 ORDER BY ID DESC LIMIT 1;

-- Insert answers
INSERT INTO answer (text, points, question_id)
SELECT 'Foood', 25, id FROM temp_question_id
UNION ALL
SELECT 'A baby', 16, id FROM temp_question_id
UNION ALL
SELECT 'Animal/insect', 8, id FROM temp_question_id
UNION ALL
SELECT 'News', 3, id FROM temp_question_id;

-- Clear temporary table
DELETE FROM temp_question_id;

-- 5. Name a profession that involves getting wet?
INSERT INTO question (text, stage)
VALUES ('Name a profession that involves getting wet?', 1);

-- Store ID
INSERT INTO temp_question_id (id)
SELECT ID FROM question WHERE text = 'Name a profession that involves getting wet?' AND stage = 1 ORDER BY ID DESC LIMIT 1;

-- Insert answers
INSERT INTO answer (text, points, question_id)
SELECT 'Diver/swimmer', 50, id FROM temp_question_id
UNION ALL
SELECT 'Lifeguard', 27, id FROM temp_question_id
UNION ALL
SELECT 'Firefighter', 9, id FROM temp_question_id
UNION ALL
SELECT 'Plumber', 5, id FROM temp_question_id;

-- Clear temporary table
DELETE FROM temp_question_id;

-- 6. Name a place that always has a long bathroom line?
INSERT INTO question (text, stage)
VALUES ('Name a place that always has a long bathroom line?', 1);

-- Store ID
INSERT INTO temp_question_id (id)
SELECT ID FROM question WHERE text = 'Name a place that always has a long bathroom line?' AND stage = 1 ORDER BY ID DESC LIMIT 1;

-- Insert answers
INSERT INTO answer (text, points, question_id)
SELECT 'Sports venue', 28, id FROM temp_question_id
UNION ALL
SELECT 'Concert', 27, id FROM temp_question_id
UNION ALL
SELECT 'Bar/club', 15, id FROM temp_question_id
UNION ALL
SELECT 'Movie', 8, id FROM temp_question_id
UNION ALL
SELECT 'Theme park/fair', 6, id FROM temp_question_id
UNION ALL
SELECT 'Restaurant', 5, id FROM temp_question_id
UNION ALL
SELECT 'Every ladies'' room', 4, id FROM temp_question_id;

-- Clear temporary table
DELETE FROM temp_question_id;

-- 7. What is a common fear that many people have?
INSERT INTO question (text, stage)
VALUES ('What is a common fear that many people have?', 1);

-- Store ID
INSERT INTO temp_question_id (id)
SELECT ID FROM question WHERE text = 'What is a common fear that many people have?' AND stage = 1 ORDER BY ID DESC LIMIT 1;

-- Insert answers
INSERT INTO answer (text, points, question_id)
SELECT 'Heights', 50, id FROM temp_question_id
UNION ALL
SELECT 'Spiders', 25, id FROM temp_question_id
UNION ALL
SELECT 'Public speaking', 15, id FROM temp_question_id
UNION ALL
SELECT 'Flying', 10, id FROM temp_question_id
UNION ALL
SELECT 'Death', 8, id FROM temp_question_id
UNION ALL
SELECT 'Restaurant', 5, id FROM temp_question_id
UNION ALL
SELECT 'Every ladies'' room', 4, id FROM temp_question_id;

-- Clear temporary table
DELETE FROM temp_question_id;

-- Commit the transaction
COMMIT;
