---
title: La bibliothèque RobotParts
date: 2022-04-04
tags: robot, impression 3D, openscad
draft: false
author: "Hugues Casse"
image: docs/robot-parts.jpg
credit: https://www.flickr.com/photos/101032075@N07/
---

Cette petite [bibliothèque](https://github.com/tcarle/RobotParts/tree/exp) de pièces pour robot est développé à
l'Université Paul Sabatier. Elle a déjà permis la mise en oeuvre de
plusieurs petits robot **suiveurs de ligne** mais nous espérons qu'elle
servira pour d'autres créations.

Elle intégre:
* Des pièces génériques et configurables dont les dimensions sont
  compatibles avec la série MakeBlock.
* Des modèles 3D d'accessoires (actionneurs, capteurs, etc) courants
  dans la réalisation de ce genre de robots.
* Des recettes de robots à monter soi-même (bientôt).

La bibliothèque se présente sous forme d'une archive Git récupérable
par la commande:

```bash
$ git clone git@github.com:tcarle/RobotParts.git -b exp
```

Le répertoire `extern` contient les modèles 3D pour intégration alors
ques les pièces qui nous intéressent se trouvent dans les autres
répertoires. Les pièces sont décrites dans le langage d'[OpenSCAD](https://openscad.org/)
qui est une application de conception 3D basée sur des scripts. Cela
permet de définir des pièces de manière algorithmique et surtout
de les paramétriser.


Chaque pièce _XXX_ est représentée par 3 fichiers :
* _XXX_.png -- image de la pièce (pour aider au choix des pièces).
* _XXX_.md -- fichier de description de la pièce et de ses paramètres.
* _XXX_.scad -- le modèle de la pièce en [OpenSCAD](https://openscad.org/).

Le moyen le plus simple de générer une pièce (nommée ci-après _XXX_ in directory _DIR_)
est de créer, dans le répertoire `RobotParts`, un fichier `test.scad`
et de taper le code suivant:

```openscad
import <DIR/XXX.scad>

XXX(PARAMS);
```

Avec _PARAMS_ une séquence de paramètres séparés par des virgules de la forme _IDENTIFIANT_=_VALEUR_. La liste des paramètres est disponible dans les fichiers `.md`.

Une fois ouvert dans [OpenSCAD](https://openscad.org/), ce modèle peut être généré en _XXX_.stl qui est format de modèle 3D accepté à peu près partout :
* pour l'intégration 3D de votre robot,
* pour l'impression 3D.
