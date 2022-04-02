---
title: Moteur à courant-continu DG01D
author: "Hugues Casse"
tags: moteur, courant-continu
draft: false
date: 2018-11-06 16:57
image: /docs/moteur.jpg
---

Nous allons utiliser des moteur à courant continu, aussi appelés motoréducteurs : ils incluent un moteur en courant continu et un ensemble de pignons permettant de réduire la vitesse du moteur et de transformer en mouvement perpendiculaire à l'axe du moteur. Ce dernier système permet de rendre moins encombrant le moteur pou l'assemblage sur le robot.

Ils sont constitué d'un double sortie sur axe Ø5 mm à double méplat.

Les caractéristiques de ces moteurs sont les suivantes :

* alimentation : 3 à 9 Vcc (7,2 Vcc nominal)
* vitesse à vide : 90 tours/min sous 4,5 Vcc
* consommation à vide: 190 mA (250 mA maxi) sous 4,5 Vcc
* couple : 0,8 kg.cm
* dimensions : 70 x 37 x 23 mm

Il n'y a pas beaucoup d'information sur Internet mais j'ai trouvé cette datasheet [DG01D.pdf](/docs/DG01D.pdf).

En fait, les moteurs à courant continu sont très simples. Vous pouvez vous référer à [Wikipédia](https://fr.wikipedia.org/wiki/Machine_%C3%A0_courant_continu) pour plus de détail sur leur fonctionnement.

De notre point de vue, il suffit de savoir qu'ils ont 2 entrées : une pour l'alimentation et l'autre pour la masse. Ils peuvent être connecté dans les 2 sens et suivant le sens de connection, le moteur ira en avant ou en arrière. Les shields Arduino pour moteur CC contrôlenet ces 2 entrées et permettent au moteur d'aller en avant ou en arrière.

**Il faut noter qu'il est déconseillé de connecter le moteur directement sur l'Arduinon : celui-ci tirerait plus de puissance que ne peut fournir l'Arduino et pourrait le cramer.**

La puissance (et la vitesse) développée par le moteur CC dépend de l'intensité multiplié par le temps. Il est compliquée d'agir sur l'intensité mais on pourra facilement jouer sur le temps. Ainsi, le shield Arduino délivrant la puissance au moteur sera piloté PWM (Pulse Width Modulation) ou modulation de largeur d'impulsion. L'idée est de délivrer un signal discret et périodique (habituellement de 2ms) et de jouer sur la proportion du signal qui est à 1 (le reste du temps à 0). Plus l'impulsion (partie à 1) est large (proche de 2ms), plus la quantité d'énergie est grande et le moteur sera vélonce. Inversement, une impulsion de largeur nulle arrêtera le moteur.

![Largeur d'impulsion avec signal PWM](/docs/pwm_duty.png)

On remarquera qu'il faut la période soit suffisamment petite pour profiter de l'inertie du moteur. Sans cela, le déplacement se fera par à-coup (démarrage, arrêt, démarrage, arrêt, etc). En fait, le shield de moteur CC contient 2 MOSFET, des transistors supportant une puissance importante agissant comme des interrupteurs contrôlé par le signal PWM.
