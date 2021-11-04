include("./Params.jl")

using .Types
import .Environment
import .Development
import .Mutation

println("start simulation: $nEpisodes episodes with $nEvoSteps evolutionairy steps...")
println("status: episode 001 of $nEpisodes")

for episode in 1:nEpisodes
    if (episode % 100 == 0)
        global individuals = [individuals[end]]
        println("status: episode $episode of $nEpisodes")
    end
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
        end
    end
end


using CSV, DataFrames, Dates
timestamp = now()
CSV.write("run_$timestamp epi$nEpisodes.csv", DataFrame(individuals[end].B, :auto))
