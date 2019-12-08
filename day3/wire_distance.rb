#!/usr/bin/ruby
require 'set'

def get_visited(path)
    visited = {}
    x, y = 0, 0
    steps = 0

    path.split(',') { |code|
        dir = code[0]
        amnt = code[1..].to_i

        amnt.times do
            case dir
            when 'R'
                x += 1
            when 'L'
               x -= 1
            when 'U'
                y += 1
            when 'D'
                y -= 1
            end
            steps += 1
            if !visited[[x, y]]
                visited[[x, y]] = steps
            end
        end
    }
    return visited
end

def manhatten_distance(path_1, path_2)
    intersect = get_visited(path_1).keys & get_visited(path_2).keys
    
    distance = intersect.map { |x, y|
        x.abs + y.abs
    }.min

    return distance
end

def fewest_steps(path_1, path_2)
    visited_1, visited_2 = get_visited(path_1), get_visited(path_2)
    intersect = visited_1.keys & visited_2.keys

    distance = intersect.map { |x, y|
        visited_1[[x, y]] + visited_2[[x, y]]
    }.min

    return distance
end

path_1, path_2, = File.read("wire_path.txt").split("\n")
puts "Manhatten Distance: #{manhatten_distance(path_1, path_2)}"
puts "Fewest Steps: #{fewest_steps(path_1, path_2)}"