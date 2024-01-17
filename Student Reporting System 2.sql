-- Creating Database
drop database if EXISTS CPRMS;
create database CPRMS;
use CPRMS;


-- Schools Table
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools` (
  `SchoolID` varchar(5) NOT NULL,
  `SchoolName` varchar(70),
  PRIMARY KEY (`SchoolID`)
);

-- Insert Data for Schools Table
INSERT INTO `schools` VALUES
('BASS','Harry W. Bass Jr. School of Arts, Humanities, and Technology'),
('BBS','School of Behavioral and Brain Sciences'),
('ECS','Erik Jonsson School of Engineering and Computer Science'),
('EPPS','School of Economic, Political and Policy Sciences'),
('IS','School of Interdisciplinary Studies'),
('JSOM','Naveen Jindal School of Management'),
('NSM','School of Natural Sciences and Mathematics');

-- Majors Table
DROP TABLE IF EXISTS `majors`;
CREATE TABLE `majors` (
  `MajorID` tinyint NOT NULL AUTO_INCREMENT,
  `School` varchar(5) NOT NULL,
  `Major` varchar(30),
  PRIMARY KEY (`MajorID`, `School`),
  CONSTRAINT `Majors_FK00` FOREIGN KEY (`school`) REFERENCES `schools` (`SchoolID`)
);

-- Insert Data for Majors Table
INSERT INTO `majors` VALUES
(1,'JSOM','Accounting'),
(2,'NSM','Actuarial Science'),
(3,'NSM','Biochemistry'),
(4,'JSOM','Business Administration'),
(5,'JSOM','Business Analytics'),
(6,'ECS','Computer Engineering'),
(7,'ECS','Computer Science'),
(8,'EPPS','Economics'),
(9,'IS','Education'),
(10,'JSOM','Finance'),
(11,'BASS','History'),
(12,'BBS','Neuroscience'),
(13,'EPPS','Political Science'),
(14,'JSOM','Supply Chain Management'),
(15,'BASS','Visual And Performing Arts');


-- Country Table
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `CountryCode` varchar(5) NOT NULL,
  `CountryName` varchar(30),
  PRIMARY KEY (`CountryCode`)
);

-- Insert Data for Country Table
INSERT INTO `country` VALUES
('BD','Bangladesh'),
('BR','Brazil'),
('CN','China'),
('FR','France'),
('DE','Germany'),
('HK','Hong Kong'),
('IN','India'),
('KR','South Korea'),
('MX','Mexico'),
('NP','Nepal'),
('NG','Nigeria'),
('SN','Senegal'),
('SG','Singapore'),
('US','United States'),
('VN','Vietnam');

-- Subject Table
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `SubjectID` varchar(20) NOT NULL,
  `SubjectDescription` varchar(50),
  PRIMARY KEY (`SubjectID`)
);

-- Insert Data for Country Table
INSERT INTO `subjects` VALUES
('ACCT','Accounting'),
('BUAN','Business Analytics'),
('CS','Computer Science'),
('ECON','Economics'),
('EPPS','Economics, Political and Policy Sciences'),
('HIST','History'),
('HLTH','Health Care Studies'),
('ITSS','Information Technology and Systems'),
('MATH','Mathematical Sciences'),
('MKT','Marketing Management'),
('PSY','Psychology'),
('SYSM','Systems Engineering and Management');

-- Student Org Table
DROP TABLE IF EXISTS `StudentOrg`;
CREATE TABLE `StudentOrg` (
  `OrgID` int NOT NULL AUTO_INCREMENT,
  `OrgName` varchar(70),
  `Members` smallint,
  `Description` varchar(300),
  PRIMARY KEY (`OrgID`)
);

-- Insert Data for Student Org Table

INSERT INTO `StudentOrg` VALUES
  (1, 'Alpha Epsilon Delta','305', 'Alpha Epsilon Delta is the National Health Preprofessional Honor Society dedicated to the encouragement and recognition of excellence in preprofessional health scholarship, including medicine, dentistry, veterinary, and others'),
  (2, 'Chess Club UT Dallas', '80', 'To spread chess at UTD by organizing meetings, tournaments, and other chess-related events'),
  (3, 'Developer Student Club', '827', 'Developer Student Club is a university-based community group for students interested in growing as a developer regardless of background and experience'),
  (4, 'Envision', '181', 'Our club aims to allow students to learn and explore the world of data visualization using tools such as Tableau, Power BI, and other data dashboarding tools'),
  (5, 'Fellowship of Christian University Students', '151', 'It shall be the purpose of Fellowship of Christian University Students to create a place for both Christian and Non-Christian UTD students to build relationships and to learn about Christ'),
  (6, 'Kappa Sigma', '67', 'Kappa Sigma is a social fraternity that was founded in 1869 at the University of Virginia and brought to the University of Texas at Dallas in 1992'),
  (7, 'Student Game Developer Association', '331', 'We serve to create a growing community of students and industry professionals to promote game development'),
  (8, 'The Accounting Club', '133', 'The Accounting Club strives to provide members with knowledge of accounting careers, networking & collaboration events, and community service opportunities'),
  (9, 'Turning Point USA', '280', 'Turning Point USA’s mission is to educate students about the importance of fiscal responsibility, free markets, and limited government'),
  (10, 'Vietnamese International Network of Culture, Education and Friendship', '98', 'VINCEF is an organization dedicated to Vietnamese foreign students at UT Dallas. Our mission is promoting cultural exchange, education, and friendship between Vietnam and the international community');

-- Student Org Category Table
DROP TABLE IF EXISTS `SO_Category`;
CREATE TABLE `SO_Category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(30),
  PRIMARY KEY (`CategoryID`)
);

