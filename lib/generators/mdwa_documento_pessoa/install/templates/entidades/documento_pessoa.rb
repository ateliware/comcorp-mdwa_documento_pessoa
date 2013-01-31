# -*- encoding : utf-8 -*-
require 'mdwa/dsl'
MDWA::DSL.entities.register "DocumentoPessoa" do |e|
  
  e.resource  = true
  e.ajax      = false
  e.scaffold_name = 'a/documento_pessoa'
  e.model_name = 'a/documento_pessoa'

  e.attribute 'fisico_juridico', 'boolean'
  e.attribute 'cpf', 'string'
  e.attribute 'cnpj', 'string'
  e.attribute 'rg', 'string'
  e.attribute 'inscricao_estadual', 'string'
  
end

MDWA::DSL.entity('DocumentoPessoa').in_requirements << 'armazenar_documentos'
