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
sibling(Sibling,Target) :- father(Parent,Sibling), father(Parent,Target), Target \= Sibling.
brother(Brother,Target) :- sibling(Brother,Target), male(Brother).
sister(Sister,Target) :- sibling(Sister,Target), female(Sister).

uncle(Uncle,Target) :- brother(Uncle,Parent), parent(Parent,Target).
uncle(Uncle,Target) :- married(Uncle,Aunt), sibling(Aunt,Parent), parent(Parent,Target).
aunt(Aunt,Target) :- sister(Aunt,Parent), parent(Parent,Target).
aunt(Aunt,Target) :- married(Uncle,Aunt), sibling(Uncle,Parent), parent(Parent,Target).

grandparent(Grandparent,Grandchild) :- parent(Parent,Grandchild), parent(Grandparent,Parent).
grandmother(Grandparent,Grandchild) :- grandparent(Grandparent,Grandchild), female(Grandparent).
grandfather(Grandparent,Grandchild) :- grandparent(Grandparent,Grandchild), male(Grandparent).
grandchild(Grandchild,Grandparent) :- child(Parent,Grandparent), child(Grandchild,Parent).

ancestor(Ancestor,Target) :- parent(Ancestor,Target).
ancestor(Ancestor,Target) :- parent(Ancestor,Parent), ancestor(Parent,Target).
descendant(Descendant,Target) :- child(Descendant, Target).
descendant(Descendant,Target) :- child(Descendant, Child), descendant(Child,Target).

older(Person,Target) :- born(Person,PersonYear), born(Target,TargetYear), PersonYear < TargetYear.
younger(Person,Target) :- born(Person,PersonYear), born(Target,TargetYear), PersonYear > TargetYear.

regentWhenBorn(Regent,Target) :- born(Target,TargetYear), reigned(Regent,RegentStartYear,RegentEndYear), RegentStartYear < TargetYear, TargetYear < RegentEndYear.

cousin(Cousin,Target) :- child(Cousin,CousinParent), sibling(CousinParent,Parent), parent(Parent,Target).