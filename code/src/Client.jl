include("./Params.jl")

import .Environment


B[:,:,end]

for episode in 1:nEpisodes
    println("episode $episode of $nEpisodes")
    # init environment
    env = Environment.changeEnv()
    # develop phenotype
    # calc fitness -> old fitness
    for evoStep in 1:nEvoSteps

        # mutate

        # iterate over dev steps
        # calc mutant fitness
        # compare fitness
        # store winner fitness as old fitness
    end
    # iterate over evo steps

    # iterate over dev steps

end
