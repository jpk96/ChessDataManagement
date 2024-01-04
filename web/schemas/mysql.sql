CREATE TABLE PROCESSING (
    PROCESSING_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PROCESSING VARCHAR(255) NOT NULL UNIQUE,
    CREATE_AT INTEGER,
    CREATE_BY VARCHAR(255),
    MODIFY_AT INTEGER,
    MODIFY_BY VARCHAR(255)
);
CREATE TABLE PARENTS (
    PARENT_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PARENT VARCHAR(255) NOT NULL UNIQUE,
    CREATE_AT INTEGER,
    CREATE_BY VARCHAR(255),
    MODIFY_AT INTEGER,
    MODIFY_BY VARCHAR(255)
);
CREATE TABLE SITES (
    SITE_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SITE VARCHAR(255) NOT NULL UNIQUE,
    CREATE_AT INTEGER,
    CREATE_BY VARCHAR(255),
    MODIFY_AT INTEGER,
    MODIFY_BY VARCHAR(255)
);
CREATE TABLE BUCKETS (
    BUCKET_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    BUCKET VARCHAR(255) NOT NULL UNIQUE,
    META_ID VARCHAR(255),
    DATASET_ID BIGINT REFERENCES DATASETS(DATASET_ID) ON UPDATE CASCADE,
    CREATE_AT INTEGER,
    CREATE_BY VARCHAR(255),
    MODIFY_AT INTEGER,
    MODIFY_BY VARCHAR(255)
);
CREATE TABLE METADATA (
    META_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DID VARCHAR(255) NOT NULL UNIQUE,
    CREATE_AT INTEGER,
    CREATE_BY VARCHAR(255),
    MODIFY_AT INTEGER,
    MODIFY_BY VARCHAR(255)
);
CREATE TABLE DATASETS (
    DATASET_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DATASET VARCHAR(255) NOT NULL UNIQUE,
    META_ID BIGINT REFERENCES METADATA(META_ID) ON UPDATE CASCADE,
    SITE_ID BIGINT REFERENCES SITES(SITE_ID) ON UPDATE CASCADE,
    PROCESSING_ID BIGINT REFERENCES PROCESSINGS(PROCESSING_ID) ON UPDATE CASCADE,
    PARENT_ID BIGINT REFERENCES PARENTS(PARENT_ID) ON UPDATE CASCADE,
    CREATE_AT INTEGER,
    CREATE_BY VARCHAR(255),
    MODIFY_AT INTEGER,
    MODIFY_BY VARCHAR(255)
);
CREATE TABLE FILES (
    FILE_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FILE VARCHAR(255) NOT NULL UNIQUE,
    IS_FILE_VALID INTEGER DEFAULT 1,
    META_ID BIGINT REFERENCES METADATA(META_ID) ON UPDATE CASCADE,
    DATASET_ID BIGINT REFERENCES DATASETS(DATASET_ID) ON UPDATE CASCADE,
    CREATE_AT INTEGER,
    CREATE_BY VARCHAR(255),
    MODIFY_AT INTEGER,
    MODIFY_BY VARCHAR(255)
);
