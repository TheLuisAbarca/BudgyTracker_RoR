class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index
    @entities = Entity.joins(:groups_entities)
      .where(groups_entities: { group_id: params[:group_id] }).order(created_at: :desc)
    @group = Group.find(params[:group_id])
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    # @group = Group.find(params[:group_id])
    @entity = Entity.new(author_id: entity_params[:author_id], name: entity_params[:name],
                         amount: entity_params[:amount])

    unless params[:entity][:group_ids]
      flash[:notice] = 'You should select at least one category'
      redirect_to request.referrer
      return
    end

    respond_to do |format|
      if @entity.save
        params[:entity][:group_ids].each do |group_id|
          GroupsEntity.create(group_id:, entity_id: @entity.id)
        end
        format.html { redirect_to group_entities_url, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to group_entities_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:author_id, :name, :amount, group_ids: [])
  end
end
