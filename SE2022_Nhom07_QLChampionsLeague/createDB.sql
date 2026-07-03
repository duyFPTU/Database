-- ==============================================
-- 1. ORGANIZER
-- ==============================================
CREATE TABLE Organizer (
    OrganizerID INT IDENTITY(1,1),
    OrganizerName NVARCHAR(100) NOT NULL,
    Contact NVARCHAR(100),
    Phone NVARCHAR(25) not null,
    Email NVARCHAR(100) not null,
    PRIMARY KEY (OrganizerID),
)

-- ==============================================
-- 2. TEAMS
-- ==============================================
CREATE TABLE Clubs (
    ClubID INT IDENTITY(1,1),
    ClubName NVARCHAR(100) NOT NULL,
    Country NVARCHAR(50),
    CoachName NVARCHAR(100),
    CoachPhone NVARCHAR(25),
    CoachEmail NVARCHAR(100),
    OrganizerID INT,
    PRIMARY KEY (ClubID),
    FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID)
)

-- ==============================================
-- 3. PLAYERS
-- ==============================================
CREATE TABLE Players (
    PlayerID INT IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Nationality NVARCHAR(50),
    Position NVARCHAR(50),
    ShirtNumber INT,
    Phone NVARCHAR(25),
    Email NVARCHAR(100),
    ClubID INT,
    PRIMARY KEY(PlayerID),
    FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID)
)

-- ==============================================
-- 4. STADIUMS
-- ==============================================
CREATE TABLE Stadiums (
    StadiumID INT IDENTITY(1,1),
    StadiumName NVARCHAR(100) NOT NULL,
    City NVARCHAR(100),
    Capacity INT,
    Phone NVARCHAR(25),
    Email NVARCHAR(100),
    PRIMARY KEY(StadiumID)
)

-- ==============================================
-- 5. STAFF (thuộc Stadiums)
-- ==============================================
CREATE TABLE Staff (
    StaffID INT IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50),
    Phone NVARCHAR(25),
    Email NVARCHAR(100),
    StadiumID INT,
    PRIMARY KEY(StaffID),
    FOREIGN KEY (StadiumID) REFERENCES Stadiums(StadiumID)
)

-- ==============================================
-- 6. REFEREES
-- ==============================================
CREATE TABLE Referees (
    RefereeID INT IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Country NVARCHAR(50),
    Phone NVARCHAR(25),
    Email NVARCHAR(100),
    PRIMARY KEY(RefereeID)
)

-- ==============================================
-- 7. MATCHES
-- ==============================================
CREATE TABLE Matches (
    MatchID INT IDENTITY(1,1),
    MatchDate DATE NOT NULL,
    Stage NVARCHAR(50),
    StadiumID INT,
    RefereeID INT,
    HomeClubID INT,
    AwayClubID INT,
    Score NVARCHAR(20),
    PRIMARY KEY(MatchID),
    FOREIGN KEY (StadiumID) REFERENCES Stadiums(StadiumID),
    FOREIGN KEY (RefereeID) REFERENCES Referees(RefereeID),
    FOREIGN KEY (HomeClubID) REFERENCES Clubs(ClubID),
    FOREIGN KEY (AwayClubID) REFERENCES Clubs(ClubID)
)

-- ==============================================
-- 8. GOALS (phụ thuộc MATCH và PLAYER)
-- ==============================================
CREATE TABLE Goals (
    GoalID INT IDENTITY(1,1),
    MatchID INT,
    PlayerID INT,
    Minute INT,
    GoalType NVARCHAR(20),
    PRIMARY KEY(GoalID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
)

-- ==============================================
-- 9. CARDS (phụ thuộc MATCH và PLAYER)
-- ==============================================
CREATE TABLE Cards (
    CardID INT IDENTITY(1,1),
    MatchID INT,
    PlayerID INT,
    CardType NVARCHAR(10), -- Yellow, Red
    Minute INT,
    PRIMARY KEY(CardID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
)

-- ==============================================
-- 10. (Tùy chọn) Bảng trung gian nhiều đội tham gia 1 trận
-- ==============================================
CREATE TABLE Club_Matches (
    ClubID INT NOT NULL,
    MatchID INT NOT NULL,
    PRIMARY KEY (ClubID, MatchID),
    FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
)