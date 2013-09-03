desc "Fix username attribute for user record without one"
task :fix_username do
  User.all.each { |u| u.save }
end