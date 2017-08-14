PAUSE Press [RETURN] to see Question 1;
/* 1 */

column "Movie" format a25;

select MovieTitle as "Movie"
from tblMovie
where DirectorID is null;

PAUSE Press [RETURN] to see Question 2 ;
/* 
Movie
-------------------------
Drive Angry
*/

/* 2 */
column "Movie" format a30;

select distinct tm.MovieTitle as "Movie"
from tblKeyword tk
	inner join (tblKeywordDetail tkd 
		inner join tblMovie tm on tm.MovieID = tkd.MovieID )
	on tkd.KeywordID = tk.KeywordID
where tk.KeywordDesc Like '%France%' OR 
	  tk.KeywordDesc Like '%Pizza%' OR 
	  tk.KeywordDesc Like '%Waitress%'
Order by tm.MovieTitle;
/*
Movie
------------------------------
30 Minutes or Less
Drive Angry
Saving Private Ryan
Taken
*/

PAUSE Press [RETURN] to see Question 3 ;


/* 3 */

column "Movie" format a30;

select distinct tm.MovieTitle as "Movie"
from tblKeyword tk
	inner join (tblKeywordDetail tkd 
		inner join tblMovie tm on tm.MovieID = tkd.MovieID )
	on tkd.KeywordID = tk.KeywordID
where LOWER(tk.KeywordDesc) Like '%pizza%' ;

/*
Movie
------------------------------
30 Minutes or Less
*/

PAUSE Press [RETURN] to see Question 4 ;

/* 4 */

column "Movie" format a30;
column "Critic Rating" format 99.9;
column "User Rating" format 99.9;

select tm.MovieTitle as "Movie", 
       AVG(tr1.reviewstar) as "Critic Rating" , 
       AVG(tr2.reviewstar) as "User Rating"
from tblCritic tc1 inner join tblReview tr1 on tc1.CriticID = tr1.CriticID,
     tblCritic tc2 inner join tblReview tr2 on tc2.CriticID = tr2.CriticID,
     tblMovie tm
where tr1.MovieID = tm.MovieID and tr2.MovieID = tm.MovieID and 
      tc1.CriticClassID = 1    and tc2.CriticClassID = 2
Group by tm.MovieTitle
Order by tm.MovieTitle;
/* 
Movie                          Critic Rating User Rating
------------------------------ ------------- -----------
30 Minutes or Less                       2.0         4.2
A Lonely Place to Die                   10.0         8.5
Taken                                    6.2         7.3
Taken 2                                  4.0         6.3
*/
PAUSE Press [RETURN] to see Question 5 ;

/* 5  */

Column "Movie" format a22;
Column "Star Rating" format 99;
Column "Critic Class" format a13;

Select tm.MovieTitle as "Movie", tr.ReviewStar as "Star Rating",
       tcc.CriticClassDesc as "Critic Class"
from tblMovie tm, 
     tblReview tr inner join (tblCritic tc 
                    inner join tblCriticClass tcc on tc.CriticClassID = tcc.CriticClassID)
                  on tr.CriticID = tc.CriticID
where tm.MovieID = tr.MovieID
Order by tm.MovieTitle, tc.CriticID;

/* 
Movie                     Star Rating Critic Class
------------------------- ----------- ----------
30 Minutes or Less                  2 User
30 Minutes or Less                  4 User
30 Minutes or Less                  3 User
30 Minutes or Less                  6 User
30 Minutes or Less                  6 User
30 Minutes or Less                  2 Critic
A Lonely Place to Die               9 User
A Lonely Place to Die               8 User
A Lonely Place to Die               8 User
A Lonely Place to Die               8 User
A Lonely Place to Die               8 User

Movie                     Star Rating Critic Class
------------------------- ----------- ----------
A Lonely Place to Die              10 User
A Lonely Place to Die              10 Critic
Taken                               6 User
Taken                               5 User
Taken                               7 User
Taken                               9 User
Taken                               8 User
Taken                               9 User
Taken                               8 User
Taken                               7 User
Taken                               9 User

Movie                     Star Rating Critic Class
------------------------- ----------- ----------
Taken                               6 User
Taken                               6 User
Taken                               8 Critic
Taken                               7 Critic
Taken                               3 Critic
Taken                               5 Critic
Taken                               6 Critic
Taken                               8 Critic
Taken 2                             6 User
Taken 2                             7 User
Taken 2                             5 User

Movie                     Star Rating Critic Class
------------------------- ----------- ----------
Taken 2                             7 User
Taken 2                             6 User
Taken 2                             7 User
Taken 2                             6 User
Taken 2                             5 Critic
Taken 2                             3 Critic
Taken 2                             4 Critic

40 rows selected.

*/


