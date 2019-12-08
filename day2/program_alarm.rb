#!/usr/bin/ruby

def compute_codes(file_name)
    File.readlines(file_name).each do |line|
        codes = line.split(',').map { |s| s.to_i }
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
end

codes = compute_codes("codes.txt")
puts "Output: " + codes.inspect