<div align="center">

# asdf-pkl

[![Build](https://github.com/chrisvander/asdf-pkl/actions/workflows/build.yml/badge.svg)](https://github.com/chrisvander/asdf-pkl/actions/workflows/build.yml) [![Lint](https://github.com/chrisvander/asdf-pkl/actions/workflows/lint.yml/badge.svg)](https://github.com/chrisvander/asdf-pkl/actions/workflows/lint.yml)

[pkl](https://pkl-lang.org/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Install

Plugin:

```shell
asdf plugin add pkl
# or
asdf plugin add pkl https://github.com/chrisvander/asdf-pkl.git
```

pkl:

```shell
# Show all installable versions
asdf list-all pkl

# Install specific version
asdf install pkl latest

# Set a version globally (on your ~/.tool-versions file)
asdf global pkl latest

# Now pkl commands are available
pkl --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

# License

See [LICENSE](LICENSE) © [Christian van der Loo](https://github.com/chrisvander/)