PAUSE Press [RETURN] to see Question 6 ;

/* 6 */

column "Actor" format a30;

select ta.ActorFName||' '|| ta.ActorLName as "Actor"
    from tblActor ta 
        left outer join tblActorDetail tad on ta.ActorID = tad.ActorID
where tad.MovieID is null
order by ta.actorid;
/*

Actor
------------------------------
Tracy Nelson

*/

PAUSE Press [RETURN] to see Question 7 ;

 
/* 7 */
Column "Writers Name" format a25;

select tw.WriterFName||' '||tw.WriterLName as "Writers Name"
    from tblWriter tw
        left outer join tblWriterDetail twd on tw.WriterID = twd.WriterID
    where twd.MovieID is null
    order by tw.WriterID;


PAUSE Press [RETURN] to see Question 8 ;
/*

Writers Name
-------------------------
Ben Hecht
Christopher Nolan
Walon Green
Sam Peckinpah
Nunnally Johnson
Frank S. Nugent
Sidney Carroll
Robert Rossen
Woody Allen
Francis Ford Coppola
Edmund H. North

Writers Name
-------------------------
Joseph Stefano
David Mamet
Alexander Payne
Jim Taylor
Eric Roth
Phil Alden Robinson
Federico Fellini
Brunello Rondi
Tullio Pinelli
Ennio Flaiano
Colin Higgins

Writers Name
-------------------------
Jean Renoir
Charles Spaak
William Goldman
John Michael Hayes
Donn Pearce
Frank Pierson
Jerzy Kosinski
Earl W. Wallace
William Kelley
Mel Brooks
Sylvester Stallone

Writers Name
-------------------------
Charlie Kaufman
Donald Kaufman
Paul Schrader
Mardik Martin
Carl Foreman
George Lucas
Cameron Crowe
Betty Comden
Adolph Green
James L. Brooks
Peter Benchley

Writers Name
-------------------------
Carl Gottlieb
Ted Tally
Robert Zemeckis
Bob Gale

48 rows selected.

*/

/* 8 */

Column "Actor Gender" format a15;

select ActorGender as "Actor Gender", count(actorID) as "Number of Actor"
from tblActor
group by ActorGender;

/*

A Number of Actor
- ---------------
M              21
F               7

*/

PAUSE Press [RETURN] to see Question 9 ;

/* 9 */

Column "Movie Title" format a35;
Column "Total Awards" format 99;

select tm.MovieTitle as "Movie Title",
       count(tad.AwardResultID) as "Total Awards"
from tblMovie tm 
    left outer join tblAwardDetail tad on tm.MovieID = tad.MovieID
where tad.AwardResultID ='1' or tad.AwardResultID = '2' or tad.AwardResultID is null
group by tm.MovieTitle, tad.movieid
order by tm.MovieTitle;

/*

Movie Title                         Total Awards
----------------------------------- ------------
30 Minutes or Less                             0
A Lonely Place to Die                          5
Abraham Lincoln: Vampire Hunter                0
Act of Valor                                   3
Captain America: The First Avenger            19
Date Night                                     5
Drive Angry                                    2
Saving Private Ryan                           13
Taken                                          3
Taken 2                                        0

10 rows selected.

*/

PAUSE Press [RETURN] to see Question 10 ;

/* 10 */

Column "Movie Title" format a35;

select "Movie Title"
from  (select tm.MovieTitle as "Movie Title",
              count(tad.MovieID) as "Total Awards"
        from tblMovie tm 
              inner join tblAwardDetail tad on tm.MovieID = tad.MovieID 
        where tad.AwardResultID = '1' 
        group by tm.MovieTitle
        order by "Total Awards" desc) 
where ROWNUM = 1;

/*

Movie Title
-----------------------------------
Saving Private Ryan

*/
PAUSE Press [RETURN] to quit the Script  ;


/* 1 */
alter table tblReview Modify ReviewStar default 0;
select reviewid,reviewstar from tblreview order by reviewid;
insert into tblreview(ReviewID,criticid,movieid) values('42','1','73');

/* 2 */
Create Unique Index ndx_tblActor_ActorName ON tblactor(ActorFName, ActorLName);

/* 3 */ 
Alter table tblActor Modify ActorGender default NULL 
					 add constraint CK_tblActor_ActorGender 
					 	 CHECK(ActorGender IN ('M','F',NULL));