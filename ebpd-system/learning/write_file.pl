list_to_file(_, []):-!.
list_to_file(File, [Head]) :-
    write(File, Head),!.
list_to_file(File, [Head|Tail]) :-
    write(File, Head),
    write(File, ',\n\t\t\t'),
    list_to_file(File, Tail).
%%----------------------------------------------------------------
write_activity_schema(Filename,Task_c,Task_g,SeqOp,Goal) :-
    %string_concat(Dir,'race_activity_schemata.pl',Filename),
    %exists_directory(Dir),
    open(Filename, append, File),
    write(File, ':-assert(activity_schema(\n\t'),
    write(File, '%%% '),
    write(File, Task_c),
    write(File, '\n\t'),
    Task_g=..[T|A],
    write(File,T),
    write(File, ',\n\t'),
    write(File, A),
    write(File, ',\n\t[\t\t'),
    list_to_file(File, SeqOp),
    write(File, '\t]'),
    write(File, ',\n\t'),
    write(File, Goal),
    write(File, '\n)).\n'),
    close(File),!.

%%----------------------------------------------------------------
%%----------------------------------------------------------------
write_activity_schema_pddl(Filename,Task_c,Task_g,SeqOp,_Goal) :-
    open(Filename, append, File),
    write(File, '(robot_activity_schema\n'),
    write(File, '  (:domain race)\n'),
    write(File, '  (:method '),
    Task_g=..[T|A],
    write(File,T),
    write(File, '        ;;; '),
    write(File, Task_c),
    write(File, '\n   :parameters  ('),
    write_variable_pddl(File, A),
    %write(File, ')\n   :goal   ('),
    %write_goal_pddl(File, _Goal),
    write(File, ')\n   :abstract-plan\n     ('),
    write_absplan_pddl(File,SeqOp),
    write(File, ')))'),
    close(File),!.

%%%%%%%%%%%
write_absop_pddl(File, AbsOp) :-
    AbsOp=[Op,Features],
    Op=..[N|A],
    write(File, '(!'),
    write(File, N),
    write(File, ' '),
    write_variable_pddl(File,A),
    write(File, ') (('),
    Features=[F1-F2],
    write_features1_pddl(File,F1),
    write(File, ')-('),
    write_features2_pddl(File,F2),
    write(File, '))').
%%
write_loop_pddl(_, []):-!.
write_loop_pddl(File, [Head]) :-
    write_absop_pddl(File, Head), !.
write_loop_pddl(File, [Head|Tail]) :-
    write_absop_pddl(File, Head), 
    write(File, '\n      '), !,
    write_loop_pddl(File, Tail).
%%
write_absplan_pddl(_, []):-!.
write_absplan_pddl(File, [Head|Tail]) :-
    Head=[[_,_]|_], !, %% if loop
    write(File, '(forall\n      '), 
    write_loop_pddl(File, Head), 
    write(File, ')\n      '),
    write_absplan_pddl(File, Tail).
write_absplan_pddl(File, [Head|Tail]) :-
    write_absop_pddl(File, Head), 
    write(File, '\n      '), !,
    write_absplan_pddl(File, Tail).

%%%%%%%%%%%
write_features1_pddl(_,[]) :-!.
write_features1_pddl(File, [Head]) :-
    write_timestamp_predicate_pddl(File,Head),!.
write_features1_pddl(File, [Head|Tail]) :-
    write_timestamp_predicate_pddl(File,Head),
    write(File, ' '),!,
    write_features1_pddl(File, Tail).

%%%%%%%%%%%
write_features2_pddl(_,[]) :-!.
write_features2_pddl(File, [Head]) :-
    Head=[F1,F2],
    write(File, '('),
    write_timestamp_predicate_pddl(File,F1),
    write(File, ' '),
    write_timestamp_predicate_pddl(File,F2),
    write(File, ')'),!.
write_features2_pddl(File, [Head|Tail]) :-
    Head=[F1,F2],
    write(File, '('),
    write_timestamp_predicate_pddl(File,F1),
    write(File, ' '),
    write_timestamp_predicate_pddl(File,F2),
    write(File, ') '),!,
    write_features2_pddl(File, Tail).

%%%%%%%%%%%
%% write a feature in pddl
write_timestamp_predicate_pddl(File, Feature) :-
    Feature=..[T|[R]],
    write(File, '('),
    write(File, T),
    R=..[P|A],
    write(File, '('),
    write(File, P),
    write(File, ' '),
    write_variable_pddl(File,A),
    write(File, '))').

