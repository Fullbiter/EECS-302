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
   
    member([brenda, wish, may, twelveth, day_1], Quintuples),
	member([cally, ridge, july, twentythird, day_2], Quintuples),
	member([linda, scopefield, april, fourth, month_1], Quintuples),
	member([rachel, mann, february, seventeenth, day_3], Quintuples),
	member([sheila, enfield, september, eighth, month_2], Quintuples),
	
    
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
