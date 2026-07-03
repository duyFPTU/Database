---------------------------------------------------
-- 1. Organizer
---------------------------------------------------
INSERT INTO Organizer (OrganizerName, Contact, Phone, Email)
VALUES ('UEFA', 'Champions League 2024–2025', '+41 22 123 4567', 'info@uefa.com');

---------------------------------------------------
-- 2. Clubs (4 đội)
---------------------------------------------------
INSERT INTO Clubs (ClubName, Country, CoachName, CoachPhone, CoachEmail, OrganizerID)
VALUES
('Real Madrid', 'Spain', 'Carlo Ancelotti', '+34 600 123 456', 'ancelotti@realmadrid.com', 1),
('Manchester City', 'England', 'Pep Guardiola', '+44 700 234 567', 'pep@mcfc.co.uk', 1),
('Bayern Munich', 'Germany', 'Thomas Tuchel', '+49 171 987 654', 'tuchel@fcbayern.de', 1),
('Paris Saint-Germain', 'France', 'Luis Enrique', '+33 612 345 678', 'luis.enrique@psg.fr', 1),
('Inter Milan', 'Italy', 'Simone Inzaghi', '+39 340 222 333', 'inzaghi@inter.it', 1),
('Barcelona', 'Spain', 'Xavi Hernandez', '+34 611 999 888', 'xavi@fcbarcelona.com', 1),
('Arsenal', 'England', 'Mikel Arteta', '+44 701 555 666', 'arteta@arsenal.co.uk', 1),
('Liverpool', 'England', 'Jurgen Klopp', '+44 700 777 888', 'klopp@liverpoolfc.com', 1);

-- ========================================
-- 3. PLAYERS 
-- ========================================

-- === Real Madrid ===
INSERT INTO Players (FullName, Nationality, Position, ShirtNumber, Phone, Email, ClubID) VALUES
('Thibaut Courtois', 'Belgium', 'Goalkeeper', 1, '+34 611 100 001', 'courtois@realmadrid.com', 1),
('Dani Carvajal', 'Spain', 'Defender', 2, '+34 611 100 002', 'carvajal@realmadrid.com', 1),
('Antonio Rüdiger', 'Germany', 'Defender', 4, '+34 611 100 003', 'rudiger@realmadrid.com', 1),
('David Alaba', 'Austria', 'Defender', 3, '+34 611 100 004', 'alaba@realmadrid.com', 1),
('Ferland Mendy', 'France', 'Defender', 23, '+34 611 100 005', 'mendy@realmadrid.com', 1),
('Jude Bellingham', 'England', 'Midfielder', 5, '+34 611 100 006', 'bellingham@realmadrid.com', 1),
('Federico Valverde', 'Uruguay', 'Midfielder', 15, '+34 611 100 007', 'valverde@realmadrid.com', 1),
('Luka Modric', 'Croatia', 'Midfielder', 10, '+34 611 100 008', 'modric@realmadrid.com', 1),
('Rodrygo Goes', 'Brazil', 'Forward', 11, '+34 611 100 009', 'rodrygo@realmadrid.com', 1),
('Vinícius Jr', 'Brazil', 'Forward', 7, '+34 611 100 010', 'vinicius@realmadrid.com', 1),
('Joselu Mato', 'Spain', 'Forward', 14, '+34 611 100 011', 'joselu@realmadrid.com', 1);

