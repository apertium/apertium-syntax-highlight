# Finite-State Morphology and Constraint Grammar syntax highlighting plugins
vim: lexc, twolc, xfst, vislcg3 (both rules and stream formats)

These plugins are based on the following repositories with some refactoring and additions:
[dotfiles](https://github.com/jonorthwash/dotfiles) and [vim-finitestatemorphology](https://github.com/apertium/vim-finitestatemorphology)

This repository contains rudimentary syntax files for colourful higlighting of
things and stuff in vim for some legacy file formats used in natural language
morphologies. The lexc and twolc file formats follow the implememtations and
grammars used in [HFST](https://hfst.github.io). The CG format tries to
match the features of VISL CG 3 version of constraint grammar.

## Installation

<!--
### Vundle

If you use Vundle, and I strongly recommend you do, just add the line:

```
Plugin 'flammie/vim-finitestatemorphology'
```

in the Vundle section. 
-->

### Manual

Copy the subdirs here in the `~/.vim/`.
