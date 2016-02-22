module Api
  module V1
    class TasksController < BaseController
      skip_before_filter :authorized?

      def index
        respond_with tasks
      end

      def show
        task = Task.find(params[:id])
        respond_with task
      end

      def create
          task = Task.new(task_params)
          save(task)
      end

      def update
          task = Task.find(params[:id])
          task.assign_attributes(task_params)
          save(task)
      end

      def destroy
        task = Task.find(params[:id])
        task.destroy
        render json: { success: true, message: "The task was removed!" }
      end

      private

      def tasks
        @tasks ||= Task.all
      end

      def save(task)
         if task.save
            render json: { success: true, message: "The task was saved!", resource: task }, status: 200
          else
            render json: { success: false, message: task.errors.full_messages.first, resource: task }
          end
      end

      def task_params
        params.require(:task).permit(:name, :executable_path, :days_of_week, :started_at, :ended_at, :status, :server_ids)
      end
    end
  end
end