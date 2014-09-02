class ProgramsController < ApplicationController

	def index
		@programs = current_user.programs
	end

	def new
		@program = Program.new
		render "_new.html.erb"
	end

	def create
		user = current_user
		goal = params[:program][:goal]
		user.programs.create(goal: goal)
		redirect_to programs_path
	end

	def edit
		@program = Program.find(params[:id])
		render "_new.html.erb"
	end

	def update
		program = Program.find(params[:id])
		updated_info = params[:program].permit(:goal)
		program.update_attributes(updated_info)
		redirect_to programs_path
	end

end
