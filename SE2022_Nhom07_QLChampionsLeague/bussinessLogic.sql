--query using order by
SELECT ClubName, Country, CoachName
FROM Clubs
ORDER BY Country ASC, ClubName ASC
--query using inner join  
SELECT m.MatchID, c1.ClubName AS HomeTeam, c2.ClubName AS AwayTeam, s.StadiumName, m.Score
FROM Matches m
 inner JOIN Clubs c1 ON m.HomeClubID = c1.ClubID
 inner JOIN Clubs c2 ON m.AwayClubID = c2.ClubID
 inner JOIN Stadiums s ON m.StadiumID = s.StadiumID
--query using aggregate functions
SELECT COUNT(PlayerID) AS TotalPlayers
FROM Players
--query using the group by and having clauses 
SELECT s.StadiumName, COUNT(m.MatchID) AS TotalMatches
FROM Matches m
 JOIN Stadiums s ON m.StadiumID = s.StadiumID
GROUP BY s.StadiumName
HAVING COUNT(m.MatchID) >= 2
ORDER BY TotalMatches DESC
--query that uses a sub-query as a relation 
	SELECT c.ClubName, g.TotalGoals
FROM (
    SELECT p.ClubID, COUNT(go.GoalID) AS TotalGoals
    FROM Goals go
     JOIN Players p ON go.PlayerID = p.PlayerID
    GROUP BY p.ClubID
) AS g
 JOIN Clubs c ON g.ClubID = c.ClubID
WHERE g.TotalGoals = (
    SELECT MAX(TotalGoals)
    FROM (
        SELECT p.ClubID, COUNT(go.GoalID) AS TotalGoals
        FROM Goals go
         JOIN Players p ON go.PlayerID = p.PlayerID
        GROUP BY p.ClubID
    ) AS MaxGoals
)
--query that uses partial matching in the where clause
SELECT FullName, Nationality, Position
FROM Players
WHERE FullName LIKE '%son%'
--query that uses a self – join
Code: 
SELECT 
    m1.MatchID AS Match1,
    m2.MatchID AS Match2,
    s.StadiumName
FROM Matches m1
 JOIN Matches m2 ON m1.StadiumID = m2.StadiumID 
   AND m1.MatchID < m2.MatchID
  JOIN Stadiums s ON m1.StadiumID = s.StadiumID
ORDER BY s.StadiumName
--store Procedure
CREATE PROCEDURE Show_Match_Info
    @ClubName NVARCHAR(100)
AS
BEGIN
    SELECT m.MatchDate, s.StadiumName, r.FullName AS Referee, m.Score
    FROM Matches m
    JOIN Referees r ON m.RefereeID = r.RefereeID
    JOIN Stadiums s ON m.StadiumID = s.StadiumID
    JOIN Clubs c ON (m.HomeClubID = c.ClubID OR m.AwayClubID = c.ClubID)
    WHERE c.ClubName = @ClubName
END

EXEC Show_Match_Info @ClubName = 'Real Madrid'
--Trigger
CREATE TRIGGER Prevent_Same_Team_Match
ON Matches
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE HomeClubID = AwayClubID)
    BEGIN
        PRINT 'Invalid match: Home and Away teams cannot be the same!';
        ROLLBACK TRANSACTION
    END
END

--test case thu sai
INSERT INTO Matches (MatchDate, Stage, StadiumID, RefereeID, HomeClubID, AwayClubID, Score)
VALUES ('2025-01-10', 'Group Stage', 1, 1, 3, 3, '0-0');

SELECT * FROM Matches WHERE HomeClubID = 3 AND AwayClubID = 3

--test thu dung
INSERT INTO Matches (MatchDate, Stage, StadiumID, RefereeID, HomeClubID, AwayClubID, Score)
VALUES ('2025-01-11', 'Group Stage', 1, 2, 3, 4, '2-1');

SELECT * FROM Matches WHERE HomeClubID = 3 AND AwayClubID = 4;

