%Universidades%
pertence(isep, ipp).
pertence(iscap, ipp).
pertence(ese, ipp).
pertence(esmae, ipp).
pertence(estg, ipp).
pertence(ess, ipp).
pertence(esht, ipp).
pertence(esmad, ipp).

%Cursos%
curso(lce, estg).
curso(lei, estg).
curso(lgil, estg).
curso(lsta, estg).
curso(lsirc, estg).
curso(lsig, estg).
curso(ls, estg).

%Cadeiras%
disciplina(esi, estg).
disciplina(esii, estg).
disciplina(pp, estg).
disciplina(paw, estg).
disciplina(ia, estg).
disciplina(pf, estg).
disciplina(lds, estg).

%Cadeiras ano%
cadeira(pp, lei, 1).
cadeira(lp, lei, 1).
cadeira(paw, lei, 2).
cadeira(lds, lei, 3).

%aluno inscrito%
aluno(8160526, ia).
aluno(8160527, ia).
aluno(8160528, pf).
%query: findall(X, aluno(X, ia), L)%
%query: findall(X, aluno(X, ia), L); findall(X, aluno(X, pf), L)%


%pedra-papel-tesoura: só vencedores
vence(pedra, tesoura).
vence(papel, pedra).
vence(tesoura, papel).

%versao the lizard spock%
vence2(spock, pedra).
vence2(spock, tesoura).
vence2(lizard, spock).
vence2(lizard, papel).
vence2(papel, pedra).
vence2(papel, spock).
vence2(pedra, lizard).
vence2(pedra, tesoura).
vence2(tesoura, lizard).
vence2(tesoura, papel).

%tipos pokemon%
pokemon(bulbasaur, grass).
pokemon(squirtle, water).
pokemon(pidgeot, flying).
pokemon(charizar, fire).

%geracao pokemon%
geracao(pikachu, 1).

%bst total
value(mewtwo, 680).


%eficacia de tipos%
tipo(water, fire).
tipo(electric, flying).
tipo(electric, water).
%findall(X, tipo(electric, X), L)%
tipo(poison, bug).
tipo(flying, bug).
tipo(rock, bug).
tipo(fire, bug).
%findall(X, tipo(X, bug), L)%
