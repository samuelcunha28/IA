aluno(1,joao,m).
aluno(2,antonio,m).
aluno(3,carlos,m).
aluno(4,luisa,f).
aluno(5,maria,f).
aluno(6,isabel,f).

curso(1,lei).
curso(2,lsirc).
curso(3,lsig).

%disciplina(cod,sigla,ano,curso)
disciplina(1,ed,2,1).
disciplina(2,ia,3,1).
disciplina(3,fp,1,2).

%inscrito(aluno,disciplina)
inscrito(1,1).
inscrito(1,2).
inscrito(5,3).
inscrito(5,5).

%nota(aluno,disciplina,nota)
nota(1,1,15).
nota(1,2,16).
nota(1,5,20).
nota(2,5,10).
nota(3,5,8).

%copia
copia(1,2).
copia(2,3).
copia(3,4).

%achar todas as notas de um dado aluno
student_list(Aluno, Lista):- findall(Nota, nota(Aluno,_,Nota), Lista). 

%Quais os alunos que não estão inscritos em qualquer disciplina
%findall(X,(aluno(X,_,_), not(inscrito(X,_))), L).

%Quais os alunos que não estão inscritos em qualquer disciplina, assumindo que um aluno inscrito numa disciplina que
%não existe não está inscrito
alunosInscritos(X):-
    aluno(X,_,_),
    disciplina(Y,_,_,_),
    inscrito(X,Z),
    Z==Y.

naoInscritos(NaoInscritos):-
    setof(X,alunosInscritos(X),Inscritos),
    setof(Y,aluno(Y,_,_), Alunos),
    setof(K, (member(K,Alunos), not(member(K,Inscritos))), NaoInscritos).

%Qual a media de um determinado aluno
media_aluno(X):- aluno(X,_,_), nota(X,_,_), T1 is T+N, C1 is C+1, Y is T1/C1.



average( Aluno, Average ):- student_list(Aluno, List),
                            list_sum( List, Sum ),
                            length( List, Length ),
                            Length > 0,
                            Average is Sum / Length.

%media de todos alunos : average( X,Average)
%media de um determinado aluno : average( X,Average) , onde X ]e o numero de aluno

%Get all unique student values 
unique(Result) :- std_em_nota(List), sort(List, Result ).

totalAvg(Result):- average( _, Result ).

%Alunos cujo as medias sao acima da media total
%query: students_avg(Average)
students_avg(Average):- unique(Result),
    					member(Resultado, Result),
    					average( Resultado, Average ),
    					totalAvg(TotalAvg),
    					Average > TotalAvg.




%Quais os alunos cuja média é acima da média (considere todas as notas de todas as disciplinas)
alunoAcimaMedia(X):-
    findall(X, (aluno(X,_,_), nota(X,_,_)), Alunos),
    sort(Alunos, listAlunos),
    verificacaoMedia(listAlunos).

%Quais os nomes dos alunos que copiaram
%findall(X,(copia(N,_),aluno(N,X,_)),L).

%Quais os nomes dos alunos que copiaram (direta ou indiretamente) por um dado aluno
copiouPor(X,Y):- copia(X,Y).
copiouPor(X,Y):- copia(X,Z), copiouPor(Z,Y).

%mapToNome - converter uma lista de números de alunos numa lista de nomes. Assuma que podem ser dados números de
%alunos não registados (que devem ser ignorados)
mapToNome([H|T]):- aluno(H,Y,_), mapToNome[T].
lista_de_alunos(Lista, AlunoName):- member(AlunoNumber, Lista),aluno(AlunoNumber, AlunoName,_).


%posicao: posicao(X,Y,Inimigo).
posicao(10, 10, robot1).
posicao(10, 5, robot2).

%minha posicao: eu(X,Y).
eu(0,0).
%precisao: accuracy(Inimigo, P).
accuracy(robot1, 50).
accuracy(robot2, 70).
%disparo da bala: disparo(Inimigo, Acertou).
disparo(robot1, hit).

%calcula a distancia a que um dado inimigo se encontra do meu robot: distancia(X,Y).
distancia(Inimigo, D):-
    posicao(X1,Y1,Inimigo),
    eu(X2,Y2),
    D is sqrt((X2-X1)^2 + (Y2-Y1)^2).

%lista de distancias
distance_list(ResultList):- findall(D, distance(_, D), ResultList).

%calcula a distancia média a que o meu robot se encontra dos inimigos: distanciaMedia(X).
avg_distance(Average):- distance_list(ResultList),
    					list_sum( ResultList, Sum ),
    					length( ResultList, Length ), 
    					Length > 0,
                        Average is Sum / Length.

%calcula o total de inimigos com os quais estou a combater: totalInimigos(X).
totalInimigos(Count):- aggregate_all(count, posicao(_,_,_), Count).


%Find minimum value in list
min_in_list([Min],Min).                 % We've found the minimum

min_in_list([H,K|T],M) :- H =< K,                             % H is less than or equal to K
                          min_in_list([H|T],M).               % so use H

min_in_list([H,K|T],M) :- H > K,                              % H is greater than K
    					  min_in_list([K|T],M). 
%Find minimum value in list

%Achar enimigo mais perto
find_closest_enemy(Min):-distance_list(ResultList), min_in_list(ResultList,Min).

%Lista de enimigos cujas eficacias sao superiores a 75%

%obter todos os nomes dos enimigos cujas as eficacias superiores a 75%
medias_sup(NameResult):- accuracy(_, P), P> 75, accuracy(NameResult, P).

%criar lista de eficacias
max_eff_targets(ResultList):- findall(P, medias_sup(P), ResultList).
%query max_eff_targets(ResultList)



disparar(Enemy, Potencia):- Enemy == sitingDuck, Potencia is 3.
disparar(Enemy, Potencia):- accuracy(Enemy, Accuracy),
    						Accuracy > 75,
    						distance(Enemy, D),
    						D< 100,
    						Potencia is 3.
disparar(Enemy, Potencia):- velocity(Enemy, V), V > 4, Potencia is 0.
disparar(Enemy, Potencia):- velocity(Enemy, V), V < -4, Potencia is 0.

%Se a velocidade estiver entre 1 e 2, usar isto
range(X) :- X>=1, X =<2.