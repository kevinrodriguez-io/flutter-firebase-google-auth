# gauth_app: English guide

Example app with Google Auth

## App generation

This app was generated with the following command:
`flutter create --org io.kevinrodriguez -i swift -a kotlin --description "Example app with Google Auth" gauth_app`

## App configuration

- Modify `ios/Runner/GoogleService-Info.plist` and drop your own Firebase generated `GoogleService-Info.plist`
- Modify `ios/Runner/Info.plist` and replace `USE REVERSE ID HERE` with your own reverse id taken from `GoogleService-Info.plist`
- Modify `android/app/google-services.json` and supply your own `google-services.json` file generated on Firebase
- On Firebase console, DON'T forget to supply your own `SHA-1` fingerprint for your android app, otherwise google auth won't work. The following command should work on macOS:
  - `keytool -exportcert -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore`
  - Please note this is a DEBUG key SHA-1, you must provide your production SHA-1 too in order to Google Auth to work in production.

## Android Multidex Known Issues

If, for some reason you are trying to implement this from scratch and you're having issues with some weird numbers on your buld related to `dex`, please do the following:

- Open `android/app/build.gradle` and add the following line: `multiDexEnabled true` under defaultConfig

## AndroidX Issues

If, for some reason you are trying to implement this from scratch and you're having issues with AndroidX, please do the following:

- Open `android/app/build.gradle` and change both `targetSdkVersion` and `compileSdkVersion` to version 28
- In **Android Studio** open `android/gradle.properties` and add the following lines, then save and wait for gradle to do it's job:
  - `android.useAndroidX=true`
  - `android.enableJetifier=true`

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

----------

# gauth_app: Guía en español

Aplicación de ejemplo con google auth

## Generar el App
Esta aplicación fue generada con el siguiente comando:
`flutter create --org io.kevinrodriguez -i swift -a kotlin --description "Example app with Google Auth" gauth_app`
También sirve clonar este repositorio y cambiar los archivos de firebase y el identificador de app.

## Configuración del app
- Modifique `ios/Runner/GoogleService-Info.plist` y utilice su archivo `GoogleService-Info.plist` generado desde Firebase
- Modifique `ios/Runner/Info.plist` y reemplace `USE REVERSE ID HERE` con su revese id obtenido de `GoogleService-Info.plist`
- Modifique `android/app/google-services.json` y utilice su `google-services.json` generado en Firebase
- En la consola de Firebase, No olvide proveer su propia huella `SHA-1` para su aplicación de Android, de otro modo Google Auth no va a funcionar. El siguiente comando funciona en macOS:
  - `keytool -exportcert -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore`
  - Porfavor notese que esta es una llave de DEBUG SHA-1, al lanzar a producción deve proveer su propia llave SHA-1 de producción para que Google Auth funcione en ambos ambientes.

## Problemas conocidos con Android MultiDex

Si por alguna razón estas tratando de implementar este app desde cero y tienes problemas con algunos "números extraños" a la hora de hacer build relacionados a `dex`, por favor haga lo siguiente:
- Abra `android/app/build.gradle` y añada la siguiente linea: `multiDexEnabled true` bajo defaultConfig

## Problemas con AndroidX

Si por alguna razón estas tratando de implementar este app desde cero y tienes probllemas con AndroidX, por favor haga lo siguiente:
- Abra `android/app/build.gradle` y cambie tanto `targetSdkVersion` como `compileSdkVersion` a la versión `28`
- En **Android Studio** abra `android/gradle.properties` y agregue las siguientes lineas, despues guarde y espere a que gradle complete el proceso.
  - `android.useAndroidX=true`
  - `android.enableJetifier=true`