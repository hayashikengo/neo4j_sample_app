class Department 
  include Neo4j::ActiveNode
  property :name, type: String



end
