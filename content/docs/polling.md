---
title: Programmation des systèmes réactifs
author: "Hugues Casse"
tags: système réactif, programmation, arduino, capteur, actionneur, régulation
image: docs/polling.jpg
credit: https://www.flickr.com/photos/frostbricks/
date: 2022-04-06
---

Nos systèmes embarqués sont des _systèmes réactifs_ : ils réagissent à des modifications de l'_environnement_ (obtenues à partir de _capteurs_) et, selon leur fonction/objectif (on parle de _consigne_), ils nont modifier leur _environnement_ (grâce aux _actionneurs_).

Pour gérer de tels systèmes, on peut faire appel à la théorie de la régulation :

![Boucle fermée](https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Simple_feedback_control_loop2.svg/473px-Simple_feedback_control_loop2.svg.png)

Dans ce schéma, les blocs sont :
* _C_ -- notre système réactif,
* _P_ -- notre environnement,
* _F_ -- nos capteurs.

Notre système lit son environnement _y(t)_, le compare à sa consigne _r(t)_. La différence est appelée _erreur_ _e(t)_ et selon l'erreur, il met à jour son effet sur les actionneurs _u_(t). C'est ce qu'on appelle _asservissement_ du système ou sa _régulation_.

Remarquez que toutes ces grandeurs (a) varient en fonction du temps et (b) sont potentiellement exprimées dans des unites différentes ou son multiples (plusieurs capteurs, plusieurs actionneurs).

L'effet de notre système réactif avec le temps peut être résumé par l'équation qui s'applique à chaque instant :

> u(t) = C(e(t)) = C(r(t) - y(t))

Bien sûr, en informatique, on ne peut pas faire un système qui renvoie une réponse de manière continue mais on a des microprocesseurs qui vont très vites. Cette fonction peut alors s'écrire (en C):

```C
setup();
while(1) {
	u = C(r() - y());
}
```

Le temps est implicitement supporté par les itérations de la boucle **infinie**. Bien sûr, pour que notre système ne se plante pas, il faut que le corps de cette boucle soit assez rapide.

Cette forme particulière de programme est directement supporté par l'Arduino avec son modèle de programmation :

```C
// variables globales
...

void setup() {
	...
}

void loop() {
	...
}
```

En fait, la fonction `main`de l'Arduino est la suivante :
```C
int main() {
	setup();
	while(1)
		loop();
}
```

On applique alors une programmation des entrées-sor par _scrutation_ (_polling_ en anglais) :
1. On lit les capteurs (au travers des registres d'entrée),
2. On calcule et on applique l'effet voulu sur les actionneurs (au travers des registres de sortie).

On notera l'utilisation de variables globales, qui survivent aux appels aux appels de fonction, pour maintenir l'état du système.

L'alternative à la programmation par scrutation est la programmation par _interruption_ : le système invoque automatiquement des fonctions utilisateurs quand une donnée sur un capteur est prête. Il est possible de programmer l'Arduino par _interruption_ mais c'est un peu plus compliqué.
