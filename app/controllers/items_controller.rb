class ItemsController < ApplicationController

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
    set_item
  end

  def purchase

  end

  def destroy
    set_item
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
    params.require(:item).permit( :name, :text, :brand, :status, :fee, :prefecture_id, :shipping, :price, :user_id,images_attributes: [:url]).merge(category_id: params[:category_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
