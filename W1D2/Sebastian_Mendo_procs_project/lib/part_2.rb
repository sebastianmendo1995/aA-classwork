def reverser(str,&prc)
    prc.call(str.reverse)
end 

def word_changer(sentence, &prc)
    sentence = sentence.split(" ")
    answer = sentence.map{|word| prc.call(word)}
    answer.join(" ")
end 

def greater_proc_value(num, prc1, prc2)
    prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end 


def and_selector(arr,prc1,prc2)
    arr.select{|ele| prc1.call(ele) && prc2.call(ele)}
end

def alternating_mapper(arr, prc1, prc2)
    arr.each_with_index do |ele, idx|
        if idx.even?
            arr[idx] = prc1.call(ele)
        else 
            arr[idx] = prc2.call(ele)
        end
    end
    arr
end