# TravelGPT

This is a travel assistant based on GPT-3. Visit the [web version](https://simon-wong-hjz.github.io/travel_gpt/) or download the Android app in [release](https://github.com/Simon-Wong-hjz/travel_gpt/releases).

## Project Structure

The project is divided into 3 modules: `backend`, `mobileapp` and `webapp`. All modules are managed with Gradle.

### backend

It is a Restful API server based on Spring WebFlux deployed with Azure WebApps.

Requirements:
- Java 17
- Gradle 8.2.1
- Azure CLI (Optional)

#### Build

``` gradle build ```

#### Run Locally

Run the main method in `com/centific/travelgpt/backend/TravelGpt.java` with IDEA is recommended.

#### Deploy to Azure

Merge a PR to the `backend_release` branch to trigger the `Build and deploy JAR app to Azure Web App - TravelGPT` GitHub Action to deploy the backend to Azure WebApps.

### mobileapp

It is an Android app developed with Flutter.

Requirements:
- Flutter 3.13.7 (with Dart)
- Gradle 7.5 or above
- Android SDK (if you want to build locally)

#### Build

```
# in mobileapp/
flutter build apk --split-per-abi --no-shrink
```

You can find the apk in `mobileapp/build/app/outputs/`.

#### Release

Merge a PR to the `mobileapp_release` branch with a tag `v*` to trigger the `Build and Publish APK` GitHub Action to release the Android app to GitHub Release.

### webapp

It is a web app developed with React.

Requirements:
- Node 18.15.0
- Npm 9.5.0
- Gradle 8.2.1

#### Build

``` gradle npm_build ```

#### Run Locally

``` gradle npm_start ```

#### Deploy to GitHub Pages

Merge a PR to the `webapp_release` branch to trigger the `Build and Publish WebApp` GitHub Action to deploy the webapp to GitHub Pages.