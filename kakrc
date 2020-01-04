colorscheme solarized-dark-termcolors

# Source: https://github.com/mawww/kakoune/wiki/Line-flags
add-highlighter global/ number-lines

# Source: https://github.com/mawww/kakoune/wiki/Avoid-the-escape-key
hook global InsertChar k %{ try %{
  exec -draft hH <a-k>jk<ret> d
  exec <esc>
}}

# Source: https://github.com/mawww/kakoune/wiki/Indentation-and-Tabulation#use-tab-for-both-indenting-and-completion
hook global InsertCompletionShow .* %{
    try %{
        # this command temporarily removes cursors preceded by whitespace;
        # if there are no cursors left, it raises an error, does not
        # continue to execute the mapping commands, and the error is eaten
        # by the `try` command so no warning appears.
        execute-keys -draft 'h<a-K>\h<ret>'
        map window insert <tab> <c-n>
        map window insert <s-tab> <c-p>
    }
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}
