# describe "element_count" do
#     it "should accept an array as an arg" do
#       expect { element_count(["cat", "dog", "cat", "cat"]) }.to_not raise_error
#     end

#     it "should return a hash where each key is an element of the array and it's corresponding value is the number of times it appears in the array" do
#       expect(element_count(["cat", "dog", "cat", "cat"])).to eq({"cat" => 3, "dog"=>1})

def element_count(arr)
    hash = Hash.new(0)
    arr.each { |element| hash[element] += 1 }
    return hash
end

def char_replace!(str,hash)
    str.each_char.with_index do |char,idx|
        if hash[char] != nil
            str[idx]=hash[char]
        end
    end
    return str
end

def product_inject(arr)
    arr.inject{|accum,num| accum * num}
end