class ListsController < ApplicationController
   # 各Viewファイルに受け取った情報を送るためroutes.rbにて指定されたアクションを実行し、インスタンス変数を定義して表示させるようにする
   # それがcontrollerの役割
   # インスタンス変数「@*****」にはroutes.rbから渡されたデータ(URL,記録など)を格納する。
  def new #newアクション
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new #newメゾット
  end

  def create
    @list = List.new(list_params) # １.&2. データを受け取り新規登録するためのインスタンス作成(定義)
    if @list.save  # 3. データをデータベースに保存するためのsaveメソッド実行
      flash[:notice] = "投稿が成功しました" #	フラッシュメッセージを定義
      redirect_to list_path(@list.id) # 4. トップ画面へリダイレクト
    else
      render :new # render :アクション名で、同じコントローラ内の別アクションのViewを表示
      # 仮に'new'のところが'index'だった場合、インスタンス変数@listがない(未定義)ためエラーが起きてしまう
      # エラーメッセージを扱う際にはrender、それ以外はredirect_toを使う
      # ちなみにrenderはビューファイルで書くときは[<%= render 'new' =>]とする
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = @list.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト
  end

   private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
