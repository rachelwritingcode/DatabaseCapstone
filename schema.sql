DROP TABLE tblKeyWordDetail;
DROP TABLE tblKeyWord;
DROP TABLE tblActorDetail;
DROP TABLE tblActor;
DROP TABLE tblGenreDetail;
DROP TABLE tblGenre;
DROP TABLE tblWriterDetail;
DROP TABLE tblWriter;
DROP TABLE tblAwardDetail;
DROP TABLE tblAwardResult;
DROP TABLE tblAwardCategoryDesc;
DROP TABLE tblAwardType;
DROP TABLE tblReview;
DROP TABLE tblCritic;
DROP TABLE tblCriticClass;
DROP TABLE tblMovie;
DROP TABLE tblDirector;
DROP TABLE tblMPAA;





CREATE TABLE tblMPAA
(
MPAAID Number(38) PRIMARY KEY,
MPAARating VARCHAR2(10),
MPAADesc VARCHAR2(100)
);

CREATE TABLE tblDirector
(
DirectorID Number(38) PRIMARY KEY,
DirectorFName VARCHAR2(25),
DirectorLName VARCHAR2(25)
);

CREATE TABLE tblAwardType
(
AwardTypeID Number(38) PRIMARY KEY,
AwardTypeDesc VARCHAR2(100),
AwardNick VARCHAR2(50)
);

CREATE TABLE tblAwardCategoryDesc
(
AwardCategoryID Number(38) PRIMARY KEY,
AwardCategoryDesc VARCHAR2(100),
AwardTypeID Number(38),
FOREIGN KEY (AwardTypeID) REFERENCES tblAwardType(AwardTypeID )
);

CREATE TABLE tblAwardResult
(
AwardResultID Number(38) PRIMARY KEY,
AwardResultDesc VARCHAR2(25)
);

CREATE TABLE tblWriter
(
WriterID Number(38) PRIMARY KEY,
WriterFName VARCHAR2(25),
WriterLName VARCHAR2(25)
);

CREATE TABLE tblGenre
(
GenreID Number(38) PRIMARY KEY,
GenreDesc VARCHAR2(25)
);

CREATE TABLE tblKeyword
(
KeywordID Number(38) PRIMARY KEY,
KeywordDesc VARCHAR2(100)
);

CREATE TABLE tblCriticClass
(
CriticClassID Number(38) PRIMARY KEY,
CriticClassDesc VARCHAR2(25)
);

CREATE TABLE tblCritic
(
CriticID Number(38) PRIMARY KEY,
CriticFName VARCHAR2(25),
CriticLName VARCHAR2(25),
CriticAlias VARCHAR2(50),
CriticClassID Number(38),
FOREIGN KEY (CriticClassID) REFERENCES tblCriticClass(CriticClassID)
);

CREATE TABLE tblActor
(
ActorID Number(38) PRIMARY KEY,
ActorFName VARCHAR2(25),
ActorLName VARCHAR2(25),
ActorGender VARCHAR2(1)
);

CREATE TABLE tblMovie
(
MovieID Number(38) PRIMARY KEY,
MovieTitle VARCHAR2(100),
MovieRuntime Number(3),
MovieReleaseYear Number(4),
MoviePlot VARCHAR2(500),
DirectorID Number(38),
MPAAID Number(38),
FOREIGN KEY (DirectorID) REFERENCES tblDirector(DirectorID),
FOREIGN KEY (MPAAID) REFERENCES tblMPAA(MPAAID)
);

CREATE TABLE tblAwardDetail
(
MovieID Number(38),
AwardCategoryID Number(38),
AwardResultID Number(38),
AwardYear Number(4),
PRIMARY KEY (MovieID, AwardCategoryID),
FOREIGN KEY (MovieID) REFERENCES tblMovie(MovieID),
FOREIGN KEY (AwardCategoryID) REFERENCES tblAwardCategoryDesc(AwardCategoryID),
FOREIGN KEY (AwardResultID) REFERENCES tblAwardResult(AwardResultID)
);

CREATE TABLE tblWriterDetail
(
MovieID Number(38),
WriterID Number(38),
PRIMARY KEY (MovieID, WriterID),
FOREIGN KEY (MovieID) REFERENCES tblMovie(MovieID),
FOREIGN KEY (WriterID) REFERENCES tblWriter(WriterID)
);

CREATE TABLE tblGenreDetail
(
MovieID Number(38),
GenreID Number(38),
PRIMARY KEY (MovieID, GenreID),
FOREIGN KEY (MovieID) REFERENCES tblMovie(MovieID),
FOREIGN KEY (GenreID) REFERENCES tblGenre(GenreID)
);

CREATE TABLE tblActorDetail
(
MovieID Number(38),
ActorID Number(38),
PRIMARY KEY (MovieID, ActorID),
FOREIGN KEY (MovieID) REFERENCES tblMovie(MovieID),
FOREIGN KEY (ActorID) REFERENCES tblActor(ActorID)
);

CREATE TABLE tblKeywordDetail
(
MovieID Number(38),
KeywordID Number(38),
PRIMARY KEY (MovieID, KeywordID),
FOREIGN KEY (MovieID) REFERENCES tblMovie(MovieID),
FOREIGN KEY (KeywordID) REFERENCES tblKeyword(KeywordID)
);

CREATE TABLE tblReview
(
ReviewID Number(38) PRIMARY KEY,
ReviewWritten VARCHAR2(500),
ReviewStar Number(2),
CriticID Number(38),
MovieID Number(38),
FOREIGN KEY (MovieID) REFERENCES tblMovie(MovieID),
FOREIGN KEY (CriticID) REFERENCES tblCritic(CriticID)
);


CREATE INDEX ndxKeywordDesc ON tblKeyword(lower(KeywordDesc));
