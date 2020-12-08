cd ../
flutter build web
rm -rf deploy/public/web
mv build/web deploy/public/
cd deploy
firebase deploy
