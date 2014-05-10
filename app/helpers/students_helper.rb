module StudentsHelper
	def generate_random_array(values)
		return values.shuffle
	end

	def assign_to_team(number_of_teams, ids)
		team_hash = Hash.new {|h,k| h[k]=[]}
		counter = ids.count
		team_count = number_of_teams
		i = 1

		team_count.times do |cnt|
			cnt += 1
			team_hash["Team " + cnt.to_s]
		end

		ids.each do |id|
			if i <= team_count
				team_hash["Team " + i.to_s] << id.id
			else
				i = 1
				team_hash["Team " + i.to_s] << id.id
			end

			i += 1
		end

		return team_hash
	end

	def student_name(id)
		students = Student.find(id)

		student = ActiveSupport::JSON.decode(students.to_json)
		return student["name"]
		
	end
end
