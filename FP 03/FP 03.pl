%------------------------------------------Exercicio 1-------------------------------------------------------------

%homem(nome, ano_nascimento, ano_falecimento)
homem("John Hamilton", 1900, 1984).
homem("Steve Smith", 1928, 2000).
homem("John Hamilton", 1929, 2010).
homem("Dale Calebs", 1936, 2017).

%mulher(nome, ano_nascimento, ano_falecimento)
mulher("Jan Simon", 1902, 1982).
mulher("Abby Hamilton", 1925, 2002).
mulher("Gabi Julian", 1930, 2008).
mulher("Barb Hamilton", 1932, 2012).

%filho(filho, pai, mãe)
filho("Fae Smith", "Steve Smith", "Abby Hamilton").
filho("Cami Smith", "Steve Smith", "Abby Hamilton").
filho("Meg Hamilton", "John Hamilton", "Gabi Julian").
filho("Pam Calebs", "Dale Calebs", "Barb Hamilton").
filho("Angie Grant", "Mark Grant", "Pam Calebs").
filho("Mike Calebs", "Dale Calebs", "Barb Hamilton").
filho("Mary Calebs", "Mike Calebs", "Alex Jones").

%casamento(homem, mulher)
casamento("John Hamilton", "Jan Simon").
casamento("Steve Smith", "Abby Hamilton").
casamento("Dale Marx", "Cami Smith").
casamento("John Hamilton", "Gabi Julian").
casamento("Dale Calebs", "Barb Hamilton").
casamento("Mark Grant", "Pam Calebs").
casamento("Mike Calebs", "Alex Jones").

%irmão?
%irmao(X,Y):-filho(X,P,M),filho(Y,P,M),X\==Y.

%avô materno (masculino)
avo_materno(X,Y):-filho(Y,_,M),filho(M,X,_).

%avô (homem ou mulher, materno ou paterno)
avo(X,Y):-filho(Y,P,M),(filho(P,X,_);filho(P,_,X);
                       filho(M,X,_);filho(M,_,X)).
%------------------------------------------Exercicio 2------------------------------------------------------------
%homem(nome)
homem('Stannis').
homem('Renly').
homem('Loras tyrell').
homem('Sandor Clegane').
homem('Ser Gregor Clegane').
homem('Robert').
homem('Joffrey').
homem('Tommen').
homem('Ser Jaime').
homem('Tyrion').
homem('Tywin').
homem('Kevan').
homem('Lancel').
homem('Aerys II').
homem('Viserys').
homem('Khal Drogo').
homem('Rhaegar').
homem('Rhaenys').
homem('Aegon').

%mulher(nome)
mulher('Joanna').
mulher('Dorna').
mulher('Cersei').
mulher('Myrcella').
mulher('Rhaella').
mulher('Elia').
mulher('Daenerys').

%familia(nome, familia)
%Lannister
familia('Joanna', 'Lannister').
familia('Tywin', 'Lannister').
familia('Kevan', 'Lannister').
familia('Dorna', 'Lannister').
familia('Cersei', 'Lannister').
familia('SerJaime', 'Lannister').
familia('Tyrion', 'Lannister').
familia('Lancel', 'Lannister').
%Baratheon
familia('Stannis', 'Baratheon').
familia('Renly', 'Baratheon').
familia('Robert', 'Baratheon').
familia('Joffrey', 'Baratheon').
familia('Myrcella', 'Baratheon').
familia('Tommen', 'Baratheon').
familia('Gandor Clegane', 'Baratheon').
familia('Ser Gregor Clegane', 'Baratheon').
%Targaryen
familia('Aerys II', 'Targaryen').
familia('Rhaella', 'Targaryen').
familia('Elia', 'Targaryen').
familia('Rhaegar', 'Targaryen').
familia('Viserys', 'Targaryen').
familia('Daenerys', 'Targaryen').
familia('Rhaenys', 'Targaryen').
familia('Aegon', 'Targaryen').
%sem família
familia('Loras Tyrel', _).
familia('Khal Drogo', _).

%casados(homem, mulher)
casados('Tywin', 'Joanna').
casados('Kevan', 'Dorna').
casados('Robert', 'Cersei').
casados('Aerys II', 'Rhaella').
casados('Rhaegar', 'Elia').
casados('Khal Drogo', 'Daenerys').

