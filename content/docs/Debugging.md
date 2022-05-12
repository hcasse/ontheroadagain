---
title: Déboguer l'application embarquée
author: "Hugues Casse"
tags: application, embarqué
draft: false
date: 2022-05-12
image: docs/Debugging.jpg
credit: https://www.flickr.com/photos/hulagway/
---

Déboguer une application embarqué, et mobile, est parfois compliqué.
Il n'est pas toujours possible de rester connecté et recevoir des affichages :
* La connection physique peut perturber le système mobile.
* L'utilisation d'affichage - `Serial.println()`, perturbe le temps de l'application en introduisant des temps supplémentaires (la communication série sur l'USB étant assez lente).

# Journaux

Pour éviter cela, on peut adopter la stratégie suivante :
* On enregistre les données dans des tableaux - qu'on peut nommer journaux comme dans les systèmes d'exploitation (de taille forcément limité).
* Dès que le câble série est branché, le robot s'arrête et transmet vers `Serial` les données qu'il a stocké, ce qui permet d'essayer de comprendre ce qui s'est passé _post mortem_.

Afin de construire de réels journaux et de bien comprendre ce qui se passe :
* Il faut dater les entrées dans les journaux - fonction `millis()`,
* Comme le taille est limitée, on peut remplir un journal modulo (les dernières entrées sont écrasées par les nouvelles).

En Arduino, pour détecter si le câble série est branché, il suffit de réaliser le test :
```C++
	if(Serial) {
		// afficher le journal
		while(Serial)	// attendre le débranchement
			;
	}
```

La documentation de `Serial` est [ici](https://www.arduino.cc/reference/en/language/functions/communication/serial/).


# Tests de cohérence / mode erreur

En phase de débogage, il est utile de rajouter des tests pour :
* vérifier si tout va bien,
* si on ne se retrouve pas une situation d'échec.

Dans cas cas, il faut prévoir une procédure qui permet à l'expérimenteur de voir si quelque chose est allée de travers. Ce signal peut être fait de diverses manières :
* en utilisant des LEDs,
* en réalisant un mouvement explicite (le robot tourne sur lui-même durant 2s).

Après cela, le robot doit s'arrêter en attente d'une connexion USB et il peut utiliser la même méthode que précédemment pour fournir un message plus explicite. On peut avoir une fonction du type:
```C++
void crash(string message) {
	// réalisation du signal
	while(!Serial);
	Serial.println(message);
	while(1);
}
```

On peut bien sûr améliorer la communication en rajoutant divers boutons et LEDs.


> Ce qui est clair, c'est que déboguer une applicatin embarquée mobile/temps-réel est plus compliqué que déboguer une application sur un PC. Il n'est pas toujours possible de communiquer en temps réel et l'interface du robot est très limité. Il faut alors développer des stratégies permettant de contrôler ce qui se passe et de récolter de l'information.


