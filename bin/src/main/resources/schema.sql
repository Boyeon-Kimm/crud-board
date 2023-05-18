DROP TABLE IF EXISTS `comments`;
DROP TABLE IF EXISTS `board`;
DROP TABLE IF EXISTS `users`;


CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) UNIQUE NOT NULL,
  `age` int NOT NULL,
  `img` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `board` (
  `no` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(500) NOT NULL,
  `id` varchar(40) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `generatedDate` varchar(120) NOT NULL,
  `modifiedDate` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `comments`(
	`commentNo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`boardNo` INT NOT NULL,
    `id` VARCHAR(100) NOT NULL,
    `content` VARCHAR(1000) NOT NULL,
	`generatedDate` varchar(120) NOT NULL,
	`modifiedDate` varchar(120) NOT NULL,
    CONSTRAINT fk_board_no FOREIGN KEY (boardNo) REFERENCES board(no)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4;


INSERT INTO users (id, password, name, email, age) values ("ssafy", "1234", "김싸피", "ssafy.kim@ssafy.com", 20);
INSERT INTO users (id, password, name, email, age) VALUES ("administrator", "qkrwoals123", "관리자", "catbirdseat@naver.com", 999);

INSERT INTO board(no, title, id, content, generatedDate, modifiedDate)
VALUES
(0, "수비드 하는법", "ssafy", "소고기 안심 기준 56도 1시간", "2023-03-28", "2023-03-28"),
(0, "식단 좀 알려줄 사람", "ssafy", "건강하게 벌크업하고 싶은데 식단 좀 알려줄 형님들", "2023-04-05", "2023-04-05"),
(0, "여자친구 사귀는 법 강의 들어간다", "ssafy", "눈 뜨고 귀열고 들어라 강의 시작한다.", "2022-01-05", "2022-01-03"),
(0, "챗gpt 개발자의 적군일지 아군일지", "ssafy", "두고봐야할듯", "2023-03-08", "2023-03-08");


SELECT * FROM users;
SELECT * FROM board;
SELECT * FROM comments;
