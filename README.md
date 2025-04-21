# OS_USER

## Arborescence du dépôt

```
OS_USER/
    src/
        server.c       # serveur TCP
        sh13.c         # client SDL2
    assets/            # images .png et police .ttf
    Makefile           # compile server + client
    README.md          # ce fichier
```
## Prérequis

- GCC (ou tout compilateur C compatible)
- SDL2, SDL2_image, SDL2_ttf
    - macOS : `brew install sdl2 sdl2_image sdl2_ttf`
    - Debian/Ubuntu : `sudo apt install libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev`
- `sdl2-config` dans le PATH
- `pthread` (intégré à la plupart des distributions)

## Compilation

À la racine du projet (`OS_USER_2/`), exécute :

```
make
```

Deux exécutables seront créés :
- `server`
- `client`

## Exécution

1. **Serveur** (à la racine) :
   ```
   ./server 1234
   ```

2. **Client** (pour chaque joueur, depuis `assets/`) :
   ```
   cd assets
   ../client <IP_SERVEUR> 1234 <IP_CLIENT> <PORT_CLIENT> <TonNom>
   ```

### Exemple d’exécution

**Terminal 1 : serveur**  
```bash
./server 1234
```

**Terminal 2 : client – Farah**  
```bash
cd assets
../client 127.0.0.1 1234 127.0.0.1 1235 Talla
```

**Terminal 3 : client – Fayçal**  
```bash
cd assets
../client 127.0.0.1 1234 127.0.0.1 1236 Fayçal
```

**Terminal 4 : client – Ilyes**  
```bash
cd assets
../client 127.0.0.1 1234 127.0.0.1 1237 Ilyes
```

**Terminal 5 : client – Nadir**  
```bash
cd assets
../client 127.0.0.1 1234 127.0.0.1 1238 Nadir
```

## Utilisation rapide

1. Clique **Connect** en haut à gauche.  
2. Pose tes questions (sélectionne un objet ou un suspect, puis **GO**).  
3. Accuse un joueur (sélectionne un nom, puis **GO**).

## Poser des questions et accuser

### 1) Poser une question globale (O) – “Qui a cet objet ?”

1. Cliquez sur l’icône de l’objet dans la **ligne du haut**.  
2. L’objet est surligné pour indiquer votre choix.  
3. Cliquez sur **GO**.  
4. Le serveur renvoie un message `V <id_joueur> <id_objet> <valeur>` pour chaque joueur :
   - `<valeur> = 100` si le joueur possède au moins une carte avec cet objet, sinon `0`.

### 2) Poser une question ciblée (S) – “Combien de cartes cet objet chez ce joueur ?”

1. Cliquez sur l’icône de l’objet dans la **ligne du haut**.  
2. Cliquez sur le nom du joueur dans la **liste en bas à gauche** pour le sélectionner.  
3. Cliquez sur **GO**.  
4. Le serveur renvoie un message `V <id_joueur> <id_objet> <nombre>` :
   - `<nombre>` = nombre exact de cartes de cet objet chez le joueur ciblé.

### 3) Accuser un suspect (G) – “C’est lui le coupable !”

1. Cliquez sur le nom du suspect dans la **liste en bas à gauche** (sans cliquer sur la croix).  
2. Cliquez sur **GO**.  
3. Le serveur reçoit `G <votre_id> <id_suspect>` et affiche :
   - “tu as faux” si vous vous trompez  
   - “<Nom> a gagne” si vous trouvez le coupable  

> **Astuce** : votre bouton **GO** n’est actif que lorsqu’il est **votre tour** (votre ligne est surlignée).

## Nettoyage

```
make clean
```
