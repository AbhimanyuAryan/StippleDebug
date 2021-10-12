pushfirst!(LOAD_PATH, joinpath(@__DIR__, "..")) # add LAMMPS to environment stack

using Documenter
using Literate

makedocs(sitename="My Documentation")

const EXAMPLES_DIR = joinpath(@__DIR__, "..", "examples")
const OUTPUT_DIR   = joinpath(@__DIR__, "src/generated")

println("$EXAMPLES_DIR")

examples = [
    "Basic Genie" => "geni",
    "Stipple Ex" => "stipp",
]

for (_, name) in examples
  example_filepath = joinpath(EXAMPLES_DIR, string(name, ".jl"))
  Literate.markdown(example_filepath, OUTPUT_DIR, documenter=true)
end

examples = [title=>joinpath("generated", string(name, ".md")) for (title, name) in examples]

println("$examples")

makedocs(
  sitename="StippleDebug.jl",
  repo="https://github.com/cesmix-mit/LAMMPS.jl/blob/{commit}{path}#{line}",
  pages = [
    "Examples" => examples
  ],
  doctest = true
)