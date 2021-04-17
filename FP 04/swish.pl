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


posicao(X,Y,Inimigo).
eu(X,Y).
accuracy(Inimigo, P).
disparo(Inimigo, Acertou).

%calcula a distancia a que um dado inimigo se encontra do meu robot
distancia(X,Y).

%calcula a distancia média a que o meu robot se encontra dos inimigos
distanciaMedia(X).

%calcula o total de inimigos com os quais estou a combater
totalInimigos(X).
