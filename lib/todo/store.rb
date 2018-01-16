require 'json'
module Todo
  class Store

    # TODO: too tekitou

    FILE = File.expand_path("~/.config/todo/store.json")
    DEFAULT_STORE_JSON = {"meta":{"id":0},"todos":[]}.to_json

    STATE = {
      todo: "🔥",
      done: "🎉",
    }

    def initialize
      @data = open(FILE) do |io|
        JSON.load(io)
      end
      @todos = @data["todos"]
      @meta = @data["meta"]
    end

    def load(all: false)
      return @todos if all

      @todos.select do |t|
        t["state"] != STATE[:done]
      end
    end

    def create(todo)
      @todos << {
        "task"       => todo,
        "id"         => next_id,
        "state"      => STATE[:todo],
        "created_at" => timestamp,
        "done_at"    => "",
      }
      save
    end

    def done(id)
      @todos.map do |t|
        if t["id"] == id.to_i
          t["state"]   = STATE[:done]
          t["done_at"] = timestamp
        end
      end
      save
    end

    def destroy(id)
      @todos.reject! { |t| t["id"] == id.to_i }
      save
    end

    protected

      def save
        open(FILE, 'w') do |io|
          JSON.dump({
            meta: @meta,
            todos: @todos,
          }, io)
        end
      end

      def next_id
        @meta["id"] += 1
      end

      def timestamp
        Time.now.strftime("%Y-%m-%d %H:%M")
      end
  end
end
