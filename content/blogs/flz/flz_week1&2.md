---
title: F(Ligne)-Zero - Week 1&2
author: "flz"
draft: false
image: blogs/flz/flz.jpg
date: 2022-04-18
---

Ainsi s'achève la deuxième semaine du BE pour le groupe F(Ligne)-Zero.

Le thème principal de cette première semaine : découverte 👀

Le thème principal de cette deuxième semaine : modélisation 🚗

![Image](../material_discovery.jpg)
Petit descriptif de ces deux premières semaines :
- (Lundi) réunion de lancement du projet. Notre tuteur, H. Casse, nous a fourni le matériel nécessaire pour démarrer le projet, à savoir :
	- un arduino uno
	- un shield motor
	- deux moteurs
	- un capteur QTR-3RC
	- une roue libre
	- deux roues
	- un câbles
	- quelques composants
- (mardi) première découverte de l'arduino, nous avons pu tester le fonctionnement de l'arduino plus concrètement à l'aide de l'application
- (mercredi) découverte de quelques problèmes sur certaines des pièces fournies, notamment la nécessité d'avoir une pile 9V ainsi qu'une vis manquante sur le motor shield. Réalisation de tests sur certains composants.
![Image](../shield_motor_screw_missing.jpg)
- (Jeudi/Vendredi) prise en main du logiciel OpenSCAD
- (toute la semaine 2) modélisation du châssis principal. Cette modélisation devait prendre en compte les caractéristiques physiques des différents composants. Par exemple, les capteurs doivent être à 3-6mm du sol. Les pièces créés (au nombre de deux) sont totalement "modulables" en ce sens que les fichiers sources (.scad) peuvent rapidement être altérés via des variables.
![Image](../chassis.png)
![Image](../freewheelsupport.png)

Aussi, afin d'obtenir un résultat performant, j'ai (Elana) décidé de faire l'acquisition d'un capteur supplémentaire. Ce capteur sera positionné sur le châssis en même temps que l'autre capteur fourni.
Le but : permettre de gagner en vitesse sur un circuit "vitesse", et, permettre de "prévoir" la ligne pour aider certaines prises de décisions (c'est la théorie en tout cas)

Ces différentes commandes sont finalement arrivées à la fin de la deuxième semaine.


Le but pour la semaine suivante sera de réaliser l'impression, et de vérifier que le robot s'assemble. Il sera également intéressant de se renseigner sur la façon dont doit être codé l'arduino.