-- === Manchester City ===
INSERT INTO Players (FullName, Nationality, Position, ShirtNumber, Phone, Email, ClubID) VALUES
('Ederson Moraes', 'Brazil', 'Goalkeeper', 31, '+44 720 200 001', 'ederson@mcfc.co.uk', 2),
('Kyle Walker', 'England', 'Defender', 2, '+44 720 200 002', 'walker@mcfc.co.uk', 2),
('Ruben Dias', 'Portugal', 'Defender', 3, '+44 720 200 003', 'dias@mcfc.co.uk', 2),
('John Stones', 'England', 'Defender', 5, '+44 720 200 004', 'stones@mcfc.co.uk', 2),
('Josko Gvardiol', 'Croatia', 'Defender', 24, '+44 720 200 005', 'gvardiol@mcfc.co.uk', 2),
('Rodri', 'Spain', 'Midfielder', 16, '+44 720 200 006', 'rodri@mcfc.co.uk', 2),
('Kevin De Bruyne', 'Belgium', 'Midfielder', 17, '+44 720 200 007', 'debruyne@mcfc.co.uk', 2),
('Phil Foden', 'England', 'Midfielder', 47, '+44 720 200 008', 'foden@mcfc.co.uk', 2),
('Jack Grealish', 'England', 'Forward', 10, '+44 720 200 009', 'grealish@mcfc.co.uk', 2),
('Julian Alvarez', 'Argentina', 'Forward', 19, '+44 720 200 010', 'alvarez@mcfc.co.uk', 2),
('Erling Haaland', 'Norway', 'Forward', 9, '+44 720 200 011', 'haaland@mcfc.co.uk', 2);

-- === Bayern Munich ===
INSERT INTO Players (FullName, Nationality, Position, ShirtNumber, Phone, Email, ClubID) VALUES
('Manuel Neuer', 'Germany', 'Goalkeeper', 1, '+49 611 300 001', 'neuer@fcbayern.de', 3),
('Joshua Kimmich', 'Germany', 'Midfielder', 6, '+49 611 300 002', 'kimmich@fcbayern.de', 3),
('Alphonso Davies', 'Canada', 'Defender', 19, '+49 611 300 003', 'davies@fcbayern.de', 3),
('Dayot Upamecano', 'France', 'Defender', 2, '+49 611 300 004', 'upamecano@fcbayern.de', 3),
('Kim Min-Jae', 'South Korea', 'Defender', 3, '+49 611 300 005', 'kim@fcbayern.de', 3),
('Leon Goretzka', 'Germany', 'Midfielder', 8, '+49 611 300 006', 'goretzka@fcbayern.de', 3),
('Jamal Musiala', 'Germany', 'Midfielder', 42, '+49 611 300 007', 'musiala@fcbayern.de', 3),
('Serge Gnabry', 'Germany', 'Forward', 7, '+49 611 300 008', 'gnabry@fcbayern.de', 3),
('Leroy Sané', 'Germany', 'Forward', 10, '+49 611 300 009', 'sane@fcbayern.de', 3),
('Harry Kane', 'England', 'Forward', 9, '+49 611 300 010', 'kane@fcbayern.de', 3),
('Thomas Müller', 'Germany', 'Forward', 25, '+49 611 300 011', 'muller@fcbayern.de', 3);

-- === Paris Saint-Germain ===
INSERT INTO Players (FullName, Nationality, Position, ShirtNumber, Phone, Email, ClubID) VALUES
('Gianluigi Donnarumma', 'Italy', 'Goalkeeper', 99, '+33 611 400 001', 'donnarumma@psg.fr', 4),
('Achraf Hakimi', 'Morocco', 'Defender', 2, '+33 611 400 002', 'hakimi@psg.fr', 4),
('Marquinhos', 'Brazil', 'Defender', 5, '+33 611 400 003', 'marquinhos@psg.fr', 4),
('Lucas Hernandez', 'France', 'Defender', 21, '+33 611 400 004', 'hernandez@psg.fr', 4),
('Nuno Mendes', 'Portugal', 'Defender', 25, '+33 611 400 005', 'mendes@psg.fr', 4),
('Warren Zaïre-Emery', 'France', 'Midfielder', 33, '+33 611 400 006', 'zaireemery@psg.fr', 4),
('Vitinha', 'Portugal', 'Midfielder', 17, '+33 611 400 007', 'vitinha@psg.fr', 4),
('Marco Asensio', 'Spain', 'Forward', 11, '+33 611 400 008', 'asensio@psg.fr', 4),
('Ousmane Dembélé', 'France', 'Forward', 10, '+33 611 400 009', 'dembele@psg.fr', 4),
('Kylian Mbappé', 'France', 'Forward', 7, '+33 611 400 010', 'mbappe@psg.fr', 4),
('Randal Kolo Muani', 'France', 'Forward', 23, '+33 611 400 011', 'kolomuani@psg.fr', 4);

