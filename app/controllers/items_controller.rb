class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update :destroy]
  def index
    @items = Item.order("created_at desc").limit(6)

  end

  def new
    @item = Item.new
    @item.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def purchase
    @item = Item.find(params[:id])
    @card = Card.where(user_id: current_user.id)
    unless @card.present?
      redirect_to new_card_path, method: :get
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '投稿が送信されました'
    else
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      flash.now[:alert] = '必須項目を入力してください。'
      render :new
    end
  end

  def show
    @item_status = Statushash.find(@item.status)
    @item_fee = Feehash.find(@item.fee)
    @item_shipping = Shippinghash.find(@item.shipping)
  end

  def edit
    @item = Item.find(params[:id])
    grandchild_category = @item.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
    
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path, notice: '投稿が更新されました'
    else
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      flash.now[:alert] = '必須項目を入力してください。'
      render :edit
    end
  end

  def destroy
    if @item.destroy
      render :destroy
    else
      flash.now[:alert] = '商品出品取り消しに失敗しました。'
      render :show
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private
  def item_params
    params.require(:item).permit( :name, :text, :brand, :status, :category_id, :fee, :prefecture_id, :shipping, :price, images_attributes: [:_destroy,:id,:url]).merge( saler_id: current_user.id)
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

end
