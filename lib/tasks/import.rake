namespace :import do
  task universities: :environment do
    file_path = "#{Rails.root}/lib/tasks/data/universities.json"
    json_data = open(file_path){|io| JSON.load(io) }
    
    json_data.each_slice(2) do |university_data|
      target_university = nil
      
      if university_name = university_data[0]['大学']
        target_university = University.find_or_create(name: university_name)
      end
      
      if department_names = university_data[1]['学部']
        department_names.each do |department_name|
          department = Department.find_or_create(name: department_name)
          target_university.add_department(department) if target_university
        end
      end
    end
  end
end