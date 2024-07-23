require_relative "lib/hash_map"

hash = HashMap.new

freq = Hash.new(0)
random_names = %w[
  Emma Olivia Sophia Isabella Charlotte Amelia Mia Harper Evelyn Abigail
  Liam Noah William James Oliver Benjamin Elijah Lucas Mason Logan
  Ava Emily Madison Avery Ella Scarlett Grace Chloe Victoria Zoe
  Alexander Michael Daniel Matthew Jackson Joseph David Lucas Ryan Benjamin
]
random_names.each { |number| freq[hash.hash(number)] += 1 }
puts freq
