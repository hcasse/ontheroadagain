---
title: Rampe de capteurs IR
author: "Hugues Casse"
tags: capteur, IR
draft: false
date: 2018-11-26 14:57
image: /docs/IRS.jpg
---

Le capteur utilisé dans le projet est un rampe de 3 capteurs Infra-Rouge (IR) QTR-3C de Polulu.

La documentation officielle est [ici](https://www.pololu.com/product/2457).

Bien que je conseille la lecture de ces documents, je vais faire ici un résumé.

Le capteur est composé de 3 couples (LED IR émettrice, photo-transistor) : la LED émet un rayon IR qui est, après réflection, reçu par le photo-transistor. Le temps entre l'émission et la réception du singal est proportionnel à la réflexivité du support : plus c'est court, plus le support est réflexif (blanc); plus c'est long (voire aucun relfet), plus le support est peu réflexif (noir).

Le schéma ci-dessous montre le câblage du capteur :

![Circuit de capteur IR](/docs/circuitIR.png)

Une fois l'alimentation et la masse connectée, chaque sortie OUTi est reliée à un couple (LED IR, photo-transistor). Ces lignes sont bidirectionnelles et le protocole suivant doit être appliqué pour réaliser une mesure :

1. positionner en sortie OUTi
2. écrire un 1 (émission du rayon IR)
3. attendre 10 us (micro-secondes)
4. positionner en entrée OUTi
5. écrire 0 sur OUTi (utilisation de la résistance pull-up)
6. enregistrer la date courante t
7. attendre que OUTi passe à 0
8. enregistrer la date courante t'

La réflectivité du support est inversement proportionnelle à t' - t. Il faut noter qu'un support très noir n'a aucun réflexité et qu'il faut dans ce cas prévoir un timeout. Par expérience, des timeout de 1ms sont suffisants.

Les caractéristiques géométriques du capteur pourront aussi vous être utiles (Attention ! L'unité utilisée est le pouce " -- inch) :

![Dimensions du capteur IR](/docs/tailleIR.jpg)

Ces données pourront également vous êtres utiles :

* voltage opérationnel : 5.0 V
* courant à fournir : 50 mA
* distance optimale du capteur : 0.125" (3 mm)
* distance maximale du capteur : 0.25" (6 mm)
* poids sans les broches : 0.02 oz (0.6 g)
