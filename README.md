# Pranic Healing Sanctuary 🪷

A Flutter meditation app for guided meditations, mantras and chants by Master Choa Kok Sui. Built from Figma designs, Android only.

## Screenshots

| Splash | Onboarding | Onboarding | Login |
| :---: | :---: | :---: | :---: |
| <img src="screenshots/02_splash.jpg" width="200"> | <img src="screenshots/03_onboarding_1.jpg" width="200"> | <img src="screenshots/04_onboarding_2.jpg" width="200"> | <img src="screenshots/05_login.jpg" width="200"> |

| Sign Up | Complete Profile | Home | My Albums |
| :---: | :---: | :---: | :---: |
| <img src="screenshots/06_signup.jpg" width="200"> | <img src="screenshots/07_complete_profile.jpg" width="200"> | <img src="screenshots/08_home.jpg" width="200"> | <img src="screenshots/09_albums.jpg" width="200"> |

| Playlists | Profile | Settings | Logout |
| :---: | :---: | :---: | :---: |
| <img src="screenshots/10_playlists.jpg" width="200"> | <img src="screenshots/11_profile.jpg" width="200"> | <img src="screenshots/12_settings.jpg" width="200"> | <img src="screenshots/13_logout.jpg" width="200"> |

## Features

- Splash screen and two-step onboarding
- Email login and a two-step sign-up with profile setup
- Home with daily wisdom, a featured album, popular meditations and a mini player
- My Albums, Playlists and Profile tabs
- Settings with edit profile, logout and delete account

## Tech Stack

Flutter · Riverpod · Firebase Auth · Cloud Firestore · flutter_svg · google_fonts · image_picker · country_picker

## Project Structure

```
lib/
├── core/        # theme, shared widgets
└── features/    # splash, home, albums, playlists, profile, settings, player, shell
```

## Run Locally

```bash
git clone https://github.com/mukunda03/meditation_app.git
cd meditation_app
flutter pub get
flutter run
```

You'll need your own Firebase project. Add `google-services.json` to `android/app/`, then enable Email/Password Auth and Firestore.



## Author

**Mukunda** · [GitHub](https://github.com/mukunda03) · [LinkedIn](https://linkedin.com/in/mukundasv03)

