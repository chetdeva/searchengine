# searchengine

Search any query from Google custom search API. The app is built using BLoC pattern.

<img src="./README_images/search_engine_screen.gif" width="300" height="534"/>

Screenshot for Search Engine

## Installation

- Get the `api_key` and `search_engine_id` from Google [custom-search](https://developers.google.com/custom-search/v1/overview).
- Create `secrets.json` file in the `assets/properties` folder.
- Add `api_key` and `search_engine_id` to `secrets.json` file like such:

```json
{
  "api_key": "YOUR_API_KEY",
  "search_engine_id": "YOUR_SEARCH_ENGINE_ID"
}
```

## Design Patterns

- Dependency Injection
- Reactive Programming
- BLoC Pattern
- In Memory Caching

## Packages

- cupertino_icons
- http
- flutter_webview_plugin
- rxdart

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## License

```
MIT License

Copyright (c) 2019 Chetan Sachdeva

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
