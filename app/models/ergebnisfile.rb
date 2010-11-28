class Ergebnisfile < ActiveRecord::Base
  
  def write(content)
    return nil unless content.respond_to?('each')
    File.open(self.name, 'w') do |f|
      content.each do |line|
        f.puts line
      end
    end
  end
  
  def parse_teams
    teams_arr = IO.readlines(self.name)
    teams_arr = teams_arr[2..19]
    teams_arr.collect! { |t| t.chomp! }
  end
end
