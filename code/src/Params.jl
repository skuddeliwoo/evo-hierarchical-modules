using .Types

nModules = 4
nModuleSize = 4
N = nModules * nModuleSize # Number of genes and traits
individuals = [Individual(zeros(N), zeros(N,N))]
nEpisodes = 200000 # lit: 200000
nEvoSteps = 1000 # lit: 1000
