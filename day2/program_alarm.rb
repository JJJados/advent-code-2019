#!/usr/bin/ruby

def compute_codes(codes, noun, verb)
    codes[1] = noun
    codes[2] = verb
    i = 0        
    loop do
        case codes[i]
        when 1
            codes[codes[i+3]] = codes[codes[i+1]] + codes[codes[i+2]]
        when 2
            codes[codes[i+3]] = codes[codes[i+1]] * codes[codes[i+2]]
        when 99
            return codes[0]
        end
        i+=4
    end
end

File.readlines("codes.txt").each do |line|
    codes = line.split(',').map { |s| s.to_i }
    100.times { |n|
        100.times { |v|
            code = compute_codes(codes.clone, n, v)
            if code == 19690720
                puts "Output: #{100 * n + v}"
            end
        }
    }
end