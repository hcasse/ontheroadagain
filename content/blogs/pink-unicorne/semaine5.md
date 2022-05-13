---
title: Semaine 5 de Pink-Unicorne
author: "pink-unicorne"
draft: false
image: blogs/pink-unicorne/robot.png
date: 2022-05-13
---

Nous avons changé le principe du PID que nous utilisons. Avant, nous regardions chaque capteur.
Maintenant nous récupérons la valeur de la position du robot directement via la bibliotèque : 
```C
uint16_t position1 = treeway.readLineBlack(sensorValues);
```
Cela nous permet d'avoir une seule valeur pour l'erreur
```C
int error = 3500 - position1;
```
Position1 variant de 0 à 7000 pour les 8 capteurs, 3500 represente le milieu.

Ensuite nous faisons un calcul classique de PID :
```C
  P = error;
  I = I + error;
  D = error - lastError;
  lastError = error; 
  int motorspeed = P*Kp + I*Ki + D*Kd;
```
puis motorspeed est ajouter à la vitesse initiale voulu pour les moteurs : 
```C
  int motorspeeda = VITESSEINIT + motorspeed;
  int motorspeedb = VITESSEINIT - motorspeed;
```
La valeur de motorspeed pouvant être positive ou négative faire un + / - nous permet de reguler la valeur des moteurs par rapport à la vitesse initiale voulu.


Ensuite nous bornons les deux motorspeed en haut et en bas si besoin : 
```C
  if (motorspeeda > VITESSEMAX) {
    motorspeeda = VITESSEMAX;
  }
  if (motorspeedb > VITESSEMAX) {
    motorspeedb = VITESSEMAX;
  }
  if (motorspeeda < VITESSEMINI) {
    motorspeeda = VITESSEMINI;
  }
  if (motorspeedb < VITESSEMINI) {
    motorspeedb = VITESSEMINI;
  }
```
Nous avons une fonction "forward_brake" qui permet de controler les moteurs
```C
void forward_brake(int vdroite, int vgauche) {
  digitalWrite(M1, HIGH);
  digitalWrite(M2, HIGH);
  analogWrite(droite, vdroite);
  analogWrite(gauche, vgauche);
}
```
Notre fonction de calibrage reste inchangé

Notre loop() est de 100Hz : 
```C
void loop() {
  float t = millis();
  PID_control();
  float del = (millis()-t);
  delay(10-del);
}
```
Si nous baissons trop la fréquence, nous observons une baisse des performences, le robot devient "impulsif" et la correction est forcement moins fluide

