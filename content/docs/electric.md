---
title: Réseau électrique dans un système embarqué
auhor: "Hugues Casse"
draft: false
date: 2022-04-05
image: docs/electric.jpg
credit: https://www.flickr.com/photos/26527162@N04/
---

Contrairement à une connexion classique sur une carte mère, un système
embarqué a à faire co-exister plusieurs domaines électriques :

* Le calculateur fonctionne en courant continu en 5V, 3.3V ou même 1.8V.

* Les capteurs et actionneurs peuvent nécessiter des tensions plus importantes.

* L'alimentation doit permettre de fournir assez de courant pour l'ensembe du système et le courant nécessité est très variable d'un composant à l'autre.

Par conséquent, il faut:
1. S'assurer que tous les composants sont suffisament alimentés.
2. Que les connexions entre composants se fassent dans des plages acceptables.

Sans cela, on termine assez rapidement par casser du matériel et tout spécialement le calculateur qui est souvent à la fois le composant le plus cher et le plus fragile du système embarqué.

Pour résumer notre système, nous avons les composants suivants :
* 1 calculateur Arduino,
* 1 rampe de capteurs IR,
* 2 moteurs en courant continus.

J'ai résumé leurs caractéristiques électriques ci-dessous :

Composant 	| Tension	| Courant
---       	| ---     	| ---
Arduino		| 4-6V		| 45 mA
Rampe IR	| 5V		| 17 mA
Moteur		| 3-9V		| 190-250 mA

De plus, on dispose comme source de courant soit le câble USB, soit le bloc de pile. L'Arduino peut également servir de source de courant :

Alimentation	| Tension	| Courant
---				| ---		| ---
USB				| 5V		| 500 mA (max)
Bloc de pile	| 6V		| 11 A 
Arduino			| 5V		| 20 mA/pin - total 200 mA

Pour que tout marche bien, il faut appliquer les règles suivantes :

> 1. On ne connecte que des broches dont les tensions sont compatibles.

Sinon, au mieux, le composant de plus fort voltage aura un comportement erratique. Au pire, on risque de casser/cramer le composant de plus faibles tension.


> 2. Une source de courant ne doit pas être connecté à des composant de la somme de leur consommation est supérieure au courant fourni.

Sinon, on crée une surconsommation qui risque de provoquer un échauffement, façon court-circuitn qui va casser la pièce la plus fragile : il s'agit souvent de l'Arduino.

Alors, me direz-vous, comment est-ce que je peux alimenter/contrôler les moteurs ? Et bien en utilisant le [shield moteur](../shield-moteur) qui va faire le lien entre le domaine numérique Arduino et le domaine courant continue des moteurs avec les connexions suivantes :


Broche		| Composant		| Tension
---			| ---			| ---
M1+/M1-		| moteur 1		| 3-9V
M2+/M2-		| moteur 2		| 3-9V
P4 (M1)		| Arduino 		| 5V
P5 (E1)		| Arduino		| 5V
P6 (E2)		| Arduino		| 5V
P7 (M2)		| Arduino		| 5V
VIN/GND		| Bloc pile		| 6V







