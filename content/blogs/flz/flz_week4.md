---
title: F(Ligne)-Zero - Week 4
author: "flz"
draft: false
image: blogs/flz/flz.jpg
date: 2022-04-29
---

Ainsi s'achève la quatrième semaine du BE pour le groupe F(Ligne)-Zero.

Les thèmes principaux de cette quatrième semaine : *faire mouvoir le robot* 🚗 ➡️ 🏎️
*Quelques petites vidéos ont été mises en ligne sur Youtube afin de vous partager nos avancements.*

```
```

**Premiers déplacements !**



Le robot en lui-même tenait debout à la fin de la semaine dernière, il était désormais question de le faire rouler... et c'est donc chose faite !

{{< youtube NNQ9alLzp0w >}}

Au final, le robot utilisera donc 2 rampes de capteurs QTR-3RC. Une à l'avant qui sera utilisé dans une optique d'optimisation de vitesse, et une à l'arrière réalisant un suivi plus lent mais plus adapté à un circuit d'endurance.

```
```

**Suivi de ligne naïf**


Première tentative de suivi de ligne naïf à l'aide des capteurs arrières.
C'est pas glorieux, certes, mais c'est déjà mieux que de faire le tour en 50 secondes comme au début...

{{< youtube ypwv5R1_6SU >}}

```
```

**Suivi de ligne PID fonctionnel, pas optimisé**

Première *mise en œuvre* de l'algorithme PID fonctionnelle. Deux jeux de valeurs ont été produits, un pour la rampe arrière un l'autre pour la rampe avant (sur cette vidéo, il s'agit de la rampe arrière).
Ces jeux de variables ne sont probablement pas complètement optimisés, puisqu'avec plus de vitesse le robot a tendance à quitter le circuit... on notera néanmoins **qu'il n'oscille pas !** Et ça c'est très positif.

{{< youtube iAL5mcDE8lA >}}



```
```

**Suivi de ligne PID, optimisé en ligne droite**

~~Malheureusement aucune vidéo n'a été prise...~~

Cela étant, via inversement proportionnel à l'erreur courrante, il est possible de donner une accélération en ligne droite. Un seuil de début d'accélération étant à prévoir (ex : si l'erreur engendre une accélération de moins 40 PWM en plus).
Exemple de code :
```c
if (abs(motorspeed) < 40) {
    analogWrite(E1,motorspeedL + (100 - motorspeed/40*100));
```
Où "motorspeed" est la variation de vitesse que l'algorithme PID a trouvé.

Cette amélioration permet au robot de gagner plusieurs secondes sur le circuit, passant de ~19 secondes à 12-13 secondes.

```
```

Ainsi s'achève donc cette quatrième semaine. Le robot peut donc suivre des lignes dans deux modes de vitesse selon la rampe de capteur utilisée.
Cependant, il reste encore de nombreuses optimisations à faire afin d'aller encore plus vite. À noter également qu'aucun test n'a été réalisé sur un circuit d'endurance, cela sera probablement la thématique de la semaine prochaine.