%%%%%%%%%%%
write_goal_pddl(_,[]) :-!.
write_goal_pddl(File, GoalList) :-
    write(File, 'and '),!,
    write_predicate_pddl(File, GoalList).

%%%%%%%%%%%
%% write a list of predicates in pddl
write_predicate_pddl(_, []):-!.
write_predicate_pddl(File, [Head]) :-
    Head=..[F|A],
    write(File, '('),
    write(File, F),
    write(File, ' '),
    write_variable_pddl(File,A),
    write(File, ')'),!.
write_predicate_pddl(File, [Head|Tail]) :-
    Head=..[F|A],
    write(File, '('),
    write(File, F),
    write(File, ' '),
    write_variable_pddl(File,A),
    write(File, ') '),
    write_predicate_pddl(File, Tail).

%%%%%%%%%%%
%% write variables in pddl
write_variable_pddl(_, []):-!.
write_variable_pddl(File, [Head]) :-
    write(File, '?'),
    write(File, Head),!.
write_variable_pddl(File, [Head|Tail]) :-
    write(File, '?'),
    write(File, Head),
    write(File, ' '),
    write_variable_pddl(File, Tail).


%%----------------------------------------------------------------
%%----------------------------------------------------------------


write_list_to_file(Filename,Task,SeqOp) :-
    string_concat(Dir,'activity_schemata',Filename),
    exists_directory(Dir),
    open(Filename, append, File),
    write(File, ':-assert(\n\t['),
    write(File, Task),
    write(File, ',\n\t\t[\t'),
    list_to_file(File, SeqOp),
    write(File, '\t]]\n).\n'),
    close(File),!.

write_list_to_file(Filename,Task,SeqOp) :-
    string_concat(Dir,'activity_schemata',Filename),
    not(exists_directory(Dir)),
    string_concat('prolog/',Filename,Filename2),
    open(Filename2, append, File),
    write(File, ':-assert(\n\t['),
    write(File, Task),
    write(File, ',\n\t\t[\t'),
    list_to_file(File, SeqOp),
    write(File, '\t]]\n).\n'),
    close(File),!.

write_list_to_file(Filename,Task,SeqOp,Features) :-
    string_concat(Dir,'activity_schemata2',Filename),
    not(exists_directory(Dir)),
    string_concat('prolog/',Filename,Filename2),
    open(Filename2, append, File),
    write(File, ':-assert(\n\t['),
    write(File, Task),
    write(File, ',\n\t\t[\t'),
    list_to_file(File, SeqOp),
    write(File, '],\n\t\t[\t'),
    list_to_file(File, Features),
    write(File, '\t]]\n).\n'),
    close(File),!.

write_list_to_file(Filename,Task,SeqOp,Features) :-
    string_concat(Dir,'activity_schemata2',Filename),
    exists_directory(Dir),
    open(Filename, append, File),
    write(File, ':-assert(\n\t['),
    write(File, Task),
    write(File, ',\n\t\t[\t'),
    list_to_file(File, SeqOp),
    write(File, '],\n\t\t[\t'),
    list_to_file(File, Features),
    write(File, '\t]]\n).\n'),
    close(File),!.


%list_to_file(File, []).
%list_to_file(File, [Head]) :-
%    write(File, Head).
%list_to_file(File, [Head|Tail]) :-
%    write(File, Head),
%    write(File, ',\n\t\t'),
%    list_to_file(File, Tail).

%write_list_to_file(Filename,List) :-
%    string_concat(Dir,'activity_schemata',Filename),
%    exists_directory(Dir),
%    open(Filename, append, File),
%    write(File, ':-assert(\n\t['),
%    list_to_file(File, List),
%    write(File, ']\n).\n'),
%    close(File),!.

%write_list_to_file(Filename,List) :-
%    string_concat(Dir,'activity_schemata',Filename),
%    not(exists_directory(Dir)),
%    string_concat('prolog/',Filename,Filename2),
%    open(Filename2, append, File),
%    write(File, ':-assert(\n\t['),
%    list_to_file(File, List),
%    write(File, ']\n).\n'),
%    close(File),!.




%% for feature extraction (cbr.pl)
%vahid
%union_features(+ListOfListOfFeatures,-UnionListOfFeatures)
union_features([],[]).
union_features([H|T],L):-
    union_features(T,U),
    union(U,H,L).


split([],[],[]).
split([[A,F]|T],[A|M],[F|R]):- split(T,M,R).