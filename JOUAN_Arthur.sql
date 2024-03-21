-- Devoir 165
-- Nom: JOUAN , Prenom: Arthur

-- Feuille SAE2.04 Exploitation d'une base de donn�es
-- 
-- Veillez � bien r�pondre aux emplacements indiqu�s.
-- Seule la premi�re requ�te est prise en compte.

-- +-----------------------+--
-- * Question 165440 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quelles sont les formations offertes par l'IUT d'Orl�ans en 2023? On veut le num�ro de formation, la fili�re, le nom (fil_lib_voe_acc)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | num_form | fil_lib_voe_acc                                          | select_form         | num_fili | fili              |
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | etc...
select  num_form, fil_lib_voe_acc, select_form, num_fili, fili FROM ETABLISSEMENT NATURAL JOIN FORMATION NATURAL JOIN FILIERE NATURAL JOIN STATS NATURAL JOIN VOEUX WHERE g_ea_lib_vx = "I.U.T d'Orléans" and session = 2023;



-- +-----------------------+--
-- * Question 165451 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quels sont les �tablissements de la Creuse qui offrent un BTS? On veut le code uai, le nom de l'�tablissement ( g_ea_lib_vx) et la ville.

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------+------------+------+
-- | cod_uai  | g_ea_lib_vx                      | ville_etab | FILI |
-- +----------+----------------------------------+------------+------+
-- | etc...
select cod_uai, g_ea_lib_vx, ville_etab, fili FROM ETABLISSEMENT NATURAL JOIN FILIERE NATURAL JOIN DEPARTEMENT NATURAL JOIN FORMATION NATURAL JOIN VOEUX where dep_lib = 'Creuse' and fili = 'BTS';



-- +-----------------------+--
-- * Question 165507 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Combien de candidats ont �t� class�s lors de la phase principale de 2023 par les diff�rents �tablissements qui d�livrent le BUT QLIO? On veut le code uai, le nom et la ville de l'�tablissement et le nombre de class�s lors de la phase principale (nb_cla_pp)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | cod_uai  | g_ea_lib_vx                                         | ville_etab         | nb_cla_pp |
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | etc...
select cod_uai, g_ea_lib_vx, ville_etab, nb_cla_pp FROM ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN DEPARTEMENT NATURAL JOIN FORMATION NATURAL JOIN STATS WHERE session = 2023 and fil_lib_voe_acc = 'Qualité, logistique industrielle et organisation';


-- +-----------------------+--
-- * Question 165541 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  La liste des lyc�es agricoles publics de la Gironde

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------+-------------+
-- | cod_uai  | g_ea_lib_vx                            | ville_etab  |
-- +----------+----------------------------------------+-------------+
-- | etc...
select cod_uai, g_ea_lib_vx, ville_etab FROM ETABLISSEMENT NATURAL JOIN DEPARTEMENT WHERE contrat_etab = 'Public' and g_ea_lib_vx LIKE '%Lycée agricole%' and dep_lib = 'Gironde';



-- +-----------------------+--
-- * Question 165563 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des d�partements dans lesquels il n'y a aucune offre de CPGE

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-----+-------------------------+
-- | dep | dep_lib                 |
-- +-----+-------------------------+
-- | etc...
select dep, dep_lib FROM DEPARTEMENT WHERE dep NOT IN ( Select dep FROM DEPARTEMENT NATURAL JOIN FILIERE NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION where num_fili = 4);



-- +-----------------------+--
-- * Question 165619 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements qui offrent � la fois une licence de Droit et une licence informatique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+--------------------------------------------------------------+----------------+
-- | cod_uai  | g_ea_lib_vx                                                  | ville_etab     |
-- +----------+--------------------------------------------------------------+----------------+
-- | etc...
select distinct cod_uai, g_ea_lib_vx, ville_etab FROM ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE WHERE (num_fili = 6 and fil_lib_voe_acc = 'Droit') or (num_fili = 6 and fil_lib_voe_acc = 'Informatique') group by g_ea_lib_vx HAVING count(*)>1;



