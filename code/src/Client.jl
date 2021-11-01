nModules = 4
nModuleSize = 4
N = nModules * nModuleSize # Number of genes and traits
g = zeros(N, 1) # initialize genotype
B = zeros(N,N, 1) # init regulation coeff matrix

nEpisodes = 1000 # lit: 100000
nEvoSteps = 1000 # lit: 1000

include("./Environment.jl")


B[:,:,end]

for episode in 1:nEpisodes
    println("episode $episode of $nEpisodes")
    # init environment
    env = changeEnv()
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
