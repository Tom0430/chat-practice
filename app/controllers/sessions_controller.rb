class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        #セッション情報に含まれているメールアドレスをもとに、Usersテーブルに保存されているUserオブジェクトを抽出

        if user && user.authenticate(params[:session][:password])
            # Userオブジェクトが抽出できる（つまり、Usersテーブルに存在している）かつ（&&）
            # paramsで送られてきたセッションの中のパスワード（ハッシュ化されている）が
            # DB内のハッシュ化されたpassword_digestカラムの値と一致しているかどうか検証することで、ユーザーを識別
            log_in user
            redirect_to user
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end
end
