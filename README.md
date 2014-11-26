% ufbathesis - formato LaTeX p/ teses da UFBA

## Sobre

Este pacote é destinado à escrita de trabalhos de conclusão de curso,
dissertações de mestrado e teses de doutorado da Universidade Federal da Bahia.

Este pacote á baseado no
[UFPEThesis](http://www.cin.ufpe.br/~paguso/ufpethesis/), por Paulo G. S. da
Fonseca, e numa versão modificada para o DMCC por Alírio Sá.
Adaptado para o PGCOMP por Christina von Flach em 2014.

## Como usar

* Instale o [abnTeX](http://code.google.com/p/abntex2/ ou http://www.ctan.org/pkg/abntex2).
* [Baixe o pacote](ufbathesis-##VERSION##.tar.gz) da versão atual do ufbathesis
  e descomprima no diretório onde estão os fontes da sua tese.
* Use `ufbathesis` como o `documentclass` do seu documento.
* Tente seguir um dos modelos o mais fielmente possível:
    * Para teses de doutorado do DMCC, há um [modelo mais
      simples](template.tex) com o mínimo necessário.
    * Para qualquer outro trabalho, há o [modelo completo](template-full.tex)
      possui tudo que você precisa preencher, e mais algumas coisas que talvez
      você não queira (epígrafe, dedicatória, cólofon, bla bla bla).

Em caso de dúvidas que não possam ser sanadas olhando o template, por enquanto
a melhor coisa a fazer é olhar o código do `ufbathesis.cls`.
