# faforever
Gentoo overlay for Forged Alliance Forever.

## Adding overlay
`layman -f -o https://raw.githubusercontent.com/Wesmania/faforever/master/overlay.xml -a faforever`

## Installation
`emerge faforever-client`

## Running

`faforever-client`

## Notes
- The overlay is working and sane, but I can't guarantee stability. It shouldn't, but possibly might break your Gentoo.
- faforever-client-9999 is hardmasked and nonfunctional yet. A couple parts are missing and some patches might be accepted upstream.
- Configuration of wine prefix and command prefix is not yet in the GUI. You will have to figure out setting them up on your own.
- I'd love to hear about any bugs you find, even more so pull requests.
