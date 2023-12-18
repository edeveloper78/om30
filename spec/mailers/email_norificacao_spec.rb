require "rails_helper"

RSpec.describe EmailNotificacaoMailer, type: :mailer do
    describe 'notificacao' do
      let(:destinatario) { 'teste@teste.com' }
      let(:assunto) { 'Registro Criado ou Alterado com sucesso!' }
      let(:mail) {  described_class.notificacao(destinatario, assunto) }

      it 'renders the headers' do
        expect(mail.subject).to eq('Registro Criado ou Alterado com sucesso!')
        expect(mail.to).to eq(['teste@teste.com'])
        expect(mail.from).to eq(['suporte@om30.com'])
      end
  
    end
end

