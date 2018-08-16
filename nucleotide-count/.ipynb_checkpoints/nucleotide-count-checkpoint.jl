function nucleotideCountUpdate(newNucleotide::Char, nucleotideCounter::Dict)
    nucleotideCounter[newNucleotide] += 1
end

function count_nucleotides(strand::AbstractString)
    nucleotides = Set(['A', 'C', 'G', 'T'])
    nucleotideCounter = Dict(x => 0 for x in nucleotides)
    for nucleotide in strand
        if nucleotide in nucleotides
            nucleotideCountUpdate(nucleotide, nucleotideCounter)
        else
            throw(DomainError(strand, "This strand contains bad nucleotides."))
        end
    end
    nucleotideCounter
end

