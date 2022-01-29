class Task

    attr_accessor :title, :done, :description, :id
    def initialize(attr = {})
      @id = attr[:id]
      @title = attr[:title]
      @description = attr[:description]
      @done = attr[:done]
    end

    # find
    def self.find(id)
        task = DB.execute("SELECT * FROM tasks WHERE id=#{id}")
        task[0].transform_keys!(&:to_sym)
        Task.new(task[0])
    end

    # crate
    def self.create(title, description, done)
        DB.execute("INSERT INTO tasks (title, description, done) VALUES ('#{title}', '#{description}', #{done})")
    end
    # save
    def save
        if id.nil?
            DB.execute("INSERT INTO tasks (title, description, done) VALUES ('#{title}', '#{description}', #{done})")
        else
            DB.execute("UPDATE tasks SET title='#{title}', description='#{description}', done=#{done} WHERE id=#{id}" )
        end
    end
    
    # update
    def update(title, description, done)
        DB.execute("UPDATE tasks SET title=?, description=?, done=? WHERE id=?", title, description, done, id)
    end

    # all
    def self.all
        array = []
        DB.execute("SELECT * FROM tasks").each do |task|
            task = task.transform_keys!(&:to_sym)
            array << Task.new(id: task[:id], title: task[:title], description: task[:description], done: task[:done])
        end
        array
    end

    # destroy
    def destroy
        DB.execute("DELETE FROM tasks WHERE id = ?", @id)
    end
end

