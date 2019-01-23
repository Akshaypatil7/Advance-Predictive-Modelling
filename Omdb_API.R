rm(list = ls())
setwd("set the working directory")
#Let's Connect to IMDB API http://www.omdbapi.com
library(imdbapi)#imdbapi package to use retrieve imdb information
library(qdap)#qdap package to convert vector into List
omdb_api_key(force = T) # Enter api_key="142758bc"

#Establish connection
#Find by movie or series by it's title
got_title=find_by_title("Game of thrones", type = "series",season = "1", episode = "1",
                  year_of_release = "2011", plot = "Full", include_tomatoes = FALSE,api_key = omdb_api_key())
#Find by movie or series by it's id, you can get the id by going to imdb page of a movie and in the URL of that page you will get id
got_id=find_by_id("tt1480055", type = "series", year_of_release = "2011", plot = "short",
                  include_tomatoes = FALSE, api_key = omdb_api_key())
#Get the list of Actors 
Actors = vect2list(get_actors(got_title))
#Get the list of Country
Country = vect2list(get_countries(got_title))
#Get the list of Directors
Directors = vect2list(get_directors(got_title))
#Get the list of Genre
Genre = vect2list(get_genres(got_title))
#Get the list of Writers
Writers = vect2list(get_writers(got_title))
# If you want to the search results of imdb for a particular search word
search = search_by_title("Game of thrones",type = NULL, year_of_release = NULL, api_key = omdb_api_key())
