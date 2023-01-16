DROP TABLE IF EXISTS `user_role`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `dictionary`;
DROP TABLE IF EXISTS `language`;
DROP TABLE IF EXISTS `word`;
DROP TABLE IF EXISTS `file`;

CREATE TABLE `user_role`
(
    id   varchar(36)  NOT NULL UNIQUE,
    name varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE user
(
    id       varchar(36)  NOT NULL UNIQUE,
    login    varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    role_id  varchar(36),
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES user_role (id)
);

CREATE TABLE language
(
    id   varchar(36)  NOT NULL UNIQUE,
    name varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE dictionary
(
    id          varchar(36)  NOT NULL UNIQUE,
    name        varchar(255) NOT NULL,
    language_id varchar(36),
    user_id     varchar(36),
    PRIMARY KEY (id),
    FOREIGN KEY (language_id) REFERENCES language (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE file
(
    id   varchar(36)  NOT NULL UNIQUE,
    name varchar(255) NOT NULL,
    path varchar(255) NOT NULL
);

CREATE TABLE word
(
    id          varchar(36)  NOT NULL UNIQUE,
    word        varchar(255) NOT NULL UNIQUE,
    translation varchar(255) NOT NULL,
    file_id     varchar(36),
    dict_id     varchar(36),
    PRIMARY KEY (id),
    FOREIGN KEY (file_id) REFERENCES file (id),
    FOREIGN KEY (dict_id) REFERENCES dictionary (id)
);