-- +-----------------------+--
-- * Question 165620 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements de l'acad�mie de Corse qui n'offrent que des BTS

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------------------+------------+
-- | cod_uai  | g_ea_lib_vx                                        | ville_etab |
-- +----------+----------------------------------------------------+------------+
-- | etc...
select distinct cod_uai, g_ea_lib_vx, ville_etab FROM ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FILIERE NATURAL JOIN DEPARTEMENT NATURAL JOIN ACADEMIE where acad_mies = 'Corse' and cod_uai NOT IN (select distinct cod_uai FROM ETABLISSEMENT where num_fili != 2 );


-- +-----------------------+--
-- * Question 165631 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner le nombre d'�tablissements publics par acad�mie

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +---------------------+-------+
-- | acad_mies           | nb_et |
-- +---------------------+-------+
-- | etc...
select acad_mies, count(cod_uai) as nb_et FROM ETABLISSEMENT NATURAL JOIN DEPARTEMENT NATURAL JOIN ACADEMIE where  contrat_etab = 'Public' group by acad_mies;



-- +-----------------------+--
-- * Question 165664 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner le nombre total de candidatures en licence en 2023 par r�gion

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------------------------+------------+
-- | region_etab_aff            | nb_voe_but |
-- +----------------------------+------------+
-- | etc...
select region_etab_aff, count(*) as nb_voe_but FROM ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN DEPARTEMENT NATURAL JOIN REGION NATURAL JOIN FORMATION NATURAL JOIN FILIERE where num_fili = 6 group by region_etab_aff;



-- +-----------------------+--
-- * Question 165710 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la ou les formations qui ont re�u le moins de voeux en phase principale en 2023

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-----------------------------------------------------+-------------------------+-----------------+-----------+
-- | cod_uai  | g_ea_lib_vx                                         | ville_etab              | fili            | nb_voe_pp |
-- +----------+-----------------------------------------------------+-------------------------+-----------------+-----------+
-- | etc...
select cod_uai, g_ea_lib_vx, ville_etab, fili, nb_voe_pp FROM ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN STATS NATURAL JOIN FORMATION NATURAL JOIN FILIERE WHERE nb_voe_pp = ( select min(nb_voe_pp) FROM STATS WHERE session = 2023);


-- +-----------------------+--
-- * Question 165765 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des acad�mies qui ont offert plus de places en 2022 qu'en 2023

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +---------------------+
-- | acad_mies           |
-- +---------------------+
-- | etc...
WITH place_2022 AS(
    SELECT acad_mies, sum(capa_fin) as Place_2022
    FROM ETABLISSEMENT natural join VOEUX natural join STATS natural join DEPARTEMENT natural join ACADEMIE
    WHERE session = 2022
    GROUP BY acad_mies)
    ,
    place_2023 AS(SELECT acad_mies, sum(capa_fin) as Place_2023
    FROM ETABLISSEMENT natural join VOEUX natural join STATS natural join DEPARTEMENT natural join ACADEMIE
    WHERE session = 2023
    GROUP BY acad_mies)

SELECT distinct P2022.acad_mies
FROM place_2022 P2022, place_2023 P2023
WHERE P2022.Place_2022 > P2023.Place_2023; 



-- +-----------------------+--
-- * Question 165776 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 1er graphique   

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+---------+
-- | fili              | nb_form |
-- +-------------------+---------+
-- | etc...
SELECT fili, COUNT(*) AS nb_form 
FROM FILIERE NATURAL JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN STATS NATURAL JOIN ETABLISSEMENT NATURAL JOIN DEPARTEMENT NATURAL JOIN ACADEMIE 
WHERE acad_mies = "Orléans-Tours" AND session = 2023 and fili != "PASS" 
GROUP BY fili;




-- +-----------------------+--
-- * Question 165798 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 2eme graphique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+----------+
-- | filiere           | nb_voeux |
-- +-------------------+----------+
-- | etc...
SELECT
fili AS filiere, SUM(capa_fin) AS nb_voeux
FROM FILIERE NATURAL JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN STATS NATURAL JOIN ETABLISSEMENT
WHERE session = 2023 AND select_form = "formation sélective"
GROUP BY num_fili ORDER BY nb_voeux DESC;




