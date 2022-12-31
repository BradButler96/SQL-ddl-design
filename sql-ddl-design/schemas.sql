# Modify this code to update the DB schema diagram.
# To reset the sample schema, replace everything with
# two dots ('..' - without quotes).

MedicalCenter
-
Name string
Address string
Doctors string FK -< Doctor.Name

Doctor
-
Name string
Specialty string
Patients string FK  >-< Patients.Doctor

Patients
-
Doctor string
Diagnosis string FK >-< Diagnosis.Disease

Diagnosis
-
Disease string

-----------------------------------------------------------------------------------

Region
-
Region string
Posts string FK >- Posts.Title

User
-
Posts string FK >- Posts.Poster
PreferredRegion string FK - Region.Region

Posts
-
Title string
Description string
Poster string
Location
Region FK - Region.Region
Category FK -< Categories.Category

Categories
-
Category

-----------------------------------------------------------------------------------


League
-
Refs string FK >-< Referee.Games
Teams string FK >- Team.Ranking
StartDate datetime
EndDate datetime

Team
-
Ranking int
Record string
Schedule string FK - Matches.Opponent
Players string FK >-< Player.Goals

Player
-
Goals int FK >- Goals.Scorer
Position string
YearsInLeague int

Matches
-
Refs string
Opponent string
Outcome string
FinalScore1 string FK - Goals.Team
FinalScore2 string FK - Goals.Team
Date datetime

Goals
-
Team string
Scorer string

Referee
-
Games string FK -< Matches.Refs
YearsAsRef int
