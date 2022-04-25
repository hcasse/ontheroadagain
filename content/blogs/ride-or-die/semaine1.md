---
title: Semaine 1 of Ride Or Die
author: "Ride Or Die"
draft: false
image: blogs/myblog/semaine1.png
---

Pour cette première semaine, le mot d'ordre était : découverte.
En effet, la réunion de découverte/lancement du projet a eu lieu le lundi. Suite à cette dernière,
une boîte nous a été fourni pour commencer le projet, elle contenait:
-un arduino uno
-un motor shield 
-deux moteurs
-deux roues
-un capteur QTR-3RC
-une roue "libre"
-des piles et son support

C'est alors que la partie découverte a pu commencer.

On a commencé à prendre en main Arduino avec l'application de base, puis on s'est rendu compte que ce n'était 
pas très convivial comme interface. On a donc choisi d'utiliser Visual Studio Code, avec les librairies nécessaires (un enfer sur terre pour tout faire fonctionner !). Finalement, nous avons opté pour la solution PlatformIO, un plugin extrêmement pratique, qui configure automatiquement notre VSCode, permettant un "plug and play" très pratique de notre arduino!

La prise en main d'arduino et de son langage faite, on décide alors de tester chaque composant et comprendre 
comment ils fonctionnent. On se rends compte qu'on a certains composants qui ont un problème. Comme un des deux moteurs qui s'était
désoudé et la roue libre qui n'est pas la bonne.

On se rend compte aussi qu'on a besoin d'une pile 9V plutôt que de plusieurs piles (car très peu de puissance fournie).

Enfin, le plus important : Les capteurs infrarouges. La documentation de la librairie QTR de Pololu nous a bien guidé notamment grâce au programme fournit exemple. Entre autres, il nous a permis de comprendre comment nous devions calibrer nos capteurs, et comment lire les données.