%descendentes diretos(homem, mulher, filho)
descendenteDir('Tywin', 'Joanna', 'Cersei').
descendenteDir('Tywin', 'Joanna', 'SerJaime').
descendenteDir('Tywin', 'Joanna', 'Tyrion').
descendenteDir('Kevan', 'Dorna', 'Lancel').
descendenteDir('Robert', 'Cersei', 'Joffrey').
descendenteDir('Robert', 'Cersei', 'Myrcella').
descendenteDir('Robert', 'Cersei', 'Tommen').
descendenteDir('Aerys II', 'Rhaella', 'Rhaegar').
descendenteDir('Aerys II', 'Rhaella', 'Viserys').
descendenteDir('Aerys II', 'Rhaella', 'Daenerys').
descendenteDir('Rhaegar', 'Elia', 'Rhaenys').
descendenteDir('Rhaegar', 'Elia', 'Aegon').

%irmão(irmão, irmão)
irmao(X,Y):-descendenteDir(P,M,X),descendenteDir(P,M,Y),X\==Y.

%matou(assassino, vitima)
matou('Tyrion', 'Joanna').
matou('Ser Jaime', 'Aerys II').
matou('Robert', 'Rhaegar').
matou('Ser Gregor Clegane', 'Elia').
matou('Ser Gregor Clegane', 'Rhaenys').
matou('Ser Gregor Clegane', 'Aegon').

%inimigo(pessoa, pessoa)
inimigo('Gandor Clegane', 'Ser Gregor Clegane').
inimigo('Cercei', 'Tyrion').
inimigo('Tywin', 'Tyrion').

%amigo(pessoa, pessoa)
amigo('Renly', 'Loras Tyrell').

%relação amorosa(pessoa, pessoa)
relamorosa('Ser Jaime', 'Cersei').
relamorosa('Renly', 'Loras Tyrell').

%filho(pai, filho)
filho(P,F):-descendenteDir(P,_,F), homem(F).

%filha(pai, filha)
filha(P,F):-descendenteDir(P,_,F), mulher(F).

%gay(pessoa)
gay('Renly').
gay('Loras Tyrell').

gay(X):-relamorosa(X,Y),(homem(X),homem(Y);mulher(X),mulher(Y)).

%viúvo(pessoa)
viuvo(H):-casados(H,M), matou(_, M), homem(H).

%viúva(pessoa)
viuva(M):-casados(H,M), matou(_, H), mulher(M).

%viúvos amorosos(homem, mulher)
viuvos_amorosos(H,M):-(homem(H),mulher(M);mulher(M),homem(H)),(viuvo(H),viuva(M);viuva(M),viuvo(H)).

%vingança pendente(pessoa, pessoa)
vingança(X,Y):-matou(Y,Z),(casados(X,Z);casados(Z,X)).

%morto(pessoa)
morto(X):-matou(_,X).

%vingou(pessoa, pessoa)
vingou(X,Y):-matou(X,Z),matou(Z,Y).

%infiel(pessoa)
infiel(X):-(casados(X,Y);casados(Y,X)),
    		not(morto(Y)),
            relamorosa(Z,X),
    		not(morto(Z)).

%Respostas Ex2
%morto('Aerys II') -> true
%matou('Ser Jaime', 'Aerys II') -> true
%amigo('Tywin', 'Tyrion') -> false
%irmao('Stannis', 'Renly')
%incesto(X,Y):-irmao(X,Y).

%Respostas Ex3
%incesto(X,Y):-relamorosa(X,Y),irmao(X,Y).
%matou('Tyrion',X) -> Joanna
%matou2('Sir Jaime',X):-familia(X,'Targaryen').
%matoutar(X):-matou(X,Y),familia(Y,'Targaryen').
%descendenteDir('Robert','Cersei',X)
%descendenteDir(_,_,X).

%FICHA 4
descendenteQualquerGrau(X, Y):- filho(X, Y).
descendenteQualquerGrau(X, Y):- filho(Z, Y), descendenteQualquerGrau(X, Z).
%descendenteQualquerGrau("Aerys II", X)