class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, except: [:index, :show]

  def toggle_confirmed
    membership = Membership.find(params[:id])
    membership.update_attribute :confirmed, (not membership.confirmed)
    new_status = membership.confirmed? ? true : false
    redirect_to :back, notice:"membership confirmed status changed to #{new_status}"
  end

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
    @beerclubs = Beerclub.all
  end

  # GET /memberships/1/edit
  def edit
    @beerclubs = Beerclub.all
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)
    @membership.user = current_user
    @membership.confirmed = false
    club = Beerclub.find membership_params[:beerclub_id]
    exists = current_user.beerclubs.include?(club)

    if exists
      @membership.errors.add(club.name, " you are already a member of this club")
    end

    respond_to do |format|
      if not exists and @membership.save
        format.html { redirect_to club, notice: current_user.username + ", welcome to the club!" }
        format.json { render :show, status: :created, location: @membership }
      else
        @beerclubs = Beerclub.all
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    club = Beerclub.find membership_params[:beerclub_id]
    respond_to do |format|
      format.html { redirect_to club, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:user_id, :beerclub_id)
    end
end
