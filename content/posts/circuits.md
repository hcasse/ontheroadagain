---
title: Conception des circuits
author: "Hugues Casse"
draft: false
image: posts/circuits.jpg
credit: https://lemagsportauto.ouest-france.fr/formule-1-vers-come-back-grand-prix-portugal/24161/
date: 2022-05-09
---

Voila, j'ai déterminé quels seront les circuits de la compétition.

Je suis disparu de l'hypothèse que nos nappes ont une taille de 1,20m x 2,40m (mais je peux me tromper) et je les ai découpé en carrés de 30x30cm (ce sera plus facile pour tracer). Cela donne le modèle suivant :

![modèle](../modele.png)

L'idée est d'avoir des formes simples pour chacun des carrés.

# Concours de vitesse

Pour le circuit de vitesse, cela donne :

![circuit de vitesse](../vitesse.png)

La barre vertical indique le point de départ et d'arrivée. Les roues motrices du robot doivent se placer sur la barre ou avant la barre.

> Le temps sera mesure entre le démarrage du robot et la traversée de la barre par les roues motrices.

Je n'ai pas sélectionné un circuit simplement elliptique car le suivi est un élément important même quand on teste la vitesse. Le robot doit pouvoir alterner ses vitesse en fonction de la complexité du circuit.


# Concours de robustesse

Le circuit ci-dessous est destiné au concours de robustesse (désolé pour la forme des vagues) :

![circuit de robustesse](../robustesse.png)

Le point de départ est la barre horizontale à gauche et le point d'arrivé est la barre verticale à gauche.

J'ai essayé de classer les différentes figures du circuit par order de difficulté.

> Le gagnant sera celui qui arrivera le plus loin dans le circuit ou jusqu'au bout (en un minimum de temps).


Les étapes sont les suivantes :
* ligne droite
* tournant
* parcours crénelé
* ligne à 45°
* courbes en vaguelette
* angles de 30°
* courbe croisée
* pointillets de plus en plus espacés

