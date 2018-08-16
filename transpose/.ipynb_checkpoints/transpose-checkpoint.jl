function transpose_strings(input::AbstractArray)
    
    #return empty if input is empty
    if isempty(input)
        return []
    end
    
    # pad the rows so that they can be zipped more easily.
    maxLength = maximum(length(s) for s in input)
    paddedInput = [col * (" " ^ (maxLength - length(col))) for col in input]
    processedOutput = [join(col) for col in zip(paddedInput...)]
    
    numberRows = length(processedOutput)
    
    # read through the new rows in reverse order (bottom to top)
    # if a given row can lose white spaces in the right, lose them
    # otherwise stop looking for whitespace to strip.
    for (i, row) in enumerate(reverse(processedOutput))
        println(row)
        processedRow = rstrip(row)
        if processedRow == row
            break
        else
            processedOutput[numberRows + 1 - i] = processedRow
        end
    end
    processedOutput
end
