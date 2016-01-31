json.id @user.id
json.name @user.name
json.email @user.email
json.location @user.location

json.lines @user.lines do |line|
  json.id line.id
  json.brand line.brand
  json.length line.length
  json.width line.width
  json.style line.style
  json.system line.system
  json.user_id line.user_id
end
