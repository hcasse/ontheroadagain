---
title: DFRobot DRI0001
author: "Hugues Casse"
tags: shield, moteur, arduino
draft: false
date: 2022-05-09
image: docs/dfrobot-shield.jpg
---

Le nouveau shield de contrôle moteur est arrivé et il est normalement
plus précis. Sa documentationest [ici](https://wiki.dfrobot.com/Arduino_Motor_Shield__L293___SKU__DRI0001_).

L'image ci-dessous vous indique comment le câbler :

![DFROBOT-DRI0001](../dfrobot-dri0001.png)

_La grosse différence est que la shield est alimenté par la carte Arduino. Il ne faut donc pas utiliser le shield sans alimentation extérieure sur la carte Arduino._

Autre différences, l'utilisation des broches de l'Arduino ou plutôt le numéro des broches parce que pour le reste, le fonctionnement est le même:

Broche	| Moteur	| Fonction
--------|-----------|---------
Pin 4	| Moteur 2	| Direction
Pin 5	| Moteur 2  | Puissance (PWM)
Pin 6	| Moteur 1	| Puissance (PWM)
Pin 7	| Moteur 1	| Direction

Voila, c'est tout.
