---
title: Semaine 5-6
author: "redbull racing"
draft: false
image: blogs/redbull-racing/introduction.png
date: 2022-05-16
---
Tout d'abord, nous avons eu la surprise de recevoir un nouveau shield, le L923 motor shield v1 de la marque DFRobot.

Ce shield nous permet d'atteindre des vitesses bien plus basses pour nos moteurs (là où l'ancien shield ne faisait plus tourner les moteurs pour une valeur inférieure à 50, nous arrivons ici jusqu'à 30)
Cela nous permet ainsi de prendre des virages plus précis.

![shield](../shield.png)

Notre circuit électrique a été simplifié étant donné que ce shield ne demande pas à être alimenté, seule l'arduino en a désormais besoin.

![schemelec2](../schemelec2.png)

Comme dit dans notre précédent rapport, notre objectif est de programmer notre premier algorithme PID.

Nous avons pour cela procédé étape par étape au développement de notre algorithme.

Notre premier objectif était de déterminer le coefficient Kp

Nous devions pour dans un premier temps mesurer l'erreur de notre capteur:
Une méthode nous permet de directement mesurer la position de la ligne par rapport à notre capteur et d'en ressortir un entier.
Cette méthode renvoie normalement 1000 si la ligne est déterminée comme au centre du capteur, moins de 1000 si plus à gauche et inversement si plus à droite.

Nous nous sommes donc servis de cette valeur pour déterminer l'erreur de notre formule PID.
Pour rappel, la formule de base est Kp * erreur + Kd * (erreur - dernière erreur) + Ki * (somme des erreurs)

Nous avons donc mis les coefficients Ki et Kd à 0 pour nous concentrer sur le Kp.

En positionnant notre robot à une vitesse de base assez basse, nous avons mis Kp à 1 et regardé les résultats.
Dans le cas où notre robot ne tournait pas assez, nous augmentions Kp.
Et dans le cas inverse nous diminuions Kp.

Ainsi et à force d'essayer, nous avons trouvé un Kp qui permettait de suivre un tracé facile seul.

Après avoir trouvé notre Kp, nous avons déterminé le Kd et Ki de la même façon.
Le Kd servait à affiner la stabilité du robot notamment en ligne droite tandis que le Ki nous permettait de suivra plus facilement la ligne dans les virages assez serrés notamment.

Voici une première vidéo avec seulement P et D

{{< youtube FWGbWeLxrBg >}}

Et enfin voici une vidéo avec un algorithme complet

{{< youtube AfQEvh9T9yY >}}

Une fois cela fait, nous avons essayé d'améliorer la vitesse moyenne de notre robot, à nouveau en remettant à jour les coefficients du PID si besoin... 


