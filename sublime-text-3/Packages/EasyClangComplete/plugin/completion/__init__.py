"""Completer part of the plugin.

base_complete: abstract class for completions

bin_complete: sibling of `base_complete` that handles completions using clang
binary.

lib_complete: sibling of `base_complete` that handles completions using libclang
and its python bindings
"""
__all__ = ("base_complete", "bin_complete", "lib_complete")
