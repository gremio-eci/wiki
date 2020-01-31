# Wiki de Engenharia da Computação e Informação (ECI) - UFRJ

https://gremio-eci.github.io/wiki/

Essa wiki é colaborativa, de forma que se algo está errado, por favor modifique, e se sinta a vontade para extender artigos e adicionar novos.

É uma wiki estática, gerada a partir do gerador de sites [Hugo](https://gohugo.io/), utilizamos arquivos de sintaxe [Markdown]({{< ref "/tutorial/markdown.md" >}}) para editar os artigos.

O código fonte (com os conteúdos) se encontra em https://github.com/gremio-eci/wiki

Caso seja um aluno de ECI fique basta pedir à algum admin da organização [Gremio ECI](https://github.com/gremio-eci) para te adicionar como membro. Se não, faça um fork no github e crie um pull request com as modificações feitas.

## Fontes que podem ajudar

- [Markdown](https://gremio-eci.github.io/wiki/tutorial/markdown.md)
- [Tutorial do Git](https://gremio-eci.github.io/wiki/tutorial/git.md)
- [Adicionar chave SSH ao github](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
- [Hugo](https://gohugo.io)

## Ingredientes

1. [git](https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git) instalado.
2. [hugo](https://gohugo.io/getting-started/installing/) instalado

Se você usa windows pode instalar ambos rodando o script: `Installer.ps1`

Com essas dependências a wiki já pode ser executada localmente e até publicada (se você tem permissão de escrita no repositório).

Git suporta interface gráficas, havendo diversas implementações, fique a vontade para escolher a sua, será necessário apenas converter os comandos do terminal para a GUI.

## Modo de Preparo

Abra o terminal, dele você faz tudo (até editar o markdown se utilizar um editor como o `vim`)

### Clonando o repositório

`git clone git@github.com:gremio-eci/wiki.git`

Uma pasta `wiki/` será criada e nela o repositório estará clonado.

`cd wiki`

### Modificando conteúdo

Dentro da pasta `wiki/` haverá uma pasta chamada `content/`. Nessa pasta ficam os arquivos [Markdown]({{< ref "/tutorial/markdown.md" >}}), modifique-os a vontade em seu editor de texto favorito (ou IDE).

Para criar um arquivo novo digite

`hugo new tutorial/novo-tutorial.md`

O arquivo será criado, se baseie no conteúdo de outros arquivos dapasta. Novas pastas podem ser criadas à vontade.

Arquivos estáticos além do markdown (como imagens e vídeos que não são hosteados externamente) são adicionados na pasta `static/` da base do repositório. Mas no geral tendemos a utilizar links externos, isso significa que o link um dia pode sair do ar. Mas se for um conteúdo que pode variar pode ser interessante manter a dinamicidade.

### Testando as modificações

É possível testar as modificações localmente enquanto elas são feitas e descobrir se existem erros de compilação ou de formatação.

Por favor as teste antes de publicar as coisas, não de push em `master` com erros de compilação. Não execute o script de `publish` sem revisar as modificações feitas localmente.

Linux:

`./local.sh`

Windows:

Execute o arquivo `Local.ps1`

Isso abrirá uma aba do browser padrão na wiki local. Ela será atualizada automaticamente caso algum arquivo seja modificado, e avisará no terminal caso existam erros de compilação.

### Salvando suas modificações (git add, commit, push)

Git é uma ferramenta de controle de versão, então existe um protocolo para alterar a versão atual no repositório.

Adicione as modificações

`git status`

Irá avisar todas as modificações feitas

`git add {arquivo mostrado no status}`

Após adicionar todos os arquivos desejados crie o commit:

Se você não configurou o git ainda ele pedirá para definir o nome e e-mail local a ser salvo nos metadados do git

`git commit`

Abrirá uma janela para editar texto, escreva de forma concisa as modificações feitas na primeira linha e na terceira linha explique mais detalhadamente.

Suas mensagens devem ser em inglês (os nomes em português podem se manter em português), e devem ser no presente, exemplo "Create ...", "Fix ...", "Merge ...".

Exemplo de mensagem:

```
Create markdown and contribution tutorial

- Created tutorial/contribution.md file, with a thorough explanation of how this wiki works, how to run it locally and how to change it
- Created tutorial/markdown.md with a basic reference to Markdown and more sources
```

### Verificando atualizações (git fetch, merge, pull...)

Antes de dar push é importante saber se existem modificações feitas por outros, idealmente elas seriam obtidas antes de iniciar as modificações, mas nem sempre isso é possível.

É possível utilizar branches para manter seu código lá sem atrapalhar master, quando ainda está incompleto. Isso evita muita dor de cabeça, se sua modificação for extensa e você quiser commitar por favor crie uma nova branch e a utilize até o merge. Para mais informações cheque o tutorial de [Git]({{< ref "/tutorial/git.md" >}})

`git pull origin master`

Se houver conflito de modificações é necessário os resolver na mão. Existem ferramentas especializadas para merge de git, uma googlada te dá referências.

Se houve conflito e foi resolvido manualmente digite

`git commit`

Salve a mensagem da migração.

### Publicando no repositório

Agora é necessário compartilhar suas modificações pelo git, para que outros editores tenham acesso e possam modificar.

Para isso é necessário ter permissão de escrita no repositório, então se você estuda ECI e não tem nos peça. De qualquer forma você pode fazer um fork seu e modificaro próprio repositório, integrando as coisas por Pull Request do github.

`git push origin master`

Se você nunca deu push em nada no github provavelmente será negado, porque não há permissão. Será necessário criar uma chave `ssh` para o git usar e a cadastrar em sua conta do github.

Para saber mais de criar uma chave ssh use esse tutorial do github: https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh

### Publicando a wiki online

Após atualizar o repositório com suas modificações, e garantir que elas estão funcionando como desejado no teste local é a hora de publicar a wiki.

Isso só funcionará se você tem permissão de escrita no repositório (apenas pessoas da organização `gremio-eci` tem).

Linux:

`./publish.sh`

Windows:

Execute o arquivo `Publish.ps1`

# Justificativas

Nós entendemos que o metodo atual cria uma barreira pra contribuição e pode afastar colaboradores. Mas entendemos também que é necessário reconhecer os recursos disponíveis. Uma wiki que dependa de um servidor externo gera custo e trabalho de manutenção. Cria também a necessidade de um sistema de autenticação e de permissões, quando o github já providencia isso para a gente. E internamente o git provavelmente seria usado de qualquer forma, para permitir recuperações e migrações.

Mesmo um servidor de um laboratório da UFRJ geraria problemas, com a wiki indisponível quando a rede se encontra instável (constantemente). E no passado o nosso curso já teve uma wiki hosteada externamente. Wiki que eventualmente saiu do ar com o desligamento do servidor.

Por isso que compreendemos que ao menos inicialmente é importante criar uma wiki à prova de futuro. Entendemos que muitas informações ficam ultrapassadas logo, mas se exigir um trabalho constante de observação acabará por ser abandonada.

Portanto essa barreira compensa a problemática de um servidor. Estamos trabalhando ao máximo para diminuir a dificuldade de colaboração, mas é bom lembrar que somos alunos de Engenharia da Computação. Se não conseguimos sentar por alguns arquivos de documentação para realizar uma tarefa teremos muitas dificuldades de atuar nessa área, então aproveite agora para criar o costume.

Então calouro, se esse tutorial te intimidar não se assuste, vai com calma que a habilidade mais importante da programação é a paciência de ler documentações (e de fazer as suas rsrs). Qualquer dúvida fique a vontade para procurar os veteranos, sempre terá alguém disponível para te ajudar! Os grupos das redes sociais tem um grande papel nessa integração, mas pessoalmente é sempre bom também.

# Licença

[GNU AFFERO GENERAL PUBLIC LICENSE 3.0 - AGPL-3](LICENSE.md)
