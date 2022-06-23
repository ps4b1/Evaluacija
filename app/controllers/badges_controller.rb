class BadgesController < ApplicationController

  before_action set_badge %i[destroy update edit]

  def new
    @badge=Badge.new
  end

  def create
    @badge=Badge.new(badge_params)
    respond_to do |format|
      if @badge.save
        format.html { redirect_to badge_url(@badge), notice: "Badge was successfully created." }
        format.json { render :show, status: :created, location: @badge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @badge.destroy

    respond_to do |format|
      format.html { redirect_to badge_url, notice: "Badge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @badge.update(human_params)
        format.html { redirect_to badge_url(@badge), notice: "Badge was successfully updated." }
        format.json { render :show, status: :ok, location: @badge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @badges = Badges.all
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_new_badge
    @badge=Badge.new
  end

  def badge_params
    params.require(:badge).permit(:name)
  end
end
