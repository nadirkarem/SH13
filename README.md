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

Ajoute juste sous **“## Exécution”** le bloc suivant pour donner un exemple concret :

```markdown
### Exemple d’exécution

**Terminal 1 : serveur**  
```bash
./server 1234
```

**Terminal 2 : client – Talla**  
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
```

Ça montre exactement les commandes à taper dans chaque terminal.
```

## Utilisation rapide

1. Clique **Connect** en haut à gauche.  
2. Pose tes questions (sélectionne un objet ou un suspect, puis **GO**).  
3. Accuse un joueur (sélectionne un nom, puis **GO**).

## Nettoyage

```
make clean
```
