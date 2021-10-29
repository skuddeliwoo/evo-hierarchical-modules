nModules = 4
nModuleSize = 4
N = nModules * nModuleSize # Number of genes and traits
g = zeros(N) # initialize genotype
B = zeros(N,N) # init regulation coeff matrix

nEpisodes = 1000 # lit: 100000

for episode in 1:nEpisodes
    # init environment
    env = changeEnv()

    # iterate over evo steps

    # iterate over dev steps
end

function changeEnv(z=0.95, nModules=nModules)
    envs = Dict(
    "dPos" => Dict("coeffs"=>( 0.7,  1.0), "prob"=>(p -> p < z/2)),
    "dNeg" => Dict("coeffs"=>( 1.0,  0.7), "prob"=>(p -> p >= z/2 && p < z)),
    "sPos" => Dict("coeffs"=>(-1.0,  1.0), "prob"=>(p -> p >= z && p < (z + (1-z) / 2))),
    "sNeg" => Dict("coeffs"=>( 1.0, -1.0), "prob"=>(p -> p >= (z + (1-z) / 2))),
    )

    rolledEnvs = []

    for i in 1:nModules
        roll = rand(Float64)
        if envs["dPos"]["prob"](roll)
            push!(rolledEnvs, envs["dPos"]["coeffs"])
        elseif envs["dNeg"]["prob"](roll)
            push!(rolledEnvs, envs["dNeg"]["coeffs"])
        elseif envs["sPos"]["prob"](roll)
            push!(rolledEnvs, envs["sPos"]["coeffs"])
        elseif envs["sNeg"]["prob"](roll)
            push!(rolledEnvs, envs["sNeg"]["coeffs"])
        end # if
    end # for

    println(rolledEnvs)
    return rolledEnvs

end
