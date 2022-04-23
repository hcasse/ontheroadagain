---
title: F(Ligne)-Zero - Week 3
author: "flz"
draft: false
image: blogs/flz/flz.jpg
date: 2022-04-23
---

Ainsi s'achève la troisième semaine du BE pour le groupe F(Ligne)-Zero.

Les thèmes principaux de cette troisième semaine : impression, assemblage et réalisation des circuits électriques 👀

```
```

**L'impression !**

 - première pièce : le support de la roue libre avant !
 - deuxième pièce : le châssis !

~~... en fait... j'ai oublié de prendre des photos des pièces seules, et elles sont déjà vissées maintenant...~~


```
```

**L'assemblage !**

Avec les pièces enfin imprimés, des premiers assemblages ont eu lieu. Et, miracle, aucun problème d'alignement des trous, tout s'assemble parfaitement 🤠... enfin sauf pour la roue avant, le trou est un peu trop gros donc il va nous falloir des rondelles pour faire tenir les écrous...

![Image](../week3_first_assembly.jpg)

```
```

**Le circuit électrique complet du robot**

![Image](../week3_eletrical_circuit.jpg)

Bon... fait à la main mais c'était plus simple pour ajouter des notes.

Pour résumer le schéma dans son ensemble :
- une pile 9V sert d'alimentation pour le circuit. Sur ce circuit seront placés deux interrupteurs : le premier pour couper toute l'alimentation, et le second uniquement pour couper l'alimentation du motor shield ;
- ce circuit (en bas) vient donc directement se brancher sur l'alimentation de l'arduino et du motor shield en parallèle ;
- les deux moteurs connectés via le motor shield occuperont les pins 4,5,6 et 7 ;
- deux capteurs IR QTR-3RC seront connectés. Le premier utilisera les pins 8,9,10 et le second les pins 11,12,2, ainsi que le 5V et le GND (via une breadboard probablement) ;
- un petit circuit avec une résistance et un interrupteur utilisant le pin A3, ainsi que le 5V et le GND servira à faire un changement de "mode" (vitesse & endurance).

```
```

**Séance soudures !**

![Image](../week3_soldering.jpg)

Et voilà... petit atelier de soudure afin de réaliser les circuit comprenant les intérrupteurs comme décrit sur le schéma précédent. J'ai (Elana) également soudé des pins (mâle, individuel) aux extrémité d'un 3e interrupteur afin de rendre la connexion plus facile pour le changement de mode (visible en haut à gauche de la photo). Un domino servira à faire la connexion entre ce petit circuit et les câbles du couvercle de la pile, le but étant... de ne pas souder le couvercle de la pile (il faudra le rendre, et en bon état, après tout).


```
```

**Assemblage final et test rapide !**

![Image](../week3_final_assembly.jpg)

Et voilà plusieurs pièces assemblées ! Sur cette photo il y a donc :
- Le châssis ;
- le support de la roue libre ;
- les deux moteurs vissés ;
- les deux roues fixés aux moteurs ;
- la roue avant fixée à l'aide de quelques rondelles ;
- la pile simplement dans son socle (pas vraiment attachée, mais elle ne bouge pas) ;
- l'arduino dans son socle, il n'est pas encore fixé, d'avantages de trous seront à faire ;
- le circuit électrique de la pile à l'arduino+shield motor (avec les interrupteurs !).

Maintenant est-ce que ça fonctionne... la réponse est "plus ou moins". Après l'assemblage, le robot a réussi à démarrer et à rouler 🥳 (très vite d'ailleurs), prouvant ainsi que le circuit des interrupteurs est fonctionnel.
Le problème ? Et bien après l'avoir empêcher de manger le mur, il refuse de redémarrer... 😔 mais ça, ce sera un problème pour la semaine prochaine.

En ce qui concerne la hauteur du châssis, elle semble correcte (~6/7mm exactement comme prévu au niveau des roues arrière, et ~8mm au niveau de la roue avant, ajustable en changeant les rondelles). Bien entendu les capteurs n'ont pas encore été fixés (d'ailleurs il faudra faire des trous pour eux aussi).
Donc selon les résultats sur les premiers tests de code, la hauteur aura éventuellement à être ajustée.

```
```

Ainsi s'achève donc cette troisième semaine. Pouvoir enfin voir le robot tenir debout et rouler était très satisfaisant à (enfin) voir !
La semaine prochaine sera donc (hopefully) dédiée au développement du code de contrôle PID (après quelques tests histoire de voir si suivre une ligne sans PID fonctionne... mais pourquoi donc est-ce que ça ne fonctionnerait pas... 🙄)


