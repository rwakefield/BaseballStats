# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard :minitest do
  watch(%r{^app/models/(.*)\.rb$}) { |m| "test/models/#{m[1]}_test.rb" }
  watch(%r{^test/models/(.*)\.rb$}) { |m| "test/models/#{m[1]}.rb" }
  watch(%r{^app/presenters/(.*)\.rb$}) { |m| "test/presenters/#{m[1]}_test.rb" }
  watch(%r{^test/presenters/(.*)\.rb$}) { |m| "test/presenters/#{m[1]}.rb" }
  watch(%r{^app/queries/(.*)\.rb$}) { |m| "test/queries/#{m[1]}_test.rb" }
  watch(%r{^test/queries/(.*)\.rb$}) { |m| "test/queries/#{m[1]}.rb" }
  watch(%r{^app/services/(.*)\.rb$}) { |m| "test/services/#{m[1]}_test.rb" }
  watch(%r{^test/services/(.*)\.rb$}) { |m| "test/services/#{m[1]}.rb" }
  watch(%r{^lib/tasks/(.*)\.rake$}) { |m| "test/lib/tasks/#{m[1]}_test.rb" }
  watch(%r{^test/lib/tasks/(.*)\.rb$}) { |m| "test/lib/tasks/#{m[1]}.rb" }
end
