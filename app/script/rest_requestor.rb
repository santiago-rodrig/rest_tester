require 'rest-client'

url = 'http://localhost:3000/'
print "\nSpecify the resource to append to the url, leave empty if root: "
resource = gets.chomp
response = nil

loop do
  puts "\nWhat HTTP method are you gonna use? (get/post/delete/patch/put): "
  method = gets.chomp
  break if %w[get post delete patch put].include? method
end

case method
when 'get'
  response = RestClient.get(url + resource)
when 'post'
  response = RestClient.post(url + resource)
when 'patch'
  response = RestClient.post(url + resource)
when 'put'
  response = RestClient.post(url + resource)
when 'delete'
  response = RestClient.delete(url + resource)
end

puts "\nCode: #{response.code}"

if method.eql? 'get'
  loop do
    print "\nYou want to see the headers? (Y/n): "
    ans = gets.chomp

    if %w[y n].include?(ans) || ans.empty?
      if ans.eql?('y') || ans.empty?
        puts "\n--- HEADERS START ---\n\n"
        puts response.headers
        puts "\n--- HEADERS END ---"
      end

      break
    end
  end

  loop do
    print "\nYou want to see the body? (Y/n): "
    ans = gets.chomp

    if %w[y n].include?(ans) || ans.empty?
      if ans.eql?('y') || ans.empty?
        puts "\n--- BODY START ---\n\n"
        puts response
        puts "\n--- BODY END ---"
      end

      break
    end
  end

  loop do
    print "\nYou want to see the cookies? (Y/n): "
    ans = gets.chomp

    if %w[y n].include?(ans) || ans.empty?
      if ans.eql?('y') || ans.empty?
        puts "\n--- COOKIES START ---\n\n"
        puts response.cookies
        puts "\n--- COOKIES END ---"
      end

      break
    end
  end
end
