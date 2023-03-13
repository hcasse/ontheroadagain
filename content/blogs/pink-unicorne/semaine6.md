---
title: Semaine 6 de Pink-Unicorne
author: "pink-unicorne"
draft: false
image: blogs/pink-unicorne/robot.png
date: 2022-05-13
---

Cette semaine nous avons conclu qu'un des problèmes de notre robot etait que les capteurs étaient trop proche de l'axe des roues.
![Image](../CapteurRoue.jpg)


Ce qui fait que la réaction est lente. Deporter les capteurs vers l'avant amplifie la réaction des roues sur le capteur et permet de corriger plus fortement pour chaque changement.

Nous avons donc ajouté une glissière. Ce qui nous permet de regler la distance du capteur en fonction de ce qui marchera le mieux.
![Image](../CapteurDistance.jpg)

Le nouveau design comporte aussi un meilleur cable management et nous ajoutons un PCB au dessus pour avoir plus de liberté de mouvements avec les capteurs (limite de taille de cable) et par la suite ajouter des LED pour avoir un feedback en direct de ce qu'il se passe, sans print.

![Image](../PCB.jpg)

Pour le moment notre problème est dans la prise de virage, et nous travaillons sur le PID pour changer Kp Ki Kd pour résoudre le problème.
