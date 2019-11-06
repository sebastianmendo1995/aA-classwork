def bubble_sort(array, &prc)
    sorted = false
    while !sorted
        sorted = true

        (0...array.length-1).each do |i|
            if prc.call(array[i], array[i+1]) == 1
                array[i], array[i+1] = array[i+1], array[i]
                sorted = false
            end
        end
    end
    array
end

p bubble_sort([6,10,9,-5,9,0,8,3,2]) { |a, b| a <=> b}

p (bubble_sort(["y", "z", "a", "b","m", "l"]) do |a, b| 
    alphabet = ('a'..'z').to_a
    alphabet.index(a) <=> alphabet.index(b)
end)
