# Gravedecay Homebrew tap

Install the macOS companion:

```sh
brew install projectmushroom/gravedecay/gravedecay-companion
gravedecay-mac install
```

For T3 Code and the web terminal, install the optional dependencies and opt
into the agents layer:

```sh
brew install projectmushroom/gravedecay/gravedecay-companion --with-node --with-tmux --with-ttyd
gravedecay-mac install --agents
```

Update with `brew upgrade projectmushroom/gravedecay/gravedecay-companion`,
then rerun `gravedecay-mac install`. To remove it, run
`gravedecay-mac uninstall` before `brew uninstall
projectmushroom/gravedecay/gravedecay-companion`; the former keeps Application
Support data unless you explicitly pass `--purge`.

The unsigned native macOS DMG is documented upstream at
[clients/apple](https://github.com/projectmushroom/gravedecay/tree/master/clients/apple).
See the upstream [macOS guide](https://github.com/projectmushroom/gravedecay/blob/master/docs/MACOS.md)
for details. Gravedecay is MIT-licensed; see the upstream
[LICENSE](https://github.com/projectmushroom/gravedecay/blob/master/LICENSE).