-- Insert Data for Student Org  Category Table
INSERT INTO `SO_Category` VALUES
  (1, 'Academic Interest'),
  (2, 'Art and Music'),
  (3, 'Cultural'),
  (4, 'Educational'),
  (5, 'Fraternity & Sorority Life'),
  (6, 'Honor Society'),
  (7, 'Political'),
  (8, 'Religious'),
  (9, 'Services'),
  (10, 'Social'),
  (11, 'Sports'),
  (12, 'Special Interest');

-- Student Org Information Table
DROP TABLE IF EXISTS `SO_Info`;
CREATE TABLE `SO_Info` (
  `OrgID` int NOT NULL,
  `OrgCategory` int,
  PRIMARY KEY (`OrgID`,`OrgCategory`),
  CONSTRAINT `SOCategory_FK00` FOREIGN KEY (`OrgID`) REFERENCES `StudentOrg` (`OrgID`),
  CONSTRAINT `SOCategory_FK01` FOREIGN KEY (`OrgCategory`) REFERENCES `SO_Category` (`CategoryID`)
);

-- Insert Data for Student Org Category Table
INSERT INTO `SO_Info` VALUES
  (1, 6),
  (2, 10),
  (2, 12),
  (3, 1),
  (4, 8),
  (4, 10),
  (5, 1),
  (6, 5),
  (6, 9),
  (6, 10),
  (7, 1),
  (7, 2),
  (7, 10),
  (8, 1),
  (8, 4),
  (8, 10),
  (9, 7),
  (10, 3),
  (10, 4),
  (10, 10);

-- Student Org Leadership Table
DROP TABLE IF EXISTS `SO_Position`;
CREATE TABLE `SO_Position` (
  `PositionID` tinyint NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(20),
  PRIMARY KEY (`PositionID`)
);

-- Insert Data for Student Org Leadership Table
INSERT INTO `SO_Position` VALUES
('1','President'),
('2','Vice President'),
('3','Treasurer'),
('4','Secretary'),
('5','Coordinator'),
('6','Member');

-- RateMyProf Table
DROP TABLE IF EXISTS `RateMyProf`;
CREATE TABLE `RateMyProf` (
  `Category` varchar(20) NOT NULL,
  `ProfRatingUpperBound` float,
  `ProfRatingLowerBound` float,
  PRIMARY KEY (`Category`)
);

-- Insert Data for RateMyProf Table
INSERT INTO `RateMyProf` VALUES
('Outstanding','5.0', '4.0'),
('Exceeds expectations','3.99', '3.0'),
('Meets expectations','2.99', '2.0'),
('Needs improvement','1.99', '1.0'),
('Unsatisfactory ','0.99', '0');