-- === Inter Milan ===
INSERT INTO Players (FullName, Nationality, Position, ShirtNumber, Phone, Email, ClubID) VALUES
('Yann Sommer', 'Switzerland', 'Goalkeeper', 1, '+39 340 500 001', 'sommer@inter.it', 5),
('Matteo Darmian', 'Italy', 'Defender', 36, '+39 340 500 002', 'darmian@inter.it', 5),
('Francesco Acerbi', 'Italy', 'Defender', 15, '+39 340 500 003', 'acerbi@inter.it', 5),
('Federico Dimarco', 'Italy', 'Defender', 32, '+39 340 500 004', 'dimarco@inter.it', 5),
('Nicolo Barella', 'Italy', 'Midfielder', 23, '+39 340 500 005', 'barella@inter.it', 5),
('Hakan Calhanoglu', 'Turkey', 'Midfielder', 20, '+39 340 500 006', 'calhanoglu@inter.it', 5),
('Henrikh Mkhitaryan', 'Armenia', 'Midfielder', 22, '+39 340 500 007', 'mkhitaryan@inter.it', 5),
('Marcus Thuram', 'France', 'Forward', 9, '+39 340 500 008', 'thuram@inter.it', 5),
('Lautaro Martínez', 'Argentina', 'Forward', 10, '+39 340 500 009', 'martinez@inter.it', 5),
('Denzel Dumfries', 'Netherlands', 'Defender', 2, '+39 340 500 010', 'dumfries@inter.it', 5),
('Davide Frattesi', 'Italy', 'Midfielder', 16, '+39 340 500 011', 'frattesi@inter.it', 5);

-- === Barcelona ===
INSERT INTO Players (FullName, Nationality, Position, ShirtNumber, Phone, Email, ClubID) VALUES
('Marc-André ter Stegen', 'Germany', 'Goalkeeper', 1, '+34 611 500 001', 'terstegen@barca.com', 6),
('Ronald Araújo', 'Uruguay', 'Defender', 4, '+34 611 500 002', 'araujo@barca.com', 6),
('Jules Koundé', 'France', 'Defender', 23, '+34 611 500 003', 'kounde@barca.com', 6),
('Alejandro Balde', 'Spain', 'Defender', 3, '+34 611 500 004', 'balde@barca.com', 6),
('Frenkie de Jong', 'Netherlands', 'Midfielder', 21, '+34 611 500 005', 'dejong@barca.com', 6),
('Pedri González', 'Spain', 'Midfielder', 8, '+34 611 500 006', 'pedri@barca.com', 6),
('Gavi', 'Spain', 'Midfielder', 6, '+34 611 500 007', 'gavi@barca.com', 6),
('Raphinha', 'Brazil', 'Forward', 11, '+34 611 500 008', 'raphinha@barca.com', 6),
('Robert Lewandowski', 'Poland', 'Forward', 9, '+34 611 500 009', 'lewandowski@barca.com', 6),
('Lamine Yamal', 'Spain', 'Forward', 27, '+34 611 500 010', 'yamal@barca.com', 6),
('Ferran Torres', 'Spain', 'Forward', 7, '+34 611 500 011', 'torres@barca.com', 6);

-- === Arsenal ===
INSERT INTO Players (FullName, Nationality, Position, ShirtNumber, Phone, Email, ClubID) VALUES
('David Raya', 'Spain', 'Goalkeeper', 1, '+44 701 300 001', 'raya@arsenal.co.uk', 7),
('Ben White', 'England', 'Defender', 4, '+44 701 300 002', 'white@arsenal.co.uk', 7),
('Gabriel Magalhães', 'Brazil', 'Defender', 6, '+44 701 300 003', 'gabriel@arsenal.co.uk', 7),
('William Saliba', 'France', 'Defender', 2, '+44 701 300 004', 'saliba@arsenal.co.uk', 7),
('Oleksandr Zinchenko', 'Ukraine', 'Defender', 35, '+44 701 300 005', 'zinchenko@arsenal.co.uk', 7),
('Declan Rice', 'England', 'Midfielder', 41, '+44 701 300 006', 'rice@arsenal.co.uk', 7),
('Martin Ødegaard', 'Norway', 'Midfielder', 8, '+44 701 300 007', 'odegaard@arsenal.co.uk', 7),
('Bukayo Saka', 'England', 'Forward', 7, '+44 701 300 008', 'saka@arsenal.co.uk', 7),
('Gabriel Jesus', 'Brazil', 'Forward', 9, '+44 701 300 009', 'jesus@arsenal.co.uk', 7),
('Kai Havertz', 'Germany', 'Forward', 29, '+44 701 300 010', 'havertz@arsenal.co.uk', 7),
('Leandro Trossard', 'Belgium', 'Forward', 19, '+44 701 300 011', 'trossard@arsenal.co.uk', 7);

