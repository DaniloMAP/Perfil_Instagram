# Instagram Profile Viewer

Um aplicativo Flutter simples para visualizar o perfil do Instagram de um usuário, usando a biblioteca `flutter_insta` para acessar os dados do perfil e exibi-los de maneira amigável.

## BLoC - Business Logic Component

O BLoC (Business Logic Component) é um padrão arquitetural popular no desenvolvimento de aplicativos Flutter. Ele é projetado para separar a lógica de negócios do código de interface do usuário, tornando o aplicativo mais organizado, testável e escalável. O BLoC ajuda a gerenciar o estado da aplicação de forma eficiente, especialmente em aplicativos complexos.

### Uso do BLoC no Projeto

O projeto "Instagram Profile Viewer" utiliza o padrão BLoC para gerenciar a lógica de negócios relacionada à recuperação e exibição de informações do perfil do Instagram. O arquivo `profile_bloc.dart` contém a implementação do BLoC, incluindo o fluxo de dados por meio de um `StreamController` e métodos para buscar e emitir os dados do perfil.

O BLoC é utilizado da seguinte maneira neste projeto:

1. A classe `ProfileBloc` contém um `StreamController` que é responsável por emitir dados do tipo `ProfileData`.

2. O método `fetchProfileData` é utilizado para buscar os dados do perfil do Instagram usando a biblioteca `flutter_insta` e emitir os dados por meio do `StreamController`.

3. O arquivo `main.dart` utiliza um `StreamBuilder` para ouvir as alterações no fluxo de dados do BLoC. Isso permite que a interface do usuário reaja dinamicamente às mudanças nos dados do perfil.

4. Quando o usuário clica no botão "Carregar Perfil", o método `fetchProfileData` do BLoC é chamado com o nome de usuário digitado pelo usuário. Os dados do perfil são então emitidos pelo BLoC e exibidos na interface do usuário por meio do `StreamBuilder`.

### Benefícios do Uso do BLoC

O uso do padrão BLoC neste projeto traz diversos benefícios:

- Separação clara entre a lógica de negócios e a interface do usuário, facilitando a manutenção e a adição de novos recursos.
- Facilidade de teste, já que a lógica de negócios está isolada em uma classe independente.
- Gerenciamento eficiente do estado da aplicação, permitindo atualizações dinâmicas da interface do usuário conforme os dados do perfil são carregados.
- Melhora a escalabilidade, tornando mais fácil adicionar mais funcionalidades e extensões no futuro.

O uso do BLoC no projeto "Instagram Profile Viewer" demonstra como esse padrão arquitetural pode ser benéfico em projetos Flutter, especialmente ao lidar com a recuperação e exibição de dados complexos.


## Pré-requisitos

- Certifique-se de ter o ambiente de desenvolvimento Flutter configurado. Se você ainda não o fez, siga as instruções em [flutter.dev](https://flutter.dev/docs/get-started/install) para configurá-lo.

## Instalação

1. Clone este repositório para o seu ambiente de desenvolvimento local:

   ```
   git clone https://github.com/https://github.com/DaniloMAP/Perfil_Instagram.git
   ```

2. Navegue até o diretório do projeto:

   ```
   cd perfil_instagram

   cd projeto_instagram
   ```

3. Instale as dependências do projeto executando:

   ```
   flutter pub get
   ```

## Uso

1. Execute o aplicativo:

   ```
   flutter run
   ```

2. Digite o nome de usuário do perfil do Instagram que deseja visualizar e clique no botão "Carregar Perfil". As informações do perfil, incluindo nome de usuário, número de seguidores, número de seguidos, biografia e imagem de perfil, serão exibidas na tela.

## Personalização

- Você pode personalizar a aparência do aplicativo ajustando as cores e estilos no arquivo `main.dart`. As definições de tema estão localizadas na classe `MyApp`.

- Você também pode fazer outras modificações no código para adicionar mais funcionalidades ou ajustar o layout de acordo com suas preferências.

## Créditos

- Este aplicativo foi desenvolvido com base no pacote `flutter_insta` para acessar dados de perfil do Instagram. Para obter mais informações sobre o pacote, visite [pub.dev](https://pub.dev/packages/flutter_insta).

## Licença

Este projeto está licenciado sob a Licença MIT - consulte o arquivo [LICENSE](LICENSE) para obter detalhes.
