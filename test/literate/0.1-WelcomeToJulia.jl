include("header.jl")

#=
# Introduction
This is meant to be a simple introductory notebook. If you can run this, you should
be able to run any notebook that comes later in the course. The notebook runs on
the [Julia](https://julialang.org/) programming language.
=#
#-
#=
First, note that the notebooks in this package are probably read-only for you, so
you cannot save it if you make changes. (This is for good reason.) If you would
like to save your changes, then go up to the File menu in Jupyter and click
"Make a copy..." and then do your work on the copy.
=#
#-
#=
### Basics on Jupyter notebook with Julia
First try a simple mathematical operation. To run a cell, press `SHIFT+RETURN`
(or `SHIFT+ENTER`). You can also press the `Run` button above.
=#
2+2

#=
If you don't want to see the output of a calculation, then you can suppress it
with the semicolon `;`
=#
a = 2+2;

#=
Here is an example of an array of values, specified as a range:
=#
x = 0:0.1:5.0

#=
And here is an evaluation of a function on that range:
=#
y = sin.(x)
#=
Notice the `.` that is placed just before the parentheses. This specifies a
vectorized operation: in other words, it tells it to evaluate the function on
each element of `x`.
=#
#-
#=
### Unicode symbols
Julia allows the use of `unicode` symbols in variable or function names. This
is really nice when we want to use Greek letters. The way to get such a symbol
is by typing backslash (`\`), then the name of the symbol, then `TAB` to convert it.

For example, let's write `Δt = 0.01`. We type `\Delta + TAB`:
=#
Δt = 0.01

#=
### Plotting
Now try plotting. We first have to load the Plots package to use its plotting features.
It take a couple of seconds for this to load.
=#
using Plots

#=
Now let's plot our data.

Note that it takes a few seconds to run this plot function for the first
time, since it does a little compiling on the fly. (Julia operates on a 'just-in-time'
compiling approach to generate much faster codes. As a result, this function is
basically instantaneous the next time you run it.
=#
plot(x,y)

#=
That's the basic plot. Let's make it look better:
=#
plot(x,y,xlims=(0,5),ylims=(-1,1),legend=false,xguide="x",yguide="y")



#=
To make the labels on the axes look a little bit more professional, we can
use the `LaTeXStrings` package
=#
using LaTeXStrings
#=
Then, each of the labels can be prefixed with `L`:
=#
plot(x,y,xlims=(0,5),ylims=(-1,1),legend=false,xguide=L"x",yguide=L"y")

#=
Suppose we wish to plot multiple things. Then we use `plot!` on every additional
plot. Also, let's save the plot for later use (saving), by naming it `ps`.
=#
y2 = cos.(x)
ps = plot(x,y,xlims=(0,5),ylims=(-1,1),label=L"sin($x$)",legend=true,xguide=L"x",yguide=L"y")
plot!(ps,x,y2,label=L"cos($x$)")
#=
Note: The $$ around the `x` in the labels above renders this in math (italic) font,
but keeps the rest of the text in roman (upright) font.
=#
#-

#=
If we want to save that plot, e.g., for homework, then we would run this to save
it as a pdf file (the best format for quality). Obviously you can change the name,
but you should end it with ".pdf".
=#
savefig(ps,"myfigure.pdf")

#=
### Special functions
Sometimes, we might need a *special function* for plotting. For example, the
Bessel function comes up in some problems in physics, particularly in waves in
circular geometries. Let's suppose we wish to plot the '2nd-order Bessel function
of the first kind', $J_2(y)$.

In Julia, we can load the `SpecialFunctions` package for this:
=#
using SpecialFunctions
#-
f(x) = besselj(2,x)
#-
x = 0:0.01:20;
plot(x,f.(x),grid=:true,xlims=(0,Inf),ylim=(-1,1),xguide=L"x",yguide=L"J_2(x)",legend=:false)

#=
### Further help on Julia
#### Basic help
If you need help on a specific Julia function, just type `?` followed by the
function name.

#### More detailed help
If you want more detailed help, go to the Julia documentation here:

https://docs.julialang.org/en/v1/
=#
