# -*- encoding : utf-8 -*-

require 'rails/generators'
require 'mdwa/dsl'

module MdwaDocumentoPessoa
	class InstallGenerator < Rails::Generators::Base

		source_root File.expand_path("../templates", __FILE__)

		def mdwa
			gem 'brcpfcnpj'
			run 'bundle install'

			copy_file 'requisitos/armazenar_documentos.rb', MDWA::DSL::REQUIREMENTS_PATH + 'armazenar_documentos.rb'
			copy_file 'entidades/documento_pessoa.rb', MDWA::DSL::STRUCTURAL_PATH + 'documento_pessoa.rb'
		end

		def templates
			copy_file 'templates/model.erb', MDWA::DSL::TEMPLATES_PATH + 'documento_pessoa/a/model.erb'
			copy_file 'templates/controller.erb', MDWA::DSL::TEMPLATES_PATH + 'documento_pessoa/a/controller.erb'
			copy_file 'templates/helper.erb', MDWA::DSL::TEMPLATES_PATH + 'documento_pessoa/a/helper.erb'
			directory 'templates/views', MDWA::DSL::TEMPLATES_PATH + 'documento_pessoa/a/views'
		end

		def assets
			copy_file 'assets/documento_pessoa.js.erb', 'app/assets/javascripts/qw3/documento_pessoa.js.erb'
		end

		def locales
			copy_file 'locales/mdwa.documento_pessoa.en.yml', 'config/locales/mdwa.documento_pessoa.en.yml' unless File.exists?(Rails.root + 'config/locales/mdwa.documento_pessoa.en.yml')
			copy_file 'locales/mdwa.documento_pessoa.pt-BR.yml', 'config/locales/mdwa.documento_pessoa.pt-BR.yml' unless File.exists?(Rails.root + 'config/locales/mdwa.documento_pessoa.pt-BR.yml')
		end

		def rodar_transformacao
			if yes? "Deseja rodar a transformação dos templates de documento_pessoa?"
				generate "mdwa:transform DocumentoPessoa --skip-locales"
			end
		end

	end
end
