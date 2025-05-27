Create Table Country(
Country_id serial PRIMARY KEY,
Country_name character varying(100) NOT NULL
);
Create table City(
City_id serial PRIMARY KEY,
Country_id INTEGER NOT NULL REFERENCES Country(Country_id),
City_Name character varying(100) NOT NULL
);
Create table Mission_Application(
Application_id serial PRIMARY KEY,
Mission_id INTEGER NOT NULL REFERENCES Missions(Mission_id),
User_id INTEGER NOT NULL REFERENCES Users(Users_id),
Application_date timestamp with time zone NOT NULL DEFAULT now(),
Status boolean,
MissoinTotal_Sheet INTEGER NOT NULL
);
Create table Missions(
Mission_id serial PRIMARY KEY,
Misson_Name character varying(100) NOT NULL,
Mission_Description character varying(200) NOT NULL,
Misson_Organization_name character varying(100) NOT NULL,
Mission_Organization_Description character varying(200) NOT NULL,
Country_id INTEGER NOT NULL REFERENCES Country(Country_id),
City_id INTEGER NOT NULL REFERENCES City(City_id),
Mission_Start_date timestamp with time zone NOT NULL DEFAULT now(),
Mission_End_date timestamp with time zone NOT NULL DEFAULT now(),
Mission_Type character varying(200) NOT NULL,
MissoinTotal_Sheet INTEGER,
RegistrationDeadLine timestamp with time zone NOT NULL,
MissionTheme_id INTEGER NOT NULL REFERENCES MissionTheme(MissionTheme_id),
MissionSkill_id INTEGER NOT NULL REFERENCES MissionSkill(MissionSkill_id),
Mission_ImagesLink character varying(200) NOT NULL,
Mission_DocumentLink character varying(200) NOT NULL,
Mission_Availability character varying(200) NOT NULL,
Mission_VideoAUrl character varying(200) NOT NULL
);
Create table MissionSkill(
MissionSkill_id serial PRIMARY KEY,
MissionSkill_Name character varying(100) NOT NULL,
MissionSkill_Status character varying(100) NOT NULL
);
Create table MissionTheme(
MissionTheme_id serial PRIMARY KEY,
MissionTheme_Name character varying(100) NOT NULL,
MissionTheme_Status character varying(100) NOT NULL
);
Create table Users(
Users_id serial PRIMARY KEY,
First_name character varying(100) NOT NULL,
Last_name character varying(100) NOT NULL,
User_phoneNumber character varying(100) NOT NULL,
User_EmailAddress character varying(100) NOT NULL,
UserType character varying(100) NOT NULL,
User_Password character varying(100) NOT NULL
);
Create table UserDetail(
UserDetail_id serial PRIMARY KEY,
User_id INTEGER NOT NULL REFERENCES Users(Users_id),
User_Name character varying(100) NOT NULL,
User_Surname character varying(100) NOT NULL,
Employee_id character varying(100) NOT NULL,
Manager character varying(100) NOT NULL,
Title character varying(100) NOT NULL,
Department character varying(100) NOT NULL,
My_profile character varying(100) NOT NULL,
Why_I_Volunteer character varying(100) NOT NULL,
Country_id INTEGER NOT NULL REFERENCES Country(Country_id),
City_id INTEGER NOT NULL REFERENCES City(City_id),
Availability character varying(100) NOT NULL,
LinkedIn_Url character varying(100) NOT NULL,
My_Skills character varying(100) NOT NULL,
User_Image_Link character varying(100) NOT NULL,
Status boolean
);
Create table UserSkills(
UserSkill_id serial PRIMARY KEY,
Skills character varying(100) NOT NULL,
User_id INTEGER NOT NULL REFERENCES Users(Users_id)
);

INSERT INTO Country VALUES (1, 'India'), (2, 'USA');
select * from Country;

INSERT INTO City VALUES (1, 1, 'Mumbai'), (2, 2, 'New York');
select * from City;

INSERT INTO Mission_Application VALUES (
    1, 1, 1, '2025-05-20 10:00:00', TRUE, 1
);
select * from Mission_Application;

INSERT INTO Missions  VALUES (
    1, 'Beach Cleanup', 'Clean the beach with team', 'Green Org', 'NGO for environment',
    1, 1, '2025-06-01', '2025-06-30', 'Time', 100, '2025-05-31', 1, 1,
    'img1.jpg', 'doc1.pdf', 'Weekends', 'https://video.com/cleanbeach'
);
select * from Missions;

INSERT INTO MissionSkill VALUES (1, 'Teaching', 'Active');
select * from MissionSkill;

INSERT INTO MissionTheme VALUES (1, 'Environment', 'Active');
select * from MissionTheme;

INSERT INTO Users VALUES (1, 'John', 'Doe', '1234567890', 'john@example.com', 'Volunteer', 'securepass');
select * from Users;

INSERT INTO UserDetail VALUES (
    1, 1, 'John', 'Doe', 'E123', 'Jane', 'Developer', 'IT', 'Profile info',
    'Help society', 1, 1, 'Weekends', 'linkedin.com/in/john', 'Teaching', 'img.png', TRUE
);
select * from UserDetail;

INSERT INTO UserSkills VALUES (1, 'Teaching', 1);
select * from UserSkills;
