# Consumo de API Front-end em Flutter para Desafio de Programação Senior Mega

Esta aplicação faz consumo da API desenvolvida em [https://github.com/h-buzzi/desafio-senior-q1](https://github.com/h-buzzi/desafio-senior-q1). Era obrigatório que tivesse pelo menos um campo de entrada de texto e mostrasse as informações provenientes do Backend, uma lista de resultados com o total de resultados encontrados.

# Importante

Abaixo você encontra algumas intruções de como estar com sua máquina do mesmo jeito que a minha, garantindo que você terá o mesmo ambiente para execução que o meu, e no qual o software foi desenvolvido.

## Instalação

O próprio site do Flutter possui um passo a passo extremamente detalhado de como realizar sua instação. Irei focar na instalação para Windows, por ser o mesmo OS que utilizei, e seu guia pode ser acessado em [https://docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows). É possível seguir o guia completo, entretanto, pode-se realizar apenas até a etapa 'Set up the Android Emulator', pulando-se a 'Set up your Android Device'. Além disso, certifique-se que é a versão Flutter 3.0.4 ou superior.

Durante a criação de seu emulador Android no Android Studio, selecione o hardware Pixel 3 e a release 'S' (API Level 31 x86-64 Android 12.0), assim você terá o mesmo emulador que o meu.

Além disso, para ter o mesmo ambiente de desenvolvimento, baixe o Visual Studio Code, disponível em [https://code.visualstudio.com/](https://code.visualstudio.com/) e instale o mesmo. Uma vez com o VSCode aberto, clique em suas extensões na esquerda e certifique-se de ter instalado as extensões 'Dart' e 'Flutter' de Dart Code, e também 'Code Runner' de Jun Han.

Após isto, clique sobre o arquivo pubspec.yaml e pressione CTRL+S, isto irá rodar um pub get para as packages externas.

## Antes de rodar

Depedendo de como você está rodando a questão 1 do desafio, que é a API de Filmes, o endereço local pode ter mudado. Por favor, verifique-se que em qual porta do localhost sua aplicação está rodando, e certifique-se que ela esteja rodando em localhost. Se a porta for diferente de 7131, por favor, vá para o arquivo \lib\providers\movies_api_provider.dart e altere a porta do endereço na linha 20, dentro de URi.parse, e altere de 7131 para sua respectiva porta. Assim, o emulador android conseguirá se conectar a sua API Local.

## Rodando

Primeiro, abra seu emulador android pelo VSCode. Isto é feito clicando-se no canto inferior direito, está entre a sua versão do Flutter e o ícone de 'Tweet Feedback', esta opção talvez esteja nomeada como Edge, Chrome, Windows ou o nome que você deu aos seu emulador no Android Studio. 

Depois que seu emulador estiver na tela inicial e pronto, pode-se clicar sobre a opção 'Run' na aba de ferramentas do topo da tela, e selecionar a opção 'Run Without Debugging', ou aperta CTRL+F5.

Com isto, ele irá buildar o app, isto pode levar um tempo dependendo de sua máquina. Uma vez na tela inicial, pode-se pesquisar pelo a string que desejar.
