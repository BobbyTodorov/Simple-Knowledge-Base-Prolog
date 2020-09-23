%prove function
prove(true) :- !.
prove((B, Bs)) :- !,
    prove(B),
    prove(Bs).
prove((B; Bs)) :- !,
    (prove(B) ; prove(Bs)).
prove(H) :-
    clause(H, B),
    prove(B).
prove(H) :-
    ask(H),
    writeln(H),
    read(Answer),
	Answer == yes.

%engine for finding the mood of the guinea pig
mood(X) :- is_wheeking(X), (((is_fun_time(X); owner_is_close(X)), excited(X)); strange_behavior(X), help(X)).
mood(X) :- is_purring(X), (((is_taken_by_owner(X); is_crawling_around(X)), enjoy(X)); (is_in_a_new_place(X), investigate(X)); (is_just_given_food(X), ty(X))). 
mood(X) :- is_making_rumbling_sound(X), ((is_male(X), is_circling_another_guinea_pig(X), rumblestrutting(X));((is_vibrating_shortly(X),is_higher_pitched_sound(X)),scared(X));dominance(X)). 
mood(X) :- (is_chutting(X); is_whining(X)), (((is_pursuating_another_guinea_pig(X);is_playing(X)), fun(X)); excited(X)).
mood(X) :- is_chattering(X), looks_angry(X), danger(X).
mood(X) :- is_squealing(X), is_higher_pitched_sound(X), pain(X).
mood(X) :- is_chirping(X), ((is_it_a_little_guinea_pig(X), hungry(X)); stress(X)).

is_fun_time(X) :- is_feeding_time(X); is_playing_time(X).

is_taken_by_owner(X) :- is_being_petted(X); is_being_held(X).
                          
is_playing(X) :- is_playing_with_owner(X); is_playing_with_friends(X).

strange_behavior(X) :- (is_running_in_random_directions(X), looks_unoriented(X)); looks_scared(X).

looks_scared(X) :- looks_unoriented(X); is_freezed(X); is_running_towards_house(X).

is_freezed(X) :- is_paralyzed_in_a_corner(X); is_paralyzed_when_owner_gets_close(X).

looks_angry(X) :- is_gnashing_teeth(X), is_raising_head(X).

%moods
excited('I am excited!').
help('I am lost! Help me!').
enjoy('I am enjoying this! :))))').
investigate('I am investigating!').
ty('Thank you! <3').
rumblestrutting('I like her!').
scared('I am scared! :(').
dominance('I am the BOSS!').
fun('I am having fun playing with a friend!').
danger('Be careful, I am angry!').
pain('I am in pain!').
hungry('I need food!').
stress('I feel stressed!').

%questions
ask(is_it_a_little_guinea_pig(_)).
ask(is_chirping(_)).
ask(is_squealing(_)).
ask(is_gnashing_teeth(_)).
ask(is_raising_head(_)).
ask(is_feeding_time(_)).
ask(is_playing_time(_)).
ask(owner_is_close(_)).
ask(is_wheeking(_)).
ask(is_running_in_random_directions(_)).
ask(is_running_towards_house(_)).
ask(is_purring(_)).
ask(is_being_petted(_)).
ask(is_being_held(_)).
ask(is_crawling_around(_)).
ask(is_in_a_new_place(_)).
ask(is_just_given_food(_)).
ask(is_making_rumbling_sound(_)).
ask(is_male(_)).
ask(looks_unoriented(_)).
ask(is_circling_another_guinea_pig(_)).
ask(is_paralyzed_in_a_corner(_)).
ask(is_paralyzed_when_owner_gets_close(_)).
ask(is_vibrating_shortly(_)).
ask(is_higher_pitched_sound(_)).
ask(is_chutting(_)).
ask(is_whining(_)).
ask(is_chattering(_)).
ask(is_pursuating_another_guinea_pig(_)).
ask(is_playing_with_owner(_)).
ask(is_playing_with_friends(_)).
ask(is_freezed(_)).
ask(is_running(_)).