-- Gender Matrix Table
DROP TABLE IF EXISTS `gendermatrix`;
CREATE TABLE `gendermatrix` (
  `Gender` varchar(1) NOT NULL,
  `Male` smallint,
  `Female` smallint,
  `NonBinary` smallint,
  PRIMARY KEY (`Gender`)
);

-- Insert Data for Gender Matrix Table
INSERT INTO `gendermatrix` VALUES
('M', 1, 0, 0),
('F', 0, 1, 0),
('N', 0, 0, 1);

-- Letter Grades Table
DROP TABLE IF EXISTS `LetterGrades`;
CREATE TABLE `LetterGrades` (
  `LetterGrade` varchar(2),
  `LowerBound` float,
  `HigherBound` float,
  `GradeWeight` float,
  PRIMARY KEY (`LetterGrade`)
);

-- Insert Data for Letter Grades Table
INSERT INTO `LetterGrades` VALUES
('A+', 97, 120, 4),
('A', 93, 96.99, 4),
('A-', 90, 92.99, 3.7),
('B+', 87, 89.99, 3.3),
('B', 83, 86.99, 3),
('B-', 80, 82.99, 2.7),
('C+', 77, 79.99, 2.3),
('C', 73, 76.99, 2),
('C-', 70, 72.99, 1.7),
('D+', 67, 69.99, 1.3),
('D', 63, 66.99, 1),
('D-', 60, 62.99, 0.7),
('F', 0, 59.99, 0);

-- Students Table
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
`NetID` varchar(9) NOT NULL,
`StudentFirstName` varchar(30),
`StudentLastName` varchar(30),
`StudentBirthDate` date,
`StudentNationality` varchar(2),
`StudentGender` varchar(1),
`StudentMajor` tinyint,
PRIMARY KEY (`NetID`),
KEY `StudentNationality` (`StudentNationality`),
KEY `StudentMajor` (`StudentMajor`),
CONSTRAINT `Students_FK01` FOREIGN KEY (`StudentMajor`) REFERENCES `majors` (`MajorID`),
CONSTRAINT `Students_FK02` FOREIGN KEY (`StudentNationality`) REFERENCES `country` (`CountryCode`)
);

-- Insert Data for Students table
INSERT INTO `students` VALUES
('tsn130030','Tung','Nguyen','1995-05-10','VN','M','5'),
('ska230001','Sai','Adlluru','1998-01-01','IN','M','5'),
('axb210151', 'Astha', 'Bhatiya', '1997-06-08','IN','F','6'),
('sxc230027', 'Saisravan', 'Chagantipati','1995-11-04','IN','M','4'),
('sxv230040', 'Sarthak', 'Verma','1996-12-16','IN','F','8'),
('adj220001', 'Arati', 'Jamdade','1996-06-27','IN','M','10'),
('kmb210212', 'Kylian','Mbappe', '1998-10-10', 'FR', 'M', '5'),
('vnj190000', 'Vinicius','Junior', '1995-01-12', 'BR', 'F', '1'),
('ngz200000', 'Nicholas','Zolton', '1996-07-31', 'DE', 'M', '7'),
('bjj210001', 'Ben','Jeffery', '1998-10-10', 'US', 'M', '3'),
('vxr210030', 'Vittal','Ranganath', '1993-06-25', 'SG', 'M', '2'),
('nsc210001', 'Nitin', 'Chikkodi', '1997-06-16', 'NG', 'F', '9'),
('bdr180200', 'Bhim','Rajiv', '1994-05-09', 'NP', 'M', '7'),
('smx210212', 'Su','Xia', '2000-03-12', 'CN', 'F', '10'),
('shm230000', 'Heungmin','Son', '1992-10-12', 'KR', 'M', '2');

-- Professors Table
DROP TABLE IF EXISTS `professors`;
CREATE TABLE `professors` (
  `ProfessorID` varchar(9) NOT NULL,
  `ProfessorFirstName` varchar(30),
  `ProfessorLastName` varchar(30),
  `ProfessorSchool` varchar(5),
  `Ratings` float,
  PRIMARY KEY (`ProfessorID`),
  KEY `ProfessorSchool` (`ProfessorSchool`),
  CONSTRAINT `Professors_FK00` FOREIGN KEY (`ProfessorSchool`) REFERENCES `schools` (`SchoolID`)
  );

