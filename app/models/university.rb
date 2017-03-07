class University 
  include Neo4j::ActiveNode
  property :name, type: String

  has_many :out, :departments, type: :has, model_class: :Department

  def add_department(department)
    return department if self.departments.include?(department)
    
    self.departments << department
  end
end
