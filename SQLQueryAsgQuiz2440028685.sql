USE The_Externational

-- 1
CREATE TABLE leaderboard(
	rank_id CHAR(5) PRIMARY KEY CHECK(rank_id LIKE 'RNK[0-9][0-9]'),
	team_id CHAR(5) FOREIGN KEY REFERENCES team (team_id),
	rank INT NOT NULL CHECK(rank BETWEEN 1 AND 8),
	prize BIGINT NOT NULL
)

-- 2
SELECT * FROM team_detail

BEGIN TRAN
ALTER TABLE team_detail
ADD is_captain INT

ROLLBACK

BEGIN TRAN
ALTER TABLE team_detail
ADD CONSTRAINT constraint1 CHECK(is_captain BETWEEN 1 AND 0)

ROLLBACK

-- 3
SELECT * FROM position

BEGIN TRAN
INSERT INTO position VALUES
	('POS06', 'Coach')

ROLLBACK

-- 4
SELECT 
	player_name,
	joined_date
FROM player, team_detail
WHERE player.player_id = team_detail.player_id AND joined_date LIKE '%-09-%'

-- 5
SELECT
	*
FROM match_detail, team
WHERE match_detail.team_id = team.team_id

BEGIN TRAN
UPDATE match_detail
SET team_score = 2
FROM match_detail, team
WHERE match_detail.team_id = team.team_id AND team.team_name LIKE 'Invictus Gaming' AND match_detail.match_id = 'MT010'

ROLLBACK

BEGIN TRAN
UPDATE match_detail
SET team_score = 0
FROM match_detail, team
WHERE match_detail.team_id = team.team_id and match_id LIKE 'MT010' AND team_name LIKE 'Vici Gaming'

ROLLBACK