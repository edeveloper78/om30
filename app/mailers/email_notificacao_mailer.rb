class EmailNotificacaoMailer < ApplicationMailer
    
    def notificacao(destinatario="teste@teste.com",assunto="Sem Assunto")
        @email= destinatario
        @assunto = assunto
        mail(to: @email, subject: @assunto,  from: 'suporte@om30.com')
    end
    
end
