# -*- encoding : utf-8 -*-
require 'mdwa/dsl'
MDWA::DSL.requirements.register do |r|
  
  r.summary     = 'Armazenar documentos de pessoa.'
  r.alias       = 'armazenar_documentos'
  r.description = %q{Encapsula os documentos de pessoa.}
  
  r.entities    = ['DocumentoPessoa']
end
