WITH inserted_question AS (
    INSERT INTO question (text, stage)
        VALUES ('Neutral color?', 1)
        RETURNING id)
INSERT
INTO answer (text, points, question_id)
VALUES ('Grey', 25, (SELECT id FROM inserted_question)),
       ('White', 12, (SELECT id FROM inserted_question)),
       ('Brown', 16, (SELECT id FROM inserted_question)),
       ('Tan', 18, (SELECT id FROM inserted_question));

WITH inserted_question AS (
    INSERT INTO question (text, stage)
        VALUES ('Dark color?', 1)
        RETURNING id)
INSERT
INTO answer (text, points, question_id)
VALUES ('Black', 25, (SELECT id FROM inserted_question)),
       ('Blue', 12, (SELECT id FROM inserted_question)),
       ('Green', 16, (SELECT id FROM inserted_question)),
       ('Purple', 18, (SELECT id FROM inserted_question)),
       ('Brown', 19, (SELECT id FROM inserted_question)),
       ('Grey', 12, (SELECT id FROM inserted_question));

WITH inserted_question AS (
    INSERT INTO question (text, stage)
        VALUES ('Bright color?', 1)
        RETURNING id)
INSERT
INTO answer (text, points, question_id)
VALUES ('Yellow', 25, (SELECT id FROM inserted_question)),
       ('Red', 12, (SELECT id FROM inserted_question)),
       ('Orange', 16, (SELECT id FROM inserted_question));

WITH inserted_question AS (
    INSERT INTO question (text, stage)
        VALUES ('Name something that might be a day old?', 1)
        RETURNING id)
INSERT
INTO answer (text, points, question_id)
VALUES ('Foood', 25, (SELECT id FROM inserted_question)),
       ('A baby', 16, (SELECT id FROM inserted_question)),
       ('Animal/insect', 8, (SELECT id FROM inserted_question)),
       ('News', 3, (SELECT id FROM inserted_question));

WITH inserted_question AS (
    INSERT INTO question (text, stage)
        VALUES ('Name a profession that involves getting wet?', 1)
        RETURNING id)
INSERT
INTO answer (text, points, question_id)
VALUES ('Diver/swimmer', 50, (SELECT id FROM inserted_question)),
       ('Lifeguard', 27, (SELECT id FROM inserted_question)),
       ('Firefighter', 9, (SELECT id FROM inserted_question)),
       ('Plumber', 5, (SELECT id FROM inserted_question));

WITH inserted_question AS (
    INSERT INTO question (text, stage)
        VALUES ('Name a place that always has a long bathroom line?', 1)
        RETURNING id)
INSERT
INTO answer (text, points, question_id)
VALUES ('Sports venue', 28, (SELECT id FROM inserted_question)),
       ('Concert', 27, (SELECT id FROM inserted_question)),
       ('Bar/club', 15, (SELECT id FROM inserted_question)),
       ('Movie', 8, (SELECT id FROM inserted_question)),
       ('Theme park/fair', 6, (SELECT id FROM inserted_question)),
       ('Restaurant', 5, (SELECT id FROM inserted_question)),
       ('Every ladies'' room', 4, (SELECT id FROM inserted_question));

WITH inserted_question AS (
    INSERT INTO question (text, stage)
        VALUES ('What is a common fear that many people have?', 1)
        RETURNING id)
INSERT
INTO answer (text, points, question_id)
VALUES ('Heights', 50, (SELECT id FROM inserted_question)),
       ('Spiders', 25, (SELECT id FROM inserted_question)),
       ('Public speaking', 15, (SELECT id FROM inserted_question)),
       ('Flying', 10, (SELECT id FROM inserted_question)),
       ('Death', 8, (SELECT id FROM inserted_question)),
       ('Restaurant', 5, (SELECT id FROM inserted_question)),
       ('Every ladies'' room', 4, (SELECT id FROM inserted_question));