-- Insert Data for Professors table
INSERT INTO `professors` VALUES
('qcx088765', 'LeBron', 'James', 'BASS', 4.5),
('vgs056432', 'Kobe', 'Bryant', 'BASS', 3.2),
('iwt134567', 'Michael', 'Jordan', 'BASS', 2.8),
('pfo012345', 'Rafael', 'Nadal', 'BBS', 1.0),
('cqv099876', 'Tiger', 'Woods', 'BBS', 2.6),
('hxp045678', 'Shohei', 'Ohtani', 'BBS', 3.3),
('qmd023456', 'Michael', 'Phelps', 'ECS', 4.7),
('nkr189076', 'Mike', 'Trout', 'ECS', 3.1),
('oey045612', 'Marcus', 'Rashford', 'ECS', 2.9),
('tkc065432', 'Bruno', 'Fernandes', 'EPPS', 1.4),
('szi078956', 'David', 'Beckham', 'EPPS', 0.5),
('jwb022334', 'Wayne', 'Rooney', 'EPPS', 1.2),
('fqu011223', 'Michael', 'Schumacher', 'IS', 2.6),
('mjk112345', 'Wayne', 'Gretzky', 'IS', 3.0),
('rbd013678', 'Tom', 'Brady', 'IS', 2.7),
('kxs018700', 'Kannan', 'Srikanth', 'JSOM', 5),
('yxz066000', 'Yibin', 'Zhou', 'JSOM', 4.7),
('tgw100020', 'Tristan', 'Whalen', 'JSOM', 4.1),
('lnu199876', 'Lionel', 'Messi', 'NSM', 2.9),
('avz045620', 'Alex', 'Ferguson', 'NSM', 3.4);

-- Course Book Table
DROP TABLE IF EXISTS `CourseBook`;
CREATE TABLE `CourseBook` (
  `CourseNumber` int NOT NULL,
  `CourseSubject` varchar(20),
  `CourseID` int,
  `SectionID` int,
  `CourseName` varchar(60) ,
  `Credits` tinyint,
  `Seats` smallint,
  PRIMARY KEY (`CourseNumber`),
  KEY `CourseSubject` (`CourseSubject`),
  CONSTRAINT `CourseBook_FK00` FOREIGN KEY (`CourseSubject`) REFERENCES `subjects` (`subjectID`)
);
  
-- Insert Data for Assignments table
INSERT INTO `CourseBook` VALUES
('86910','BUAN', 6320, '008' ,'Database Foundations for Business Analytics','3','65'),
('87020','ACCT', 6301, '001' ,'Financial Accounting','3','48'),
('24268','CS', 6364, '001' , 'Artificial Intelligence','3','140'),
('26077','ECON', 6306, '501' ,'Applied Econometrics','3','70'),
('26322','EPPS', 3110, '001' ,'Leading for Good','4','30'),
('28017','HIST', 6320, '001' ,'America in the Nineteenth Century','3','12'),
('26439','HLTH', 4305, '002' ,'Public Health','3','39'),
('26758','ITSS', 4354, '001' ,'Advanced Big Data Analytics','4','60'),
('20456','MATH', 6310, '001' ,'Topology','3','30'),
('27333','MKT', 6301, '001' ,'Marketing Management','3','60'),
('23509','PSY', 4320, '001' ,'Psychology of Reasoning','3','72'),
('26817','SYSM', 6337, '501' ,'Organizing for Business Analytics Platforms','3','48');


-- Student grades Table
DROP TABLE IF EXISTS `student_grades`;
CREATE TABLE `student_grades` (
  `NetID` varchar(9) NOT NULL,
  `CourseNumber` int NOT NULL,
  `Grade` float DEFAULT NULL,
  PRIMARY KEY (`NetID`,`CourseNumber`),
  CONSTRAINT `Student_Grades_FK00` FOREIGN KEY (`CourseNumber`) REFERENCES `CourseBook` (`CourseNumber`),
  CONSTRAINT `Student_Grades_FK01` FOREIGN KEY (`NetID`) REFERENCES `students` (`NetID`)
);

-- Insert Data for Student Grades table
INSERT INTO `student_grades` VALUES
('tsn130030', '86910', 0),
('tsn130030', '87020', 0),
('tsn130030', '27333', 0),
('ska230001', '86910', 0);

