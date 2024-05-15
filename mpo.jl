#assuming a hamiltonian of H = JΣᵢSi(dot)Si+1 = JΣᵢ(SxiSxi+1 + SyiSyi+1 SziSz+1) and all particles spin 1/2
include("kronecker-product.jl")
include("pauli-matrices.jl")

function MPO(particles::Integer)

	dim = 2^particles
	#H = Array{Union{Missing, Number}}(missing, dim, dim)
	H = zeros(dim,dim)
	j = (particles-2)

	for i = 0:(particles-2)
		#do pauli x tensors
		H += kron(kron(nthI(i),kron(σx,σx)),nthI(j))
		#do pauli y tensors
		H += kron(kron(nthI(i),kron(σy,σy)),nthI(j))
		#do pauli z tensors
		H += kron(kron(nthI(i),kron(σz,σz)),nthI(j))
		j -= 1
	end
	return H
end

function nthI(times::Integer)		#surely there is a better way to name this function
	if times == 0 return 1 end
	working = I2
	
	for i = 1:(times-1)
		working = kron(working,I2)
	end
	return working
end
