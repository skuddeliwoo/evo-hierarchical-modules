nModules = 4
nModuleSize = 4
N = nModules * nModuleSize # Number of genes and traits
g = zeros(N, 1) # initialize genotype
B = zeros(N,N, 1) # init regulation coeff matrix

nEpisodes = 1000 # lit: 100000
nEvoSteps = 1000 # lit: 1000