-- Assignment Table
DROP TABLE IF EXISTS `assignments`;
CREATE TABLE `assignments` (
  `AssignmentID` int NOT NULL AUTO_INCREMENT,
  `CourseNumber` int NOT NULL,
  `AssignmentDesciprtion` varchar(50),
  `GradePercentage` float,
  PRIMARY KEY (`AssignmentID`,`CourseNumber`),
  CONSTRAINT `Assignments_FK00` FOREIGN KEY (`CourseNumber`) REFERENCES `CourseBook` (`CourseNumber`)
);

-- Insert Data for Assignments table
INSERT INTO `assignments` VALUES
(1,'86910','Group Project','0.2'),
(2,'86910','Homework 1','0.1'),
(3,'86910','Homework 2','0.1'),
(4,'86910','Quiz 1','0.15'),
(5,'86910','Quiz 2','0.15'),
(6,'86910','Quiz 3','0.15'),
(7,'86910','Quiz 4','0.15'),
(8,'87020','Homework 1','0.2'),
(9,'87020','Quiz 1','0.2'),
(10,'87020','Exam 1', '0.3'),
(11,'87020','Final Exam', '0.3'),
(12,'27333', 'Project', '0.5'),
(13,'27333', 'Assignment 1', '0.1'),
(14,'27333', 'Exam', '0.3'),
(15,'27333', 'Assignment 2', '0.1');

-- Assignment Grade Table
DROP TABLE IF EXISTS `assignment_grades`;
CREATE TABLE `assignment_grades` (
  `AssignmentID` int NOT NULL,
  `NetID` varchar(9) NOT NULL,
  `Points` tinyint,
  PRIMARY KEY (`AssignmentID`,`NetID`),
  CONSTRAINT `Assignment_Grades_FK00` FOREIGN KEY (`AssignmentID`) REFERENCES `assignments` (`AssignmentID`)
);

-- Insert Data for Assignments table
INSERT INTO `assignment_grades` VALUES
(1,'tsn130030','90'),
(2,'tsn130030','95'),
(3,'tsn130030','80'),
(4,'tsn130030','87'),
(5,'tsn130030','100'),
(6,'tsn130030','70'),
(1,'ska230001','100'),
(2,'ska230001','98'),
(3,'ska230001','92'),
(4,'ska230001','95'),
(5,'ska230001','100'),
(6,'ska230001','95'),
(7,'ska230001','100'),
(8,'tsn130030','90'),
(9,'tsn130030','90'),
(10,'tsn130030','70'),
(11,'tsn130030','85'),
(12,'tsn130030','75'),
(13,'tsn130030','70'),
(14,'tsn130030','90');

-- Student Org Members Table
DROP TABLE IF EXISTS `SO_Membership`;
CREATE TABLE `SO_Membership` (
  `NetID` varchar(9) NOT NULL,
  `OrgID` int NOT NULL,
  `Position` tinyint,
  PRIMARY KEY (`NetID`,`OrgID`),
  CONSTRAINT `Org_Membership_FK00` FOREIGN KEY (`NetID`) REFERENCES `students` (`NetID`),
  CONSTRAINT `Org_Membership_FK01` FOREIGN KEY (`OrgID`) REFERENCES `StudentOrg` (`OrgID`),
  CONSTRAINT `Org_Membership_FK02` FOREIGN KEY (`Position`) REFERENCES `SO_Position` (`PositionID`)
);

-- Insert Data for Student Org Members table
INSERT INTO `SO_Membership` VALUES
('tsn130030','10','5'),
('tsn130030','4','6'),
('kmb210212','1','2'),
('vnj190000','2','1'),
('kmb210212','3','3'),
('ska230001','4','6'),
('axb210151','4','1'),
('sxc230027','4','2'),
('sxv230040','4','3'),
('shm230000','8','1');

-- Professor Class Table
DROP TABLE IF EXISTS `ProfessorClass`;
CREATE TABLE `ProfessorClass` (
  `CourseNumber` int NOT NULL,
  `ProfessorID` varchar(9) NOT NULL,
  PRIMARY KEY (`CourseNumber`, `ProfessorID`),
  CONSTRAINT `Professor_Class_FK00` FOREIGN KEY (`CourseNumber`) REFERENCES `coursebook` (`CourseNumber`),
  CONSTRAINT `Professor_Class_FK01` FOREIGN KEY (`ProfessorID`) REFERENCES `professors` (`ProfessorID`)
);

