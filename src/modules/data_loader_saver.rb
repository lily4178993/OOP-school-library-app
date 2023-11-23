private

def ensure_data_directory
  data_directory = 'src/data'
  return if Dir.exist?(data_directory)

  Dir.mkdir(data_directory)
  puts "\nCreated 'data' directory in 'src'."
end

def save_to_json(file_name, data)
  File.write(file_name, JSON.pretty_generate(data))
end

def load_from_json(file_name)
  JSON.parse(File.read(file_name), symbolize_names: true) if File.exist?(file_name)
rescue StandardError => e
  puts "Error loading data from #{file_name}: #{e.message}"
  nil
end