-- === Liverpool ===
INSERT INTO Players (FullName, Nationality, Position, ShirtNumber, Phone, Email, ClubID) VALUES
('Alisson Becker', 'Brazil', 'Goalkeeper', 1, '+44 702 400 001', 'alisson@liverpoolfc.com', 8),
('Trent Alexander-Arnold', 'England', 'Defender', 66, '+44 702 400 002', 'taa@liverpoolfc.com', 8),
('Virgil van Dijk', 'Netherlands', 'Defender', 4, '+44 702 400 003', 'vandijk@liverpoolfc.com', 8),
('Andrew Robertson', 'Scotland', 'Defender', 26, '+44 702 400 004', 'robertson@liverpoolfc.com', 8),
('Ibrahima Konaté', 'France', 'Defender', 5, '+44 702 400 005', 'konate@liverpoolfc.com', 8),
('Alexis Mac Allister', 'Argentina', 'Midfielder', 10, '+44 702 400 006', 'macallister@liverpoolfc.com', 8),
('Dominik Szoboszlai', 'Hungary', 'Midfielder', 8, '+44 702 400 007', 'szoboszlai@liverpoolfc.com', 8),
('Luis Díaz', 'Colombia', 'Forward', 7, '+44 702 400 008', 'diaz@liverpoolfc.com', 8),
('Darwin Núñez', 'Uruguay', 'Forward', 9, '+44 702 400 009', 'nunez@liverpoolfc.com', 8),
('Mohamed Salah', 'Egypt', 'Forward', 11, '+44 702 400 010', 'salah@liverpoolfc.com', 8),
('Cody Gakpo', 'Netherlands', 'Forward', 18, '+44 702 400 011', 'gakpo@liverpoolfc.com', 8);

---------------------------------------------------
-- 4. Stadiums + Staff
---------------------------------------------------
INSERT INTO Stadiums (StadiumName, City, Capacity, Phone, Email)
VALUES
('Santiago Bernabeu', 'Madrid', 81044, '+34 600 700 800', 'bernabeu@realmadrid.com'),
('Etihad Stadium', 'Manchester', 53400, '+44 700 800 900', 'etihad@mcfc.co.uk'),
('Allianz Arena', 'Munich', 75000, '+49 800 900 100', 'allianz@fcbayern.de'),
('Parc des Princes', 'Paris', 47929, '+33 900 100 200', 'parc@psg.fr');

-- 4 staff mỗi sân
INSERT INTO Staff (FullName, Role, Phone, Email, StadiumID)
VALUES
('Miguel Santos', 'Ground Manager', '+34 700 111 001', 'miguel@realmadrid.com', 1),
('Carlos Perez', 'Security', '+34 700 111 002', 'carlos@realmadrid.com', 1),
('Ana Gomez', 'Medical', '+34 700 111 003', 'ana@realmadrid.com', 1),
('Luis Torres', 'Technician', '+34 700 111 004', 'luis@realmadrid.com', 1),

('John Taylor', 'Ground Manager', '+44 800 222 001', 'john@mcfc.co.uk', 2),
('Emma Collins', 'Security', '+44 800 222 002', 'emma@mcfc.co.uk', 2),
('Jake Smith', 'Medical', '+44 800 222 003', 'jake@mcfc.co.uk', 2),
('Lucas Brown', 'Technician', '+44 800 222 004', 'lucas@mcfc.co.uk', 2),

