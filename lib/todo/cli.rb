require 'thor'
require 'formatador'

module Todo
  class CLI < Thor
    include Thor::Actions

    desc "list", "show todo list"
    method_option :all, aliases: 'a', type: :boolean, default: false
    def list
      d = Store.new
      Formatador.display_table d.load(all: options[:all])
    end

    desc "add", "add new todo"
    def add(todo)
      d = Store.new
      d.create(todo)
      Formatador.display_table d.load
    end

    desc "done", "make a todo done"
    def done(id)
      d = Store.new
      d.done(id)
      Formatador.display_table d.load
    end

    desc "delete", "delete a todo"
    def delete(id)
      d = Store.new
      d.destroy(id)
      Formatador.display_table d.load
    end

    desc "init", "initialize"
    def init
      create_file Store::FILE, Store::DEFAULT_STORE_JSON
    end

    desc "clear", "clear all todos"
    def clear
      create_file Store::FILE, Store::DEFAULT_STORE_JSON
    end

  end
end
