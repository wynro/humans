-- Students table
CREATE TABLE IF NOT EXISTS STUDENT (
    nip      INTEGER       PRIMARY KEY,
    dni      TEXT          NOT NULL,
    name     TEXT          NOT NULL
);

-- Subject table
CREATE TABLE IF NOT EXISTS SUBJECT (
    code     INTEGER       PRIMARY KEY,
    name     TEXT          NOT NULL
);

-- Relationships between students and subjects
CREATE TABLE IF NOT EXISTS ENROLLMENT (
    nip      INTEGER       NOT NULL,
    code     INTEGER       NOT NULL,
    FOREIGN KEY(nip)       REFERENCES   ALUMNOS(nip),
    FOREIGN KEY(code)      REFERENCES   SUBJECT(code)
);

CREATE TABLE IF NOT EXISTS BACHELOR (
    code     INTEGER       PRIMARY KEY,
    name     TEXT          NOT NULL
);

CREATE TABLE IF NOT EXISTS REGISTER (
    nip      INTEGER       NOT NULL,
    code     INTEGER       NOT NULL,
    FOREIGN KEY(nip)       REFERENCES   ALUMNOS(nip),
    FOREIGN KEY(code)      REFERENCES   BACHELOR(code)
);

CREATE VIEW IF NOT EXISTS ALL_INFO AS
       SELECT STUDENT.nip AS nip, STUDENT.dni AS dni, STUDENT.name AS name, SUBJECT.name AS subject, BACHELOR.name AS bachelor
       FROM STUDENT JOIN ENROLLMENT ON STUDENT.nip = ENROLLMENT.nip
       JOIN SUBJECT ON ENROLLMENT.code = SUBJECT.code
       JOIN REGISTER ON STUDENT.nip = REGISTER.nip
       JOIN BACHELOR ON REGISTER.code = BACHELOR.code;
