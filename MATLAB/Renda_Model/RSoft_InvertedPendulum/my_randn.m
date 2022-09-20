function randnVec = my_randn(size, mean, var)

randnVec = mean + var*randn(size(1), size(2))

end