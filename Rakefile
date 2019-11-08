require 'yaml'
require 'logger'
require 'active_record'



root = File.expand_path '..', __FILE__
DatabaseTasks.env = ENV['ENV'] || 'development'
conf = File.join root, 'db/config.yml'
DatabaseTasks.database_configuration = YAML.load(File.read(conf))
DatabaseTasks.db_dir = File.join root, 'db'
# DatabaseTasks.fixtures_path = File.join root, 'test/fixtures'
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]
# DatabaseTasks.seed_loader = Seeder.new File.join root, 'db/seeds.rb'
DatabaseTasks.root = root



load 'active_record/railties/databases.rake'

task :console do
  Pry.start
end