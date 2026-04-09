# www

Opens a URL in a browser.

If `$BROWSER` is set, delegates to it. Otherwise, scans `$XDG_DATA_DIRS` for installed web browsers and prompts the user to pick one via `dmenu`.

## Usage

```sh
www https://example.com
```

## Dependencies

`bash`, `coreutils`, `findutils`, `grep`, `dmenu`
