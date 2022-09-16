-- 1
select editeur.NOMED
from editeur
where editeur.VILLEED="paris"
ORDER by editeur.VILLEED;

-- 2

SELECT *
FROM ecrivain e
WHERE e.LANGUECR="français"
ORDER by e.NOMECR ,e.PRENOMECR;

--3

select o.NOMOUVR
from ouvrage o
where o.ANNEEPARU between 1986 and 1987;

--4

select *
from editeur
WHERE editeur.TELED is null;

-- 5

select ecrivain.NOMECR, ecrivain.PRENOMECR
FROM ecrivain
WHERE ecrivain.NOMECR like '%C%';

--6

SELECT ouvrage.NOMOUVR
FROM ouvrage
where ouvrage.NOMOUVR like "%banque%"
order by ouvrage.NUMOUVR
;


--7

select depot.NOMDEP , depot.VILLEDEP
from depot
WHERE depot.VILLEDEP='Grenoble'
    or depot.VILLEDEP='Lyon';


--8


select ecrivain.PRENOMECR , ecrivain.NOMECR
from ecrivain
WHERE ecrivain.LANGUECR="français"
    and ecrivain.PAYSECR="usa";


--9

SELECT e.NOMECR, e.PRENOMECR
from ecrivain e
where e.LANGUECR="français"
    and (e.NOMECR like "H%" or e.PRENOMECR like "H%");

--10

SELECT o.NOMOUVR , s.NUMDEP
from ouvrage o
    JOIN stocker s on o.NUMOUVR =s.NUMOUVR
WHERE s.NUMDEP=2;

-- 11


SELECT e.PRENOMECR, e.NOMECR, t.DATEDEB, t.PRIXVENTE
FROM ecrivain e
    JOIN ecrire ec on ec.NUMECR=e.NUMECR
    JOIN tarifer t on t.NUMOUVR=ec.NUMOUVR
WHERE t.PRIXVENTE>=30 and t.DATEDEB="2002/10/01";

--12


SELECT e.PRENOMECR, e.NOMECR
FROM ecrivain e JOIN ecrire ec on ec.NUMECR=e.NUMECR JOIN ouvrage o on o.NUMOUVR= ec.NUMOUVR JOIN classification c on c.NUMRUB=o.NUMRUB
WHERE c.LIBRUB="finances publiques ";

--13

SELECT e.PRENOMECR, e.NOMECR
FROM ecrivain e JOIN ecrire ec on ec.NUMECR=e.NUMECR JOIN ouvrage o on o.NUMOUVR= ec.NUMOUVR JOIN classification c on c.NUMRUB=o.NUMRUB
WHERE c.LIBRUB="finances publiques" and e.NOMECR LIKE "%a%";
--14

select (t.PRIXVENTE*15.5)/100 "pht" , t.NUMOUVR
from tarifer t;

--15

select count(*)
from ecrivain
where ecrivain.LANGUECR in ("anglais","allemand");

-- 16

SELECT COUNT(*)
FROM ouvrage o JOIN classification c on c.NUMRUB=o.NUMRUB JOIN stocker s on s.NUMOUVR= o.NUMOUVR JOIN depot d on d.NUMDEP=s.NUMDEP
WHERE c.LIBRUB="gestion de portefeuilles" AND d.NOMDEP LIKE "%Grenoble%";

-- 17
SELECT o.NOMOUVR, t.PRIXVENTE
FROM ouvrage o JOIN tarifer t on t.NUMOUVR=o.NUMOUVR
GROUP by t.PRIXVENTE
DESC LIMIT 1;
-- 18


select COUNT(e.NUMECR) "nb_ovr", ec.NOMECR
from ecrivain ec join ecrire e on ec.NUMECR=e.NUMECR JOIN ouvrage o on o.NUMOUVR=e.NUMOUVR
GROUP BY e.NUMECR
ORDER BY nb_ovr DESC;


--19

select c.LIBRUB,o.NUMOUVR "nbr exe" from classification c JOIN ouvrage o on c.NUMRUB=o.NUMRUB join stocker s on s.NUMOUVR=o.NUMOUVR join depot d on s.NUMDEP=d.NUMDEP where d.NOMDEP like "%Grenoble%" group by o.NUMOUVR , c.LIBRUB;