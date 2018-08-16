function to_rna(dna::AbstractString)
    dictionary = Dict(
                    'G' => 'C',
                    'C' => 'G',
                    'T' => 'A',
                    'A' => 'U'
                    )
    dna_nucleotides = Set(['A', 'C', 'G', 'T'])
    rna = Char[]
    for char in dna
        if !(char in dna_nucleotides)
            throw(ErrorException("This strand contains non-dna nucleotides"))
        else
            push!(rna, dictionary[char])
        end
    end
    join(rna)
end