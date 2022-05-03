---
title: Semaine 4 de Pink-Unicorne
author: "pink-unicorne"
draft: false
image: blogs/pink-unicorne/robot.png
date: 2022-03-25
---

Récapitulatif de la semaine 4 du BE.

L'objectif de cette semaine était de se familiariser avec le PID et de produire une première version.

On a commencé par une base PD (Proportional, dérivé)

On utilisera pour PD : 
```
P = error
```
```
D = error - lastError
```
On utilisera cette formule pour la vitesse des moteurs : 
```
MotorSpeed = KP * error + KD * (error - lastError)
```

Pour déterminer notre erreur on attribuera une valeur à chaque capteur. 
![Image](../PIDError.png)
Si votre robot est centré sur la ligne noire. Notre erreur sera de 0. Dans les autres cas elle sera proportionnelle au décalage du robot. 

Grâce à cette erreur nous pouvons donc faire fluctuer la vitesse de chaque roue en accélérant une et en ralentissant l'autre pour recentrer le robot sur la ligne.
![Image](../PID.png)

Sur un banc de test le robot réagi bien a l'algorithme mais sur le terrain nous sommes trop limité par la résistance des moteurs qui nous empêchent d'avoir des vitesses faibles


