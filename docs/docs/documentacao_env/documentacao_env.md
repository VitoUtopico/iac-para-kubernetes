# Sobre esta documentação

##  <img src="../../images/poetry-logo.png" alt="drawing" width="30"/> Poetry

Está sendo utilizado o Poetry para criar uma env do Python apenas com os recursos necessários para o uso do mkdocs.
Após criar e acessar a pasta "docs".

~~~sh

poetry init -n --name=iac-para-kubernetes-doc
poetry add mkdocs
poetry add pymdown-extensions
poetry add mkdocs-material
poetry add Pygments

~~~

## <img src="../../images/mkdocs-logo.png" alt="drawing" width="30"/> Mkdocs

O mkdocs foi escolhido para essa documentação por ser de fácil edição, por já ser usado em muitos projetos grandes, portanto está se tornando um padrão e pela possibilidade de utilizá-lo no Github Pages.

Para iniciar o mkdocs

~~~sh

mkdocs new .

~~~

Para deployar o mkdocs no Github Pages

~~~sh

mkdocs gh-deploy

~~~

---

## Referências

Poetry:

[Gerenciando pacotes e ambientes com Poetry](https://www.youtube.com/watch?v=ZOSWdktsKf0&ab_channel=EduardoMendes)

MkDocs:

[Documentado projetos com MkDocs](https://www.youtube.com/watch?v=GW6nAJ1NHUQ&ab_channel=EduardoMendes)