function kron(matrix1::Matrix, matrix2::Matrix)		#2d arrays only, overload for other cases
	println(size(matrix1))
	(r1,c1) = size(matrix1)
	(r2,c2) = size(matrix2)
	m = 0
	n = 0
	
	#result = Array{Union{Missing, Number}}(missing, r1*r2, c1*c2)
	result = zeros(r1*r2,c1*c2)
	
	for j = 1:c1			#bro this is horrible code ??
		for i = 1:r1
			n = n%(c1*c2)+1
			for l = 1:c2
				n = (j-1)*c2+l
				for k = 1:r2
					m = (i-1)*r2+k		#rearrange in loop for optimization
					result[m,n] = matrix1[i,j]*matrix2[k,l]
				end
			end
		end
	end
	return result			#^_^
end

function kron(matrix::Matrix, value::Number)
	return value .* matrix
end

function kron(value::Number, matrix)
	return value .* matrix
end

function kron(value1::Number, value2::Number)
	return value1*value2
end

#display(a) to show matrixx
