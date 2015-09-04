DROP SCHEMA IF EXISTS rss_reader;

CREATE SCHEMA rss_reader;

USE rss_reader;

DROP TABLE IF EXISTS channels;

CREATE TABLE channels
(
  id BIGINT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  link VARCHAR(255) NOT NULL,
  description text NULL,
  pub_date TIMESTAMP NOT NULL default now(),
  PRIMARY KEY (id),
  UNIQUE KEY(title)
)ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

CREATE TABLE items
(
  guid VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  link VARCHAR(255) NOT NULL,
  description text NULL,
  pub_date TIMESTAMP NOT NULL default now(),
  channel_id BIGINT NOT NULL,
  PRIMARY KEY (guid),
  CONSTRAINT channel_id_fk FOREIGN KEY(channel_id) REFERENCES channels(id)
)ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;