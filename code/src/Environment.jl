module Environment
include("./Params.jl")

export changeEnv
export calcFitness

function calcBenefit(p, env)
    res = 0.0

    # loop over modules
    for i in 1:nModules
        # get expression levels of this module
        subP = p[((i - 1) * nModuleSize) + 1:i*nModuleSize]
        # sum up all module benefits
        res += calcModuleBenefit(subP, env[i])
    end # for

    return (res / nModules)
end

function calcModuleBenefit(subP, subEnv)
    x = sum(subP) / nModuleSize
    return max(-x * subEnv[1], x * subEnv[2])
end

function calcCost(B)
    return sum(abs(B)) / (N * N)
end

function calcFitness(p, B, env, λ=0.1)
    return calcBenefit(p, env) - λ * calcCost(B)
end

function changeEnv(z=0.95, nModules=nModules)
    # 4 types of module env:
    # d_: dual peaked, s_: single peak,
    # _Pos: global optimum lies in
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

    return rolledEnvs

end
end  # module Environment
