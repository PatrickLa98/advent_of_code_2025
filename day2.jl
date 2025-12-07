 
line = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
1698522-1698528,446443-446449,38593856-38593862,565653-565659,
824824821-824824827,2121212118-2121212124"

 id_ranges = split(line, ",")


 invalids = 0


 for r in id_ranges
        id_range = r

        start = parse(Int, split(id_range, "-")[1]) 

        ending = parse(Int, split(id_range, "-")[2])

        sequence = collect(start:ending)

        even_digit_numbers = filter(x -> iseven(length(string(abs(x)))), sequence)


        for i in even_digit_numbers


            ID_vector = parse.(Int, collect(string(i)))
            
            
            first_half = parse(Int, join(ID_vector[1:Int(round(length(ID_vector)/2))])) 
            
            
            second_half = parse(Int, join(ID_vector[(Int(round(length(ID_vector)/2)) + 1) : length(ID_vector)]))

            if ID_vector[1] == 0 || first_half == second_half 
                
                invalids += parse(Int, join(ID_vector))

            end

        end

    end

invalids