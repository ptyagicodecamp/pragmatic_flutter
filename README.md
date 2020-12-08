# pragmatic_flutter

# Building Web App

In root directory:

```
 flutter build web
```

Above command generates web content in `build/web` directory.

# Publishing content

## Set up Firebase Hosting

Note: You need to install firebase sdk etc.
Account: Androidbotsutdio.
Project: ittybittylearnings

```
firebase init
```

## Test

```
cd deploy/

firebase serve  #opens local website at port 5000

```

## Deploy

```
# copy files from build/web to deploy/public/ folder

cd deploy/

firebase deploy
```

## Configuration

Checkout `deploy/firebase.json` config