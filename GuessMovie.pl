go :- hypothesize(Movie),
      write('I guess that the movie is: '),
      write(Movie),
      nl,
      undo.

/* hypotheses to be tested */
hypothesize(toy_story)   :- toy_story, !.
hypothesize(paddington)  :- paddington, !.
hypothesize(creed)       :- creed, !.
hypothesize(the_avengers):- the_avengers, !.
hypothesize(parasite)    :- parasite, !.
hypothesize(cinderella)    :- cinderella, !.
hypothesize(unknown).    /* no diagnosis */

/* movie identification rules */
toy_story :- animation,
             toys,
             american,
             john_Lasseter,
             verify(release_date_1995),
    		 verify(age_rating_PG),
             verify(is_a_disney_movie),
    		 verify(has_a_cowboy_toy),
    		 verify(has_a_spaceman_toy).

paddington :- bear,
              family,
              british,
              comic,
              verify(release_date_2014),
    		  verify(age_rating_PG),
              verify(is_in_london),
              verify(paddington_series).

creed :- drama,
         sport,
         american,
         ryan_Coogler,
         verify(release_date_2015),
         verify(age_rating_12),
		 verify(has_a_boxer),
         verify(is_based_in_LA).

the_avengers :- action,
                scifi,
                american,
                marvel,
                verify(release_date_2012),
                verify(age_rating_12),
    			verify(has_superheros),
    			verify(is_in_new_york),
                verify(iron_Man_is_his_ultimate_hero).

parasite :- thriller,
            drama,
            korean,
            verify(release_date_2019),
            verify(age_rating_15),
            verify(the_first_Korean_film_win_in_international_award).

cinderella :- animation,
            princess,
            romantic,
            glass_shoes,
            verify(release_date_1950),
            verify(age_rating_6),
            verify(is_a_disney_movie).

/* classification rules */
animation :- verify(a_cartoon_movie), !.
toys :- verify(toys_come_to_life), !.
american :- verify(this_movie_was_produced_in_the_united_states), !. 
john_Lasseter:- verify(this_movie_was_directed_by_john_Lasseter), !.
bear :- verify(the_movie_talks_about_a_bear), !.
family :- verify(family_friendly_movie), !.
british :- verify(this_movie_was_produced_in_the_united_kingdom), !.
comic :- verify(this_movie_is_comic), !.
drama :- verify(this_movie_is_dramatic), !. 
sport :- verify(talks_about_boxing), !.
ryan_Coogler:-verify(this_movie_was_directed_by_ryan_Coogler), !.
action :- verify(full_of_action_sequences), !.
scifi :- verify(has_science_fiction_elements), !.
marvel :- verify(produced_by_Marvel), !.
thriller :- verify(is_suspenseful), !.
korean :- verify(this_movie_was_produced_in_south_korea), !.
princess :- verify(the_heroine_becomes_princess_at_the_end), !.
romantic :- verify(this_movie_is_romantic), !.
glass_shoes :- verify(the_heroine_loses_her_glass_shoe), !.

/* how to ask questions */
ask(Question) :-	
    write('Does the movie have the following attribute: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.