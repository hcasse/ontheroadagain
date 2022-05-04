---
title: Utilisation d'automate
author: "Hugues Casse"
tags: automate, contrôle
draft: false
date: 2022-05-03
image: docs/automate.jpg
credit: https://www.flickr.com/photos/klong35/
---

Les programmes embarquées peuvent avoir un comportement qui varie en fonction du temps et de la situation. Cela se traduit, d'un point de vue programmation, par un grand nombre de variables globales et des conditions de plus en plus complexes. On parle parfois également de _modes_ : mode normal, mode arrêt, mode dégradé, mode erreur, etc.

La formalisation de ces concepts est appelé en informatique **automate**.
Un automate identifie un certain nombre d'états (ou mode) et un ensemble de transition entre les états déclenchés par des signaux. Le comportement de l'automate est le suivant :
* L'état courant est tout d'abord initial de l'automate.
* Tant qu'aucun signal n'est émis, l'état ne change pas.
* Dès qu'un signal est émis, l'état est changé selon le signal et une action est déclenchée à ce moment là.

> **Attention** Un état est très différent d'une action : il représente une situation qui dure. Les actions sont accrochées sur les transitions d'automate.

Par exemple, pour notre robot, les états pourraient être :
* Attente (initial)
* En marche (suivi de ligne)
* Perdu (plus de ligne et mise en place de stratégie pour retrouver la ligne).

Les signaux pourraient être :
* Appui sur un bouton.
* Fin d'une période de temps.
* Les 3 capteurs affichent blanc.

A ce moment-là, une représentation classique des automates est la forme d'un graphe :
![Automate de robot](../automate-xpl.png)

L'intérêt d'utiliser des automates est multiple :
1. Il permet d'avoir une vision globale du fonctionnement de l'application. Le comportement n'est plus perdu dans un entrelacs de conditions complexes.
2. Il permet de recenser précisément quels sont les signaux qui influent sur l'application.
3. Lors du débogage, l'identification de l'état permet d'aider à comprendre ce qui se passe.
4. Les automates sont très faciles à programmer en C et permette d'avoir une structure de l'application plus simple à comprendre.

Par exemple, l'automate de notre exemple peut se programmer de la manière suivante :
```C
enum {
	EN_ATTENTE,
	EN_MARCHE,
	PERDU
} etat = EN_ATTENTE;

void loop() {
	switch(etat) {
	case EN_ATTENTE:
		if(boutonONOFF()) {
			etat = EN_MARCHE;
			demarrerMoteur();
		}
		break;
	case EN_MARCHE:
		gererDirection();
		if(boutonONOFF()) {
			etat = EN_ATTENTE;
			arreterMoteur();
		}
		else if(toutBlanc() && t > 500)
			etat = PERDU;
		break;
	case PERDU:
		chercher();
		if(boutonONOFF()) {
			etat = EN_ATTENTE;
			arreterMoteur();
		}
		else if(!toutBlanc())
			etat = EN_MARCHE;
		break;
	}
}
```

Bien sûr, ceci n'est qu'un exemple et vous utiliserez probablement vos propres automates. Il faut noter qu'une application peut contenir plusieurs automates gérant différents aspects ou qu'un automate peut être le sous-automate d'un autre automate (actif seulement durant un ou plusieurs états de l'automate parent).

> La notion d'automate se retrouver dans plusieurs autres formalismes comme [GraphCET](https://fr.wikipedia.org/wiki/Grafcet) ou les [diagrammes état-transition](https://fr.wikipedia.org/wiki/Diagramme_%C3%A9tats-transitions) de [UML](https://fr.wikipedia.org/wiki/UML_(informatique))/[SysML](https://fr.wikipedia.org/wiki/Systems_Modeling_Language) (entre autres).

> Enfin, on notera que les automates sont des [objets mathématiques](https://fr.wikipedia.org/wiki/Automate_fini_d%C3%A9terministe) qui ont donné lieu à de nombreux développements.
