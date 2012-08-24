Fabricator(:user) do
  name { sequence(:name) { |i| "user_#{i}" } }
  bio "This is a simple bio." 
end
