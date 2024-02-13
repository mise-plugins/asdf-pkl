# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test pkl https://github.com/chrisvander/asdf-pkl.git "pkl --help"
```

Tests are automatically run in GitHub Actions on push and PR.
