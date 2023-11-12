# Modelisation-assurance-vie-Projet-actuariel


## Objectif du Projet

Ce projet vise à estimer et projeter la mortalité d'une cohorte d'assurés italiens afin d'étudier un contrat de retraite et un produit de capital décès. La cohorte en question a souscrit deux types de contrats en 2015 à l'âge de 40 ans : un contrat de retraite et un contrat de capital décès.

---

## Prérequis

Assurez-vous d'installer les packages R nécessaires en exécutant le code suivant :

```R
install.packages(c("StMoMo", "lifecontingencies", "reliaR", "demography", "fanplot", "actuar"))
```

---

## Chargement des Données

Les données de mortalité sont chargées à partir d'un fichier CSV (`LifeTable.csv`) et les taux de mortalité de l'année 2015 pour les femmes et les hommes sont visualisés.

---

## Calcul des Provisions Mathématiques

Les provisions mathématiques sont calculées pour le contrat de capital décès et le contrat de retraite en utilisant une table de mortalité de référence pour l'année 2016.

---

## Projection de la Mortalité avec le Modèle de Lee-Carter

La mortalité est projetée en utilisant le modèle de Lee-Carter, avec une analyse des paramètres tels que αx, βx, et kt. Les résultats sont visualisés pour comprendre les tendances de mortalité au fil du temps.

---

## Estimation des Paramètres

Les paramètres αx et βx du modèle de Lee-Carter sont estimés, et des graphiques sont générés pour illustrer la variation de ces paramètres en fonction de l'âge.

---

## Simulation Stochastique de la Mortalité

Une simulation stochastique est réalisée pour générer des trajectoires futures de mortalité en prenant en compte à la fois les tendances historiques et les fluctuations aléatoires.

---

## Tarification des Contrats

Les VAP des deux contrats (capital décès et contrat de retraite) sont recalculées en utilisant les taux projetés.

---

## Instructions d'Exécution

1. Assurez-vous d'avoir installé tous les packages nécessaires en exécutant la commande `install.packages(c("StMoMo", "lifecontingencies", "reliaR", "demography", "fanplot", "actuar"))`.
2. Chargez le fichier CSV contenant les données de mortalité (`LifeTable.csv`).
3. Exécutez le code R dans chaque section du script pour obtenir les résultats correspondants.

---

## Notes Supplémentaires

- Certains résultats numériques sont affichés dans la console R pour illustrer les calculs réalisés.
- Les graphiques générés visuellement représentent les différentes analyses effectuées.

---
