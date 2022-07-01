# quickest sinfo function to write


return (
    $args.ForEach({
            scoop info $_
        })
)




