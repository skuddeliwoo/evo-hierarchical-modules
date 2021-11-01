include("./Params.jl")

using .Types
import .Environment
import .Development
import .Mutation

for episode in 1:nEpisodes
    println("episode $episode of $nEpisodes")
    # init environment
    env = Environment.changeEnv()

    # develop phenotype
    p = Development.developPhenotype(individuals[end])

    # calc fitness -> old fitness
    fitness = Environment.calcFitness(p, individuals[end].B, env)

    for evoStep in 1:nEvoSteps
        # mutate
        mutant::Individual = Mutation.mutate(individuals[end])

        # iterate over dev steps
        pMutant = Development.developPhenotype(mutant)

        # calc mutant fitness
        fitnessMutant = Environment.calcFitness(pMutant, mutant.B, env)

        # compare fitness
        if (fitnessMutant > fitness)
            push!(individuals, mutant)
            # store winner fitness as old fitness
            fitness = fitnessMutant
        else
            push!(individuals, individuals[end])
        end
    end
end
