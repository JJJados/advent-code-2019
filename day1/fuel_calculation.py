from math import floor

# Calculates fuel based on mass for Part 1
def calculate_fuel(mass):
    return (floor(mass / 3)) - 2

# Calculates additional fuel based on mass for Part 2
def calculate_additional_fuel(mass):
    if mass <= 0:
        return 0

    return calculate_additional_fuel(calculate_fuel(mass)) + mass

# Returns fuel requirement based on module masses in file
def fuel_requirement(module_masses):
    fuel = 0
    with open(module_masses) as file:
        line = file.readline()
        mass = int(line)

        while line:
            initial_fuel = calculate_fuel(mass)
            fuel += calculate_additional_fuel(initial_fuel)
            line = file.readline()

            # Check for EOF
            if line != '':
                mass = int(line)

    return int(fuel)

if __name__ == "__main__":
    module_masses = "module_masses.txt"
    fuel = fuel_requirement(module_masses)
    print("Fuel required: " + str(fuel))