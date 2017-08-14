# DatabaseCapstone
Capstone for Database Design II and SQL Using Oracle Course

Query requirements:

1. Use the data file you are supplied and the schema attached to this document to guide you.
2. You MUST only use the command and keywords you were taught in this class.
3. You may use the following aggregate functions :
  a. SUM
  b. AVG
  c. COUNT
  d. MIN
  e. MAX
4. All queries must use the ANSI SQL92 format (ie: using JOIN keywords)

Questions Part One:

1. Create a query that will list any ‘Movie Titles’ that have not yet been assigned a director.
2. Create a query that will list all “Movie Titles” that have the words France, Waitress, or Pizza
anywhere in their keywords/keyword phrases.
3. Create a query that will list all “Movie Titles” that have the word “pizza” as part of their
keyword/keyword phrase. Movie titles should not repeat.
4. Create a query that will list all ‘Movie Titles’ along with their overall ‘Star Review Rating’ for
each type of critic (ie: professionals and users).
5. Create a query that will list all ‘Movie Titles’ along with their overall ‘Star Rating’ given by
each critic or user.
6. List all actor names that do not have any movie credits (ie: have not been assigned to a
movie).
7. Create a query that will list any ‘Writers names’ that have not yet been assigned to a movie
if any.
8. Create a query that will count how many male actors we have and how many female actors
we have.
9. Create a query that lists all ‘Movie Titles’ and the number of awards they either won or
were nominated for (ie: two columns – Movie Title, Total Awards). If they did not win or
were not nominated the number should be 0.
10. Create a query that list the ‘Movie Title’ of the Movie that has WON the most awards.

Questions Part Two:

1. Show the query to modify the existing table tblReview so that the default value of the
ReviewStar column is 0 for any records inserted.
2. Show the query that would create a unique index on the ActorFName and ActorLName
in the existing table tblActor.
3. Show the query that would modify the existing tblActor table to only allow either a “M”
or “F” or Null in the ActorGender column and set the default to NULL for new records.
(hint – you must use the CHECK constraint)
