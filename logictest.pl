/*
Author: Kevin Nash
Date: 1 May 2015
*/

firstname(brenda).
firstname(cally).
firstname(linda).
firstname(rachel).
firstname(sheila).

lastname(enfield).
lastname(mann).
lastname(ridge).
lastname(scopefield).
lastname(wish).

month(february).
month(april).
month(may).
month(july).
month(september).

day(fourth).
day(eighth).
day(twelveth).
day(seventeenth).
day(twentythird).

lie(day_1).
lie(day_2).
lie(day_3).
lie(month_1).
lie(month_2).

solve :-
    lastname(BrendaLast), lastname(CallyLast), lastname(LindaLast), lastname(RachelLast), lastname(SheilaLast),
    all_different([BrendaLast, CallyLast, LindaLast, RachelLast, SheilaLast]),
    
    month(BrendaMonth), month(CallyMonth), month(LindaMonth), month(RachelMonth), month(SheilaMonth),
    all_different([BrendaMonth, CallyMonth, LindaMonth, RachelMonth, SheilaMonth]),
	
	day(BrendaDay), day(CallyDay), day(LindaDay), day(RachelDay), day(SheilaDay),
    all_different([BrendaDay, CallyDay, LindaDay, RachelDay, SheilaDay]),
	
	lie(BrendaLie), lie(CallyLie), lie(LindaLie), lie(RachelLie), lie(SheilaLie),
    all_different([BrendaLie, CallyLie, LindaLie, RachelLie, SheilaLie]),

    Quintuples = [ [brenda, BrendaLast, BrendaMonth, BrendaDay, BrendaLie],
                 [cally, CallyLast, CallyMonth, CallyDay, CallyLie],
                 [linda, LindaLast, LindaMonth, LindaDay, LindaLie],
                 [rachel, RachelLast, RachelMonth, RachelDay, RachelLie],
				 [sheila, SheilaLast, SheilaMonth, SheilaDay, SheilaLie] ],
   
    % 1. Linda's last name is not Ridge.
    \+ member([linda, ridge, _, _, _], Quintuples),
	% 1. Linda's birthday was not in September.
	\+ member([linda, _, september, _, _], Quintuples),
	% 1. Linda's birthday was on the fourth day of the month.
	member([linda, _, _, fourth, _], Quintuples),
    
	% 2. The girl born on May 12th didn't have a last name of Ridge.
    \+ member([_, ridge, may, twelveth, _], Quintuples),
	% 2. The girl born in February lied about the day and has a last name of Mann.
    member([_, mann, february, _, day_3], Quintuples),
	
	% 3. The girl whose last name is Enfield had her birthday in September.
    member([_, enfield, september, _, _], Quintuples),
	% 3. Cally's last name is not Enfield.
    \+ member([cally, enfield, _, _, _], Quintuples),
	
	% 4. The girl with the last name Wish lied about the day.
    member([_, wish, _, _, day_1], Quintuples),
	% 4. Rachel lied about the day.
    member([rachel, _, _, _, day_3], Quintuples),
	% 4. The girl born on the 23rd lied about the day.
    member([_, _, _, twentythird, day_2], Quintuples),
	% 4. The girls above are different.
    \+ member([rachel, wish, _, _, _], Quintuples),
	\+ member([rachel, _, _, twentythird, _], Quintuples),
	\+ member([_, wish, _, twentythird, _], Quintuples),
	
	% 5. Sheila lied about the month.
    member([sheila, _, _, _, month_2], Quintuples),
	% 5. Rachel was born on the 17th.
    member([rachel, _, _, seventeenth, _], Quintuples),
	% 5. Rachel was not born in April.
    \+ member([rachel, _, april, _, _], Quintuples),
	
	% 6. Brenda was born in May
	member([brenda, _, may, _, _], Quintuples),
	% 6. Brenda's last name is not Scopefield.
	\+ member([brenda, scopefield, _, _, _], Quintuples),
	% 6. Cally was not born on the 8th.
	\+ member([cally, _, _, eighth, _], Quintuples),
	% 6. Cally was born in July.
	member([cally, _, july, _, _], Quintuples),
    
    tell(brenda, BrendaLast, BrendaMonth, BrendaDay, BrendaLie),
	tell(cally, CallyLast, CallyMonth, CallyDay, CallyLie),
	tell(linda, LindaLast, LindaMonth, LindaDay, LindaLie),
	tell(rachel, RachelLast, RachelMonth, RachelDay, RachelLie),
	tell(sheila, SheilaLast, SheilaMonth, SheilaDay, SheilaLie).

% Succeeds if all elements of the argument list are bound and different.
% Fails if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(A, B, C, D, E) :-
    write(A), write(' '), write(B), write(' was born on the '), write(D), write(' of '), write(C),
	write(' but lied about the '), write(E), write('.'), nl.
