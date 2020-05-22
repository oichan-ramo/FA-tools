class UserController < ApplicationController

before_action :set_current_user
before_action :authenticate_user,{only:[:report,:set,:logout,:re_set,:report]}
before_action :only_current_user,{only:[:login_form,:new,:login,:create]}

  def report
    require "date"
    @today = Date.today
  end

  def login_form
  end

  def login
    @user = User.find_by(student_number: params[:number])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/report")
    else
      flash[:notice] = "学籍番号もしくはパスワードが間違っています。"
      render("user/login_form")
    end
  end

  def new
  end

  def create
    @user = User.new(name: params[:name],
                     student_number: params[:number],
                     my_class: params[:class],
                     password: params[:password])
    if @user.save
     redirect_to("/report")
     flash[:notice] = "ユーザー情報が正常に登録されました"
   else
     flash[:notice] = "ユーザー情報を正しく入力してください"
     render("/user/new")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def stylesheet_link_tag
  end

  def re_set
    @user = User.find_by(id: session[:user_id])
    @user.name = params[:name]
    @user.student_number = params[:number]
    @user.my_class = params[:class]
    @user.password = params[:password]
    if @user.save
     redirect_to("/report")
     flash[:notice] = "ユーザー情報が正常に登録されました"
   else
     render("/set")
     flash[:notice] = "ユーザー情報を正しく入力してください"
    end
  end

  def send_report
    report = Report.new(job: params[:job],
                        date: params[:day],
                        time: params[:time],
                        name: params[:name],
                        my_class: params[:my_class])
    if ReportMailMailer.send_mail(report).deliver
      flash[:notice] = "業務報告が送信されました"
      redirect_to("/report")
    else
      render("/report")
      flash[:notice] = "必要な情報を入力してください"
    end
  end

end
