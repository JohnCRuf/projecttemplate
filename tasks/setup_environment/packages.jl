##This script instantiates the Julia packages used throughout the project.

import Pkg
Pkg.activate("../output")
Pkg.instantiate()
using LinearAlgebra, Random, Distributions 
using CSV, DataFrames, JLD2, FileIO, StatsBase, StatFiles 
using TimerOutputs # Julia's macro @timeit

open("../output/julia_packages.txt", "w") do f
    write(f, "Successfully instantiated Project.toml")
end