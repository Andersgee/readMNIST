function readMNIST(foldername; test=false)
    if test
        images = joinpath(foldername, "t10k-images.idx3-ubyte")
        labels = joinpath(foldername, "t10k-labels.idx1-ubyte")
        N = 10000
    else
        images = joinpath(foldername, "train-images.idx3-ubyte")
        labels = joinpath(foldername, "train-labels.idx1-ubyte")
        N = 60000
    end
    X = Array{Float64}(undef, 28^2, N)
    T = Array{Int64}(undef, N)

    io = open(images, "r")
    io2 = open(labels, "r")
    for i=1:N
        seek(io, (i-1)*28^2 + 16) #offset 16 to skip header
        seek(io2, (i-1)*1 + 8) #offset 8 to skip header
        X[:,i] = convert(Array{Float64}, read(io, 28^2))
        T[i] = convert(Int, read(io2, UInt8))
    end
    close(io)
    close(io2)

    X = [permutedims(reshape(X[:,i]/255, 28, 28), [2, 1]) for i=1:N]
    return X, T
end
