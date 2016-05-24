class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all.order('created_at desc').paginate(page: params[:page], per_page: 8).decorate
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      redirect_to root_path
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      redirect_to root_path
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :link, :slug)
  end

  def find_project
    @project = Project.friendly.find(params[:id]).decorate
  end
end
