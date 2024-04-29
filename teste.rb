require 'yaml'

class Task
  attr_accessor :description, :completed

  def initialize(description)
    @description = description
    @completed = false
  end

  def complete
    @completed = true
  end

  def incomplete
    @completed = false
  end

  def to_s
    status = @completed ? "[X]" : "[ ]"
    "#{status} #{@description}"
  end
end

class TaskList
  attr_reader :tasks

  def initialize
    @tasks = []
  end

  def add_task(description)
    task = Task.new(description)
    @tasks << task
  end

  def complete_task(index)
    @tasks[index].complete
  end

  def incomplete_task(index)
    @tasks[index].incomplete
  end

  def remove_task(index)
    @tasks.delete_at(index)
  end

  def save(filename)
    File.open(filename, "w") do |file|
      file.write(YAML.dump(@tasks))
    end
  end

  def load(filename)
    @tasks = YAML.load_file(filename)
  end

  def show_tasks
    puts "Task List:"
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end
end

# Exemplo de uso
task_list = TaskList.new

# Adicionando algumas tarefas
task_list.add_task("Lavar o carro")
task_list.add_task("Fazer compras")
task_list.add_task("Estudar Ruby")

# Exibindo a lista de tarefas
task_list.show_tasks

# Marcando a primeira tarefa como concluída
puts "Marcando a primeira tarefa como concluída."
task_list.complete_task(0)

# Exibindo a lista de tarefas novamente
task_list.show_tasks

# Salvando as tarefas em um arquivo
task_list.save("tasks.yaml")
puts "Tarefas salvas em 'tasks.yaml'."

# Criando uma nova lista de tarefas e carregando as tarefas do arquivo
new_task_list = TaskList.new
new_task_list.load("tasks.yaml")

# Exibindo as tarefas carregadas
puts "Tarefas carregadas do arquivo:"
new_task_list.show_tasks
