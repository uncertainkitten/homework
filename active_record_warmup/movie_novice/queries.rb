# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  Actor.find_by(name: "Angelina Jolie")
end

def top_titles
  Movie.select("id, title").where("score >= 9")
end

def star_wars
  Movie.select("id, title, yr").where("title like ?", "#{"Star Wars"}%")
end


def below_average_years
  Movie.select("yr, COUNT(*) AS bad_movies").where("score < 5").group("yr").order("bad_movies DESC")
  #display each year with movies scoring under 5,
  #with the count of movies scoring under 5 aliased as bad_movies,
  #in descending order
  # hint: use 'select', 'where', 'group', 'order'

end

def alphabetized_actors
  Actor.order(:name).limit(10)
end

def pulp_fiction_actors
  Actor.select("actors.id, actors.name").joins(:movies).where("movies.title = ?", "Pulp Fiction")
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'

end

def uma_movies
  Movie.select("movies.id, movies.title, movies.yr").joins(:actors).where("actors.name = ?", "Uma Thurman").order("movies.yr ASC")
end
