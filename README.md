<h1 align="center">Fade Auto Complet</h1>

<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
  <a href="">
    <img src="https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal"
      alt="Donate" />
  </a>
</p><br>


# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  fade_auto_complet: ^0.0.1
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'LINK EDIT';
```

# Usage

`FadeAutoComplete`:

```dart
FadeAutoComplete(
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'List Preenchida',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keys: [
                  'teste',
                  'teste teste',
                  'Teste agua',
                  'Teste super',
                  'teste almeida',
                  'experiente',
                  'experiente fluxo',
                  'Porto',
                  'Porto pedra',
                  'Porto Pedra',
                  'Porto Pedra Pereira Agua',
                  'Preenchimento automatico de texto com fade como principal função'
                ],
              ),
```

`FadeAutoComplete`:

```dart
FadeAutoCompleteFuture(
                controller: myFutureController,
                decoration: InputDecoration(
                  hintText: 'List Future',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                getKeys: getKeys,
              ),

              ----------

Future<List<String>> getKeys() async {
    return await Future.delayed(Duration(seconds: 3), () {
      return [
        'teste',
        'teste teste',
        'Teste agua',
        'Teste super',
        'teste almeida',
        'experiente',
        'experiente fluxo',
        'Porto',
        'Porto pedra',
        'Porto Pedra',
        'Porto Pedra Pereira Agua',
        'Preenchimento automatico de texto com fade como principal função'
      ];
    });
  }
```

# Bugs or Requests

If you encounter any problems feel free to open an [issue](NEEDLINK). If you feel the library is missing a feature, please raise a [ticket](NEEDLINK) on GitHub and I'll look into it. Pull request are also welcome.

# Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/DevLSerrano"><img src="https://avatars.githubusercontent.com/u/62712813?v=4" width="100px;" alt=""/><br /><sub><b>Leonardo Serrano</b></sub></a><br /><a href="" title="Creator">🐛</a></td>
     <td align="center"><a href="https://github.com/brasizza"><img src="https://avatars.githubusercontent.com/u/26041910?v=4" width="100px;" alt=""/><br /><sub><b>Marcus Brasizza</b></sub></a><br /><a href="" title="Contributor">🐛</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
 
