### readMNIST

This is just a single small julia function to read MNIST dataset without any fluff.

[Download dataset](http://yann.lecun.com/exdb/mnist/) and extract files to a folder.

```julia
X, T = readMNIST("datafolder")
Xtest, Ttest = readMNIST("datafolder"; test=true)
```

Look at an image:

```julia
using Plots
heatmap(X[1], yflip=true)
```
