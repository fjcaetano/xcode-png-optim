🏞  xcode-png-optim ![homebrew][1] [![PRs welcome][2]](https://github.com/fjcaetano/xcode-png-optim/pulls)
---

Scans an Xcode target for PNGs and converts all to optimized JPEGs. If an image's directory contains a `Contents.json` file, `xcode-png-optim` understands it's within an `Assets.xcassets` catalog and will update the JSON file accordingly.

By default, `xcode-png-optim` will convert only non-transparent PNGs. If you need to tweak the tolerance level for the alpha channel of each image, use the `--alpha-tolerance` argument. The tolerance must be a value between zero and one, where 0 is no tolerance (e.g. if an image has any transparency at all, it will be ignored) and 1 is full tolerance (e.g. all PNGs will be converted, regardless of transparency levels).

## Installation 

Assuming that you have [Homebrew](https://brew.sh/) installed, execute the following steps:

1. Use this repository as a "tap" (alternative package repository):

```sh
$ brew tap fjcaetano/xcode-png-optim
```

2. Install xcode-png-optim (and dependencies):

```sh
$ brew install xcode-png-optim
```

### Automatically converting using a build script (optional)

If you want Xcode to automatically convert PNGs added to assets catalogs, add the following Build Script to the desired target **before the `Copy Bundle Resources`** phase.

```sh
if which xcode-png-optim >/dev/null; then
  xcode-png-optim "$SOURCE_ROOT/$TARGET_NAME"
else
  echo "error: xcode-png-optim not installed, download from https://github.com/fjcaetano/xcode-png-optim"
  exit 1
fi
```
> Notice that the script above will fail the build process if `xcode-png-optim` is not installed. If that's not desirable, remove the `exit 1` line and change the message from `error: ...` to `warning: ...`

## Usage

```sh
$ xcode-png-optim [options] {dir_name}
```

| Options                  | Description                       | Default value |
| ------------------------ | --------------------------------- | :-----------: |
| -t, --alpha-tolerance    | The tolerance allowed for the alpha channel. Value must be 0...1 | `0` |
| -x, --no-xcode-log       | Do not format output for Xcode. When this is set, the output will include ANSI colors | N/A |
| -c, --no-update-contents | Do not update Content.json files  |      N/A      |
| -i, --ignore-cache       | Ignores the cached files          |      N/A      |
| -h, --help               | Prints helper message             |      N/A      |
| -v, --version            | Prints current version            |      N/A      |

If no `dir_name` is given, the optimization will use the current directory.

[1]: https://img.shields.io/github/tag/fjcaetano/xcode-png-optim?color=orange&label=homebrew
[2]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg