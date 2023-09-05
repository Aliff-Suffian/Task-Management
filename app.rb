class Task
    attr_accessor :title, :due_date, :completed
  
    def initialize(title, due_date)
      @title = title
      @due_date = due_date
      @completed = false
      
    end
  
    def mark_as_completed
      @completed = true
    end
  
    def mark_as_incomplete
      @completed = false
    end
  
    
    def to_s
      status = @completed ? "Completed" : "Incomplete"
      
      "#{@title}\nDue Date: #{@due_date}"
    end
end
  
class TaskManagement
    def initialize
      @tasks = []
    end
  
    def add_task(task)
      @tasks << task
    end
  
    def update_task(task_index, updated_task)
      @tasks[task_index] = updated_task
    end
  
    def delete_task(task_index)
      @tasks.delete_at(task_index)
    end
  
    def list_tasks
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task.title} (Due: #{task.due_date})"
      end
    end
end
  
task_management = TaskManagement.new
  
  loop do
    puts "Task Management System"
    puts "1. Add Task"
    puts "2. Update Task"
    puts "3. Delete Task"
    puts "4. List Tasks"
    puts "5. Exit"
    print "Enter your choice: "
    choice = gets.chomp.to_i
  
    case choice
    when 1
      print "Enter task title: "
      title = gets.chomp
      print "Enter due date (DD-MM-YYYY): "
      due_date = gets.chomp
      task = Task.new(title, due_date)
      task_management.add_task(task)
      puts "Task added!"
    when 2
      task_management.list_tasks
      print "Enter the task number to update: "
      task_number = gets.chomp.to_i - 1
      task = task_management.tasks[task_number]
      if task_management.tasks[task_number]
        print "Mark as completed? (y/n): "
        completed = gets.chomp.downcase
  
        if completed == 'y'
          task.completed = true
        end  
        
        # task_management.update_task(task_number, task) if completed == 'y'
        puts "Task updated!"
      else
        puts "Task not found."
      end
    when 3
      task_management.list_tasks
      print "Enter the task number to delete: "
      task_number = gets.chomp.to_i - 1
      if task_management.list_tasks[task_number]
        task_management.delete_task(task_number)
        puts "Task deleted!"
      else
        puts "Task not found."
      end
    when 4
      task_management.list_tasks
    when 5
      puts "Exiting..."
      break
    else
      puts "Invalid choice. Please choose again."
    end
  
    puts
end
  