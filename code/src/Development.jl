module Development

export developPhenotype

# squash function
σ = x -> tanh(x/2)
# decay term coefficient
τ = 0.2
# number of developmental steps
T = 10


function developPhenotype(g, B)
    # p(0) = g
    p = g

    # p_i(t+1) = p_i(t)*(1-τ) + σ(sum_j(B_{ij}*p_j(t)))
    for t in 1:T
        p = ( (1 - τ) * p ) + ( σ.(B * p) )
    end

    # values of normalized p vector should be in range [-1, 1]
    if (max(abs.(τ*p)...) > 1)
        println("WARN: developPhenotype: elements of p > 1")
    end

    # return normalized phenotype
    return τ*p
end

end  # module Development
