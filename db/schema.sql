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
  INDEX(pub_date),
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
  INDEX(pub_date),
  CONSTRAINT channel_id_fk FOREIGN KEY(channel_id) REFERENCES channels(id)
)ENGINE=InnoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

INSERT INTO channels (title,link,description,pub_date) VALUES("JavaScript","http://www.reddit.com/r/javascript/","All about the JavaScript programming language!",'2015-02-04 01:21:46 -0300');
INSERT INTO channels (title,link,description,pub_date) VALUES("Science","http://www.reddit.com/r/science/","The Science subreddit is a place to share new findings. Read about the latest advances in astronomy, biology, medicine, physics and the social sciences. Find and submit the best writeup on the web about a discovery, and make sure it cites its sources.","2015-09-04 08:54:54 -0300");
INSERT INTO channels (title,link,description,pub_date) VALUES("中文热提网：请在此用中文！","http://www.reddit.com/r/ChineseReddit/","",'2015-09-02 19:31:27 -0300');