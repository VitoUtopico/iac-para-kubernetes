# Sobre esta documentação

## Poetry

Está sendo utilizado o Poetry para criar uma env do Python apenas com os recursos necessários para o uso do mkdocs.
Após criar e acessar a pasta "docs".

~~~sh

poetry init -n --name=iac-para-kubernetes-doc
poetry add mkdocs
poetry add pymdown-extensions
poetry add mkdocs-material

~~~

## Mkdocs

O mkdocs foi escolhido para essa documentação por ser de fácil edição, por já ser usado em muitos projetos grandes, portanto está se tornando um padrão e pela possibilidade de utilizá-lo no Github Pages.

Para iniciar o mkdocs

~~~sh

mkdocs new .

~~~

Para deployar o mkdocs no Github Pages

~~~sh

mkdocs gh-deploy

~~~