('Hans Müller', 'Ground Manager', '+49 900 333 001', 'hans@fcbayern.de', 3),
('Karl Weiss', 'Security', '+49 900 333 002', 'karl@fcbayern.de', 3),
('Sophie Beck', 'Medical', '+49 900 333 003', 'sophie@fcbayern.de', 3),
('Otto Schulz', 'Technician', '+49 900 333 004', 'otto@fcbayern.de', 3),

('Pierre Dupont', 'Ground Manager', '+33 100 444 001', 'pierre@psg.fr', 4),
('Lucas Martin', 'Security', '+33 100 444 002', 'lucas@psg.fr', 4),
('Marie Laurent', 'Medical', '+33 100 444 003', 'marie@psg.fr', 4),
('Hugo Bernard', 'Technician', '+33 100 444 004', 'hugo@psg.fr', 4);

---------------------------------------------------
-- 5. Referees (10 trọng tài)
---------------------------------------------------
INSERT INTO Referees (FullName, Country, Phone, Email)
VALUES
('Daniele Orsato', 'Italy', '+39 340 111 222', 'orsato@uefa.com'),
('Clément Turpin', 'France', '+33 612 111 222', 'turpin@uefa.com'),
('Anthony Taylor', 'England', '+44 701 111 222', 'taylor@uefa.com'),
('Danny Makkelie', 'Netherlands', '+31 612 333 444', 'makkelie@uefa.com'),
('Szymon Marciniak', 'Poland', '+48 600 555 666', 'marciniak@uefa.com'),
('Felix Zwayer', 'Germany', '+49 177 777 888', 'zwayer@uefa.com'),
('Michael Oliver', 'England', '+44 700 333 444', 'oliver@uefa.com'),
('Carlos del Cerro', 'Spain', '+34 622 111 333', 'delcerro@uefa.com'),
('Artur Soares Dias', 'Portugal', '+351 912 999 111', 'soaresdias@uefa.com'),
('Istvan Kovacs', 'Romania', '+40 733 555 777', 'kovacs@uefa.com');
---------------------------------------------------
-- 6. Matches (Tứ kết → Bán kết → Chung kết)
---------------------------------------------------
INSERT INTO Matches (MatchDate, Stage, StadiumID, RefereeID, HomeClubID, AwayClubID, Score)
VALUES
('2025-04-08', 'Quarter-Final', 1, 1, 1, 8, '3-1'),
('2025-04-09', 'Quarter-Final', 2, 2, 2, 5, '2-0'),
('2025-04-10', 'Quarter-Final', 3, 3, 3, 6, '1-1'),
('2025-04-11', 'Quarter-Final', 4, 4, 4, 7, '2-2'),
('2025-04-29', 'Semi-Final', 1, 5, 1, 2, '2-1'),
('2025-04-30', 'Semi-Final', 3, 6, 3, 4, '1-2'),
('2025-05-28', 'Final', 3, 7, 1, 4, '2-0');
-- ========================================
-- 7. GOALS
-- ========================================
INSERT INTO Goals (MatchID, PlayerID, Minute, GoalType)
VALUES
(1, 9, 17, 'Normal'),
(1, 10, 45, 'Penalty'),
(1, 3, 78, 'Header'),
(5, 6, 34, 'Normal'),
(5, 10, 88, 'Normal'),
(7, 10, 23, 'Normal'),
(7, 9, 80, 'Normal');

-- ========================================
-- 8. CARDS
-- ========================================
INSERT INTO Cards (MatchID, PlayerID, CardType, Minute)
VALUES
(1, 2, 'Yellow', 55),
(1, 8, 'Red', 70),
(5, 6, 'Yellow', 42),
(7, 9, 'Yellow', 50),
(7, 10, 'Yellow', 85);

-- ========================================
-- 9. CLUB_MATCHES
-- ========================================
INSERT INTO Club_Matches (ClubID, MatchID)
VALUES
(1, 1), (8, 1),
(2, 2), (5, 2),
(3, 3), (6, 3),
(4, 4), (7, 4),
(1, 5), (2, 5),
(3, 6), (4, 6),
(1, 7), (4, 7);
