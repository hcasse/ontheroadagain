---
title: 2 premières semaines de Pink-Unicorn
author: "pink-unicorne"
draft: false
image: blogs/pink-unicorne/robot.png
date: 2022-04-25
---
Nous allons vous présenter le travail effectué pendant cette première semaine d'OnTheRoadAgain.
Dans un premier temps nous avons fait le point sur le matériel nécessaire pour construire notre robot. 

Nous disposont :

	- 1 Arduino Uno
	- 1 shield moteur pour Arduino
	- 2 moteur 
	- 2 roue 
	- 1 roulette sur roulement 
	- 1 baterie 9V
	- 1 capteur 8 led
	
Nous avons fait le choix de passer sur un capteur 8 LEDS et de ne pas garder le capteur initial de 3 LEDS dans le but d'avoir une couverture plus large sur la ligne. 

Pour le châssis de notre robot, nous partons sur une base imprimer en 3D. Nous disposons chacun d'une imprimante 3D ce qui nous facilite énormément pour produire rapidement plusieurs version du châssis. 

![Image](../robot2.png)

Nous sommes actuellement à la V3 du châssis qui se différencie avec les moteurs sous le châssis pour avoir le robot le plus à l'horizontale possible. Pour contrer la distance entre le capteur et la ligne. Nous avons imaginé une glissière avec une visse de réglage pour ajuster la distance de notre capteur. 

![Image](../photoRobot.jpg)

Du côté électronique, nous avons branché le shield et l'arduino en parallèle avec la batterie 9V. On remarque rapidement une limite de l'arduino uno avec notre barre de capteur qui prend 8 pin sur la carte et les 4 pin du shield. 

![Image](../Schema_electrique.jpg)

On utilise un algorithme naïf de suivi de ligne qui permet à notre robot de suivre une ligne simple à une vitesse lente sans problème. Nous travaillons actuellement sur un algorithme PID. 

