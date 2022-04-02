---
title: Le robot
author: "Hugues Casse"
tags: [moteur, robot, IR, capteur, alimentation, matériel]
draft: false
date: 2021-03-28 22:00
image: /docs/wall-e.jpg
---

La configuration du robot sera assez simple : le temps qui nous est imparti est assez court et le montage doit être accessible à tout le monde.

# Au niveau matériel

La photo ci-dessous montre l'ensemble des composants qui vont constituer le robot :

![Matériels disponibles](/docs/matos.jpg)

Au niveau électronique, on trouve :

* 1 Arduino Uno
* 1 [shield Arduino moteur L298](http://www.elecfreaks.com/wiki/index.php?title=L298_Motor_Shield) d'ElecFreaks
* 1 [rampe de 3 capteurs IR QTR-3RC](https://www.pololu.com/product/2457) de Polulu

Le shield moteur est nécessaire car l'Arduino ne délivre pas assez de puissance pour alimnter les moteurs : si on le connectait directement aux moteurs, on aurait de forte chance de le faire fondre.

Au niveau alimentation, on aura :

* 1 boitier 4 piles AA
* fil électrique noir et rouge
* connecteur à bornier vers prise Jack 3.5 pour l'Arduino

Au niveau mécanique, on aura :

* 1 chassis à réaliser
* 2 moteurs avec réducteur DG01D
* 2 roues à pneu souple
* 1 roue libre

Ce sont bien sûr les composants de base. Comme la formation à l'Arduino se fera avec un pack de base dont la breadboard et les differents capteurs / actionneurs pourront être inclus dans le robot final.


# Au niveau logiciel

![Exemple de piste.](/docs/piste.jpg)

Au niveau logiciel, il s'agira de mettre en oeuvre un robot autonome qui sera capable de suivre une piste noire sur un terrain blanc. Cela includes de mettre en oeuvre différents code pour :

* configurer le matériel au démarrage
* lire le ou les capteurs (au minimum la rampe IR)
* piloter les moteurs.

Au démarrage, la rampe IR est positionné de par et d'autre de la bande noire à suivre :

* le capteur IR gauche voit du blanc
* le capteur IR du milieu voit du noire
* le capteur IR de droite voit du blanc Le pilotage de la rampe IR nécessite 3 broches GPIO dont le fonctionnement sera décrit dans un prochain article.

Les déplacement sont réalisés en appliquant une puissance encodée en PWM aux moteurs :

* si les 2 moteurs ont la même puissance, le robot va tout droit
* si le moteur de gauche a une puissance plus petite que le moteur de droite, le robot tourne à gauche
* si le moteur de droite a une puissance plus petite que le moteur de gauche, le robot tourne à droite

L'idée est de mettre en place une boucle d'asservissement :

* d'abord les capteurs IR sont lus,
* une décision de cap à suivre est prise,
* selon cette décision, une certaine puissance est appliquée aux moteurs.