-- Insert Data for Professor Class Table
INSERT INTO `ProfessorClass` VALUES
('86910','kxs018700'),
('87020','yxz066000'),
('27333','tgw100020'),
('24268','qcx088765'),
('26077','vgs056432'),
('26817','iwt134567');

-- Student Progress Report (GPA, Assessment, Note)
DROP TABLE IF EXISTS `ProgressReport`;
CREATE TABLE `ProgressReport` (
  `NetID` varchar(9) NOT NULL,
  `GPA` float,
  `Assessment` varchar(30),
  PRIMARY KEY (`NetID`),
  CONSTRAINT `Progress_Report_FK00` FOREIGN KEY (`NetID`) REFERENCES `students` (`NetID`)
);

-- Insert Data for Student Progress Report table
INSERT INTO `ProgressReport` VALUES
('tsn130030','0','Need to do better'),
('smx210212','0','Good'),
('vnj190000','0','Excellent'),
('kmb210212','0','Decent'),
('ska230001','0','Okay'),
('axb210151','0','Superb'),
('sxc230027','0','Awesome'),
('sxv230040','0','Outstanding'),
('shm230000','0','Immense');

-- Company Table
DROP TABLE IF EXISTS `Company`;
CREATE TABLE `Company` (
  `CompanyID` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(20),
  PRIMARY KEY (`CompanyID`)
);

-- Insert Data for Company table
INSERT INTO `Company` VALUES
('1','Google'),
('2','Microsoft'),
('3','Amazon'),
('4','Texas Instrument'),
('5','Facebook'),
('6','Twitter'),
('7','Samsung'),
('8','Apple'),
('9','Goldman Sachs'),
('10','Morgan Stanley'),
('11','PwC'),
('12','Deloitte');

-- Internship Table
DROP TABLE IF EXISTS `Internship`;
CREATE TABLE `Internship` (
  `NetID` varchar(9) NOT NULL,
  `Company` int,
  `Position` varchar(30),
  PRIMARY KEY (`NetID`),
  CONSTRAINT `Internship_FK00` FOREIGN KEY (`NetID`) REFERENCES `students` (`NetID`),
  CONSTRAINT `Internship_FK01` FOREIGN KEY (`Company`) REFERENCES `Company` (`CompanyID`)
);

-- Insert Data for Internship table
INSERT INTO `Internship` VALUES
('tsn130030','1','Data Science Intern'),
('kmb210212','2','Software Development Intern'),
('vnj190000','3','UX/UI Design Intern'),
('smx210212','4','Cybersecurity Intern'),
('ska230001','5','Quality Assurance (QA) Intern'),
('axb210151','6','Cloud Computing Intern'),
('sxc230027','7','Digital Marketing Intern'),
('sxv230040','8','IT Security Intern'),
('shm230000','9','Machine Learning Intern');


-- Trigger - Update student grade after inserting new assignment grade
DROP TRIGGER IF EXISTS UpdateStudentGrade;
DELIMITER //
CREATE TRIGGER UpdateStudentGrade
	AFTER INSERT ON assignment_grades
    FOR EACH ROW
    BEGIN
    SET SQL_SAFE_UPDATES = 0;
    UPDATE student_grades as S
			join(
			select G.netID, A.courseNumber, sum(points * GradePercentage)/sum(GradePercentage) as P
			from assignment_grades as G
			join assignments as A on A.assignmentID = G.assignmentID
			group by G.netID, A.courseNumber) J
			on S.netID = J.netID and S.CourseNumber = J.courseNumber
    SET grade = P
    WHERE S.netID = J.netID and S.CourseNumber = J.courseNumber;
    SET SQL_SAFE_UPDATES = 1;
    END; //
DELIMITER ;

-- Trigger - Update student GPA after inserting new assignment grade
DROP TRIGGER IF EXISTS UpdateLetterGrade;
DELIMITER //
CREATE TRIGGER UpdateLetterGrade
	AFTER UPDATE ON student_grades
    FOR EACH ROW
    BEGIN
    UPDATE ProgressReport as P
			join(
			select netID, sum(L.GradeWeight)/count(L.GradeWeight) as G from student_grades as S, LetterGrades as L
			where S.grade between L.LowerBound and L.HigherBound
			group by netID) A
			on P.netID = A.netID
    SET GPA = G
    WHERE P.netID = A.netID;
    END; //
