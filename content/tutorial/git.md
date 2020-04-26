---
title: "Cartilha: Como usar o git"
date: 2020-01-30T12:48:29-03:00
draft: false
---

- Slides: [Tutorial](https://docs.google.com/presentation/d/1bBp3djMY6sMn1qmDTdQqSOXYaCvt2RpSCy_VFP65Ebc/edit?usp=sharing)
- Video-aula: https://www.youtube.com/watch?v=-YKTIlAQOfM

## Ingredientes

1. `git` instalado e configurado.

### Clonando um Repositório

1. Comece clonando o repositório da wiki do Grêmio:

```
git clone https://github.com/gremio-eci/wiki
```

2. Entre na pasta do repositório e instale [Hugo](https://gohugo.io/)

3. Modifique algum arquivo e teste

No linux rode:

```
./local.sh
```

No windows rode:

```
./Local.ps1
```

Abrirá a página da wiki servida localmente (aperte f5 se der falha na conexão). Garanta que suas modificações não quebraram nada.

### Salvando o seu trabalho (git add, commit, push)

1. Veja quais arquivos foram modificados

```
git status
```

2. Veja o que foi mudado em cada arquivo

```
git diff <arquivo modificado>
```

3. Vendo que está tudo certo adicione os arquivos modificados

```
git add <arquivo modificado> 
```

4. Salve suas modificações no histórico local (dê commit)

```
git commit
```

Isso abrirá seu editor de texto padrão, descreva brevemente na primeira linha o que foi feito. No presente e em inglês.

Da terceira linha em diante explique detalhadamente o que foi feito e os porquês.

### Verificando atualizações (git pull)

### Usando *branches*.

*Essa página está incompleta, por favor nos ajude contribuindo com ela, basta transcrever dos slides disponibilizados acima*
