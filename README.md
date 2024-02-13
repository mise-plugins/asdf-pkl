<div align="center">

# asdf-pkl [![Build](https://github.com/chrisvander/asdf-pkl/actions/workflows/build.yml/badge.svg)](https://github.com/chrisvander/asdf-pkl/actions/workflows/build.yml) [![Lint](https://github.com/chrisvander/asdf-pkl/actions/workflows/lint.yml/badge.svg)](https://github.com/chrisvander/asdf-pkl/actions/workflows/lint.yml)

[pkl](https://pkl-lang.org/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

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

[Thanks goes to these contributors](https://github.com/chrisvander/asdf-pkl/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Christian van der Loo](https://github.com/chrisvander/)