DELIMITER ;

-- Trigger - Prevent inserting new assignment grade if points exceed 120
DROP TRIGGER IF EXISTS PointLimit;
DELIMITER //
CREATE TRIGGER PointLimit
	BEFORE INSERT ON assignment_grades
    FOR EACH ROW
    BEGIN
    IF (NEW.Points > 120)
    THEN SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = 'Assignment points cannot exceed 120';
    END IF;
    END//
DELIMITER ;

-- Function - Return student GPA by inputting netID
DROP FUNCTION IF EXISTS StudentGPA;
DELIMITER //
CREATE FUNCTION StudentGPA(
	netID varchar(9)
)
RETURNS float
DETERMINISTIC
BEGIN
	DECLARE StudentGPA float;
    SELECT GPA INTO StudentGPA FROM ProgressReport as P
    WHERE netID = P.netID;
    RETURN(studentGPA);
END //
DELIMITER ;

-- Function - Return letter grade of a course for a student by inputting netID and course number
DROP FUNCTION IF EXISTS CourseLetterGrade;
DELIMITER //
CREATE FUNCTION CourseLetterGrade(
	netID varchar(9),
    courseNumber int
)
RETURNS varchar(2)
DETERMINISTIC
BEGIN
	DECLARE CourseLetterGrade varchar(2);
    SELECT LetterGrade INTO CourseLetterGrade FROM student_grades as S, LetterGrades as L
    WHERE S.Grade BETWEEN L.LowerBound AND L.HigherBound
    AND netID = S.netID
    AND courseNumber = S.courseNumber;
    RETURN(CourseLetterGrade);	
END //
DELIMITER ;

-- Function - Return the number of credits a student is taking by inputting netID
DROP FUNCTION IF EXISTS NumberOfCredits;
DELIMITER //
CREATE FUNCTION NumberOfCredits(
	netID varchar(9)
)
RETURNS smallint
DETERMINISTIC
BEGIN
	DECLARE NumberOfCredits smallint;
    SELECT sum(Credits) INTO NumberOfCredits FROM student_grades as S
    JOIN coursebook AS C ON S.CourseNumber = C.CourseNumber
    AND netID = S.netID;
    RETURN(NumberOfCredits);	
END //
DELIMITER ;

-- Procedure - Get student transcript by inputting netID
DROP PROCEDURE IF EXISTS GetStudentGrades;
DELIMITER //
CREATE PROCEDURE GetStudentGrades(
IN netID varchar(9)
)
    BEGIN
	SELECT S.netID, Students.StudentFirstName, Students.StudentLastName, courseNumber, LetterGrade FROM LetterGrades as L, student_grades as S
    JOIN Students on Students.netID = S.netID
    WHERE S.Grade BETWEEN L.LowerBound AND L.HigherBound
    AND netID = S.netID;
    END; //
DELIMITER ;

 -- Procedure - Get the list of student orgs that a student is a part of and their position in the Student Org
DROP PROCEDURE IF EXISTS StudentSO;
DELIMITER //
CREATE PROCEDURE StudentSO(
IN netID varchar(9)
)
    BEGIN
	SELECT M.netID, S.StudentFirstName, S.StudentLastName, SO.OrgName, P.PositionName FROM SO_Membership as M
    JOIN StudentOrg as SO ON SO.OrgID = M.OrgID
    JOIN SO_Position as P ON M.Position = P.PositionID
    JOIN Students as S on S.netID = M.netID
    WHERE netID = M.NetID;
    END; //
DELIMITER ;

 -- Procedure - Get the list of internship by inputting netID
DROP PROCEDURE IF EXISTS StudentInternship;
DELIMITER //
CREATE PROCEDURE StudentInternship(
IN netID varchar(9)
)
    BEGIN
	select I.netID, S.StudentFirstName, S.StudentLastName, C.CompanyName, I.Position from internship as I
	JOIN students as S on S.netID = I.netID
	JOIN Company as C on C.CompanyID = I.Company
    WHERE netID = I.NetID;
    END; //
DELIMITER ;