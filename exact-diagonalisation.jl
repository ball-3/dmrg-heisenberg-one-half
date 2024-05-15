using LinearAlgebra

include("mpo.jl")

function idkyet(H)	#rename
	eigs = eigvals(H)
	n = length(eigs)
	vecs = [zeros(n) for i in 1:n]
	
	for i = 1:n
		vecs[i][i] = eigs[i]
	end
	return [eigs,vecs]
end
