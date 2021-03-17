/* CHATTELARD VINCENT - TP1 NoSQL */

/* EXERCICE 1 */

/* Créez la ou les tables permettant à un administré de voter dans sa commune. 

Un administré est caractérisé par :


/* Création du répertoire elections */

CREATE KEYSPACE elections WITH REPLICATION = { 'class' : 'SimpleStrategy',
'replication_factor' : 1 };

/* Création de la table administre */

CREATE TABLE elections.administre (
Prenom_A text PRIMARY KEY,
Nom_A text,
Adresse text,
NIN varint
);

/* Création de la table candidat */

CREATE TABLE elections.Candidat (
Prenom_P text ,
Nom_P text,
Parti_politique text,
nbr_vote int ,
PRIMARY KEY ((Nom_P), nbr_vote, Parti_Politique)
);

/* Création de la table vote */

CREATE TABLE elections.Vote (
Nom_A text,
Nom_P text,
PRIMARY KEY(Nom_A, Nom_P)
);

/* Insertion de valeurs dans la table Candidat */

INSERT INTO elections.Candidat (Nom_P , Prenom_P , Parti_politique ,
nbr_vote )
VALUES ('cu' , 'candidat_un', 'A' , 5 );

INSERT INTO elections.Candidat (Nom_P , Prenom_P , Parti_Politique ,
nbr_vote )
VALUES ('cd', 'candidat_deux', 'B' , 10 );

INSERT INTO elections.Candidat (Nom_P , Prenom_P , Parti_Politique ,
nbr_vote )
VALUES ('ct' , 'candidat_trois', 'C' , 15 );

INSERT INTO elections.Candidat (Nom_P , Prenom_P , Parti_Politique ,
nbr_vote )
VALUES ('cq' , 'candidat_quatre', 'A' , 30 );

/* 1- Quel partie politique a réuni le plus de voix ? */
/* le nombre de voix récoltées par chaque candidat */

SELECT sum(nbr_vote) from elections.Candidat Where Parti_politique= 'A' ALLOW FILTERING;

SELECT sum(nbr_vote) from elections.Candidat Where Parti_politique= 'B' ALLOW FILTERING; 

SELECT sum(nbr_vote) from elections.Candidat Where Parti_politique= 'C' ALLOW FILTERING; 
/* On peut ainsi voir un par un le nombre de votes reçus par les candidats et en déterminer celui qui en a récolté le plus */

/* SELECT Sum (nbr_vote) from elections.candidat Where Parti_politique in ('A','B','C') ALLOW FILTERING;
SELECT Parti_Politique Where sum nbr_vote =  SELECT MAX nbr_vote in Parti_politique;

En utilisant cette requête SQL nous pouvons automatiser le calcul si nous ne voulons pas faire le traitement candidat par candidat */
 
/* 2-Quel candidat a gagné les élections ? */

SELECT max(nbr_vote), Nom_C,Prenom_C  from Candidat; 
/* Affiche le nom, le prénom et le nombre de vote du candidat gagnant */

/* 3-Le candidat ayant gagné les élections vient-il du parti politique ayant eu
la majorité des voix ? */

CREATE INDEX ipp on elections.Candidat (parti_politique);

CREATE INDEX nbr on elections.Candidat (nbr_vote);

Select max(nbr_vote) from Candidat;

Select * from Candidat order by nbr_vote DESC ;

Select sum(nbr_vote) from candidat group by parti_politique;

Select sum(nbr_vote) from candidat group by parti_politique;

/* Oui, dans notre cas, le candidat ayant gagné les élections provient bien du parti politique ayant eu la majorité. */


/* Exercice 2 */

CREATE TABLE elections.Candidat2 (
Parti_politique text,
nbr_vote int,
Prenom_P text ,
Nom_P text,
PRIMARY KEY ((Nom_P), nbr_vote, Parti_Politique)
);

INSERT INTO elections.Candidat2 (Nom_P , Prenom_P , Parti_politique ,
nbr_vote )
VALUES ('cu' , 'candidat_un', 'A' , 30);

INSERT INTO elections.Candidat2 (Nom_P , Prenom_P , Parti_Politique ,
nbr_vote )
VALUES ('cd', 'candidat_deux', 'B' , 10 );

INSERT INTO elections.candidat2 (Nom_P , Prenom_P , Parti_Politique ,
nbr_vote )
VALUES ('ct' , 'candidat_trois', 'C' , 15 );

/* 1. Quel est le parti politique ayant eu le plus de voix ? */

SELECT MAX(nbr_vote),Parti_politique FROM elections.candidat2;

/* 2. Quel est le parti politique ayant eu le moins de voix ? */

SELECT Min (nbr_vote),Parti_Politique from elections.candidat2;

SELECT Parti_politique, MIN (nbr_vote) FROM elections.candidat2 group by Parti_politique;