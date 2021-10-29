nModules = 4
nModuleSize = 4
N = nModules * nModuleSize # Number of genes and traits
g = zeros(N) # initialize genotype
B = zeros(N,N) # init regulation coeff matrix

nEpisodes = 1000 # lit: 100000

for episode in 1:nEpisodes
    # init environment

    # iterate over evo steps

    # iterate over dev steps

    println(episode)
end

function changeEnv(z=0.95, nModules=nModules)
    envs = Dict(
    "dPos" => Dict("coeffs"=>(0.7,   1), "prob"=>(p -> p < z/2)),
    "dNeg" => Dict("coeffs"=>(  1, 0.7), "prob"=>(p -> p >= z/2 && p < z)),
    "sPos" => Dict("coeffs"=>( -1,   1), "prob"=>(p -> p >= z && p < (z + (1-z) / 2))),
    "sNeg" => Dict("coeffs"=>(  1,  -1), "prob"=>(p -> p >= (z + (1-z) / 2))),
    )

    for i in 1:nModules
        println(i)
        roll = rand(Float64)
        if envs["dPos"]["prob"](roll)
            println("i am dPos: $roll")
        elseif envs["dNeg"]["prob"](roll)
            println("i am dNeg: $roll")
        elseif envs["sPos"]["prob"](roll)
            println("i am sPos: $roll")
        elseif envs["sNeg"]["prob"](roll)
            println("i am sNeg: $roll")
        end # if
    end

end

changeEnv()
