
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'mdbook' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'mdbook'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'mdbook' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Creates the boilerplate structure and files for a new book')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Builds a book from its markdown files')
            [CompletionResult]::new('test', 'test', [CompletionResultType]::ParameterValue, 'Tests that a book''s Rust code samples compile')
            [CompletionResult]::new('clean', 'clean', [CompletionResultType]::ParameterValue, 'Deletes a built book')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate shell completions for your shell to stdout')
            [CompletionResult]::new('watch', 'watch', [CompletionResultType]::ParameterValue, 'Watches a book''s files and rebuilds it on changes')
            [CompletionResult]::new('serve', 'serve', [CompletionResultType]::ParameterValue, 'Serves a book at http://localhost:3000, and rebuilds it on changes')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'mdbook;init' {
            [CompletionResult]::new('--title', 'title', [CompletionResultType]::ParameterName, 'Sets the book title')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'Creates a VCS ignore file (i.e. .gitignore)')
            [CompletionResult]::new('--theme', 'theme', [CompletionResultType]::ParameterName, 'Copies the default theme into your source folder')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Skips confirmation prompts')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'mdbook;build' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('--dest-dir', 'dest-dir', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Opens the compiled book in a web browser')
            [CompletionResult]::new('--open', 'open', [CompletionResultType]::ParameterName, 'Opens the compiled book in a web browser')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'mdbook;test' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('--dest-dir', 'dest-dir', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'A comma-separated list of directories to add to {n}the crate search path when building tests')
            [CompletionResult]::new('--library-path', 'library-path', [CompletionResultType]::ParameterName, 'A comma-separated list of directories to add to {n}the crate search path when building tests')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'mdbook;clean' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}Running this command deletes this directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('--dest-dir', 'dest-dir', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}Running this command deletes this directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'mdbook;completions' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'mdbook;watch' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('--dest-dir', 'dest-dir', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Open the compiled book in a web browser')
            [CompletionResult]::new('--open', 'open', [CompletionResultType]::ParameterName, 'Open the compiled book in a web browser')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'mdbook;serve' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('--dest-dir', 'dest-dir', [CompletionResultType]::ParameterName, 'Output directory for the book{n}Relative paths are interpreted relative to the book''s root directory.{n}If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Hostname to listen on for HTTP connections')
            [CompletionResult]::new('--hostname', 'hostname', [CompletionResultType]::ParameterName, 'Hostname to listen on for HTTP connections')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Port to use for HTTP connections')
            [CompletionResult]::new('--port', 'port', [CompletionResultType]::ParameterName, 'Port to use for HTTP connections')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Opens the book server in a web browser')
            [CompletionResult]::new('--open', 'open', [CompletionResultType]::ParameterName, 'Opens the book server in a web browser')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'mdbook;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
