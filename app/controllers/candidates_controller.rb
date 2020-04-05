class CandidatesController < ApplicationController

  before_action :find_candidate , only: [:show , :edit , :update , :destroy , :vote]
                                  # except: [:new , :create ,:index]
  
  def index 
    @candidates = Candidate.all #@candidates會用複數
  end

  def show
    params[:id]
    
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    

    if @candidate.save 
      #成功
      flash[:notice] = "Candidate created!!" #本身也是hash
      redirect_to '/candidates' , notice: 'Candidate created!!'
    else
      #失敗
      render :new 
      #:new是借new.html.erb這個檔案做render渲染畫面但是內容會涵蓋create方法的(candidate_params)資料做保留不會讓資料全部重來
      #反之用redirect_to會讓整個頁面重新導入 使用者的資料就必須重填。
    end
  end

  def edit
    
  
  end
    
  def update 

    

    if @candidate.update(candidate_params)
      # flash[:notice] = "Candidate updated!!" 
      redirect_to '/candidates' , notice: 'Candidate updated!!'
    else
      render :edit
    end
  end

  def destroy
    
    @candidate.destroy
    
    redirect_to '/candidates' , notice: 'candidate deleted!'

  end

  def vote
    

    # VoteLog.create(candidate: @candidate , ip_address: request.remote_ip)
    
    @candidate.vote_logs.create(ip_address: request.remote_ip)
    # @candidate.votes = @candidate.votes + 1 用法同下
    # @candidate.increment(:votes)
    # @candidate.save

    # flash[:notice] = "Voted!!" 
    redirect_to '/candidates',notice: 'voted!'
  end

  
  private
  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end