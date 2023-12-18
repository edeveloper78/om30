class MunicipesController < ApplicationController
  before_action :set_municipe, only: [:edit,:update]

  def index
    @municipes = Municipe.all.order(nome_completo: :asc)
  end

  def new
    @municipe = Municipe.new
    @municipe.build_endereco
  end

  def edit
    @municipe.build_endereco unless @municipe.endereco
  end

  def update
    if valida_campos
      if atualiza_municipe
        flash[:success] = "Dados atualizados com sucesso!"
        enviar_email(municipe_params, "Dados Alterado com sucesso")
        redirect_to root_path
      else
        flash[:error] = "Erro ao atualizar os dados."
        redirect_to edit_municipe_path(@municipe)
      end
    else
      flash[:error] = @messages.join(', ')
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @municipe = Municipe.new(municipe_params)
    if valida_campos
      if salva_municipe
        flash[:success] = "Dados salvos com sucesso!"
        enviar_email(municipe_params, "Dados Criado com sucesso")
        redirect_to root_path
      else        
        flash[:error] = "Erro ao salvar os dados."
        redirect_to new_municipe_path
      end
    else
      flash[:error] = @messages.join(', ')
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def atualiza_municipe
    @municipe.update(municipe_params)
  end

  def salva_municipe
    @municipe.save
  end

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def valida_campos
    @messages = []
    @messages << "O CPF não é válido" unless ValidadorCpfServices.validar(municipe_params[:cpf])
    @messages << "O CNS não é válido" unless ValidadorCnsServices.validar(municipe_params[:cns])
    @messages << "Data de nascimento" unless ValidadorDataNascimentoServices.validar(municipe_params[:data_nascimento])
    @messages.empty? ? true : false
  end

  def enviar_email(params,assunto)
    EmailNotificacaoMailer.notificacao(params[:email],assunto).deliver_now
  end

  def municipe_params
    params.require(:municipe).permit(:id, :nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, :status,
    images:[], endereco_attributes: [:id,:cep, :logradouro, :complemento, :bairro, :cidade, :uf, :codigo_ibege])
  end
end
