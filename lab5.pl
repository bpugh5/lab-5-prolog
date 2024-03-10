/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%  < Blake Pugh >                       %
%  < pughbl@oregonstate.edu >           %
%  < 8 March 2024 >                     %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).

% your code here...
mother(Mother,Child) :- parent(Mother,Child), female(Mother).
father(Father,Child) :- parent(Father,Child), male(Father).
spouse(Spouse,Target) :- married(Spouse,Target).
spouse(Spouse,Target) :- married(Target,Spouse).
child(Child,Parent) :- parent(Parent,Child).
son(Son,Parent) :- child(Son,Parent), male(Son).
daughter(Daughter,Parent) :- child(Daughter,Parent), female(Daughter).
sibling(Sibling,Target) :- mother(Mother,Sibling) =:= mother(Mother,Target), father(Father,Sibling) =:= father(Father,Target).
brother(Brother,Target) :- sibling(Brother,Target), male(Brother).
sister(Sister,Target) :- sibling(Sister,Target), male(Sister).