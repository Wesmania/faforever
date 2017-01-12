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
- You can find details on how to configure Wine and SCFA with FAF on http://wiki.faforever.com/index.php?title=Setting_Up_FAF_Linux.
- I'd love to hear about any bugs you find, even more so pull requests.
