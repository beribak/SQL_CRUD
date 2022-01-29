require 'sqlite3'

DB = SQLite3::Database.new('db.sqlite')

def show_all
    p DB.execute("SELECT * FROM aeroplanes") 
end

class Aeroplane
    attr_reader :model, :airline
    def initialize(model, airline) 
        @model = model
        @airline = airline
    end

    def instance_method
        p "instance"
    end

    def self.class_method
        p "class"
    end    

    def delete
    end

    def self.create
    end
end 

aero = Aeroplane.new('boeing 254', 'Virgin')

aero.instance_method

Aeroplane.create

# DB.execute("INSERT INTO aeroplanes (model, airline) VALUES ('#{aero.model}', '#{aero.airline}')")
