# PetPOC
Prova de Conceito para processo seletivo

### Requisitos:
- Tela de autenticação – usuário e senha
- Caso positivo – Tela de confirmação de sucesso
- Caso negativo – mensagem de erro
- Configurar a infraestrutura de login no Firebase, para que a aplicação teste o consuma.
- Publicar aplicação no test flight e no github


[Neste vídeo](https://youtu.be/37Wqd54_7Fs), demonstro as funcionalidades e comportamentos do App.  

### Comentários Técnicos:
- Todo o projeto foi realizado com a prática do Viewcode;
- CocoaPods para gerenciar Firebase Auth;
- Suporte para dark e ligh mode. No simulador do Xcode, demonstro a experiência em ambos modos usando o atalho "cmd + shift + a".

### Detalhes:
- Inicialização com Launchscreen em light e dark mode;
- Realce nas bordas dos campos de texto quando em foco;
- Estando o campo de texto de e-mail em foco, a tecla "next" ou "próximo" deixa em foco o campo de texto da senha;
- Estando o campo de texto de senha em foco, a tecla "done" ou "concluído" dispensa o teclado;
- Se teclado em foco, tocar em qualquer lugar tela o dispensa;
- Botões "Entrar" e "Cadastre-se" apenas são habilitados se campos de e-mail e senha estiverem preenchidos, sendo que, para a senha, é preciso ter no mínimo 6 dígitos;
- Os alertas de erros são customizados;
- Minha querida filhinha Maya na HomeScreen :) 

### Erros simulados: 
- Senha e/ou Usuário incorreto;
- E-mail formatado incorretamente;
- Tentar se cadastrar com e-mail já existente no banco de dados.
