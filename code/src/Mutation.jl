module Mutation

using ..Types
include("./Params.jl")

function mutate(indivdual::Individual)::Individual

    mutant::Individual = Individual(copy(indivdual.g), copy(indivdual.B))

    if (rand() > 0.5) # mutate g
        # choose single entry and set to -1 or 1
        mutant.g[rand((1:N))] = rand((-1, 1))
    else # mutate B
        # choose single entry and add random m ∈ [-0.001; 0.001]
        mutant.B[rand((1:N)), rand((1:N))] += rand() * 0.002 - 0.001
    end

    return mutant
end

end  # module Mutation
