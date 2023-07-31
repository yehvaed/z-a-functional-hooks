# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Copyright (c) 2021 Z-Shell Community
#
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"


# https://wiki.zshell.dev/community/zsh_plugin_standard/#funtions-directory
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

typeset -gA Plugins
Plugins[FUNCTIONAL_HOOKS_DIR]="${0:h}"
Plugins[FUNCTIONAL_HOOKS_HOOKS]="atclone atpull atinit atload"

# # Autoload functions
autoload -Uz →za-functional-hooks-before-load-handler

# An empty stub to fill the handler fields
→za-functional-hooks-null-handler() { :; }

# The meta-plugins-support hook.
@zi-register-annex "z-a-functional-hooks" hook:before-load-200 \
  →za-functional-hooks-before-load-handler \
  →za-functional-hooks-null-handler 
