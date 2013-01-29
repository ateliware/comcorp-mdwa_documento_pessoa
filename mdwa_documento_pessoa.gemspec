# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mdwa_documento_pessoa/version'

Gem::Specification.new do |gem|
  gem.name          = "mdwa_documento_pessoa"
  gem.version       = MdwaDocumentoPessoa::VERSION
  gem.authors       = ["QW3 Software"]
  gem.email         = ["contato@qw3.com.br"]
  gem.description   = %q{Cria o cadastro de documentos de pessoa física ou jurídica.}
  gem.summary       = %q{Cria uma entidade DocumentoPessoa, que possui documentos CPF, CNPJ, RG e Inscrição Estadual, a partir de modelos MDWA.}
  gem.homepage      = "http://www.qw3.com.br"

  gem.add_dependency 'mdd', '>= 3.1.0'
  gem.add_dependency 'brcpfcnpj', '>= 3.3.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
