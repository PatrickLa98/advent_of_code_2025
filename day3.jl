using InvertedIndices

input = [
    987654321111111
    811111111111119
    234234234234278
    818181911112111
]

rows = [parse.(Int, collect(string(line))) for line in input]

M = reduce(vcat, (row' for row in rows))


max_jol = 0


for i in 1:length(M[:,1])

        num1, loc1 = findmax(M[i, :])

        num2, loc2_raw = findmax(M[i, Not(loc1)])


        if loc1 > loc2_raw && loc1 != length(M[1,:])

            num2, loc2_pre_adding = findmax(M[i, (loc1+1):end])

            loc2_raw = loc2_pre_adding + loc1

        end



            if loc1 < loc2_raw + 1

                max_jol += parse(Int, string(num1) * string(num2))

            elseif  loc1 > loc2_raw

                max_jol += parse(Int, string(num2) * string(num1))
            end


end

max_jol

