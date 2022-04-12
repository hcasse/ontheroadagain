---
title: Des fils partout
author: "Hugues Casse"
tags: microcontrôleur, câblage, arduino
draft: false
date: 2022-04-12
image: docs/cablage.jpg
credit: https://www.flickr.com/photos/katielouisedixon/
---

Une application embarqué, c'est braucoup de files :
* entre la carte micro-contrôleurs et les périphériques,
* entre l'alimentation et le reste des composants.

D'abord, il faut remarquer sur l'Arduino, on ne connecte pas n'importe quoi,
n'importe où. Tous les contrôleurs de périphériques ne sont pas disponibles sur
toutes les broches. Un schéma ci-dessous est utile pour connaître le plan de
brochage :

![Broches de l'Arduino](../arduino-map.png)

On ne va pas rentrer dans les détails mais on dipose des broches suivantes :
* digital (`digitalRead()`, `digitalWrite()`) -- 0-19
* analogique en sortie (`analogWrite()`) aussi appelé PWM (_Pulse Width
Modulation_) -- 3, 5, 6, 9-11
* analogique en entrée (`analogRead()`) aussi appelé ADC (_Analogic Digital
Converter_) -- 14-19

Donc quand on conçoit son système embarqué, il faut songer à :
* quelle broche on va connecter sur quel périphérique,
* si on dispose d'assez de broches pour nos besoins.

Pour cela, on peut faire un plan de connexion qui peut prendre la forme de
tableau comme ci-dessous :

Couleur | Broche Arduino	| Type	| Périphérique	| Broche	| Commentaire
---		| ---		| ---			| ---			| ---		| ---
Bleu	| 4			| digital in	| Rampe IR		| X			| ...
Vert	| 5			| ...			| ...			| ...		| ...

Le type peut être :
* digital in, out, in-out,
* analog in,
* analog out.

Un tel tableaux a plein d'avantages :
* Pour vérifier que votre câblage est faisable.
* Pour avoir une vision claire des broches utilisées dans le logiciel.
* Pour vérifier que votre câblage est correct.
* Pour recâbler le montage en cas si besoin.

On notera que :
* _Les couleurs sont vos amies_.
* Habituellement le rouge et le noir sont utilisés, respectivement, pour l'alimentation et la masse.
